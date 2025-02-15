Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0834CEACE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739588272; cv=none; b=mNnKlvPCMj2qrxWsfUc5l/HwQnJNcqxpVKK6eqxmTvhGayZSqqeaRAt6hvp4+8Jr/tVpkmzOJtjcYvAOT1kfrrSxmGzv+Caj8VLjHnRAgN2KClMUyyt5rGis2wCDyekUQaJyL4OtSn/xJ9Ep5uwGArvUhKX0WWpbhVN6eVpL3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739588272; c=relaxed/simple;
	bh=2GlBjO+P+UGRaa3+Z8Wz82eh22ttJqKqxTA1lHfVUik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K0Y0fc5fbMC9DYTw3vuUeRLsOUT7KHkKtxk2dVrlirEvnzb3uMj/RK4B8KTs2HGgj+P7OUnW0em7fCh21tqbAx15QBwBZJeKKgTcJ4TM4ih63ZEkC8qNEYZ02TutkRN5tVRcRo01GR6i9wAwAtUS2KyDQvVqehc171G6xtQoXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmy0jzh9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmy0jzh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739588270; x=1771124270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2GlBjO+P+UGRaa3+Z8Wz82eh22ttJqKqxTA1lHfVUik=;
  b=lmy0jzh92GOZfDwanRLN5NoTG08MYxqNr0ARrgzUFLLkHe3WfRVKcUl7
   agq/xW9DdubHcJSMpqL8txApdB410iDzlbs4qpTt+5q+qaViUcZ2xpJ1r
   4OFuwlXPhq1pm9kjm0g2phyBCrvRXobcTaAcSzISJbNkfdAqgLq415LL2
   9BLNqShFmD2qxgEfvHv5psUCXu47AKE6qgvVlDPzlOZH8aRc8KpNDFsNf
   kpsMk4GgtYGq8zFhg49lVghQBJbuTbbJ0udkvncf6HtV3hujLqfdwJW2V
   SdDROAcQWGPE+/xari1k0eL0L+IBCNDU4IeP7m993rD++164vuEPi3bJW
   g==;
X-CSE-ConnectionGUID: BKdkaxuoRRuXLsv75cNWeQ==
X-CSE-MsgGUID: Y1slY28bTKqSda4K9jJ75Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40474709"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40474709"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 18:57:49 -0800
X-CSE-ConnectionGUID: S8388VQiT/S25RGgFqYDgw==
X-CSE-MsgGUID: RtMCAA0uTeuFKfLgTQtXCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117758021"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Feb 2025 18:57:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj8NG-001ARt-0a;
	Sat, 15 Feb 2025 02:57:46 +0000
Date: Sat, 15 Feb 2025 10:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1926/1926] mm/memcontrol.c:3147:6: warning: no
 previous prototype for function 'hisi_oom_recover'
Message-ID: <202502151053.A5sFfyJm-lkp@intel.com>
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
head:   56197cf035ddc0d25f6d27169455448133fd75dd
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1926/1926] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502151053.A5sFfyJm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151053.A5sFfyJm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151053.A5sFfyJm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for function 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^
   mm/memcontrol.c:3147:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         | ^
         | static 
   1 warning generated.


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
