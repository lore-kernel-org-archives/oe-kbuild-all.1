Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20D1385
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 01:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705456733; cv=none; b=KLbnlCqQp5G0RXODgKF2dtpFDtbYBZPrwGJ4I+dGplJhv09UoL1VbBpKHU66/d/hOnh6D2vHYL75XsEm247Qx9e0KKd0h/fCbhCTbixZJBsSFRtAe5oVnR3gyQeXIu01ObvENY/95LNbe7uejSdzM7jdev8eOrt92idBHkuZkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705456733; c=relaxed/simple;
	bh=wSCeQTxAS8+/De9fNm2zzsjnkSHjw8OuuXFCoXN6Et4=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=M7SkKnQf81yk9ljF+ELBj/CxkMrtxT3NIpFVov+wnZpKCp/wVn3iB4tDoLN2WGOIOZT0ihVeHO04G9IUpyRw7GjbBLMWMJwmBHL+W8Wo03SYCmYewNkb94GxO+BT+VZV7TGvzRQZWhYjmplr6MFuGQWhDFoVAti/reXM5bKzYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcO/CpDR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcO/CpDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705456731; x=1736992731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSCeQTxAS8+/De9fNm2zzsjnkSHjw8OuuXFCoXN6Et4=;
  b=BcO/CpDRP8MxFvT6xrr19/ov0J6V3SeFHAcgmzRI0jTu5GSsMfmyEyma
   pPyR9Wu8662aMKF4xIHvFavWJCyJXq0xw4F8ZHI9ysvDDk+/yWi+E8Ojk
   Lr9a9VbUeFCdf6gzwIRk90rF3Makh9FufNdxD3F60IEaNT4heNl6jekpi
   SkcIvncZVNg6JFehoCWL78UIN2D2tezyRhbb41NCqbH2qwcSS38FqKCZW
   rQvtBWlbUniSwvlWd9h3FMFswVA942MX9xyCy7/xxR79rlJiKPmBVK6+k
   iNi8HbNPI7klvWHhFiWafx+atZV3iatQaLeCpZgeHaRDmaBWqY5B033A/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="21522346"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21522346"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 17:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="874669650"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="874669650"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2024 17:58:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPvCP-0001Sq-2P;
	Wed, 17 Jan 2024 01:58:37 +0000
Date: Wed, 17 Jan 2024 09:58:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1.x+fslc 4/12]
 drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted
 __be32
Message-ID: <202401170950.E479Gg1K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1.x+fslc
head:   b80c9dede70132da3ae7feb949fe0803aad3db24
commit: 72237a237e1ae7772ebcef9d5878959a2583e6d7 [4/12] drivers, misc: add U-Boot bootcount driver
config: microblaze-randconfig-r113-20240117 (https://download.01.org/0day-ci/archive/20240117/202401170950.E479Gg1K-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240117/202401170950.E479Gg1K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170950.E479Gg1K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted __be32
>> drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted __be32
>> drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted __be32
>> drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted __be32
>> drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted __be32
>> drivers/misc/uboot_bootcount.c:41:19: sparse: sparse: cast to restricted __be32
>> drivers/misc/uboot_bootcount.c:65:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] @@
   drivers/misc/uboot_bootcount.c:65:16: sparse:     expected unsigned int [usertype] value
   drivers/misc/uboot_bootcount.c:65:16: sparse:     got restricted __be32 [usertype]
   drivers/misc/uboot_bootcount.c:99:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:99:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:99:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:99:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:99:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:99:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:106:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:106:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:106:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:106:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:106:25: sparse: sparse: cast to restricted __be32
   drivers/misc/uboot_bootcount.c:106:25: sparse: sparse: cast to restricted __be32

vim +41 drivers/misc/uboot_bootcount.c

    33	
    34	/* Helper for the sysfs */
    35	static int show_str_bootcount(struct device *device,
    36					struct device_attribute *attr,
    37					char *buf)
    38	{
    39		unsigned long counter;
    40	
  > 41		counter = be32_to_cpu(readl(mem));
    42	
    43		if (single_register)
    44			counter &= UBOOT_BOOTCOUNT_COUNT_MASK;
    45	
    46		return sprintf(buf, "%lu\n", counter);
    47	}
    48	
    49	static int store_str_bootcount(struct device *dev,
    50				struct device_attribute *attr,
    51				const char *buf,
    52				size_t count)
    53	{
    54		int r;
    55		u32 value;
    56	
    57		r = kstrtou32(buf, 0, &value);
    58		if (r < 0)
    59			return -EINVAL;
    60	
    61		if (single_register)
    62			value = (UBOOT_BOOTCOUNT_MAGIC & UBOOT_BOOTCOUNT_MAGIC_MASK) |
    63				(value & UBOOT_BOOTCOUNT_COUNT_MASK);
    64	
  > 65		writel(cpu_to_be32(value), mem);
    66	
    67		return count;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
