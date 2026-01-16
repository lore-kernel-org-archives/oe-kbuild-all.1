Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E2345736
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593570; cv=none; b=am3iNzgqmMsUtTLJPrsiFl9HOnBOgNCCnyG33SK+dbbTXI28YJ609CyLR0LktEa4VtrEhhANbntcVrR7f8VsvrORJuOuQyLeey8HKyOFJBRPt66ydqQVIqHp0Ua/ytZViPC7VHs2oA0rAz9+46xde/WNzbVlFf7Q0zu3thnQg4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593570; c=relaxed/simple;
	bh=PKsRTQMpKMcVYYUWN3klXO+Ea0nHiYM8Z5gCDTIyGJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mZWhwyddMAifprqCoK7F01iZvcoGRkLbQFvL3rObeXjfU8m+3znqDgYPtLFMQFH2UepF/xXb/IE9rJH5FjgbQKOuNLoRlL4yFnXG260VqmVi3HfA/deev5RKqnin8bypXXeb5GqTgsnZAke/ppxF9QO/iC8NWLFm1U8tXZrfuGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBkj170c; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBkj170c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768593568; x=1800129568;
  h=date:from:to:cc:subject:message-id;
  bh=PKsRTQMpKMcVYYUWN3klXO+Ea0nHiYM8Z5gCDTIyGJM=;
  b=JBkj170cjA1ERI4BLAreNehZsCm2OI8ulSSD+biP6/ap212njYF8Hn5m
   MGqYCESBxCeH6r8VC25LtF8BslZNq/EhymPCDtl+vPaYuvlqOQA7qgIda
   KouMdrGv/cq0cnJlmfJdf8gMoIws/Em4hxZ8mOnQeq7kcq4KgfUcBuhSk
   N7uBZHHJNzWrhgkjCtI9dWNCFnIEiVCt3De0gzVQj8N0pLogHVMjZygvx
   qhxmgAfQywLew9yh9KbS+eIrpZqIE4SL7aQCXE5vQqL5B2ivFiDyyO+AX
   YJupYUKeASOHSsheLEpa0F3eGIv2JHH7btOiMb9z3EYd7+QLKW8FAuycS
   A==;
X-CSE-ConnectionGUID: BH9hjDJ0Sh2RmMhpscqbDA==
X-CSE-MsgGUID: 6IoJV63AS+qn1xcaToF9UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="95387806"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="95387806"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 11:59:22 -0800
X-CSE-ConnectionGUID: IR3TfLBgQnGPI00PB46Nqg==
X-CSE-MsgGUID: zFTvtOUnQ/OXQiUlSFMn2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205758026"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2026 11:59:17 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgpyU-000000001qv-3cxg;
	Fri, 16 Jan 2026 19:59:14 +0000
Date: Fri, 16 Jan 2026 20:58:47 +0100
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6259/6849]
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000
 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202601162018.qoZri4fG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 32c5491a8d73713578560f515cccd4e9460d156d [6259/6849] arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto
config: arm64-randconfig-2055-20260115 (https://download.01.org/0day-ci/archive/20260116/202601162018.qoZri4fG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162018.qoZri4fG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601162018.qoZri4fG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
--
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']
--
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (mediatek,mt7986-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: crypto@10320000 (mediatek,mt7986-crypto): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb: /soc/crypto@10320000: failed to match any schema with compatible: ['mediatek,mt7986-crypto', 'inside-secure,safexcel-eip97ies']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
