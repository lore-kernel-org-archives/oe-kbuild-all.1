Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1751DF747
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 22:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737326642; cv=none; b=k5qYjrhPYJg7FiDdKHR1JL1KL+2UZHx1NPu/srhp2/VpuXmYcjtDX0fKrBWRRCk0rCLOoDrK+P6Xm4KhUMPNAR85vF3pIVC7nnLLPQk/vCYTjO3DA6MFPXgn1oX9MdpNJbn0Urw/aGywW37tz08iH7lj0BMd3Nkzdn90pmThM8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737326642; c=relaxed/simple;
	bh=w8DJ0+dZrQjDsqFccszvoFxX1BJAYD2Cv0Qq/qKFUck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvG4UkdrJs8eRK8TV2MAOERRtphkh+5JQpcNlEU0vI+D293AW6NSI7ghMgbuUILZ9DLg5P76b5G/zcXBDCiQ1prnoSsbB2oWOs+j2hQ+EEOMt1QF4IwjetgbekiwvnFIl55rLTiwrdG0G5yk4ElfDSglAFMG59vSOLNRjRCRSac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEFn9GO0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEFn9GO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737326639; x=1768862639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8DJ0+dZrQjDsqFccszvoFxX1BJAYD2Cv0Qq/qKFUck=;
  b=CEFn9GO0y98dOJrsoeFvT0PQvUw3QAPRQpO9q+faNcVqzQFzx9LbEfdu
   QaG+1DdrDRS+giV2V2TIqyj3SjmNn24lRgte9NXAubBOX5S9nO9J55SNI
   juODtSf5qG+Oqd76GN7NXzpXpFmT74ePa/4bCI6iQP3DuoyKDWY1o1zS2
   HDpwwXk96gyBDgIZMDQUTg0WCtfFj2Hh5LSAB5RhRu17QL7LKMRDTCJDv
   qGIXJN5aE6aIULiM01Kgk+M7ZPtj2lK0NJ3qZ5bFAG9fFV603pJGPZcoG
   dTKEPSlTSzUXFhd04eXDs9JNOmJ5xtkqr2Mb4yJK79pdktn5l0aZqNbxL
   Q==;
X-CSE-ConnectionGUID: GdlemOVBTFmnNVUHpCDuhA==
X-CSE-MsgGUID: +h1/iY07STCvh9uD290E9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55090826"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="55090826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 14:43:59 -0800
X-CSE-ConnectionGUID: l+oB+0LdQ4eJIQ8jjF/2TA==
X-CSE-MsgGUID: fihanrToSj+lXzUmppOm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106258488"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jan 2025 14:43:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZe1M-000Vuh-0i;
	Sun, 19 Jan 2025 22:43:56 +0000
Date: Mon, 20 Jan 2025 06:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 333/333]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dts:19.27-26.4: Warning
 (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or
 ranges property
Message-ID: <202501200630.EGRZ2Zlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   2fd541a9d43eceddbb3b4bfd2872a1655f335e09
commit: 1468cdcfa0ac2513ba51ea93a575e951453e928f [333/333] CHROMIUM: arm64: dts: mt8196: Add usb dts
config: arm64-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501200630.EGRZ2Zlc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200630.EGRZ2Zlc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200630.EGRZ2Zlc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dts:19.27-26.4: Warning (unit_address_vs_reg): /regulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:569.37-594.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +19 arch/arm64/boot/dts/mediatek/mt8196-evb.dts

     9	
    10	/ {
    11		model = "MediaTek MT8196 evaluation board";
    12		compatible = "mediatek,mt8196-evb", "mediatek,mt8196";
    13	
    14		/* chosen */
    15		chosen: chosen {
    16			stdout-path = "serial0:115200n8";
    17		};
    18	
  > 19		usb_p0_vbus: regulator@0 {
    20			compatible = "regulator-fixed";
    21			regulator-name = "vbus";
    22			regulator-min-microvolt = <5000000>;
    23			regulator-max-microvolt = <5000000>;
    24			gpio = <&pio 20 GPIO_ACTIVE_HIGH>;
    25			enable-active-high;
    26		};
    27	};
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
