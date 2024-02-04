Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6BF2C69F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 21:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707083894; cv=none; b=myzylI+YksDCEbAQweSqgrSDSuskgcyb0IKn8cX6MegFN5a33iNtLY9X2/qi470cE0iVCX4ik5P1tyAbJDVx1GRfj0+UpHH5zYpi0h0Kn4w53rY5VrtGK5PXbxkZp8A7cTn+UMJfSv0WeVhg0WnYEttcjgO9phLl6Lj/2P7dDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707083894; c=relaxed/simple;
	bh=fbmQqiY/zY1cx6N8vvgpiCc6GpALMfkpXv9kPlJB+WI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncc6ylU2xMuuobg7eTPu9LKC28Mnenkxrs0SdX1zpBrDlM6Vax9E0nszL9DvvRkzC61rig2GrJiTRfxtRNpWh5CkT/JiBYo/Ps2hP4xGIAdR/nqFIuh+0JneMTwOX6NueGwBgGVF7VUh/MlICYnq4XyGRbHu3Kjo1UYGdWIC3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6BFRRYe; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6BFRRYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707083891; x=1738619891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbmQqiY/zY1cx6N8vvgpiCc6GpALMfkpXv9kPlJB+WI=;
  b=C6BFRRYeNCvz1etqsPq+17eEBMY+je16sBS/cn5SpG4YMEK1iNHvESgE
   nFV00fHLxS8J8FMImNIUXvkdsqpjlf/rUdE8+zL/7ilnj2o4j9fKdwpnK
   7oaYrX1jDMxEwasvQzkogVsFuc91iXsocujnmqXbRxl1jQJsCTtoBT7ZN
   2Z/YqPavbK3464Zxxcqe2YA/t/SZPQ4f72mziSkrR2JnA+fY3Tutp1Ucg
   1u32RO/DApZccAbP34pnTQ/vt1laLIwwuAsKNtj8urTorHdXixxRNXsJw
   LxTgE8tvq+RG8d6sDv0tvecZjz94qTPcQTmrtpKhkC2N3JHuonfsueDDi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="394846228"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="394846228"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 13:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="932986277"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="932986277"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2024 13:58:09 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWkV5-0006il-1e;
	Sun, 04 Feb 2024 21:58:07 +0000
Date: Mon, 5 Feb 2024 05:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2403/2942] mm/mem_reliable.c:320:13: warning:
 'mem_reliable_ctrl_bit_disabled' defined but not used
Message-ID: <202402050528.e210gDbs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   988c7111f1e95028838eb8e4f71ee49b45132a23
commit: 425771499c0742a996ab28df143d7a5123102686 [2403/2942] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-003-20240205 (https://download.01.org/0day-ci/archive/20240205/202402050528.e210gDbs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402050528.e210gDbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402050528.e210gDbs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/mem_reliable.c: In function 'mem_reliable_feature_disable':
   mm/mem_reliable.c:345:9: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable'; did you mean 'mem_reliable_ctrl_bit_disabled'? [-Werror=implicit-function-declaration]
     345 |         mem_reliable_ctrl_bit_disable(idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         mem_reliable_ctrl_bit_disabled
   mm/mem_reliable.c: At top level:
>> mm/mem_reliable.c:320:13: warning: 'mem_reliable_ctrl_bit_disabled' defined but not used [-Wunused-function]
     320 | static void mem_reliable_ctrl_bit_disabled(int idx) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
