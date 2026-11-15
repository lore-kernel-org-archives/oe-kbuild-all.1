Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794737157;
	b=tWs6kzuvLCPnNPE8WrZNi/VbbOKOOZx6Q1Pn8AhnYMe2EL59KQEj+RXHj2IZqv26HBM8
	 4wDeBqGbbby3COqcXOpkf1IS1bjtr5eh2jNWe2XH7Yt149KJgWm6Vpfb08Up6FqCb8PMx
	 iUbrHZVz/8Ohp1/pmLPKHdeHqynM8KZMMtPXJzwKipRSvHfre79LE2ij5ecFSpMBh2xMB
	 jHhsAD+Bwq9m6fxSY20QVW6iPURAKipkyGqnN5r6Rf2X3uTX/5nBu5ou1e1efmlGKSWGZ
	 Vnnxv0uzcOhmHhfE9clpkBHO6ZbS0T4U3VpA6HVHdaAnwMJBTlDcnLMFn4IeZDpISew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794737157;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o5yW3OPhOAvpQ9sGWRgVE8f8DPx1u7nwpM6Zg+XyBgI=;
	b=K8RLDwUBa7YSBFNhyOptEP1SnllHvMVHLtWfRKKYbqdSL+8O65cdmjMiyPWsaKAyovQ0
	 BCnmeHR1qUq9AI1Ly9Oeq+cdY5HyFL4+PEPVOMNX5imIfdY/a8ZXtp1G3yfMmhA0J7cca
	 +GTuy+6GGBGro13ud07f9JXtmTfxH2MdxNSU7kru3zRIo2BEpMCIURBxwW2CbuIaUTSQC
	 mTgStcCHXqgfDDS0H8iTcDTQOgSVX/rllla4PbLnr50KJMRc1tEGXtB1/GVpVR4AosUXR
	 qB0h2OLyJXaEFxTBylkkk+Ir/3HFWo220Awy/jICdbTxbSPLBkYmh1SKpVzFACUowSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7Rdykch;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF430606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 10:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF430606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I7Rdykch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794737156; x=1826273156;
  h=date:from:to:cc:subject:message-id;
  bh=nSVG1ac09/fuuuu+18nqO+W1YeiOs85aMsx1XIE0gx4=;
  b=I7RdykchxBZj/3SlgXXqDexAhT3yy4bwFSXz/IdfZ5p4EIMOqgTRR+j8
   f3LusHAzWdguUx2WTmMvEJZTV5OYGlktf/1ysnO7/JpMa++EeTdLDiC1E
   vGJhC9sxNTRkr7XKdOp5Qknaanvpj3fbCD9PnICvkL5qZflzeTeJl/lmj
   Xsr52pWCwxsqSm6ZKzFTp1xqjtTidtIhT6qaYHPVfBwADsiWZmD48AqfW
   xlKYrQDh3Fx9MoedZmu4m5n+AkQqyklYKzBLUuLOyxkZq0ESyh10GqQN+
   fJlXR08SdA5AVl/LJ3LvqMuCTQIjsnOlRKfklvPisUgJz4TemIfpvn/Z/
   Q==;
X-CSE-ConnectionGUID: S4YyOyi/TXq4xjMifW+wRw==
X-CSE-MsgGUID: OFHadYrJRLyfKtIIosqUSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3384675"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3384675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 02:05:55 -0800
X-CSE-ConnectionGUID: BfvhJsCYS/eWGBufd9VFjg==
X-CSE-MsgGUID: KOUQDufdSMiX/Lca+gudJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9227114"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Nov 2026 02:05:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSX7P-0000000028U-0wda;
	Sun, 15 Nov 2026 10:05:51 +0000
Date: Sun, 15 Nov 2026 11:05:38 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/181] htmldocs: Warning:
 anolis/rpm/kernel.spec.template references a file that doesn't exist:
 linux-%{KVERREL}/tools/perf/Documentation/examples.txt
Message-ID: <202611151138.R0tU1rTa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   4f2db664ee044fbea206f4d976d61e47d4cf2158
commit: b59c41852684e0cfcf198cb3ded58b8b37413a47 [0/181] anolis: spec: add basic framework to generate rpm tree
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151138.R0tU1rTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151138.R0tU1rTa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
