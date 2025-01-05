Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEE51BC4E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 00:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736038786; cv=none; b=G6GZex2W0MxVQ3KM+Brmz/Awbwzq57ojC5hO+7uR/RqlISBIM9oT6PtPDpm4duTrcjIU7NYqEGukVAPMoKTxDLt+XxfSonwv2ThKyUv8bCy2cXrSjDT2vTahHVrISib7xXc2kncTiNFkzz4sX+UuVTLztERmU8sv4gbsV3CJUXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736038786; c=relaxed/simple;
	bh=VpyOiCn355tf67PlViICHGgy3GKkdEUdz8bqh8/+Xf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RFTv5qVJ6itP7VaOUjx9WacYsx9fP9xuP5H8MZoQgbxotkpGIzMlaxTkPB+k0iz3so4VowXb1TvTpuQepFejyJz7bfO+0IktX3SrOdZFBjvvPUex3ffUzHwuRTjwfMffH07QObQbasMEJfG6Eg6upMggMqkVhH1sgZZyhp5R1o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilEHPAIp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilEHPAIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736038785; x=1767574785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VpyOiCn355tf67PlViICHGgy3GKkdEUdz8bqh8/+Xf4=;
  b=ilEHPAIpKucxEcSjWSaZDpu145nWAXdNB0IbXY3Clz3+Z86qj6AFb/mD
   uVz0pExYRQC9M7kxk9hs6zNWYlZjQbGpHpt3syx1c3e+sgBrhZmzZayx1
   MGcS6Tb4M7gk/X4YmfuAC0yg6m4mPSwW2wzS/ugp4gSFRUH5Wd6YzfqF+
   6v24iWB6pbELOMXrdSe/VQgHRwpH+W3Oche6nD/z/NgiTcL3owpJY684h
   DlO5+OyfAhSIVI2DFz6xw30XiU8EDDyItFLfC4uKZYrzr5glochgTPbus
   vgC0V+nH2x1h3x0lsPXAv5FyMtwYXAWEaY4B8bOBM9mOcdVRPZgwPOZNV
   A==;
X-CSE-ConnectionGUID: l8536zEYTj2tzdnb/Xo/+g==
X-CSE-MsgGUID: Y4pDB8YyS3ezaaGm83U+cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="39915700"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="39915700"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 16:59:44 -0800
X-CSE-ConnectionGUID: yy3PYSO/SwCq75yvCWzAWQ==
X-CSE-MsgGUID: bQANKd7LSbmRpA+4BvydUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="102285583"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jan 2025 16:59:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUEzU-000BLj-2k;
	Sun, 05 Jan 2025 00:59:40 +0000
Date: Sun, 5 Jan 2025 08:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function
 parameter or struct member 'nvram_start' not described in
 'bcm47xx_nvram_copy'
Message-ID: <202501050807.zSLXTjFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 298923cf999cecd2ef06df126f85a3d68da8c4d8 firmware: bcm47xx_nvram: extract code copying NVRAM
date:   3 years, 10 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250105/202501050807.zSLXTjFm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050807.zSLXTjFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050807.zSLXTjFm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/broadcom/bcm47xx_nvram.c:41: warning: Function parameter or struct member 'nvram' not described in 'bcm47xx_nvram_is_valid'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function parameter or struct member 'nvram_start' not described in 'bcm47xx_nvram_copy'
>> drivers/firmware/broadcom/bcm47xx_nvram.c:61: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_copy'
   drivers/firmware/broadcom/bcm47xx_nvram.c:85: warning: Function parameter or struct member 'flash_start' not described in 'bcm47xx_nvram_find_and_copy'
   drivers/firmware/broadcom/bcm47xx_nvram.c:85: warning: Function parameter or struct member 'res_size' not described in 'bcm47xx_nvram_find_and_copy'


vim +61 drivers/firmware/broadcom/bcm47xx_nvram.c

    36	
    37	/**
    38	 * bcm47xx_nvram_is_valid - check for a valid NVRAM at specified memory
    39	 */
    40	static bool bcm47xx_nvram_is_valid(void __iomem *nvram)
  > 41	{
    42		return ((struct nvram_header *)nvram)->magic == NVRAM_MAGIC;
    43	}
    44	
    45	static u32 find_nvram_size(void __iomem *end)
    46	{
    47		int i;
    48	
    49		for (i = 0; i < ARRAY_SIZE(nvram_sizes); i++) {
    50			if (bcm47xx_nvram_is_valid(end - nvram_sizes[i]))
    51				return nvram_sizes[i];
    52		}
    53	
    54		return 0;
    55	}
    56	
    57	/**
    58	 * bcm47xx_nvram_copy - copy NVRAM to internal buffer
    59	 */
    60	static void bcm47xx_nvram_copy(void __iomem *nvram_start, size_t res_size)
  > 61	{
    62		struct nvram_header __iomem *header = nvram_start;
    63		size_t copy_size;
    64	
    65		copy_size = header->len;
    66		if (copy_size > res_size) {
    67			pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
    68			copy_size = res_size;
    69		}
    70		if (copy_size >= NVRAM_SPACE) {
    71			pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
    72			       copy_size, NVRAM_SPACE - 1);
    73			copy_size = NVRAM_SPACE - 1;
    74		}
    75	
    76		__ioread32_copy(nvram_buf, nvram_start, DIV_ROUND_UP(copy_size, 4));
    77		nvram_buf[NVRAM_SPACE - 1] = '\0';
    78		nvram_len = copy_size;
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
