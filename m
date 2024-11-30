Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F18468
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732936249; cv=none; b=JOGtbqaRqCOcWgtKXGNU378ARJPQATsO1ZBVTZQXAtd/qMzN9FFHtcWOSxJoqnqA8oiVJUNRDTyijVeUsORCznXKuz4siBPAc4f6nyx6S21dUcjarZYX6BrnOZrnLMpDJU4owBvt23oxalFTFcyaFK13+sCMjvVz9zheQoTleaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732936249; c=relaxed/simple;
	bh=HUgtl/1F7OFAGQ7UdAJ511WfrI2NHPc1hZyDQRucMBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KwWJIYchbcELqbYOihPsbF4nOvu5O4LSkmJBwBNyw8q3ZOoH/fTr6XXgm0uEAGeXwOZ8CzahuyjfesqZLeWtwifXOqolcagFw1LyiSalJ5y34BAlk7DHC2SmJZg7vzvtSKrPCcuorxdJHQgjnOnqxGUZGurx+Wdjy6K0xlF9cck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAp/aWhb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAp/aWhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732936245; x=1764472245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HUgtl/1F7OFAGQ7UdAJ511WfrI2NHPc1hZyDQRucMBc=;
  b=eAp/aWhbW9YNOfKskNZuQxnMjUP04wiApyp78VCEYYjjF0M2SBvko6w1
   TMG1tAu86GNfkBDTaXYDDujrEeID7S85AkqjeS/m49RyubyfdUKvHFLUD
   D28dpW49NCA4pyEYyGAljNAF6VR4xbr8J03EXku/+OZn8bZzz0nJBBrjR
   ZEnJ6Col0osv7GZD5l4RbOr00Gam97vDBtZQGjVhKoF6MWxNaQ9+xqPlk
   IoDjaEeYJYsgZHQbI2vRyLNcXM4K/Xg3RLto5BnQ4IeKWIz6DIej4Tpcw
   XY7Z+cKzae4TMhzymmo3ptrDVCxD1IXPWPlqY4BKxsOXdHzyr0nfFWdT2
   Q==;
X-CSE-ConnectionGUID: IcPBVLE1SouuT214Bd2+EA==
X-CSE-MsgGUID: w5QSdBcTRv+nswgJyfxiAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="55655190"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="55655190"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 19:10:44 -0800
X-CSE-ConnectionGUID: cFFH2HAaRUGMRRglRGr6Ig==
X-CSE-MsgGUID: sTvx2B1XQoimTHOhTYkHfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92710436"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2024 19:10:43 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHDsW-00003D-1r;
	Sat, 30 Nov 2024 03:10:40 +0000
Date: Sat, 30 Nov 2024 11:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt 5/12] kernel/events/uprobes.c:659:16:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202411301144.SyT1wTT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt
head:   e1ae80d388ea2e1e3501ac7ddac7090137c4a70c
commit: 19412432d151ebff4f39b07f0e752af148597f14 [5/12] uprobes: Add mapping for optimized uprobe trampolines
config: x86_64-randconfig-123-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301144.SyT1wTT0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301144.SyT1wTT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301144.SyT1wTT0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/uprobes.c:659:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int @@
   kernel/events/uprobes.c:659:16: sparse:     expected restricted vm_fault_t
   kernel/events/uprobes.c:659:16: sparse:     got int
   kernel/events/uprobes.c:2196:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2196:17: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2196:17: sparse:    struct return_instance *
   kernel/events/uprobes.c:2277:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2277:9: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2277:9: sparse:    struct return_instance *
   kernel/events/uprobes.c:2336:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2336:9: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2336:9: sparse:    struct return_instance *
   kernel/events/uprobes.c:2395:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2397:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2656:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:2656:25: sparse:    struct return_instance [noderef] __rcu *
   kernel/events/uprobes.c:2656:25: sparse:    struct return_instance *
   kernel/events/uprobes.c:2784:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2786:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c: note: in included file:
   include/linux/rmap.h:703:28: sparse: sparse: context imbalance in '__replace_page' - unexpected unlock
   kernel/events/uprobes.c:886:17: sparse: sparse: context imbalance in 'hprobe_finalize' - unexpected unlock
   kernel/events/uprobes.c:954:25: sparse: sparse: context imbalance in 'hprobe_expire' - unexpected unlock
   kernel/events/uprobes.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +659 kernel/events/uprobes.c

   644	
   645	static vm_fault_t tramp_fault(const struct vm_special_mapping *sm,
   646				      struct vm_area_struct *vma, struct vm_fault *vmf)
   647	{
   648		struct hlist_head *head = &vma->vm_mm->uprobes_state.tramp_head;
   649		struct tramp_area *area;
   650	
   651		hlist_for_each_entry(area, head, node) {
   652			if (vma->vm_start == area->vaddr) {
   653				vmf->page = area->page;
   654				get_page(vmf->page);
   655				return 0;
   656			}
   657		}
   658	
 > 659		return -EINVAL;
   660	}
   661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
