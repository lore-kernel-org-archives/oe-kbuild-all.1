Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A854669
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718570986; cv=none; b=s3nTGbe69t5q+6rLbclHBKTOZtnINvSRQ2aKVRCptyc+RjhSJbxUNh9J8Ks4639IJD7MIXvJ9c2XQevXJiEX2EPAJr+kvRMEapFpufRNMrcnbj1TvZFNtnTx8lApiWiEXAtiGlzv5+Evsib+lPosTxJsFQdOjuUCn+GzDBRuiuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718570986; c=relaxed/simple;
	bh=ttSVHne4R+mjq5Ar9IWm5eO4LP7rvDNG6+yjZJBQOns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qmk4z99tJ9pq+nxZcWEXiaSV1dhRxe2NeEXwEhsrbgvNZWhKC6N+9Fg0H4XMeFmsEHXc1iHi8fh51ZpI2VBdSZDZskbEqxWyvpH3JIRvPqf1Rq0beDycgarL9ELErn9K9xwFN0bnNdXrSVRE8vRyASw4IlvosQpx2mvEQW3tdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/RE6Cxg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/RE6Cxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718570985; x=1750106985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ttSVHne4R+mjq5Ar9IWm5eO4LP7rvDNG6+yjZJBQOns=;
  b=E/RE6CxgSOiJKXNimFuxciPWYJxIf9XkORiulUyZl6wqlwIIn3SGx02E
   np07gatJWw8BYCmajezlxb1qyLJ7MuE2eGveFt0pbuMwwn97g9goPK0Oo
   TwUDg9jdhun2scSU3+4f6+EI98Nh4U6w4wHYQ/AsCgyEmZn9G4Ajt2idA
   Ib3JVJI8Vw+W31uznS2DCf71G/xFV8vm54xwu4vfHg3fdlO4uRSKlTy3r
   hd+9cEFMTha5eqKaeRF7lxwZTE+r4bpuhnq9h64mGKc0slA2P8PgYkhpO
   CjVrAQrETv2wEShK/Y08Us/Garltqu8CxMoZAxwcNwjyfAYdMGVG/7j7u
   Q==;
X-CSE-ConnectionGUID: a6hw/4TSSRGJgUUsooG03Q==
X-CSE-MsgGUID: gchlkV5WSXqTvvSL6hdDew==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15270853"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15270853"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 13:49:41 -0700
X-CSE-ConnectionGUID: BaQMzwCEQZyJnA8bsZZqiQ==
X-CSE-MsgGUID: /nwC6r2JQx+8xWLoVD1Nkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41157008"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2024 13:49:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIwoj-0003IG-1a;
	Sun, 16 Jun 2024 20:49:37 +0000
Date: Mon, 17 Jun 2024 04:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Vibhore Vardhan <vibhore@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 28/137]
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does
 not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
Message-ID: <202406170425.7BGAwd3R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   038aa785c74b05cb8f4b574c972272e77a6dfb57
commit: f50c9f12bc379088c5f1c3156f3c4477436a8bd2 [28/137] HACK: arm64: dts: ti: Configure am62a pinctrl-single for wake-up interrupts
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/archive/20240617/202406170425.7BGAwd3R-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170425.7BGAwd3R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170425.7BGAwd3R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: syscon@43000000: 'syscon@4008', 'syscon@4018' do not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/bus@b00000/syscon@43000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: pinctrl@f4000: 'interrupts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
