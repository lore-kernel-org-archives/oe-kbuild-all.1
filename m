Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256117597
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748699118; cv=none; b=u1ui0F5/du/8ghGK+uxNrxAyYG1lbojFmh5ehwNdqj0sjmMZygFwLEMSiav0P5m5TFIm5YYOk8WujTrtgq+lRbUiRTLFjQd7k8HjGzUv+2J1TpQ3q1Bl7mCIQk6Kq94RzDwcoq9F1Eq/fA8PCPgN7TPjsPspAYhN+mveEigQH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748699118; c=relaxed/simple;
	bh=SXHEtkvWsL8T6zXP92PiHLgRUftzi6svlJJ9egkE3og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BWVNEXuCpdvWy7MHHBqJmGpmoTx4MCYjel2zz8rF4hcZ9AuTGvsxw23dVOr/zLBdHsUPEXPCGGOShsIzYGQiBWgAi1x5nMISWk+Slw5uYu/tScxTrQZ3ZC/T2uc/Nv19+JWroNRbOOYkCXznFS8C8xeNcTfWoc5yzYP3B/MripY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep2PhgDn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep2PhgDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748699115; x=1780235115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXHEtkvWsL8T6zXP92PiHLgRUftzi6svlJJ9egkE3og=;
  b=ep2PhgDnq6q1rU2uJB0+DCOTFPQO/4XE8JXC1fn4Xf9mmcGdWzGLyBAX
   2rELe5gvshMRZ/SO+pSo0r5fBErFgo88TMuB7UzB6toDVkT0WTVwqoEeY
   Q1R5S8gEaE0BALx+Sk+Qjyw1/hLIFp/6IGlE/WmBP2iYkPC/rbBMhk7yv
   RwvbjBnrUDVc5xKRWDkQO6gSjxAF9hN1JL5tOxZuwNV4Bj48jWiBpIxiZ
   vmU9+3YtSUtQr+IQy0zqwFLXiabbgVq4AfdwuNeaNnvqtS2XTSnYOV7iz
   TvWHV64zLGqRSvWd4dvBGBbP1GARvLXXyT8eAAIHowGWVB+k0uPUyrR2Q
   A==;
X-CSE-ConnectionGUID: irrDwQt+R4yknY5jIGjlKg==
X-CSE-MsgGUID: z30JdE0wTJKT0heTdnjH2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50828094"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="50828094"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 06:45:14 -0700
X-CSE-ConnectionGUID: bShQfhVXSnOXHghhbnuDPg==
X-CSE-MsgGUID: vhI69eauSBCKKUl8IlawQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144152075"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 May 2025 06:45:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLMWN-000YQa-14;
	Sat, 31 May 2025 13:45:11 +0000
Date: Sat, 31 May 2025 21:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [broadcom-stblinux:devicetree/next 21/22] Error:
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:115.1-7 Label or
 path pcie1 not found
Message-ID: <202505312141.UypU3nWG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Broadcom/stblinux devicetree/next
head:   386f036078f4f15d02c24f3783b83a7c6e2d3eb7
commit: 76f20110f0216907c77d854c7f224a2b11a7ac64 [21/22] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
config: arm64-randconfig-001-20250531 (https://download.01.org/0day-ci/archive/20250531/202505312141.UypU3nWG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312141.UypU3nWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312141.UypU3nWG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:115.1-7 Label or path pcie1 not found
>> Error: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:119.1-7 Label or path pcie2 not found
>> Error: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:15.1-7 Label or path pcie2 not found
   FATAL ERROR: Syntax error parsing input tree
--
>> Error: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:115.1-7 Label or path pcie1 not found
>> Error: arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:119.1-7 Label or path pcie2 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
