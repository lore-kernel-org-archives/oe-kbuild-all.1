Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B192C10A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934714; cv=none; b=bq8UV3RflHhEMjgwSlmMvlQ1qiX7HsnzGy9kTVnj1fE6/iNkRYFPwfBqjJL48ypTsqKwRvA+caJoUcxvfINnDPsY7ujqdOYZCulJK7ctHSPho15Mmwy4wTMfqFQWmS4hAktGm0FzTF+M8TncDUx3TXbOw2NgGRUBE35GX58DxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934714; c=relaxed/simple;
	bh=BbMMk5Ru/CCU0u4mHoBte1lXJvGLOzRWs/+YmnDaFlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X2idHxGr4SWb8PQyUTaiuvvn9nHjucLl1+f43BJ4aXRIqN3dbqJGYO7Q/nbB+wTrsMUlf7Q2Fzc6pDcjsqyga9SaleO1MiDVHmovgCiRTjROrPPCzyaL3ZzQTu4fE3PiJf7DMl125uwMHxyIH2XX8wQZ5mluhjwiBBXSNqRhVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjsMWqXk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjsMWqXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745934710; x=1777470710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BbMMk5Ru/CCU0u4mHoBte1lXJvGLOzRWs/+YmnDaFlM=;
  b=BjsMWqXkgBQLDEkX0noDoY17NQAUG3VJe2O5s2+LsNjvY7en1w0Utttv
   NZvjvpSXGXvWTA3GRS2VJuvpwTypfZcuef5q4cS7Yj0B0zD0XwBEIWezY
   pIedXOJE0ev3W6VNQdUO/xJWrhw8qAFNoamz5FnPZzebvkWr6eZKtpifJ
   08Hec+ZRkM8rlIIp68LSoyj/fPOKBtPEAaZuKwsZ937ARN1HASON/+Cza
   Edeq4LSyreMMHPDmyoGlLZ9QF2QVPMlxcGetV/aJz/zj2gLxUEmznnyYD
   p8TrmzmU0EbnL46G+XNllGtmKwLeMRNlxqIHpncC5pEddsEy8hvjPpR2y
   g==;
X-CSE-ConnectionGUID: V1seJMOTRtqNH2jKO1uMKQ==
X-CSE-MsgGUID: ideAirxoQ/2v4c0IbUgTHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58546732"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="58546732"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 06:51:49 -0700
X-CSE-ConnectionGUID: SqgKlHsrTgesQEUg1Kjn+A==
X-CSE-MsgGUID: itJ7E5H5R2W8Zbh8sGl0MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="157061661"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2025 06:51:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9lNA-0000kl-3A;
	Tue, 29 Apr 2025 13:51:44 +0000
Date: Tue, 29 Apr 2025 21:50:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alessevan <44125445+Alessevan@users.noreply.github.com>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 56/195] drivers/net/ethernet/realtek/8139c.c:7:
 warning: expecting prototype for 8139c.c(). Prototype was for DRV_NAME()
 instead
Message-ID: <202504292127.xFQEFE7s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 15b4eed3e4b6bd5d5799c52a1550ad763e31adda [56/195] feat: print MAC address in C driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250429/202504292127.xFQEFE7s-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292127.xFQEFE7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292127.xFQEFE7s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/realtek/8139c.c:7: warning: expecting prototype for 8139c.c(). Prototype was for DRV_NAME() instead


vim +7 drivers/net/ethernet/realtek/8139c.c

   > 7	#define DRV_NAME "8139c"
     8	#define DRV_VERSION "0.0.1"
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
