Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC52066CE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 06:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736400; cv=none; b=M3LSsu7jnX4N+wT00HcZFcl+EF3QHzdS1IJBXihIuxA6hidqXBhvFViW4v35VuZID2qrnjXphrD9P4Yjrph5RRIMHJSX9P45MUh5J+qveF1tbyE9HuHTWMdOVTCq1BYlIjWgSD70ITmCS+ORGkt2f5u4ZClTKhzAib/C8P02ZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736400; c=relaxed/simple;
	bh=8ldV5h0hnFZhHdX9Tu4xBOfS3IkXdezqoYqGTlu0lpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oihRrSnbOAFwUIKTSDniyIdijxDLy7E6DCSoJy6ekOPC/KGfKDZu/e9OghyYE1jO5A2P4kS2qo7i0F/lEDDCxz/Y8ofTdzHdHZwZQMJMRPqmzecFcRQIOh7/3BdECTo3lmfsldUtzAVVqLfDzZ4kwYsKpFZz7deoEa4MDTMm++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERaDvHSN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERaDvHSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738736398; x=1770272398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ldV5h0hnFZhHdX9Tu4xBOfS3IkXdezqoYqGTlu0lpw=;
  b=ERaDvHSNOXfatKCUcSqNDedHKbr+kYp0QP2zD1s5DQ27Ezk6wzhXsQRQ
   0YpWT9BU+obobUsAszatoE/JW7wL1mn6vmIsKgl1Dbt18HP4FV0tMt/9q
   PXhrZ9PhtmpTyhGMA2OYMq2kuWWN5w8YWA6rXKDA1d1tukaVMyyJxlc0A
   tSIx+PNQXydZcpiokRCFhf319Vm//BykLRKNSSFE00NBwoKQVjVBcznsD
   DYIEOia8HlZd/IoL5KoN367XWVgTilewMb9SO3RE92VoduifuhZ13Oeo+
   0RT8Tny+iOiIeZRQNgtrUEDQQkWyTMPP+gIV5uI6oEOGYt12EqJ3cr8MJ
   Q==;
X-CSE-ConnectionGUID: IMfzn/hUSc2wfrPvp8gE/A==
X-CSE-MsgGUID: nC9jINl5RMqDsrALGT98UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50708335"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50708335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 22:19:56 -0800
X-CSE-ConnectionGUID: Pc7QCOXgToqa5f2l1jknuQ==
X-CSE-MsgGUID: KJ15XbwlTAmEZgCIn3hLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134055405"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2025 22:19:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfYlN-000tX3-1e;
	Wed, 05 Feb 2025 06:19:53 +0000
Date: Wed, 5 Feb 2025 14:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: failed
 to match any schema with compatible: ['mediatek,mt8196-dp-intf']
Message-ID: <202502051405.xQxig6oN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   89cb8bc425a44875dc0420914465cbc1936bef3f
commit: 3eb254258f26317099bfe349bc86c370854b2b13 [35/35] CHROMIUM: arm64: dts: mt8196: Add dp and dp_intf node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250205/202502051405.xQxig6oN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051405.xQxig6oN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051405.xQxig6oN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vcp@31800000/vcp@31000: failed to match any schema with compatible: ['mediatek,mmup-core']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31a80000: failed to match any schema with compatible: ['mediatek,mt8196-mminfra-hwv', 'mediatek,mt8196-mminfra_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@31ad5000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@31b00000: failed to match any schema with compatible: ['mediatek,mt8196-mm-hwv', 'mediatek,mt8196-mm_hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@31b50000: failed to match any schema with compatible: ['mediatek,mt8196-hfrpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32000000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32240000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32400000: failed to match any schema with compatible: ['mediatek,mt8196-mmsys1', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dp-intf@32430000: failed to match any schema with compatible: ['mediatek,mt8196-dp-intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-dvo0@324c0000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32600000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32800000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys-config', 'mediatek,mt8196-ovlsys_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a60000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a70000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a80000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32a90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@32c00000: failed to match any schema with compatible: ['mediatek,mt8196-ovlsys1-config', 'mediatek,mt8196-ovlsys1_config', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
