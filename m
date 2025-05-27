Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6321885D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 23:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748387026; cv=none; b=PWJjcUb9ho825QPML5/ya8O99tUE3JzbvqRBcJT5uzXQIS3M0GSSkb1c4b25dc4KAWsno3ZljBxs80HADUEbH+oT6f1jqZPFffeaWPz0Qwj+et6MPOQ0kU6pgGUyyLRiBwxEh+QQzJoYJiHze8iTs21jPCHNmLVVImhn7t+ujCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748387026; c=relaxed/simple;
	bh=pJ1vnHs4xuSRXDWYxafNAL/ux7P8pFJOiyZTF1MZlT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3G8OEv2VqXftX3jpvIqwVWYC+w3BHPnQaA4JjygXE8w2OO5tPqyRSPZ4xu3Ba14lghkdY+GHzTJGB5qeprLVIucFw7vEpyXUwbTEmqHa9xSQljE/OH7WwyDUZXwHoc+W7BBUaPZKdYZfIk9eUMz9Bu9aRIFrQFg15XYDU1MVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgSK90kr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgSK90kr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748387023; x=1779923023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJ1vnHs4xuSRXDWYxafNAL/ux7P8pFJOiyZTF1MZlT8=;
  b=hgSK90krDLk5cuuFbux8Lxb0e5L9LMdLKc8ffnZccQp4qPJrFAxV3xSd
   u2sKFaKCOAEmjuVWtcGZjYVkpjx2DbsPzsLZmfHCUvFfUV0eLxWF2G2FN
   StYQVAynV3VzRIEZOCVkR+ik/Y2uI7KH0m8uZ7Kwe9S+yGGQ3VWAJ5bnj
   tPJqQuGPKd+e0W2a6cFJKZ/LJiGAtDfeMbGL2EGcpvSH7iSnkw9yAWwEy
   N4f9L2cSz8EEXTMau1z9NUSvlW5TK38k7lFNSztqXbPaVzaf22XfoBfdS
   HNTLOuzELWASaTd7NGZel17JVOGHjFZUT0GHJYwj4XsSinwLBwr6+MpQb
   A==;
X-CSE-ConnectionGUID: jPUJiKfhTeudvhDgR/wo3g==
X-CSE-MsgGUID: Ro74iSTrTAiaGFuvNAAflg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="49646838"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="49646838"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 16:03:42 -0700
X-CSE-ConnectionGUID: CNUkQz+gTj2RVnzCP6uxzQ==
X-CSE-MsgGUID: R2+xmai8TVqDJb8Msf21Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143979908"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 16:03:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK3Kd-000V52-0f;
	Tue, 27 May 2025 23:03:39 +0000
Date: Wed, 28 May 2025 07:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2304/2304] mm/memcontrol.c:3147:6: warning: no
 previous prototype for function 'hisi_oom_recover'
Message-ID: <202505280603.E3YHNVzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   35c5792a71f249ce79eba3cbb546d1ece7c4f3ee
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [2304/2304] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280603.E3YHNVzo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280603.E3YHNVzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280603.E3YHNVzo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:20:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/memcontrol.c:57:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memcontrol.c:3147:6: warning: no previous prototype for function 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^
   mm/memcontrol.c:3147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         | ^
         | static 
   mm/memcontrol.c:4007:48: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4007 |                         nr += lruvec_page_state(lruvec, NR_LRU_BASE + lru);
         |                                                         ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:4009:54: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4009 |                         nr += lruvec_page_state_local(lruvec, NR_LRU_BASE + lru);
         |                                                               ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:4025:46: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4025 |                         nr += memcg_page_state(memcg, NR_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~ ^ ~~~
   mm/memcontrol.c:4027:52: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    4027 |                         nr += memcg_page_state_local(memcg, NR_LRU_BASE + lru);
         |                                                             ~~~~~~~~~~~ ^ ~~~
   12 warnings generated.


vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
