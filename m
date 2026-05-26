Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649DF403147
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806558; cv=none; b=tBbO47lMplvZvEWnM9HAzlbJEjZAniXT7M30hh9Vtvt/dIboZMo/YLw6as1x+ZwOWhp50YmfVspC0IDi5NORcHOQ6iLRd4FCU8COYTlFwmc9HiC/ChObm1bAuCCLdRGhD3szgCZGBW+7OR+CMcacJxqwrh4dwvoIXbEyOonf77Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806558; c=relaxed/simple;
	bh=ywJQC6I476XF+1S/2pU3XPPLzbcM022xyw1GGGh57eI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wu28oiT0+P6UVKKAPlwA8RSlJPuv4w08HaC7FAM4CXvC+fxZsWF9bhaSwjPXT2MTcTORUoLlVoGdUv9qoohbOFiVDcWNv38vQsvIuhT6luPJeAmLFtyYhEQ4OuqrKNhV2wxzF25aKJGMnTZV0CDlebKXTQwbrmSk4XzFz3DQ4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2CffS6Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2CffS6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779806555; x=1811342555;
  h=date:from:to:cc:subject:message-id;
  bh=ywJQC6I476XF+1S/2pU3XPPLzbcM022xyw1GGGh57eI=;
  b=F2CffS6QJduP96EQdTmtjsH5XTm0DrBXadmLcf+49SnDZW4n0/JIg3q6
   dSFqqtW0XvWDyHye8kcWucUAiy/UfWQtG1d2ywh05ksA8Pc5pzb5/5+En
   3fAViRwnCf8xISgcsHW8b6G9Q1LGaBm3Aa1FWvCSQ6r9PP/GRntvEMYEB
   wdeparX0wh8ZPFqpHYmuKs+WkIQYhpWdJLBsFhSK2atKDYQEbcJLwf0tf
   TdV7c0YQz3j8WuvezLW/Lqu0GqYgbTspaQ6BptEiDpUoD+oA9Rwnd4WrR
   W/y8Bc+cfKV1bKIEeLyj4Bed+Njzd2vhPxIDhHRjPXLC3enFW0ClcgL4q
   A==;
X-CSE-ConnectionGUID: 0LaRvs08QrOREjHmgFw+8g==
X-CSE-MsgGUID: FxS6VNQjT5aymnbwdCm+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84475780"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="84475780"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 07:42:35 -0700
X-CSE-ConnectionGUID: VpOT3XOZQTuvbYUr8wZT7A==
X-CSE-MsgGUID: VZa1Tl8TRkK5ryhgjCMO4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246908765"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 May 2026 07:42:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRszG-00000000CQD-3GRn;
	Tue, 26 May 2026 14:42:30 +0000
Date: Tue, 26 May 2026 16:41:43 +0200
From: kernel test robot <lkp@intel.com>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning: MAINTAINERS references a file that
 doesn't exist:
 Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
Message-ID: <202605261636.NQn1vkB5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zhentao-Guo-via-B4-Relay/firmware-meson-sm-Add-video-firmware-loading-SMC-call/20260526-164156
head:   6313e03367438ddc380dc72880bbd3b1697a00c5
commit: b01993107ca7016d16b888c6a9b129c374788bb4 decoder: Add V4L2 stateless H.264 decoder driver
date:   6 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260526/202605261636.NQn1vkB5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261636.NQn1vkB5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
   Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
