Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5D48CEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kcwo7IEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704894834; x=1736430834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CddRloo8PZnAJ+H3QNkg4wzkr+Ofn6qi69/66XhRVy0=;
  b=Kcwo7IEOjF+c8ztv3FTBMM4Lx8JJxUlp4s1KVfCUrYcymMpzgZWukRBA
   HOmz2lI7f+FlsNSGUJ0WkGTWAjCiABGip8V/UyO+hcMfNZrk9DvSh+hfe
   TGTpWUQnRwGiGlwO6RGGSv5jyzy2mzGfKZ0yUgggyaMrxtU+hS+R0Wt2m
   zpsJLRtJp2KwAdcPoUrIV6Fb+xrPrnHaufNHZvQDsLZ2M+coLSRC40R29
   +A0qixVR3abkv7tuTH1+QB0MHk2OH3+5gXdIYilIyhsXHquCyoffXCvih
   pdE/XVnIX5VNT4CcAO8VbYAdIRz0PEeh8tFCzPHom6VeSUANAtibH9hmB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5295955"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5295955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 05:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="24278270"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2024 05:53:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNZ1i-000750-0f;
	Wed, 10 Jan 2024 13:53:50 +0000
Date: Wed, 10 Jan 2024 21:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1683/2334] mm/memcontrol.c:3147:6: warning: no
 previous prototype for function 'hisi_oom_recover'
Message-ID: <202401102153.DZEkxjcR-lkp@intel.com>
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
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1683/2334] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401102153.DZEkxjcR-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102153.DZEkxjcR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102153.DZEkxjcR-lkp@intel.com/

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
