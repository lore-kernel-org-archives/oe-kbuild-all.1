Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723912F36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729974146; cv=none; b=UYT4aAgzjuku01H5S6weTwvpnKndqCUHsDpicrpSoCIR8SR0aUrvoelt/LMp+ICSWlCxcwStaThhywWZfvKkT679pQNvPhEQcx2buvX6Eamw6E07iUa+K3I+XKWve38iwooWR+390sOw6AStJPDLeWcrdjKodosK4x00rqfIgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729974146; c=relaxed/simple;
	bh=WKyr+LyPHgxUirxJKJ9lANnLVAIHalJkZ5XfdnEXAu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Txe6BHEcTyNDn2JLiIB597Hfw0DA7XOzQe/V7gX3wQwQFQ2tNSS3x28af31R/kJG1DgD2lXBtM4ya7tPsfwQeALoqJ8A8t6mVRKyWoJ8jCZq+djOF1O6TiX75QvwKO0atKpknGINqPtdNk10O7R9lH5cIQ0qRRQkDxsCiWoh8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mp0v3Bci; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp0v3Bci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729974143; x=1761510143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WKyr+LyPHgxUirxJKJ9lANnLVAIHalJkZ5XfdnEXAu8=;
  b=Mp0v3BciTizK/AfwgB0kCoyrwFdxmedJx9HzVaGtYH9dlxJo/aEKf3fe
   UJ7oHBm4Mx3uB5r4qdMKaYO5Q20vACBUXi2FSiBsRHcNsSvb3DlOEaYm7
   k8+kJTq1uY7Bxrhk9oPtih8A6+S8FqihZLlxfwpzQV2i+81JMVJJq6lky
   k4k0gt3hukYXnRwT/5YPyXGQLJi1WqGL6t5ll5m8DV1iZIJL3FxBX+ZFc
   eAWLmwZaMSPQQRp14MszL6sXNgK5vASKWgAdN1UCHWluf7IxJft2tnjbU
   2/dCRLXbcqcoBzKKrItp37fa/oqNhLx5FBicD3wOQSQagNdsRLkmuJdxL
   w==;
X-CSE-ConnectionGUID: fWatcVdYRuGtjBcr6AiWZA==
X-CSE-MsgGUID: /7lnc0LoSfqbFzU6ZB+d8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29807000"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29807000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 13:22:23 -0700
X-CSE-ConnectionGUID: EoKgGFovRliugYA60qjYiw==
X-CSE-MsgGUID: cP0xqDpvQDuNHxLowJJLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="112080157"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2024 13:22:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4nIh-000a0u-2X;
	Sat, 26 Oct 2024 20:22:19 +0000
Date: Sun, 27 Oct 2024 04:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2413/15331] mm/mem_reliable.c:320:13: warning:
 'mem_reliable_ctrl_bit_disabled' defined but not used
Message-ID: <202410270450.rOHyUqxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 425771499c0742a996ab28df143d7a5123102686 [2413/15331] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-001-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270450.rOHyUqxL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270450.rOHyUqxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270450.rOHyUqxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_reliable.c: In function 'mem_reliable_feature_disable':
   mm/mem_reliable.c:345:9: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you mean 'mem_reliable_ctrl_bit_disabled'? [-Wimplicit-function-declaration]
     345 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_reliable_ctrl_bit_disabled
   mm/mem_reliable.c: At top level:
>> mm/mem_reliable.c:320:13: warning: 'mem_reliable_ctrl_bit_disabled' defined but not used [-Wunused-function]
     320 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mem_reliable_ctrl_bit_disabled +320 mm/mem_reliable.c

   302	
   303	static int __init reliable_sysctl_init(void)
   304	{
   305		if (!mem_reliable_is_enabled())
   306			return 0;
   307	
   308		if (!register_sysctl("vm", reliable_ctl_table)) {
   309			pr_err("register sysctl failed.");
   310			return -ENOMEM;
   311		}
   312	
   313		percpu_counter_init(&pagecache_reliable_pages, 0, GFP_KERNEL);
   314		percpu_counter_init(&anon_reliable_pages, 0, GFP_KERNEL);
   315	
   316		return 0;
   317	}
   318	arch_initcall(reliable_sysctl_init);
   319	#else
 > 320	static void mem_reliable_ctrl_bit_disabled(int idx) {}
   321	#endif
   322	
   323	static void mem_reliable_feature_disable(int idx)
   324	{
   325		char *str = NULL;
   326	
   327		switch (idx) {
   328		case MEM_RELIABLE_FALLBACK:
   329			reliable_allow_fallback = false;
   330			str = "fallback";
   331			break;
   332		case MEM_RELIABLE_SHMEM:
   333			shmem_reliable = false;
   334			str = "shmem";
   335			break;
   336		case MEM_RELIABLE_PAGECACHE:
   337			pagecache_reliable = false;
   338			str = "pagecache";
   339			break;
   340		default:
   341			pr_err("unknown index: %d", idx);
   342			return;
   343		}
   344	
 > 345		mem_reliable_ctrl_bit_disable(idx);
   346		pr_info("%s is disabled\n", str);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
