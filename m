Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130D1B9AD5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718908699; cv=none; b=lH38s0R9hPBQsm0DXpw/5hM/naKSM1KRKPsfPrVpqpTQgSoM/J4eeY6DhV8DJw1BL9wM/FVLFPVycw/WpzZakYYVDM04e7HDiifatWXWrjeI+njg4jNfIypvJYTYEKDoThSPdkXKSzjXvVg/wBnUoLWUrB2mOdKf5bo9jAd7vPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718908699; c=relaxed/simple;
	bh=HCUtWsYw45RZhC1sHSvhPelORKE/yI8QvUxoiBDzRao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2y0qtifaVZ3lR1FQMj65EYmB1TPGPN1eZEEkGK8nfi+azy5rWGe503fm7hHhvtXHBioF+7hetyNq3+gaLcnwvOGGWob+vmVsCeXtHYxjjRwvetXZ+YNSYKE8HwpZ0qLHp3ryOSvai8frd+1DebBLDmUuWoG+ADZekGZjf1Vp9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hByKT2Zw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hByKT2Zw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718908698; x=1750444698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HCUtWsYw45RZhC1sHSvhPelORKE/yI8QvUxoiBDzRao=;
  b=hByKT2Zwix2wyIDQQk34lv/JnOKIYuaOF/qeiAMpw7eMs4K5bm5LQjM4
   m+EoLrYMmSEhlmamo5r4gABzgNgWVPbXLfA8G4wzxVgXvPnsJtDixux9k
   zKPNABO8TQVvuT90BlnJTqkA2rLnk8nCYfm9SuetNTJDZXE/6T5e5HRNr
   /aYr7JcIc8HFBfEu8SBDhoEo50iVzyDt9e3eSnoePY47g46H/6eegcV3u
   7yrvZdLKQoT5XzFW3DUJHjpI+Hc9tmGSngTEX1Y9wCIn5wWcDN299HoSB
   yJZ45c25/3bEj8bMmsZnvI2nveGviZasSbx8ONKSCA+vU/DCUgOEXGex8
   w==;
X-CSE-ConnectionGUID: +OdrVUSMRn6ae9ojUGvsjg==
X-CSE-MsgGUID: fIREsOBAQGy8NddALgcGjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33373270"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="33373270"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 11:38:18 -0700
X-CSE-ConnectionGUID: oilw962iR9qvN8KiEtt0rw==
X-CSE-MsgGUID: TUiQZpK0RHWzBCeZvULucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46851438"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2024 11:38:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKMfm-0007py-0N;
	Thu, 20 Jun 2024 18:38:14 +0000
Date: Fri, 21 Jun 2024 02:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5967/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406210239.HygHbXGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 6b1096c1eac4032ca030c106c7592566b015dc7f [5967/9999] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240621/202406210239.HygHbXGj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210239.HygHbXGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210239.HygHbXGj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
