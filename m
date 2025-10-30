Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828D30276E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853397; cv=none; b=e7O6xR2Iua//2iPjrUoAplPmC29/pceJYRzMh4q8EVJvrvySCXTiu7MI5sdMbQ3H83bYSFPtT2B3XXxKy/FDrPNdhymNapiykYFzIp1HrYH0U0zMl/WTyFQHE7ctEKdxvs+U7mgbP0lhs3uX3O/jmg9h2c5FsGeLXTp750+xk24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853397; c=relaxed/simple;
	bh=IP1TqlJnS/oCPvx6KxAiFuhFPiDG1xLM+IYq1oqXEEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzUAu7mu9HNfY0aZWBNJ8CicCpiNh/M/dKx3NcnA82b1RL2yvpHdanMTf2QHfb1PdyfW60z/7bRBegG5poorBTJ7iQnolD7agf5SIKLbSZlaXx0IucVDEokTGCJNTFNKjg1OGq4i/BMPaGw4AmlXBMchtUyY7nqZSjHDg7yHsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ63is9B; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ63is9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761853395; x=1793389395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IP1TqlJnS/oCPvx6KxAiFuhFPiDG1xLM+IYq1oqXEEs=;
  b=KQ63is9BcqerwPgV4k8Sv5G/Wk3NzZCM3J20FSyAGsmIzdsRwvgZONCU
   Hmir77E9LmKJ9LjQmAhipijMEaJmMIaVUS5i9FECaFoeskAbgEuGyjw/p
   AeLlOrwFV6llghDYxc8kVbKynr2tEDa32Ba2YjGp3/0TilEMZitZO4TD0
   XNWpwwwVv73JAaAbdh4dxGGDN/p+dWyV+7B/d5kEx1gyGTrhdNZpib8Jr
   K3PKfI4mQ7hLQqkc7doKpMEl1ZdebcBT+t1ZSp62wEI1kNv67d/94F8iB
   9tHhMykf9rDermwl+gdnZJaStRezt0FkUjb7aRe52w5wBCd87KOBt/iZ5
   g==;
X-CSE-ConnectionGUID: 2WRQsIEaR3GjQ9Ehb9h81g==
X-CSE-MsgGUID: xgOmFy0ISpafbnVRwg8HqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64040595"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64040595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 12:43:14 -0700
X-CSE-ConnectionGUID: YkbkZxy0RpKRCW/Y2iSCRQ==
X-CSE-MsgGUID: pqMwGhtOTuyu9n8du+ZvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="186139668"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2025 12:43:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEYYA-000MSY-33;
	Thu, 30 Oct 2025 19:43:10 +0000
Date: Fri, 31 Oct 2025 03:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 arch/x86/coco/pkvm/pkvm.c:195:9: error: 'pv_ops' undeclared
Message-ID: <202510310303.ZKEwLW5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   16877c3ee11ac9f341d18e2d9c5dd2d2f69d7dc2
commit: 23730d3cc59e1e886b6444acc151e57b9656943f [0/5] ANDROID: x86/pkvm: Use hypercall to access MMIO
config: x86_64-buildonly-randconfig-004-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310303.ZKEwLW5y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310303.ZKEwLW5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310303.ZKEwLW5y-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/coco/pkvm/pkvm.c: In function 'pkvm_guest_init_coco':
>> arch/x86/coco/pkvm/pkvm.c:195:9: error: 'pv_ops' undeclared (first use in this function)
     195 |         pv_ops.mmio.raw_readb = pkvm_mmio_readb;
         |         ^~~~~~
   arch/x86/coco/pkvm/pkvm.c:195:9: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/pv_ops +195 arch/x86/coco/pkvm/pkvm.c

   183	
   184	__init void pkvm_guest_init_coco(void)
   185	{
   186		cc_vendor = CC_VENDOR_PKVM;
   187	
   188		pkvm_guest_detected = true;
   189	
   190		ve_x86_ops.mmio_read = mmio_read;
   191		ve_x86_ops.mmio_write = mmio_write;
   192		ve_x86_ops.handle_virt_exception = pkvm_handle_virt_exception;
   193		ve_x86_ops.get_ve_info = pkvm_get_ve_info;
   194	
 > 195		pv_ops.mmio.raw_readb = pkvm_mmio_readb;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
