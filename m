Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3815CE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 03:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716435943; cv=none; b=TsT8MBb5N17hjEVuRNRET8hKcnvYGqlTczsrQd+9RA+HvrTP4Xl5TSokPBFHWmJxVxrDN2blsJHak/SHANF/Gh3JfXHZCYYaJ2XMzVVVubKcm/DN3bEYSTX8/hOtVTytUdPUxNUZ6nByaIyvtVDMW8xQKzkytK7dzlmYA5kAAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716435943; c=relaxed/simple;
	bh=tcT8s4t2fOIJVQTzmOPBleXC2HasIAEtW0adsGLvE9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdJepgb0f7zjLHmk9cnEqmjRusabnX8oXYgaTiOOjrYoegmGMv7gDi+7AigtP23mfQzufUd1WlZhN05nRD8jkyBlK2iJnKrCfkXBbw5fdEmKGYrTZ81PB9+pAvVJJqmGy/q28kCLDeo827gH1NozCNKwZSyUK7ssxOwQxhFyHS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RF0Xoepx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RF0Xoepx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716435942; x=1747971942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tcT8s4t2fOIJVQTzmOPBleXC2HasIAEtW0adsGLvE9c=;
  b=RF0XoepxYIn0q+bI9QeWPIqiY01dVoMUizJMgUPgFy1v+w5qf/4kf6Qy
   rhtHsksPvFDgoG1J+66Ss/ycK96mrBvoyYlb+GwGKPmw27goCIVHXsYfA
   zriaVhL4ks4n7WNEHggyxamQLCNRaOgxXF8ZjZmiHJ2ZYPMZAhzFygtiK
   HfuBCWPcKmmUOMLo8slIZNTP7OFk5eBwfKhA6psIoIkhcXVNyGBDz+PHg
   iJXV/9HS7jOkH7GFvK+7P4tr7kqjpTrOJneZ15l6v9zM7VvTgrjl0i9I3
   q95fJL7qU7wVmNWFIq7nzwH8Vs4HsaMzu62nK68bvNc+zhwQN5tUoaWFA
   w==;
X-CSE-ConnectionGUID: vGk2NnQXSmiHNFwkxJ+GLw==
X-CSE-MsgGUID: Q9Zchl4XTVG2VqnJuusDoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30257385"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="30257385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 20:45:31 -0700
X-CSE-ConnectionGUID: rhTFvTjvTuW1C7z8WYKWjw==
X-CSE-MsgGUID: K2MPNu5iTSqA3vFD0oaIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="64747035"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 May 2024 20:45:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9zOS-0002Pn-0K;
	Thu, 23 May 2024 03:45:28 +0000
Date: Thu, 23 May 2024 11:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 103/106]
 drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp.c:243:24: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202405231125.tVTr30AQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   e0a8432e750018bfe19402216e10553e4261aab7
commit: eba329daee52c5bc6a7d2ee896053b318f90ca50 [103/106] CHROMIUM: media: platform: mediatek: isp: NDD for IMGSYS RED SCP migration
config: arm64-randconfig-r111-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231125.tVTr30AQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240523/202405231125.tVTr30AQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231125.tVTr30AQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp.c:243:24: sparse: sparse: Using plain integer as NULL pointer
   drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp.c:354:72: sparse: sparse: cast truncates bits from constant value (3ffffffff becomes ffffffff)
--
>> drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:87:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *reg_va @@     got void [noderef] __iomem * @@
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:87:16: sparse:     expected void *reg_va
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:87:16: sparse:     got void [noderef] __iomem *
>> drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:95:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reg_va @@
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:95:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:95:25: sparse:     got void *reg_va
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:102:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reg_va @@
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:102:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:102:33: sparse:     got void *reg_va
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:109:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reg_va @@
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:109:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:109:33: sparse:     got void *reg_va
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:115:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *reg_va @@
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:115:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me/mtk-ipesys-me.c:115:17: sparse:     got void *reg_va

vim +243 drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp.c

   235	
   236	void *mtk_hcp_get_reserve_mem_virt(struct platform_device *pdev, unsigned int id)
   237	{
   238		struct mtk_hcp *hcp_dev = platform_get_drvdata(pdev);
   239		void *buffer;
   240	
   241		if ((id < 0) || (id >= NUMS_MEM_ID)) {
   242			pr_info("[HCP] no reserve memory for %d", id);
 > 243			return 0;
   244		} else {
   245			if (!hcp_dev->data->get_reserve_mem_virt) {
   246				dev_info(&pdev->dev, "%s: not supported\n", __func__);
   247				return NULL;
   248			}
   249	
   250			buffer = hcp_dev->data->get_reserve_mem_virt(id);
   251			if (!buffer)
   252				dev_info(&pdev->dev, "%s: get_reserve_mem_virt is null for id:%u\n", __func__, id);
   253	
   254			return buffer;
   255		}
   256	}
   257	EXPORT_SYMBOL(mtk_hcp_get_reserve_mem_virt);
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
