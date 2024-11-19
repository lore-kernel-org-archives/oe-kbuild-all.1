Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B91384BF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 02:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983830; cv=none; b=grgXENvOYmUaSpH50ao+PRCMhplX3QEBkXMV4xSxUiQD+fV801eimeJprE3wpXRquCIAARrckPWHnLWtAD7HjOLJWy33sxoT3Zn/vI/GqLWybCheSIMEJnmPopDI7mE3HHwjsOEhm3NKZMu903X2k/SZnzcEqdfOCoUcrdxW9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983830; c=relaxed/simple;
	bh=uCZjToDSCWDUVIKB3aMjlqMvAe1TBLENpkLFWVfwajI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QuVm7pWYwxcKPhlHsevXhv/oR5R2NqyUWMIdxSmFsqRTb04Wmk9Gp1pQMoynEM1zjyZnY+fhitxZw10aQKvShpc7Y/r5NOfuQzbaITUOqk4f997+pTlXhmFd84mGCuPE4QN8Faqt7zQKjdcp46yI5JQe4o3jfApyVurDFYVHe7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5zuW0dc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5zuW0dc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731983828; x=1763519828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCZjToDSCWDUVIKB3aMjlqMvAe1TBLENpkLFWVfwajI=;
  b=m5zuW0dcApclHD2LpiMXFhPTujvOPQQvi8wvPhKHz4viNDPxhaoQvcyG
   kmOQKqfqmlapOOTXuFAUKLfFqwtcyLH7NB5C5JOUnOx1Dk5Hkb3wtAH/y
   reFHEpjjyllCCWQJ5Xskms9RGzVNae3xhkAdQYQOd/W6tul7EGewx0qqa
   W3+i9ST5P35OSaRuWeA+LhxCtvMYMtyRkdehF5mKJoXseke++fenKne7c
   cnT4EjFJMX9dfRxkurLIsfc8xaxnJ+K/+Zjhnn+V0nJTg/I1k1mttO7GR
   ItI4lp3mf6B79lDlfyULzU0rNLQ0QyARi7C0AGqcaJGzwzjBveluGC2lo
   A==;
X-CSE-ConnectionGUID: jIkORO3+RgyD9jzjTv02mQ==
X-CSE-MsgGUID: pT58d8L3RMmoHFrSQ3Uxog==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31339380"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31339380"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:37:08 -0800
X-CSE-ConnectionGUID: iwTzTrrBReOcHw8EjdjoaQ==
X-CSE-MsgGUID: KgyAbHa+SmajTU6lVJjXxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="126952232"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2024 18:37:04 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDE6T-00002z-1R;
	Tue, 19 Nov 2024 02:36:44 +0000
Date: Tue, 19 Nov 2024 10:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/zen-sauce 20/31] block/elevator.c:570:31: error: too many
 arguments to function call, expected single argument 'name', have 2
 arguments
Message-ID: <202411190938.StB785cp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/zen-sauce
head:   a77e5dc91c4328da8b938f220477e8de98165075
commit: 6912e177e46c2a6e0650395cf13039bfcfc1af86 [20/31] ZEN: INTERACTIVE: Use Kyber as the elevator for MQ devices
config: x86_64-randconfig-161-20241119 (https://download.01.org/0day-ci/archive/20241119/202411190938.StB785cp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190938.StB785cp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190938.StB785cp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/elevator.c:28:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> block/elevator.c:570:31: error: too many arguments to function call, expected single argument 'name', have 2 arguments
     570 |                 return elevator_find_get(q, "kyber");
         |                        ~~~~~~~~~~~~~~~~~    ^~~~~~~
   block/elevator.c:109:30: note: 'elevator_find_get' declared here
     109 | static struct elevator_type *elevator_find_get(const char *name)
         |                              ^                 ~~~~~~~~~~~~~~~~
   4 warnings and 1 error generated.


vim +/name +570 block/elevator.c

   557	
   558	/*
   559	 * For single queue devices, default to using mq-deadline. If we have multiple
   560	 * queues or mq-deadline is not available, default to "none".
   561	 */
   562	static struct elevator_type *elevator_get_default(struct request_queue *q)
   563	{
   564		if (q->tag_set->flags & BLK_MQ_F_NO_SCHED_BY_DEFAULT)
   565			return NULL;
   566	
   567		if (q->nr_hw_queues != 1 &&
   568		    !blk_mq_is_shared_tags(q->tag_set->flags))
   569	#if defined(CONFIG_ZEN_INTERACTIVE) && defined(CONFIG_MQ_IOSCHED_KYBER)
 > 570			return elevator_find_get(q, "kyber");
   571	#elif defined(CONFIG_ZEN_INTERACTIVE)
   572			return elevator_find_get(q, "mq-deadline");
   573	#else
   574			return NULL;
   575	#endif
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
