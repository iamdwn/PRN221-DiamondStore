﻿using BussinessObject.Models;
using Microsoft.EntityFrameworkCore;
using Repository.Interface;
using System.Linq;
using System.Linq.Expressions;

namespace Repository.Implement
{
    public class OrderItemRepo : IBaseCRUD<OrderItem>
    {
        public async Task<OrderItem> GetByIdAsync(string id)
        {
            try
            {
                using (var _context = new DiamondStoreContext())
                {
                    return await _context.OrderItems.FirstAsync(oi => oi.OrderItemId == Guid.Parse(id));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<OrderItem> UpdateAsync(OrderItem entity)
        {
            try
            {
                using (var _context = new DiamondStoreContext())
                {
                    var orderItem = await _context.OrderItems.FindAsync(entity.OrderItemId);
                    if (orderItem != null)
                    {
                        orderItem.ProductId = entity.ProductId;
                        await _context.SaveChangesAsync();
                    }
                    return orderItem;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task DeleteAsync(string id)
        {
            try
            {
                using (var _context = new DiamondStoreContext())
                {
                    var orderItem = await _context.OrderItems.FindAsync(Guid.Parse(id));
                    if (orderItem != null)
                    {
                        _context.OrderItems.Remove(orderItem);
                        await _context.SaveChangesAsync();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<IEnumerable<OrderItem>> FindAsync(Expression<Func<OrderItem, bool>> predicate)
        {
            try
            {
                using (var _context = new DiamondStoreContext())
                {
                    return await _context.OrderItems.Include(p => p.Product).Where(predicate).ToListAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<OrderItem> AddAsync(OrderItem entity)
        {
            try
            {
                using (var _context = new DiamondStoreContext())
                {
                    _context.OrderItems.Add(entity);
                    await _context.SaveChangesAsync();
                    return entity;
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task<IEnumerable<OrderItem>> GetAllAsync()
        {
            try
            {
                using (var _context = new DiamondStoreContext())
                {
                    return await _context.OrderItems.ToListAsync();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Task<OrderItem> Find(Expression<Func<OrderItem, bool>> predicate)
        {
            throw new NotImplementedException();
        }

        public Task<bool> CreateAsync(OrderItem entity)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Update(OrderItem entity)
        {
            throw new NotImplementedException();
        }
    }
}
