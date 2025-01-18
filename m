Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233B18C930
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737206537; cv=none; b=E/QZE137M7thjYYVGSWCpOeaGSekBkIH9gkSQTXDEqT8GGc8RoLzmT/fsv5pDkXtZFsR8iq7yqznXGMKonBY4gaprymX+vm7wLgOXESvt6FhUqQu4kCurUDeTyIOM3oKpjUn4jB6izMoRsZlJjXWhzyXDOCkDKGEDtpB6DiSOls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737206537; c=relaxed/simple;
	bh=If8Anbb7Z2nDqegQeWBBZ3TkfQDw5UpbIo3S6QK/mBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaUiSmBbw9xjQVJx8DcK0Q0WVbrzmn9nDWgmkN7PNxeMFAvPL8Zpknj4mDTJ+YTrL6FExyNnYe/N59p8DmmfCpXNHEytT1btQEtN8nVYgb8wuuQD6Kc/wcO+SrIYEaXeONXWHX87uVwm4y7++D63IVjNuZ6KzkejmgHsUn7es2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdOFEklN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdOFEklN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737206535; x=1768742535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=If8Anbb7Z2nDqegQeWBBZ3TkfQDw5UpbIo3S6QK/mBQ=;
  b=SdOFEklNI1KMgwEmsql3/itOiWqMg4/hsidJfGM6LRI9fmpUD8gobxCY
   cTdtAox0dnLqMwbJ/GmR0N/LhuT3fg1hfMqxARdUg0oMUScOO85jX50jN
   04Q74JaTcCAnbuH21lisGEE3Q6xxxitRxG2px2TEiJrWl/bwBIN80W7wx
   lU5saWrWtVGzYaCazdqRyg7x1ykfnS+XoPLOfTRRzpWe3zqk9KFk9iXcy
   /JEEZveVvL060SCc0A8y50491Cg/5OcXkI2WQO2ADz6oz+1E0EWckM5DE
   4qpE6KmRa7htb7LYSeZ5SZPtxHeJsj92VP5GFdYIrReEQMTSOi7k0egW0
   A==;
X-CSE-ConnectionGUID: f/uy1CpATOCnrF3AchjSGQ==
X-CSE-MsgGUID: /b/RwaMASryynSkUS6v/Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48220019"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="48220019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:22:13 -0800
X-CSE-ConnectionGUID: C4ahSwYSSXea5+Q9Hzveug==
X-CSE-MsgGUID: AilBVoWgTqGArUsBGu8jSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129330547"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jan 2025 05:22:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8m9-000USz-2V;
	Sat, 18 Jan 2025 13:22:09 +0000
Date: Sat, 18 Jan 2025 21:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 292/292]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clocks' is a
 required property
Message-ID: <202501182100.SOj3bVFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5c75fa9e727eeea4f1aac71a5838a1bdc76d0dd
commit: 620014904e31a28ecd614f2a480029d86113014c [292/292] CHROMIUM: arm64: dts: mt8196: Add gce device node
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250118/202501182100.SOj3bVFg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501182100.SOj3bVFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501182100.SOj3bVFg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/watchdog@1c010000: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/systimer@1c400000: failed to match any schema with compatible: ['mediatek,mt8196-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30020000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30021000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@300c0000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@30140000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: gce@30140000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@30800000: compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@30800000: failed to match any schema with compatible: ['mediatek,mt8196-mm-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a30000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a31000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a32000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-comm@30a33000: failed to match any schema with compatible: ['mediatek,mt8196-smi-common']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
