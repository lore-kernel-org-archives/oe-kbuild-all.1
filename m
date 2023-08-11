Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3B2219C3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691773611; x=1723309611;
  h=date:from:cc:subject:message-id:mime-version;
  bh=afKoGofKWrPiQFmEhuBMe46bQ/ZTNB2spN8jS4XUssI=;
  b=IjJYOLDfKwwjwcexYmBloJKQjOlFFAIw8E/jvvx7ltP1m02NcTdJ5Iwa
   dtNV60l/oKqWL+v9Q60n8QXvUq4kLA3+4jim/j4cS7VA/U29KEVBxymB5
   Sfr0nuHTicDhzgOUdwwYoq5VjAq94ayBkLzK4eWeKP9Xd/u0fM1g7MsaR
   WoDd7I5wJfWbD8AmGOEogMn8Tx6u71/o3r5bvYrssPh3x1AhFZ1cQqZ2m
   QWeipzHF6jj+SC+03BcHm0nW9IHwXvMYyNFiugRkrtbYeSCI1Kut5Avvi
   ND9cgpWPhTCeEQneaEsTQJknRfOP2toO15KUKNg9kvy5JUfrWb0C+9vwy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374488826"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="374488826"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 10:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="726317720"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="726317720"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Aug 2023 10:06:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUVb3-0007u6-26;
	Fri, 11 Aug 2023 17:06:45 +0000
Date: Sat, 12 Aug 2023 01:06:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jim Bride <jim.bride@intel.com>,
	Mika Kuoppala <mika.kuoppala@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Asif Haswarey <asif.haswarey@intel.com>
Subject: [intel-lts:4.14/yocto/base 3042/28962]
 drivers/gpu/drm/i915/intel_engine_cs.c:1634:6: warning: no previous
 declaration for 'intel_engine_dump'
Message-ID: <202308120043.1qaE6XAo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.14/yocto/base
head:   65b8aaa4ae7a568d08d64eeee7b09f26f711c78f
commit: f79a6ed41fd3cd327d0883ad8b5be95a6d0c5596 [3042/28962] UPSTREAM: drm/i915: Filter out spurious execlists context-switch interrupts
config: i386-randconfig-i012-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120043.1qaE6XAo-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120043.1qaE6XAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120043.1qaE6XAo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_engine_cs.c:1634:6: warning: no previous declaration for 'intel_engine_dump' [-Wmissing-declarations]
    void intel_engine_dump(struct intel_engine_cs *engine, struct drm_printer *m)
         ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:5:0,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/io-mapping.h:22,
                    from drivers/gpu/drm/i915/i915_drv.h:36,
                    from drivers/gpu/drm/i915/intel_engine_cs.c:25:
   drivers/gpu/drm/i915/intel_engine_cs.c: In function '__intel_engine_context_size':
   include/linux/compiler.h:77:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    # define unlikely(x) __builtin_expect(!!(x), 0)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     \
     ^~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:43:25: note: in expansion of macro 'WARN'
    #define MISSING_CASE(x) WARN(1, "Missing switch case (%lu) in %s\n", \
                            ^~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:151:4: note: in expansion of macro 'MISSING_CASE'
       MISSING_CASE(INTEL_GEN(dev_priv));
       ^~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:152:3: note: here
      case 10:
      ^~~~
   In file included from include/asm-generic/bug.h:5:0,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from include/linux/io-mapping.h:22,
                    from drivers/gpu/drm/i915/i915_drv.h:36,
                    from drivers/gpu/drm/i915/intel_engine_cs.c:25:
   include/linux/compiler.h:77:22: warning: this statement may fall through [-Wimplicit-fallthrough=]
    # define unlikely(x) __builtin_expect(!!(x), 0)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:120:2: note: in expansion of macro 'unlikely'
     unlikely(__ret_warn_on);     \
     ^~~~~~~~
   drivers/gpu/drm/i915/i915_utils.h:43:25: note: in expansion of macro 'WARN'
    #define MISSING_CASE(x) WARN(1, "Missing switch case (%lu) in %s\n", \
                            ^~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:180:3: note: in expansion of macro 'MISSING_CASE'
      MISSING_CASE(class);
      ^~~~~~~~~~~~
   drivers/gpu/drm/i915/intel_engine_cs.c:181:2: note: here
     case VIDEO_DECODE_CLASS:
     ^~~~


vim +/intel_engine_dump +1634 drivers/gpu/drm/i915/intel_engine_cs.c

  1633	
> 1634	void intel_engine_dump(struct intel_engine_cs *engine, struct drm_printer *m)
  1635	{
  1636		struct intel_breadcrumbs * const b = &engine->breadcrumbs;
  1637		const struct intel_engine_execlists * const execlists = &engine->execlists;
  1638		struct i915_gpu_error * const error = &engine->i915->gpu_error;
  1639		struct drm_i915_private *dev_priv = engine->i915;
  1640		struct drm_i915_gem_request *rq;
  1641		struct rb_node *rb;
  1642		u64 addr;
  1643	
  1644		drm_printf(m, "%s\n", engine->name);
  1645		drm_printf(m, "\tcurrent seqno %x, last %x, hangcheck %x [%d ms], inflight %d\n",
  1646			   intel_engine_get_seqno(engine),
  1647			   intel_engine_last_submit(engine),
  1648			   engine->hangcheck.seqno,
  1649			   jiffies_to_msecs(jiffies - engine->hangcheck.action_timestamp),
  1650			   engine->timeline->inflight_seqnos);
  1651		drm_printf(m, "\tReset count: %d\n",
  1652			   i915_reset_engine_count(error, engine));
  1653	
  1654		rcu_read_lock();
  1655	
  1656		drm_printf(m, "\tRequests:\n");
  1657	
  1658		rq = list_first_entry(&engine->timeline->requests,
  1659				      struct drm_i915_gem_request, link);
  1660		if (&rq->link != &engine->timeline->requests)
  1661			print_request(m, rq, "\t\tfirst  ");
  1662	
  1663		rq = list_last_entry(&engine->timeline->requests,
  1664				     struct drm_i915_gem_request, link);
  1665		if (&rq->link != &engine->timeline->requests)
  1666			print_request(m, rq, "\t\tlast   ");
  1667	
  1668		rq = i915_gem_find_active_request(engine);
  1669		if (rq) {
  1670			print_request(m, rq, "\t\tactive ");
  1671			drm_printf(m,
  1672				   "\t\t[head %04x, postfix %04x, tail %04x, batch 0x%08x_%08x]\n",
  1673				   rq->head, rq->postfix, rq->tail,
  1674				   rq->batch ? upper_32_bits(rq->batch->node.start) : ~0u,
  1675				   rq->batch ? lower_32_bits(rq->batch->node.start) : ~0u);
  1676		}
  1677	
  1678		drm_printf(m, "\tRING_START: 0x%08x [0x%08x]\n",
  1679			   I915_READ(RING_START(engine->mmio_base)),
  1680			   rq ? i915_ggtt_offset(rq->ring->vma) : 0);
  1681		drm_printf(m, "\tRING_HEAD:  0x%08x [0x%08x]\n",
  1682			   I915_READ(RING_HEAD(engine->mmio_base)) & HEAD_ADDR,
  1683			   rq ? rq->ring->head : 0);
  1684		drm_printf(m, "\tRING_TAIL:  0x%08x [0x%08x]\n",
  1685			   I915_READ(RING_TAIL(engine->mmio_base)) & TAIL_ADDR,
  1686			   rq ? rq->ring->tail : 0);
  1687		drm_printf(m, "\tRING_CTL:   0x%08x [%s]\n",
  1688			   I915_READ(RING_CTL(engine->mmio_base)),
  1689			   I915_READ(RING_CTL(engine->mmio_base)) & (RING_WAIT | RING_WAIT_SEMAPHORE) ? "waiting" : "");
  1690	
  1691		rcu_read_unlock();
  1692	
  1693		addr = intel_engine_get_active_head(engine);
  1694		drm_printf(m, "\tACTHD:  0x%08x_%08x\n",
  1695			   upper_32_bits(addr), lower_32_bits(addr));
  1696		addr = intel_engine_get_last_batch_head(engine);
  1697		drm_printf(m, "\tBBADDR: 0x%08x_%08x\n",
  1698			   upper_32_bits(addr), lower_32_bits(addr));
  1699	
  1700		if (i915_modparams.enable_execlists) {
  1701			const u32 *hws = &engine->status_page.page_addr[I915_HWS_CSB_BUF0_INDEX];
  1702			u32 ptr, read, write;
  1703			unsigned int idx;
  1704	
  1705			drm_printf(m, "\tExeclist status: 0x%08x %08x\n",
  1706				   I915_READ(RING_EXECLIST_STATUS_LO(engine)),
  1707				   I915_READ(RING_EXECLIST_STATUS_HI(engine)));
  1708	
  1709			ptr = I915_READ(RING_CONTEXT_STATUS_PTR(engine));
  1710			read = GEN8_CSB_READ_PTR(ptr);
  1711			write = GEN8_CSB_WRITE_PTR(ptr);
  1712			drm_printf(m, "\tExeclist CSB read %d [%d cached], write %d [%d from hws], interrupt posted? %s\n",
  1713				   read, execlists->csb_head,
  1714				   write,
  1715				   intel_read_status_page(engine, intel_hws_csb_write_index(engine->i915)),
  1716				   yesno(test_bit(ENGINE_IRQ_EXECLIST,
  1717						  &engine->irq_posted)));
  1718			if (read >= GEN8_CSB_ENTRIES)
  1719				read = 0;
  1720			if (write >= GEN8_CSB_ENTRIES)
  1721				write = 0;
  1722			if (read > write)
  1723				write += GEN8_CSB_ENTRIES;
  1724			while (read < write) {
  1725				idx = ++read % GEN8_CSB_ENTRIES;
  1726				drm_printf(m, "\tExeclist CSB[%d]: 0x%08x [0x%08x in hwsp], context: %d [%d in hwsp]\n",
  1727					   idx,
  1728					   I915_READ(RING_CONTEXT_STATUS_BUF_LO(engine, idx)),
  1729					   hws[idx * 2],
  1730					   I915_READ(RING_CONTEXT_STATUS_BUF_HI(engine, idx)),
  1731					   hws[idx * 2 + 1]);
  1732			}
  1733	
  1734			rcu_read_lock();
  1735			for (idx = 0; idx < execlists_num_ports(execlists); idx++) {
  1736				unsigned int count;
  1737	
  1738				rq = port_unpack(&execlists->port[idx], &count);
  1739				if (rq) {
  1740					drm_printf(m, "\t\tELSP[%d] count=%d, ",
  1741						   idx, count);
  1742					print_request(m, rq, "rq: ");
  1743				} else {
  1744					drm_printf(m, "\t\tELSP[%d] idle\n",
  1745						   idx);
  1746				}
  1747			}
  1748			drm_printf(m, "\t\tHW active? 0x%x\n", execlists->active);
  1749			rcu_read_unlock();
  1750		} else if (INTEL_GEN(dev_priv) > 6) {
  1751			drm_printf(m, "\tPP_DIR_BASE: 0x%08x\n",
  1752				   I915_READ(RING_PP_DIR_BASE(engine)));
  1753			drm_printf(m, "\tPP_DIR_BASE_READ: 0x%08x\n",
  1754				   I915_READ(RING_PP_DIR_BASE_READ(engine)));
  1755			drm_printf(m, "\tPP_DIR_DCLV: 0x%08x\n",
  1756				   I915_READ(RING_PP_DIR_DCLV(engine)));
  1757		}
  1758	
  1759		spin_lock_irq(&engine->timeline->lock);
  1760		list_for_each_entry(rq, &engine->timeline->requests, link)
  1761			print_request(m, rq, "\t\tE ");
  1762		for (rb = execlists->first; rb; rb = rb_next(rb)) {
  1763			struct i915_priolist *p =
  1764				rb_entry(rb, typeof(*p), node);
  1765	
  1766			list_for_each_entry(rq, &p->requests, priotree.link)
  1767				print_request(m, rq, "\t\tQ ");
  1768		}
  1769		spin_unlock_irq(&engine->timeline->lock);
  1770	
  1771		spin_lock_irq(&b->rb_lock);
  1772		for (rb = rb_first(&b->waiters); rb; rb = rb_next(rb)) {
  1773			struct intel_wait *w = rb_entry(rb, typeof(*w), node);
  1774	
  1775			drm_printf(m, "\t%s [%d] waiting for %x\n",
  1776				   w->tsk->comm, w->tsk->pid, w->seqno);
  1777		}
  1778		spin_unlock_irq(&b->rb_lock);
  1779	
  1780		drm_printf(m, "\n");
  1781	}
  1782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
