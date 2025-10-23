Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E927D35B152
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 06:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761201158; cv=none; b=iqI5ddvcx/WGW3R8p4u7N5//UyTmG8lYoubVfyae1WWKG++B7C7eB4UQC9fuisdeWZwJRhV+Q8/JV8zoc77JyZBuS+SofCPXCTlVIjyYyd8CXQ8mVkGVPzo2yux02HcRPMUZ6IKXapvISZ2t1nCv3qDIavYm+Sflma9UVBR0cOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761201158; c=relaxed/simple;
	bh=EzFRJp3goS9/inrxd9TAJCReVk9hkZNZdA6RISHPzjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rYsYhSphpaMOsQWgoLl4hIMIgBZUDE6e546IYv3+NAyIEGCYBRiYh1qpQcqPEHor9bh57fwNXI8KCxzi5OxDXZaO/QhCu9HmNmM/ocnoDHCDa7jT0Erp0VMvXTL9E1VwTr1uO771xt0etxSZYYdpIgr2wD8LcRLkZjTWhNdUvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cc1mrQDr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc1mrQDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761201156; x=1792737156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EzFRJp3goS9/inrxd9TAJCReVk9hkZNZdA6RISHPzjc=;
  b=cc1mrQDr+xvHrHjyoaONK4m6eQq1/W8AVIatFdQnSsTYEj6ZoQsnfGdJ
   XOAAJ2awjR3F/nJwpGCqisaERj4OxWguj/1d8BrdPNMMRp4YN470Fp/m2
   Dr6vT+uD/b9deokWJiH163digV5UjKIOy58qsjuqS95OPtGNbBFEZ9rOW
   MFA747Rh8p53ID9p4JD4uUiKlKExf0VQgvLjAKi2udIdXdsc55U+eTVy2
   ZeXBh8pyzr+MCXg0K7V8yuArbrBXFtll0Fcz1UT/feKT9fhu1BkN2zvLE
   Y5t29iHs8tgDRVIRAsknXHy+Prhl0x0B3JEPtmZcM7AiL/RsztkZVqXHY
   Q==;
X-CSE-ConnectionGUID: aEYRm/KJS2KcpCCeIf2HDQ==
X-CSE-MsgGUID: mfAAjbVyTQif6Bkto102Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50939442"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="50939442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:32:35 -0700
X-CSE-ConnectionGUID: 5JhHMk2AT66dzQ7pATN0GQ==
X-CSE-MsgGUID: iS5eWyDAQYK9TN6MIqduUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184554337"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 23:32:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBosB-000D6n-2a;
	Thu, 23 Oct 2025 06:32:31 +0000
Date: Thu, 23 Oct 2025 14:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 198/198]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb:
 /soc/syscon@14000000: failed to match any schema with compatible:
 ['mediatek,mt8189-padme-mmsys', 'syscon']
Message-ID: <202510231422.igw7pShs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f9ec4bf2329fdcc8739152f2a8de0daff6f53e18
commit: 94cb4c57ac63f01d729b56bdea1978c392eb036a [198/198] CHROMIUM: arm64: dts: mediatek: mt8189: modify the dts for display on padme
config: arm64-randconfig-053-20251022 (https://download.01.org/0day-ci/archive/20251023/202510231422.igw7pShs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231422.igw7pShs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231422.igw7pShs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku290.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku546.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-rev1-sku802.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku290.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku546.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku802.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
--
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names:0: 'speed-bin' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cell-names: ['avs-bin-0', 'avs-bin-1', 'avs-bin-2'] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: gpu@13000000 (mediatek,mt8189-mali): nvmem-cells: [[129], [130], [131]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/gpu@13000000: failed to match any schema with compatible: ['mediatek,mt8189-mali', 'arm,mali-valhall-jm']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/gpu@13000000/power-model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/gpu@13000000/power-model@1: failed to match any schema with compatible: ['arm,mali-tnax-power-model']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/syscon@13fbf000: failed to match any schema with compatible: ['mediatek,mt8189-mfgcfg', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/syscon@14000000: failed to match any schema with compatible: ['mediatek,mt8189-padme-mmsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/syscon@14000100: failed to match any schema with compatible: ['mediatek,mt8189-dispsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/mutex@14001000: failed to match any schema with compatible: ['mediatek,mt8189-disp-mutex']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/ovl@14002000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/ovl@14003000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ovl']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/rdma@14006000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/rdma@14007000: failed to match any schema with compatible: ['mediatek,mt8189-disp-rdma']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/color@14008000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/color@14009000: failed to match any schema with compatible: ['mediatek,mt8189-disp-color']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/ccorr@1400a000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-padme-sku1314.dtb: /soc/ccorr@1400b000: failed to match any schema with compatible: ['mediatek,mt8189-disp-ccorr']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
