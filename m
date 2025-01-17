Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46113C9D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737148838; cv=none; b=g7wOEHqdg0NRttjb6oO5KsAWLGHXu7VCglR0TG+iIObtKyQPdZnrWWc6RtB7NF1gffoHi9Ypdm7UB6HZd2F8oGQFyq4cyrB8nP0f6YFHTRekw79Z2LSa1NCyO1RVoOz/LzfVMH1HOYiQ/rgsoVm6M/0co8DU1lcsk7NYTVil9ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737148838; c=relaxed/simple;
	bh=NcnDBOWzNjBv1VbjEBL5SiSbUxkAlrqq1DZTiM28ICY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKF2t9SnRxUe15XBX81ZAClXFH9iYsACei9CTL83PUuTwYTsfh85QetVNdmR46Cee66EyRivAyE8HJXAjnhTEk9WxnHRHq4H2vBuHl/r18h9DC+zpVyGr+4gVNwC6zTsKE809vy1qDy22IWlgoEnQXsEqTvjyO0X/UX/M+7A9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7KoIVek; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7KoIVek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737148836; x=1768684836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NcnDBOWzNjBv1VbjEBL5SiSbUxkAlrqq1DZTiM28ICY=;
  b=B7KoIVektVCFC0NXf3pUJj4o8UqzozJpa8B9fEy+lVn6R/0SfWVP0wCK
   VdKcw/ukGJWHrgLSdLQ7xynl7ITRLJd/S1vREbTTkI5qHy5+YwzR2G7cI
   /Pk2nRFx1/0joeuEMB3CEAhoRL6x7WvKpkT9SykLZb4dsTRiqxs3YYXRZ
   3FEKarWbdjiQSx2POly72Yx58/n5Cgfc9s5N+qFUJZibUlwPH0OFXDAPv
   HWdOYtjAxBFPR6Ltx3PYlRAmxntpJYk6000bdoGkGka2rntF2GhIuRj58
   HN/8HBxE+g966FZR2sufvSnz24/9uxhM7jzxJKxcjTC5gKJ7hq8jPHRol
   Q==;
X-CSE-ConnectionGUID: 9KvqvX9+S9Cehr024zJmQw==
X-CSE-MsgGUID: EFye+Xn5QpW8sHNonpWtBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37477565"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37477565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 13:20:36 -0800
X-CSE-ConnectionGUID: 3f7x0T8qRJqkZPZOsodZ5A==
X-CSE-MsgGUID: ScEfXYBCTzmW9CwXoVuZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105750768"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jan 2025 13:20:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtlY-000Ti7-2m;
	Fri, 17 Jan 2025 21:20:32 +0000
Date: Sat, 18 Jan 2025 05:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 292/292]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed
 to match any schema with compatible: ['mediatek,mt8196-smi-common']
Message-ID: <202501180522.CaxTvsBH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   8e1a1f8e6b770cfb1fde71b593fbd5d47be6aeda
commit: 5ea44a544d5f5529b8efcceda97d54ef85d449ed [292/292] CHROMIUM: arm64: dts: mt8196: Add SMI node and disable dependent-VCP/OPP
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180522.CaxTvsBH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180522.CaxTvsBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180522.CaxTvsBH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,mt6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/watchdog@1c010000: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30021000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32000000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys0', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32400000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a80000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e80000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600d000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3602e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3602f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38000000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38010000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38070000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38090000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38800000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1', 'mediatek,mt8196-vencsys_c1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38800000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1', 'mediatek,mt8196-vencsys_c1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38810000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38870000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38890000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'mediatek,mt8196-vencsys_c2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'mediatek,mt8196-vencsys_c2', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38c10000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38c70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38c90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3a000000: failed to match any schema with compatible: ['mediatek,mt8196-cam_main-r1a', 'mediatek,mt8196-cam_main_r1a', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3a000000: failed to match any schema with compatible: ['mediatek,mt8196-cam_main-r1a', 'mediatek,mt8196-cam_main_r1a', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e000000: failed to match any schema with compatible: ['mediatek,mt8196-mdpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3e030000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e400000: failed to match any schema with compatible: ['mediatek,mt8196-mdpsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3e430000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e800000: failed to match any schema with compatible: ['mediatek,mt8196-disp-vdisp-ao-config', 'mediatek,mt8196-disp_vdisp_ao_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3e800000: failed to match any schema with compatible: ['mediatek,mt8196-disp-vdisp-ao-config', 'mediatek,mt8196-disp_vdisp_ao_config', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e810000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e820000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e830000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@3e840000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810000: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-pll-ctrl', 'mediatek,mt8196-mfgpll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
