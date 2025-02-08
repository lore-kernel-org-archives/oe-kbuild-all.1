Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CFC194C8B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989903; cv=none; b=Cx+6n5BYMyPQzh2TnfxYOjO15JDIDe6wsII7ZENYz2BTa0ecbEn1qyW2zTBr3tPc3wyPSPL/GmVF9O/fI+Imbza7HzS7fUPwPlmmDUvnGGgOdZfGSLSuWqvo0JoepGYo6qOihQe/v5+/ZQiVcV3tr+c+4xN9NaaSxbTs9xB2RC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989903; c=relaxed/simple;
	bh=h1IU1UDp90WxifNjxu+hljfXyib08R4ECsf+PnkB7Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKMParTf1aUVq6yLE9FmfWqMXodqdNVszXFlNoz4yJEUovulLAzmEVInEVQEdoPnINWCEv51fb/1z/9yVl5RVqXcZhdpd30G7rZKfSsdmqkU+vei/u06srpfzLCORfWExx91EtJ9eHkGlGq5kI4wKz5M7Terlvrp20GNGO+euMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/CSwYUY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/CSwYUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738989902; x=1770525902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1IU1UDp90WxifNjxu+hljfXyib08R4ECsf+PnkB7Eo=;
  b=k/CSwYUYDbHdDzZhHgwCfCtLuO2TmETuslZEMsikLhYY5/yvLx6+kdlI
   8q47eSvRG0PbUPHYVZW3ES/d3J037spjW+Pzx/E3Qo3kfNRsZDVAIRFgI
   lwi74Y/0Zz7+4A9TCRni+76cQPPESnK9Z9Ck+VNpUic9wDvtx2LGfSkjP
   pBilAdYHMWLyHFGhVQL/treGupEKxME3CrXDI+ugwTRicy78YaCvA0ghP
   tsQBauXtXX7gty/7kW4KOEetm6FhZwmxzdYOM2fNNrmzvIvZDSwEvV44q
   TRhXTrck32/d7ddGZX78mGWt1px+rjjtlTdNkAep3/XXVYxu/Xpr0ydRB
   g==;
X-CSE-ConnectionGUID: yirYVvh1SfC/fa8V5pKB8g==
X-CSE-MsgGUID: OTROx0wdRFiFGugmaBWrcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="49877786"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="49877786"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 20:45:01 -0800
X-CSE-ConnectionGUID: 5fg0s77USdKeO0hApoqT2w==
X-CSE-MsgGUID: hm7t6BRIRkGvosVA1KXYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112591779"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Feb 2025 20:45:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgciA-000zXM-01;
	Sat, 08 Feb 2025 04:44:58 +0000
Date: Sat, 8 Feb 2025 12:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/video-codec@38020000:
 failed to match any schema with compatible: ['mediatek,mt8196-vcodec-enc']
Message-ID: <202502081247.tfFJvpFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: 9e44a48e129d11ad5e3908b28ec263f0e5dddcfb [204/204] CHROMIUM: arm64: dts: mt8196: Add encoder device node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250208/202502081247.tfFJvpFZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081247.tfFJvpFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081247.tfFJvpFZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@32e90000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/video@36000000: failed to match any schema with compatible: ['mediatek,mt8196-vcodec-dec']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600d000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3600e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3600f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys-soc', 'mediatek,mt8196-vdecsys_soc', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@3602e000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@3602f000: failed to match any schema with compatible: ['mediatek,mt8196-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38000000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38010000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/video-codec@38020000: failed to match any schema with compatible: ['mediatek,mt8196-vcodec-enc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38070000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38090000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38800000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1', 'mediatek,mt8196-vencsys_c1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38800000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c1', 'mediatek,mt8196-vencsys_c1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38810000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/smi-sub-comm@38870000: failed to match any schema with compatible: ['mediatek,mt8196-smi-sub-common']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38890000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'mediatek,mt8196-vencsys_c2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@38c00000: failed to match any schema with compatible: ['mediatek,mt8196-vencsys-c2', 'mediatek,mt8196-vencsys_c2', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/larb@38c10000: failed to match any schema with compatible: ['mediatek,mt8196-smi-larb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
