Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61C429B799
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 01:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762567078; cv=none; b=MTgoDqO6cGUhHDquBWJ1KqtOsmctVFoDMZzA4bZxDxUAIKI7cX2HZsAx5jP/XJ1xakwx7i0A0QXrr3aB/7wbLITsw8qfo2ynGP+2CUGa6lfyVlzR62UdT7isSrEB0RWtZDAnL+AcA0pT1HiAO6xI+esnsVdQzu2vDW3CTsUp8HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762567078; c=relaxed/simple;
	bh=fHsMbjl1zv9VJXtJNWbNPuP9NMy2LcXXQQg5AAuc9gY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1Ofg1uEqy6/JDcw/U25MQVBEIIKKa3tEWW+zf5IaXYNhOtsfbfskHb4lSHDnBb1ssuLCXU8QKwothIBJE4DeHZCEB5rx24OMa9JwJutdHvvkpn9Qxvjh9VotBOJXOAk6UuOxEjX7xcEngqY9jpUln5dLsxzoBVbHjj2V8KF+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iB4n+y+r; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iB4n+y+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762567076; x=1794103076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHsMbjl1zv9VJXtJNWbNPuP9NMy2LcXXQQg5AAuc9gY=;
  b=iB4n+y+rBwPLlkhfz+YA+yKRI6YzHrr4cnQtKrbMIj3j0OF/lMoibJtV
   j3HBggzO9qahf9YFg0KwkbcpfUYRUQ0O0A1tc2NUhhjXYRR2wO0067gLF
   y09ozcbRLPDXb6Uyewfd/HVpPrzoR2WkS3B80BmdlD3AcchfpWe8xayrH
   95NN4NQ6SuOybalYC/R4xNVeCuEgTr2cIrEthPuKf+TaVcgsdwZzsCUBi
   e9/EVxCjMDJrbsrUlSALFrD6PAcgA0w19hORUZkbuUMdu2ROTVi5Pn2Jj
   zNgVgRQ6BfH109mX8z8/INu5/DAnJTrMY6Gzi+Ml+6DMPb3G4XL894rRt
   w==;
X-CSE-ConnectionGUID: rr71YI+LQoipR+hOzH9Qog==
X-CSE-MsgGUID: 36LXTlc2Qw2JxF++wZAvbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="75830743"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="75830743"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 17:57:55 -0800
X-CSE-ConnectionGUID: g+VIaVTeSu+ChyaINQUKnQ==
X-CSE-MsgGUID: 6fFslJFJQWa7jTpVxN3Zhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="188354232"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Nov 2025 17:57:54 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHYDA-0000bV-0H;
	Sat, 08 Nov 2025 01:57:52 +0000
Date: Sat, 8 Nov 2025 09:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 7/11]
 kernel/cgroup/cpuset.c:2812:20: error: 'default_sysram_nodelist' undeclared;
 did you mean 'default_dram_nodes'?
Message-ID: <202511080948.Zf5PlQKK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   67062e895b94cd27af5fa58d8a567086a53d0914
commit: 2c5eedd6cd1524843e21a0e1ec1d1c8d9fd78e14 [7/11] cpuset: introduce cpuset.mems.default
config: s390-randconfig-002-20251108 (https://download.01.org/0day-ci/archive/20251108/202511080948.Zf5PlQKK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080948.Zf5PlQKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080948.Zf5PlQKK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17,
                    from arch/s390/include/asm/processor.h:31,
                    from include/linux/sched.h:13,
                    from include/linux/cgroup.h:12,
                    from kernel/cgroup/cpuset-internal.h:6,
                    from kernel/cgroup/cpuset.c:24:
   kernel/cgroup/cpuset.c: In function 'update_nodemasks_hier':
>> kernel/cgroup/cpuset.c:2812:20: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
      if (!nodes_empty(default_sysram_nodelist))
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c:2812:20: note: each undeclared identifier is reported only once for each function it appears in
      if (!nodes_empty(default_sysram_nodelist))
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c: In function 'cpuset_css_online':
   kernel/cgroup/cpuset.c:3601:20: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
      if (!nodes_empty(default_sysram_nodelist))
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c: In function 'cpuset_init':
   kernel/cgroup/cpuset.c:3840:19: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
     if (!nodes_empty(default_sysram_nodelist))
                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c: In function 'hotplug_update_tasks':
   kernel/cgroup/cpuset.c:3873:19: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
     if (!nodes_empty(default_sysram_nodelist))
                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c: In function 'cpuset_handle_hotplug':
   kernel/cgroup/cpuset.c:4067:20: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
      if (!nodes_empty(default_sysram_nodelist))
                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c: In function 'cpuset_init_smp':
   kernel/cgroup/cpuset.c:4141:19: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
     if (!nodes_empty(default_sysram_nodelist))
                      ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~
   kernel/cgroup/cpuset.c: In function 'cpuset_current_node_allowed':
   kernel/cgroup/cpuset.c:4375:38: error: 'default_sysram_nodelist' undeclared (first use in this function); did you mean 'default_dram_nodes'?
     if (!protected_node && !nodes_empty(default_sysram_nodelist))
                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nodemask.h:229:42: note: in definition of macro 'nodes_empty'
    #define nodes_empty(src) __nodes_empty(&(src), MAX_NUMNODES)
                                             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +2812 kernel/cgroup/cpuset.c

  2769	
  2770	/*
  2771	 * update_nodemasks_hier - Update effective nodemasks and tasks in the subtree
  2772	 * @cs: the cpuset to consider
  2773	 * @new_mems: a temp variable for calculating new effective_mems
  2774	 *
  2775	 * When configured nodemask is changed, the effective nodemasks of this cpuset
  2776	 * and all its descendants need to be updated.
  2777	 *
  2778	 * On legacy hierarchy, effective_mems will be the same with mems_allowed.
  2779	 *
  2780	 * Called with cpuset_mutex held
  2781	 */
  2782	static void update_nodemasks_hier(struct cpuset *cs, nodemask_t *new_mems)
  2783	{
  2784		struct cpuset *cp;
  2785		struct cgroup_subsys_state *pos_css;
  2786	
  2787		rcu_read_lock();
  2788		cpuset_for_each_descendant_pre(cp, pos_css, cs) {
  2789			struct cpuset *parent = parent_cs(cp);
  2790	
  2791			nodes_and(*new_mems, cp->mems_allowed, parent->effective_mems);
  2792	
  2793			/*
  2794			 * If it becomes empty, inherit the effective mask of the
  2795			 * parent, which is guaranteed to have some MEMs.
  2796			 */
  2797			if (is_in_v2_mode() && nodes_empty(*new_mems))
  2798				*new_mems = parent->effective_mems;
  2799	
  2800			/* Skip the whole subtree if the nodemask remains the same. */
  2801			if (nodes_equal(*new_mems, cp->effective_mems)) {
  2802				pos_css = css_rightmost_descendant(pos_css);
  2803				continue;
  2804			}
  2805	
  2806			if (!css_tryget_online(&cp->css))
  2807				continue;
  2808			rcu_read_unlock();
  2809	
  2810			spin_lock_irq(&callback_lock);
  2811			cp->effective_mems = *new_mems;
> 2812			if (!nodes_empty(default_sysram_nodelist))
  2813				nodes_and(cp->mems_default, cp->effective_mems,
  2814					  default_sysram_nodelist);
  2815			spin_unlock_irq(&callback_lock);
  2816	
  2817			WARN_ON(!is_in_v2_mode() &&
  2818				!nodes_equal(cp->mems_allowed, cp->effective_mems));
  2819	
  2820			cpuset_update_tasks_nodemask(cp);
  2821	
  2822			rcu_read_lock();
  2823			css_put(&cp->css);
  2824		}
  2825		rcu_read_unlock();
  2826	}
  2827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
