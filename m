Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4878F39
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 04:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780719454; cv=none; b=aBJLMRHgC4E9yqOPW+SdJPSSeEPVeg5g8FS0HBrUUV6bp+vvaIT73UFQklWGhu2jqxjPeWj1k3TG/BA0adu3tKhIJxyyDiWfxsEuorxeUULmClTRbcKjG0yS6HGASuu4WGHsKCJFNvyos002U0HpVppWqwRVf8ybBubqq2yM8As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780719454; c=relaxed/simple;
	bh=O96ekfDpslUmbN+KsU9CTOLFBxlvPnw5xEX36pMbDyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=usBypqn5NDSZBULGicvnl2kksEJlrN6ceP+0ykKscl86XgucZ7LK7VwuTotWAueAWXswtvHuaN6VemAHtaFwEW3pFKdKgLDJz5YB0EEn7ZEYAHZMZyiSc1rFpklG97BPnHidmXzVisiR2VCcs+eDLtcfGaj0Xi2WFTWVJH/dpe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfG4VzIS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfG4VzIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780719452; x=1812255452;
  h=date:from:to:cc:subject:message-id;
  bh=O96ekfDpslUmbN+KsU9CTOLFBxlvPnw5xEX36pMbDyk=;
  b=IfG4VzISLLu2/gX2Qm0TLjEe4EXJKjFVcMsZkTWy66ZJ3L4/rZEyqemJ
   iUsCl81fRXpGypy+c/msp16XeMqj/Z2odZe5tdgyCM7ZvnxRK8WDdAqSK
   HQMnOkUYOPKUQfyvinBO/SizaHY9rGKn1GPbklzUcbCW15tVN1S9smq5s
   TpcPv4FkCodvOhr8llrU+fD83ZQiSuMY8Zs/kDzkzXZjdUnfv59IghVBt
   Nai/DnrTCfh808L1EFSUS9apHMHra89oaw0PzacKp7CTmkLtTrQR2YZbQ
   Ta6eE/WEXlDlpAWcXgwu9Y9k5T8DyCJHhOT3Z7ArzFgM1g9QCYvFMLc7N
   Q==;
X-CSE-ConnectionGUID: H1GO37UrSp2SB2rMXgKfvw==
X-CSE-MsgGUID: D78583fzQW2jQoUzfc65Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92117105"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="92117105"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 21:17:32 -0700
X-CSE-ConnectionGUID: aieXjmgkSKmgcvw7eq0Lzg==
X-CSE-MsgGUID: 3/42p5orQfSMbjDOBqRT5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="242032019"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jun 2026 21:17:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wViTQ-000000002kz-2vhl;
	Sat, 06 Jun 2026 04:17:28 +0000
Date: Sat, 06 Jun 2026 06:16:52 +0200
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7813/11755]
 arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: pci@50000000
 (cortina,gemini-pci): Unevaluated properties are not allowed ('resets' was
 unexpected)
Message-ID: <202606060637.mbx8QrSx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: dce8e0cb88fb12d068459b75f299ff2242172257 [7813/11755] ARM: dts: gemini: Correct the RUT1xx
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260606/202606060637.mbx8QrSx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060637.mbx8QrSx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606060637.mbx8QrSx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
   arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/gemini/gemini-rut1xx.dtb: pci@50000000 (cortina,gemini-pci): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/faraday,ftpci100.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
