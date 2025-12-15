Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616A0331206
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789738; cv=none; b=WQl77SGun1dZmzSKgfC5RUnrIFcFQoE7mQfA/slIi1NJTgecyagnFNQuzsVEe1XhuWI6lk/GA1r4wz4Gsds2TTGYQRWtn2qwGvKJUgqB5qeymCesCDP2x8GXivJeI7zwetD20YBWzYhkvg1gVqK4aBhFinCieITB614ZoltCzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789738; c=relaxed/simple;
	bh=VGJDxXVlrFgDYNNWTlJ1qFEyyJxoWVTrXUAc9KVzxJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2k/atDxDVrNzwtcLyW7YkyGr7btok9br76XJMM0vSxQ1qxHnuilV092TlXHJoXtIELEt51W1l4B8CxvwZvDCasrwe/I/X+TQRWRQg0KYXV8mb3OwJQ+YoSNMsKrIwacDcC5NrigsYPNnx3kQex2gTZnicWVhkMXDkubtHSm3YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H37M+xlM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H37M+xlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765789738; x=1797325738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VGJDxXVlrFgDYNNWTlJ1qFEyyJxoWVTrXUAc9KVzxJA=;
  b=H37M+xlMISvXgI32TuDms1KaIa84zjPQVObtG5kUWjL5/KuKOQyO249T
   Ak87f0gDB1WH0vyk0yqHvKkNxWv406xvJWIR8CZ1jt7WORxeGNrVef3PM
   WJA4fdzUiYnh5Gs+u1dBmkZxnqhXeUfDnCUe9JyEoWngP+3ldujqAkaT7
   56ajs61ZE3HVvjNW8vSuSJYqYWS4zYc17vYFAPsvNZ5cOSAdAtBiqqCwX
   lu111KBIvC62j0WS12m8qzHOY2HJeLO0mfDnROcQ1Ou2C4Ap/pBK47Seq
   9Kg14GVaxBrHJWKIgkgAS/X+eSGEESSTxBdXomWP9DAqMG/5V1z25EbH+
   g==;
X-CSE-ConnectionGUID: vi4syJ/FTYCxoBQYHyz2sQ==
X-CSE-MsgGUID: pdTQH4a5QcCjCzgI2X0o/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="93161734"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93161734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:08:57 -0800
X-CSE-ConnectionGUID: /7TPQPfoSamdU0/innG2cg==
X-CSE-MsgGUID: 6P4Ad565Q4yosMbzge4D+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197431984"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2025 01:08:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4ZZ-000000002cG-253t;
	Mon, 15 Dec 2025 09:08:53 +0000
Date: Mon, 15 Dec 2025 10:07:57 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-mtkdts 3/4]
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202512151028.Li9hljgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-mtkdts
head:   651b3b0abad5dded7a4e0f3864b89da3a270e5f0
commit: 7685aeb3a8c75acc3a9ce3fe011e862b30a1ae7f [3/4] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151028.Li9hljgi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151028.Li9hljgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151028.Li9hljgi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
