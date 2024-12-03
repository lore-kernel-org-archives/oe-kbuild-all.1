Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F521D79B3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216663; cv=none; b=kRyVzxM2AGlvRBbcYvZM/Eac/V8Hand/ORosYybJuUnQwZDFnkvaMfR4mXpDse4RgPvQ2YR4zMERkPr8Fwv7rjg5Eip7vG1FnLVt7tugj5IoiXX1JL+wFXElMKH/kqrN7Rkucg1kQa1TBUdDCphjdEv6yZWGYqwqprINkx+QhG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216663; c=relaxed/simple;
	bh=tKZRtlk6N9zgjSHUSaU6anLy5B04Yz/8c9ESPDx2qzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X//X8r6DaDgKMrZkL8Mitue/F4Qb7+n+IsrfoowOQuOYejuLgRCYQcN1xz19QceAiLHTp7ZXiKcZoKBe0rHsJS4P3Q9qvmEKKmNp3kppuOD3mMYfXqv/LctXhHEXDmt/fYLBMNpOfzerKyUY+pq65ErkSlkutfLCBGr/09W6lRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPL3VevW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPL3VevW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733216658; x=1764752658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKZRtlk6N9zgjSHUSaU6anLy5B04Yz/8c9ESPDx2qzw=;
  b=jPL3VevWCR9/uiea6esbX8boZRZA3Aczr0vpCjnTVVxPdHcl5J4EFbGv
   GYGC6diXd4F9lDPzEgrUHc6Q3xkKHfcalYYRorw/QfBBTF2ZydAQnQrCH
   L0QFf+a5cb03dDGyWd1+dsFWzHBX2H0u5kCoPoc6M0MlsPFspJ+iSFncb
   2jTmC4nSIbUTA+DBub5pGralfL9rzIipApqy1JkZzCeT2xysJvodioISO
   CGdaBz9sufmcHBg8C3QZ4llhD+alXM28KQKNGVny3liaAoN9UKRVwxwn0
   OUEkDlOjy7Op+o5CLquZs0zd3isWop7nbfPGn4AsjUNDcpXrpFru0lnQ8
   Q==;
X-CSE-ConnectionGUID: 23SUZ5G1RqWsJQ3nuuJ3lw==
X-CSE-MsgGUID: uF5KlWyISs2yZw0esb1dSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44446768"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44446768"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 01:04:15 -0800
X-CSE-ConnectionGUID: CUiqpc4/S8SehIez4/tXtg==
X-CSE-MsgGUID: yH6UTKteSAakr0C2JUNenw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93775031"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Dec 2024 01:04:14 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIOpH-0000RR-2g;
	Tue, 03 Dec 2024 09:04:11 +0000
Date: Tue, 3 Dec 2024 17:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning:
 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
 references a file that doesn't exist:
 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
Message-ID: <202412031645.4Ov34Rgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yong,

FYI, the error/warning still remains.

tree:   https://github.com/steev/linux linux-5.10-gen-rkr3.4
head:   39141d792534c5703bb834861c47718008c85001
commit: 70ef2cc4d51e006d23e5d2559f395e1c1e4e7dbc UPSTREAM: dt-bindings: memory: mediatek: Convert SMI to DT schema
date:   3 years, 8 months ago
reproduce: (https://download.01.org/0day-ci/archive/20241203/202412031645.4Ov34Rgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031645.4Ov34Rgt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-vcodec.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
