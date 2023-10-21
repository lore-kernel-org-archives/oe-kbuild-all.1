Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA83650
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 04:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh6rV+e8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697864211; x=1729400211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TEP7Lq0eljaaOPwAXsMAcroQvjizfdiSGaDlPDoqCms=;
  b=Lh6rV+e83VTrl8GeHt4E25iLw5Lweb3vqwroNXHJilduZFkc9+GeEB8P
   MIKdxn4o+JO/XjAcVP0qe54nIwMqOHK5ut/JuoC8SmVCF3JpjWFDshKvT
   DlnPGXRYJmJ97LVpQRj8v6ZKLtBBryb9r4/Kegby+2Y4ilbL48/StQsHO
   v5lRrQTEwetcKqGs+y2od0QBINu4y+oQYxa6no4flSvuzUDhIlvNavCDH
   T/JZ2MpBp61IVL65FUo4YN1WaBlpyOhHYn3NVhmfdpvRVHWDGQop3qfkU
   Z/NdsNtgczInPHs4MrSMTW7qWvgX/rRuHf8NNV7UWBvqTegm8iQff8ouG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="383816766"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="383816766"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 21:56:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="734156684"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="734156684"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Oct 2023 21:56:49 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu42Y-0004Qo-2u;
	Sat, 21 Oct 2023 04:56:46 +0000
Date: Sat, 21 Oct 2023 12:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 09/14] lsm: Add security_inode_mknod_nscap() hook
Message-ID: <202310211245.IYL8Z5z3-lkp@intel.com>
References: <20231018105033.13669-10-michael.weiss@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018105033.13669-10-michael.weiss@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 58720809f52779dc0f08e53e54b014209d13eebb]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/device_cgroup-Implement-devcgroup-hooks-as-lsm-security-hooks/20231018-185850
base:   58720809f52779dc0f08e53e54b014209d13eebb
patch link:    https://lore.kernel.org/r/20231018105033.13669-10-michael.weiss%40aisec.fraunhofer.de
patch subject: [RFC PATCH v2 09/14] lsm: Add security_inode_mknod_nscap() hook
config: arc-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310211245.IYL8Z5z3-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211245.IYL8Z5z3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211245.IYL8Z5z3-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from fs/select.c:22:
>> include/linux/security.h:1408:1: error: expected identifier or '(' before '{' token
    1408 | {
         | ^
>> include/linux/security.h:1405:19: warning: 'security_inode_mknod_nscap' declared 'static' but never defined [-Wunused-function]
    1405 | static inline int security_inode_mknod_nscap(struct inode *dir,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/fair.c:56:
>> include/linux/security.h:1408:1: error: expected identifier or '(' before '{' token
    1408 | {
         | ^
   kernel/sched/fair.c:12871:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12871 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12873:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12873 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12878:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12878 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12880:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12880 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/security.h:1405:19: warning: 'security_inode_mknod_nscap' declared 'static' but never defined [-Wunused-function]
    1405 | static inline int security_inode_mknod_nscap(struct inode *dir,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:90,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/build_policy.c:34:
>> include/linux/security.h:1408:1: error: expected identifier or '(' before '{' token
    1408 | {
         | ^
>> include/linux/security.h:1405:19: warning: 'security_inode_mknod_nscap' declared 'static' but never defined [-Wunused-function]
    1405 | static inline int security_inode_mknod_nscap(struct inode *dir,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +1408 include/linux/security.h

  1384	
  1385	static inline int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen)
  1386	{
  1387		return -EOPNOTSUPP;
  1388	}
  1389	static inline int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen)
  1390	{
  1391		return -EOPNOTSUPP;
  1392	}
  1393	static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen)
  1394	{
  1395		return -EOPNOTSUPP;
  1396	}
  1397	static inline int security_locked_down(enum lockdown_reason what)
  1398	{
  1399		return 0;
  1400	}
  1401	static inline int security_dev_permission(umode_t mode, dev_t dev, int mask)
  1402	{
  1403		return 0;
  1404	}
> 1405	static inline int security_inode_mknod_nscap(struct inode *dir,
  1406						     struct dentry *dentry,
  1407						     umode_t mode, dev_t dev);
> 1408	{
  1409		return -EPERM;
  1410	}
  1411	#endif	/* CONFIG_SECURITY */
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
