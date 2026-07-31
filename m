Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214371ABEDE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480325; cv=none; b=POvhLRsSc07/jNmg8+FKHSztMqa8Xkx/qBetvGc91Fd39cZTTe/LrdxU1ebJ/wGd/GF9/a/bNXjjQSwKtNnRNvdkbsvpJcI/89EyrYI//BVLjk1ld2Mlpk3+/VARHPutBtNcOcCXbsmK/ItoEXZERp9AyfXoWwMxCgaI2Toc048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480325; c=relaxed/simple;
	bh=E9CnrHQYT9GTYk0l+nebO09pXG53uUTXRKmjWvgVVd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RY1lKrrwqEHjUP09ibGc6p6/o+TqHHS9BNt+TUVgknXWDTr7bxZiapLmuY+rxLxO1RsV0JFBie1mR+noXvLgczaMIqo7eph+MEkQDxQryfZKsObQMB+CJNhazVI/jKI2sdIxvA1EmuZvsvkH7/fDkLekTjeSlzRaHpVzNnoV1AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbeDXtrB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbeDXtrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785480323; x=1817016323;
  h=date:from:to:cc:subject:message-id;
  bh=E9CnrHQYT9GTYk0l+nebO09pXG53uUTXRKmjWvgVVd4=;
  b=IbeDXtrBMWN/m50elLvoImez07x/x2V3bcGL2b0AjUBJw+Ct4vAsEbIs
   c1+D1S9z70ase3WbWTvTmDaKx7Aw/pCzMv/kpPDfGt2y5twq6i1dDLrm7
   RSzq7b/WjcTcqJg3sQfS6/3HQ4eYTVls52E28i1ZEswmqrVl+UlrGAZ09
   RP/qLY8/p/X/5lGHO0F/ucO10qjP5dPNFG6+m2finQzl+hAwM+TabGRcH
   FU41laXnNnKaP42Oq+xzxdvBOGaDOK/gDgOC8drdmvFjsowwEaMdCPu//
   V/1bqBhrIuPe3LO713fbAlPm2/rvMFj8y11o7KHKtiZZEX8dE56NHka2M
   Q==;
X-CSE-ConnectionGUID: QNLgDpBiSf6k24vCSv+BXA==
X-CSE-MsgGUID: oly7BTffSg+vyPs5SkenSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="88636961"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="88636961"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 23:45:22 -0700
X-CSE-ConnectionGUID: qqyn8v/vSG+gnMMoLWH/XQ==
X-CSE-MsgGUID: cCZIqLthRs67VeGFC0Mnjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="254185268"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2026 23:45:20 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpgze-000000000FJ-2kJh;
	Fri, 31 Jul 2026 06:45:18 +0000
Date: Fri, 31 Jul 2026 14:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.2.y 58/58] .gitmodules: warning: ignored
 by one of the .gitignore files
Message-ID: <202607311452.VpTaAjwU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   b975acfb39259020dffed242fcfba388a6f4e354
commit: aadf585168240b41fc8faa32e9b150829831a44a [58/58] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260731/202607311452.VpTaAjwU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311452.VpTaAjwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311452.VpTaAjwU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .gitmodules: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
