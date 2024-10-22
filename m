Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C0140E38
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729595739; cv=none; b=nNw13pUTPoLtPANp7NqMOQE8kWz1xtWERXk+NIszTkm9ZWTJRaCgvxGV8ZkoPsnv1G0cA9Pw5+8SOKkwXHD9ssK1z5sbJNx+WVAu1cQ5RKHHPGtuv/V3FKl3YMwrBMFKTBPvbB1gW6ShjVgoxq6VzSO7Watgo+gM0IIsGaH4MLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729595739; c=relaxed/simple;
	bh=MXVqSX043Yy4w9AW4PwRc6IN7U2NvaIAL1OCyJAlcnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1ytaeS+DVLMoSEiCxvqDbRvgfkY4J+OoeZJv+7e1lBrxMa8I85XdsH7vYk9ExYzlAccuIJzNad5Q3Vr5X0OS6U9XfFzmnZt2Nh4+v/4ZewDzjinIjGKdWvIRiUlG/btSmkaasJbJEhhq/mnSGHJBCta7hEuNXDBiJqMiSHPjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWkc2Rjd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWkc2Rjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729595738; x=1761131738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MXVqSX043Yy4w9AW4PwRc6IN7U2NvaIAL1OCyJAlcnU=;
  b=fWkc2Rjd75AlHZMt8+MXPIgOSm5py7oTDOWqeKreJVfRxHCUTt1UpMk0
   iYzQdMeMjigQIVeYxnjokMQlD5gHV68Hyx6wHO7/F/0ZBzu98q6cPF5Jb
   dFfdC5F/UWnA9ANC7glPHs9dswBR2U8IDSuJgHivQlMYV+IhFKzshq/bQ
   w2dIpCDIW8WG98Ffg8UxqxjYQRcBow43SR8IH3K7tmxQ64jxMQh9sirJW
   Rn7gNyPht9TlqoYNdcAekhx2d/TBlAkTyGhUSG44Y/tJjafbpo4XCkorh
   tarnJn5lO4NWrNpz2M+RAhL0zXzQMEhevlRpPkDdk7yqlxdVnh8WGXOhF
   A==;
X-CSE-ConnectionGUID: EZqDfFIaRhCmdDVPYVrqrw==
X-CSE-MsgGUID: gYVJ4FPpRaquMdUzIGuNaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="16752401"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="16752401"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:15:37 -0700
X-CSE-ConnectionGUID: v/YIB1PCSU2TD8pylZNH5g==
X-CSE-MsgGUID: AY6QsRDvRS6m6F+ON2s1hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84433933"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2024 04:15:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3CrL-000TTy-0F;
	Tue, 22 Oct 2024 11:15:31 +0000
Date: Tue, 22 Oct 2024 19:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2181/2444]
 drivers/usb/host/xhci-plat.c:476:40: error: 'xhci_plat_phytium_pe220x'
 undeclared here (not in a function)
Message-ID: <202410221914.EqJA87bm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi wangzhimin,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 666b19bb8aeab2412d1cc496ef9fe000827cff86 [2181/2444] usb: xhci: xhci-plat: Support for Phytium Pe220x Add XHCI_RESET_ON_RESUME quirk for Phytium Pe220x Phytium Pe220x xHCI host controller does not have suspend/resume support. Therefore, use of the XHCI_RESET_ON_RESUME quirk is mandatory in order to avoid failures after resume.
config: x86_64-randconfig-005-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221914.EqJA87bm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221914.EqJA87bm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221914.EqJA87bm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/xhci-plat.c:476:40: error: 'xhci_plat_phytium_pe220x' undeclared here (not in a function)
     476 |         { "PHYT0039", (kernel_ulong_t)&xhci_plat_phytium_pe220x },
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/xhci_plat_phytium_pe220x +476 drivers/usb/host/xhci-plat.c

   472	
   473	static const struct acpi_device_id usb_xhci_acpi_match[] = {
   474		/* XHCI-compliant USB Controller */
   475		{ "PNP0D10", },
 > 476		{ "PHYT0039", (kernel_ulong_t)&xhci_plat_phytium_pe220x },
   477		{ }
   478	};
   479	MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
