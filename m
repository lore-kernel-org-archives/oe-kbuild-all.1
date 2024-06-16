Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955B117E441
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718537534; cv=none; b=nkU+V5gxCmjLKJOuDHhz9WhjVWCafR6DNrBsAgLF0YDHWcFBJ6MBrs/kzPCpPfACx1prPW+vnc77ZqfPwOu2PLdKOSOCeaa0HnDzLjrcjsDzzg0WjD9ZceJH4siWI8xlgOaovoOvDPQrMhUOBBjbWoSCZDvOSlbAR/VLfrWF51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718537534; c=relaxed/simple;
	bh=XTewTP+qvdXNSvX9W/ydGXQL+Esru5EJIKrxhATCH7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FlIh0oLalah4PMerbYJzJzdjQqbH+eBDVhvkC2KyXU8Bo33TLKqJe1YjqpbcAGByFsFOiOfhv7gBXibmBN7/P3I1TrhQcBflDXGysCcJZchVmtEicDI0RW+6tJWKHAci5K34XfgDukaBI4cG65uAyafhy0pOD1tw7sZFleC9Ivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoZTuAWw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoZTuAWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718537533; x=1750073533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTewTP+qvdXNSvX9W/ydGXQL+Esru5EJIKrxhATCH7A=;
  b=BoZTuAWwob7frj77tv+9ExvJPmx3QUFGIGdeXj8qSfrxB3vmrToVELjN
   SKFCw2yL0BbrAXFt+C8V3iNU0QwJFu+CKF4fD80ly6TNO7cfqvm0F+FkE
   EGoXZemmFCPsebPe/iTVTVf0zr4v9ZeKgkxF9PbfafRDdFFYuQ+K7UGa8
   17B6r2Aeg2YVgSyOx7GticZ5ZQjBxhaM+pOruVKrKNyTahirI+T+1g+gP
   ZsM2rlINOpFHDOSe1RlBMkVTtbk6cvHN5ohzuoemCQ6E8r5GrJ+15dLIZ
   3YOBSlo82BYG3xU9cjxUeZ5drVXBLhWqC+xTiYJLlhc4ANhi3YBIjWaWc
   w==;
X-CSE-ConnectionGUID: UfBR2jq2QY2pmfoe62PKvQ==
X-CSE-MsgGUID: oNUzTMIRQG6ATdR/8nl+kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19166165"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="19166165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 04:32:12 -0700
X-CSE-ConnectionGUID: tpaBT5nORiei49rV32W27g==
X-CSE-MsgGUID: pvvzLyMmQKGuMlyspwOVmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="41053714"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2024 04:32:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIo7E-0002g6-2H;
	Sun, 16 Jun 2024 11:32:08 +0000
Date: Sun, 16 Jun 2024 19:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3965/9999]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406161942.O2czZjtr-lkp@intel.com>
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
commit: 200c1bf10773209d5919db7cb98c4983607486cc [3965/9999] arm64: dts: renesas: r8a774e1: Add PCIe EP nodes
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240616/202406161942.O2czZjtr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161942.O2czZjtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161942.O2czZjtr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
