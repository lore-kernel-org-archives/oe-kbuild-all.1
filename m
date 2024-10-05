Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A86C231CA6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728128110; cv=none; b=f1gMdAHg+fUDycKydGvhKZw0J+hRTmfoedKZihcARFiWJIdFHk8aIdnJOhwUNhm7kXzOsWSTRrDcOYx7plZ4WXqd/eiOPeCdlbAKrQwtQNn7cVwoEB+e1OVqHPUgFw1qnR/alsDHJyfvZFxrCqLMBA8yum29HcbTMWspRLgwQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728128110; c=relaxed/simple;
	bh=DppHxAVsigE5nXeBIf3lXIawNLPBQKn7lgbsLkmQ72g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+brXGF/JQ99GAy7RtIy8XC0Rny4uEGRo+lzH0NcwvQY8v02w9Zc/FJjl//lASBka9P2Do4/HXnu+NaX16NBHEafkfRDD0z2rIvqrHRAqCSVG4SPGmDX1n2cyXKzVnUFJfvFk0REC2vpd6aCIyhg7c5NkfN0SRICoamK8bmVhGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5cT78zY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5cT78zY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728128109; x=1759664109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DppHxAVsigE5nXeBIf3lXIawNLPBQKn7lgbsLkmQ72g=;
  b=L5cT78zYcXZpjDL8dINC3kvYlP3+Ik/NMLmyxjPDrLp0R57zpaVbj3WH
   ZqkQA4citzS2TZcf+B48Dew+qgzOEu9zcEEVezVP26WNnWZmlTMYVc3YW
   qwdUY/paF+ESQpezKnJ/RgqCsjSmiyi/hr1nXYJJ9jD24cO9dHCL2LAUt
   1YVWrAFzEdOlgrdeE5KZQ9TKmn+dC8wh+KIerhD3DiWmMH31cTqoYcRc6
   lpxr51VSNek58z+hNXgUeAQkSQRBF0dCzzXPlgLkfCG5byrtStVczNAR2
   8Ly+lPdn2m4wF6UCwTRcAQPXhm/W5b9ryfzXDSEn+JzABgWNE2V7Lto6c
   A==;
X-CSE-ConnectionGUID: xEOHty8bSpCbqz97IIz0Ug==
X-CSE-MsgGUID: beXqhevDTOurH3iZI1o4qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37942212"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="37942212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 04:35:08 -0700
X-CSE-ConnectionGUID: /nRErlfSSV65JqGJAq8sNg==
X-CSE-MsgGUID: DmV35RTAQnyogehh9WAZTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="79927790"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 04:35:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx33w-0002tq-2n;
	Sat, 05 Oct 2024 11:35:04 +0000
Date: Sat, 5 Oct 2024 19:34:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: oe-kbuild-all@lists.linux.dev, Vasant Hegde <vasant.hegde@amd.com>
Subject: [jgunthorpe:for-vasant 2/10] include/linux/compiler_types.h:236:16:
 error: expected '{' before 'inline'
Message-ID: <202410051953.yBh6dRDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-vasant
head:   8aa0df6ce0d35430baeac4ee5e0ea77f82cf2ead
commit: 9d7523756e213acff67f3b9264211becfbb5b7bb [2/10] iommu: Introduce iommu_paging_domain_alloc_flags()
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20241005/202410051953.yBh6dRDV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051953.yBh6dRDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051953.yBh6dRDV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
>> include/linux/compiler_types.h:236:16: error: expected '{' before 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^~~~~~
   include/linux/iommu.h:1103:8: note: in expansion of macro 'inline'
    1103 | struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
         |        ^~~~~~
>> include/linux/compiler_types.h:236:16: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^~~~~~
   include/linux/iommu.h:1103:8: note: in expansion of macro 'inline'
    1103 | struct inline iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
         |        ^~~~~~


vim +236 include/linux/compiler_types.h

71391bdd2e9aab Xiaozhou Liu    2018-12-14  228  
71391bdd2e9aab Xiaozhou Liu    2018-12-14  229  /*
71391bdd2e9aab Xiaozhou Liu    2018-12-14  230   * Prefer gnu_inline, so that extern inline functions do not emit an
71391bdd2e9aab Xiaozhou Liu    2018-12-14  231   * externally visible function. This makes extern inline behave as per gnu89
71391bdd2e9aab Xiaozhou Liu    2018-12-14  232   * semantics rather than c99. This prevents multiple symbol definition errors
71391bdd2e9aab Xiaozhou Liu    2018-12-14  233   * of extern inline functions at link time.
71391bdd2e9aab Xiaozhou Liu    2018-12-14  234   * A lot of inline functions can cause havoc with function tracing.
71391bdd2e9aab Xiaozhou Liu    2018-12-14  235   */
889b3c1245de48 Masahiro Yamada 2020-04-06 @236  #define inline inline __gnu_inline __inline_maybe_unused notrace
71391bdd2e9aab Xiaozhou Liu    2018-12-14  237  

:::::: The code at line 236 was first introduced by commit
:::::: 889b3c1245de48ed0cacf7aebb25c489d3e4a3e9 compiler: remove CONFIG_OPTIMIZE_INLINING entirely

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
