Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B54B26F2BD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 06:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765778577; cv=none; b=o0JCgVOvDQ8Pv2D0MLWVHWoIU+3TFoR33DHat9cLqR9Or4cuMqEXnz2rwS5HSNKJm6IDOi6Ct2F6wUwofdDM5YeBB0G3ezVzHl+gtBPFyAX+0XfuBA8Kv/0KLzwE+BvvAuvA+i1w2ECd+kwVUxHmLRDMXOih1VqVjK5Xc72skuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765778577; c=relaxed/simple;
	bh=/BpkzaTgwrWmubE1mMfUpkwWnse+EG9tHnZuzxRrXh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HxAd0yROHz9ewcJFKkdB5cQiqhDqAILjS1gUGFqADjgOtIm2UV3PhgjUV+0N/knJ9Z+btHwHSdooLTlW2/QRTKKKXEEEjhBGCpiTX+KNzC6E4sVSplQvC762X3LQDORN4N2oDf0VtHbKWJq7hBWTruHRJhZ90g9vaMFpenFgiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfV1uP0/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfV1uP0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765778576; x=1797314576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BpkzaTgwrWmubE1mMfUpkwWnse+EG9tHnZuzxRrXh8=;
  b=BfV1uP0/d2nWJioSNsc6bEYwP5Pxzvuc3maM1x4w9sMVq6JhSfGkPNS4
   CiRt3veOzAN97OkZrfELYzA/EJoRTTBWZTrH3Pxgn+KzQQ+f1Fd33ZsGL
   /ilgjsXRP0FfsKOhmKSRCH9ItzZBFB8KhxPV6kJWDWSEXZ8ISwd/oT2ee
   7prfdX6ccap8yv4Km70pPUOdSjost/ry5+O53gfenRPwnkW9N/eA2ruVY
   5ZsD84hHs/ARnJ481imytjalN/fGY73YCKssCvjezebBjpyX3fTGZtkNL
   bXoyDNDfPmap+7ei2d6YuXf4Zh46273JlK2YN00EriI9O57GgT2kcX/7p
   A==;
X-CSE-ConnectionGUID: fqRIZSvNRQyJB9KiJiVQIw==
X-CSE-MsgGUID: QvjFM27mR6OMYT0mbg/opg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="71525643"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="71525643"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:02:56 -0800
X-CSE-ConnectionGUID: x8gqyvt9T6yFYwAjFwqjxA==
X-CSE-MsgGUID: yfz8LLEmRSOESHMDzGGMHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197635901"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 14 Dec 2025 22:02:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV1fY-000000002aO-0oKq;
	Mon, 15 Dec 2025 06:02:52 +0000
Date: Mon, 15 Dec 2025 07:02:02 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-mtkdts 1/4]
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb:
 crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0',
 'ring1', 'ring2', 'ring3'] is too short
Message-ID: <202512150734.N7SUiNKf-lkp@intel.com>
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
commit: 58981f020b7e76d47aa2da5925752f3e5ed1a2d2 [1/4] arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150734.N7SUiNKf-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150734.N7SUiNKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150734.N7SUiNKf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
--
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nor.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
