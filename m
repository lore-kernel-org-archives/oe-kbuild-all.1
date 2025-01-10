Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C22144CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736549445; cv=none; b=nUpFGcSVb/5ZyK1StDO9upjqzI8C0j+ujBjrZy47gTIG87nj62bNqk+PEdACiiawAT/PcEeNbVgRulgQGCW5CSfuxFAwqg42T0k/RniU8ygP1DGyTz5aBUux6xx3TqT5VJMFCEaWLPueVRVZDgGw/cALoEja0N0JUnrvJWwxXv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736549445; c=relaxed/simple;
	bh=syQwjjSfIYYlgNQXX6PvtYbfSSML3bzcKhIlaXPTUqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SW0FNdiBauSwySGLOVBYcyT++f2MO8RRpDYKw4dsU6FTO1NOwH/lWrSz0Aiv2WNDwpbX/UNuaAbje7IVmCfV3sPEdnjUllmCVQ83iY7laoaV80IDXXbl2LOx91e/bQTrp1XYINTbwdwR+k5j+XxRRTqqLitvZIcCBJOkNW6iGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPyTIYM6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPyTIYM6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736549443; x=1768085443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=syQwjjSfIYYlgNQXX6PvtYbfSSML3bzcKhIlaXPTUqw=;
  b=SPyTIYM6DK6B3ksCIGA7khl3MGXtEB44soXsBxdmqANhlWH5uERl8eAc
   XPeUnmW3yriAFBZ6vG1nJC863RNhC9X2D5jellWLWCCjSWzYHx39xKKee
   SAejQTIGButKdP/wZEPY6lDLVWgVmw/Eov405UYZ8oYpuf5iOBJ2EQSVr
   PX6bjp2wYzyKZv5AF5RQgNyrwsJGhFgT2P+bU7BBRD8P+lvSAjmv36F37
   Y0+kJllJuh598JKCEFYAGO3IhEbCnK9HR8vHI9GFq4+R/iuObPQfOSrlX
   7Ez8Bxbs7C0XLF/mzI/VlJuPIA+nKcpde8gV7SpqgcdBKITcggintSlqu
   A==;
X-CSE-ConnectionGUID: aroX/S9iTBiSDw1L/VuQ/g==
X-CSE-MsgGUID: Zoe81MOiSA6uPhLfVXGlhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47517037"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47517037"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 14:50:43 -0800
X-CSE-ConnectionGUID: TsqS0OuiTnKPCjWr8FPBFw==
X-CSE-MsgGUID: Jaa1NeawTYyZxKUBEl2xNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108958649"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jan 2025 14:50:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWNpv-000Jr1-1F;
	Fri, 10 Jan 2025 22:50:39 +0000
Date: Sat, 11 Jan 2025 06:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <saurabh.singh@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 199/504]
 drivers/gpu/drm/xlnx/xlnx_sdi.c:264:9: error: implicit declaration of
 function 'writel'
Message-ID: <202501110604.TYwWbDEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: fd4e677cfcfc2c6455abc12955015afd8c3790e6 [199/504] drm: xlnx: sdi: Adding sdi-tx driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501110604.TYwWbDEf-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110604.TYwWbDEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110604.TYwWbDEf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_writel':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:264:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
     264 |         writel(val, base + offset);
         |         ^~~~~~
   drivers/gpu/drm/xlnx/xlnx_sdi.c: In function 'xlnx_sdi_readl':
>> drivers/gpu/drm/xlnx/xlnx_sdi.c:269:16: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
     269 |         return readl(base + offset);
         |                ^~~~~


vim +/writel +264 drivers/gpu/drm/xlnx/xlnx_sdi.c

   261	
   262	static inline void xlnx_sdi_writel(void __iomem *base, int offset, u32 val)
   263	{
 > 264		writel(val, base + offset);
   265	}
   266	
   267	static inline u32 xlnx_sdi_readl(void __iomem *base, int offset)
   268	{
 > 269		return readl(base + offset);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
