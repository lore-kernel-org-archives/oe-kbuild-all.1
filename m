Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939333;
	b=16Yggd67w6NmITpIdG8HfheAfEc194sjVwC2B5nUeO8TMNEWFYOgn6cGYnkNj0+rLRMv
	 wEkDojwV1GAHx2+yhGV53YQyP1lq+SCdLoYkEENRb4rCAjvcl/uf4H9YKNeXwgXe/WDLT
	 SWe83osCEC4DyDu3tknKsxhMpxYOHv223nLcfaAyXuplShrh5hUePwLvELyNuswSZoXjh
	 ZoHhaHPiU+hJZoY2qeETMCsz5aUvEyYqAE/4Q0F+jqLUC7KmLJ9ITxuFxG17L3ftZ/N1T
	 sNdkyOMyxIR7PM8q138J/o1EDeuH204kEvi84GgNTzwvO9/5ZJbbMDeoSoCWucrIDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939333;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0sMYUJNDCltqBib0Kk0DqS/5XBFoYnAmQ28Vcdz9/5M=;
	b=D1eyUtH31rpeFDg1DW3+ER/1P2cKe95m+wpGgw2KGYHQvpovGFeVgT3X1HbQJkicPn8d
	 GouRAMIolcmPP4+YO2na6bOiazhDF70jP8JuUnbrLgqboubrh4k5WZFic0aRFWmn+NXXx
	 ncPBq23Ktl4f1Ae6wo21er3FvBi2C1TAvBQ+eqZMcN0p75TkcZDiyMgYCLu53HomDi1Rt
	 rj6n+RcR9FUsS1w/EzpQvGOieWhRg02QRsG5x3degkjc77FRwdrzHKR0zZ4KhBMR8EZsl
	 lf5soEsESmw+fVCqMJYxy0a0WWOk7dbzUx4b/fEoVJI18AoiXLiU4mvHc3Ly8Lj3PCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fvSbT2sD;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CE606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Oct 2026 14:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fvSbT2sD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792939331; x=1824475331;
  h=date:from:to:cc:subject:message-id;
  bh=ZWpf+2QC8AxLcqhAr55V0/EggURSU/yCLp/BGN5e0DA=;
  b=fvSbT2sDMcEXGVGthYyc7LR5tHiIvtY5YMku96W+RIDrdPh7lu3JlvQf
   Vs2NbsOCCYW6FVS84XfmmO6xjjnhCPbYAI8HPDvxhOk5hHCbHEW62kbfx
   ByYzgJiIIUtSZgCCugkAiTlAG/Pj5eHHouMuWnEck4dtmW4lkT6jKYBOs
   NczwhcCH1UnTWf70uaxxdqZJ2xbMH2MM/ON4InDEUJAcyvcH32gSfo7TM
   AcUsxaaKniXo/aJTWRpkmwCM7X02UNCg8U4tzjcSm7GbObZn5hPFtkt3N
   CsWhglqG82o8e/NCu4yVGiOztVciYtId28KReNvTHKKGCUfbMjx99/sT3
   Q==;
X-CSE-ConnectionGUID: Og7SojR9Tq+6wogmvXhYUg==
X-CSE-MsgGUID: XmQdGDL6SdGGopPjkZR/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1506202"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1506202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 07:42:10 -0700
X-CSE-ConnectionGUID: e5tzVw0RQK6wE+QOgsNVCA==
X-CSE-MsgGUID: I6uFaZ5sRvC4rlKrc2h/kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4448924"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2026 07:42:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKzQE-000000003il-3Hl1;
	Sun, 25 Oct 2026 14:42:06 +0000
Date: Sun, 25 Oct 2026 15:41:17 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jpirko-mlxsw:wip_attestation_all_1 13/62] htmldocs:
 Warning: Documentation/driver-api/ctlv.rst references a file that doesn't
 exist: Documentation/ctlv/specs/ctlv-example.yaml
Message-ID: <202610251507.dwyBXwHo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: dda0bd8ecf9c893c3024b2cb13b1a1168621622a [13/62] Documentation: ctlv: Describe how to write a family
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.22.4, Python 3.13.5, on linux)
sphinx: sphinx-build 9.1.1
reproduce: (https://download.01.org/0day-ci/archive/20261025/202610251507.dwyBXwHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610251507.dwyBXwHo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
>> Warning: Documentation/driver-api/ctlv.rst references a file that doesn't exist: Documentation/ctlv/specs/ctlv-example.yaml
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
