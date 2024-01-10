Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD0482C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 22:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2xaULDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704924278; x=1736460278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oL3/a85pkGCNLsfBwWWCmIdcOC7Ppln7nY7s1Z4Bt1M=;
  b=B2xaULDLMMt7cd144BB87uiRzP/8GlS8CK6vPqsSV+umA59eGncYTHgg
   AcoHOHJolaxCbMAbv0+HLK2xaOfOQiwwa/jXxYJjDmUpMfJZaRrjHefY6
   HeKvumMu5UHQJFFvvvhtOJgn9OrdltXBM/yhup2P7sqonas7CV7YLXhuh
   ltkv3t3XLvAh/VPV4yYncbw1tEBU78k4QK6r5xR2i3paqMLVv6fg8d3Zo
   AyJqaWJoKzEP4dvYGTv/kzycsjdDR9RzUz/4w8GzqD8HI6xGtU3hba67y
   5EQiZqOrCqqiwMSLXiM2CK5eNs/Xior8AskyKrxipohUh0d9VWznbTQ75
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5409528"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5409528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 14:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955507473"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="955507473"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Jan 2024 14:04:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNgga-0007XG-39;
	Wed, 10 Jan 2024 22:04:32 +0000
Date: Thu, 11 Jan 2024 06:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1758/2334] kernel/livepatch/core.c:1587:12:
 warning: no previous prototype for 'arch_klp_check_activeness_func'
Message-ID: <202401110556.6JXzgyLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: 583e6e55fb6aa193b1a82909069e8028c5d5653d [1758/2334] livepatch/x86: Support livepatch without ftrace
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240111/202401110556.6JXzgyLd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110556.6JXzgyLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110556.6JXzgyLd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/livepatch/core.c:1587:12: warning: no previous prototype for 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1587 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:1811:14: warning: no previous prototype for 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1811 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:1816:13: warning: no previous prototype for 'arch_klp_mem_free' [-Wmissing-prototypes]
    1816 | void __weak arch_klp_mem_free(void *mem)
         |             ^~~~~~~~~~~~~~~~~


vim +/arch_klp_check_activeness_func +1587 kernel/livepatch/core.c

  1586	
> 1587	int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
  1588						  klp_add_func_t add_func,
  1589						  struct list_head *func_list)
  1590	{
  1591		int ret;
  1592		unsigned long func_addr = 0;
  1593		unsigned long func_size;
  1594		struct klp_func_node *func_node = NULL;
  1595		unsigned long old_func = (unsigned long)func->old_func;
  1596	
  1597		func_node = func->func_node;
  1598		/* Check func address in stack */
  1599		if (enable) {
  1600			if (func->patched || func->force == KLP_ENFORCEMENT)
  1601				return 0;
  1602			/*
  1603			 * When enable, checking the currently active functions.
  1604			 */
  1605			if (list_empty(&func_node->func_stack)) {
  1606				/*
  1607				 * Not patched on this function [the origin one]
  1608				 */
  1609				func_addr = old_func;
  1610				func_size = func->old_size;
  1611			} else {
  1612				/*
  1613				 * Previously patched function [the active one]
  1614				 */
  1615				struct klp_func *prev;
  1616	
  1617				prev = list_first_or_null_rcu(&func_node->func_stack,
  1618							      struct klp_func, stack_node);
  1619				func_addr = (unsigned long)prev->new_func;
  1620				func_size = prev->new_size;
  1621			}
  1622			/*
  1623			 * When preemption is disabled and the replacement area
  1624			 * does not contain a jump instruction, the migration
  1625			 * thread is scheduled to run stop machine only after the
  1626			 * execution of instructions to be replaced is complete.
  1627			 */
  1628			if (IS_ENABLED(CONFIG_PREEMPTION) ||
  1629			    (func->force == KLP_NORMAL_FORCE) ||
  1630			    arch_check_jump_insn(func_addr)) {
  1631				ret = add_func(func_list, func_addr, func_size,
  1632					       func->old_name, func->force);
  1633				if (ret)
  1634					return ret;
  1635				if (func_addr != old_func) {
  1636					ret = add_func(func_list, old_func, KLP_MAX_REPLACE_SIZE,
  1637							func->old_name, func->force);
  1638					if (ret)
  1639						return ret;
  1640				}
  1641			}
  1642		} else {
  1643	#ifdef CONFIG_PREEMPTION
  1644			/*
  1645			 * No scheduling point in the replacement instructions. Therefore,
  1646			 * when preemption is not enabled, atomic execution is performed
  1647			 * and these instructions will not appear on the stack.
  1648			 */
  1649			if (list_is_singular(&func_node->func_stack)) {
  1650				func_addr = old_func;
  1651				func_size = func->old_size;
  1652			} else {
  1653				struct klp_func *prev;
  1654	
  1655				prev = list_first_or_null_rcu(
  1656						&func_node->func_stack,
  1657						struct klp_func, stack_node);
  1658				func_addr = (unsigned long)prev->new_func;
  1659				func_size = prev->new_size;
  1660			}
  1661			ret = add_func(func_list, func_addr,
  1662					func_size, func->old_name, 0);
  1663			if (ret)
  1664				return ret;
  1665			if (func_addr != old_func) {
  1666				ret = add_func(func_list, old_func, KLP_MAX_REPLACE_SIZE,
  1667						func->old_name, 0);
  1668				if (ret)
  1669					return ret;
  1670			}
  1671	#endif
  1672	
  1673			func_addr = (unsigned long)func->new_func;
  1674			func_size = func->new_size;
  1675			ret = add_func(func_list, func_addr,
  1676					func_size, func->old_name, 0);
  1677			if (ret)
  1678				return ret;
  1679		}
  1680		return 0;
  1681	}
  1682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
