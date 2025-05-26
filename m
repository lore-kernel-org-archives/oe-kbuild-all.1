Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584BB23F419
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288618; cv=none; b=KlKCxXvdr9yFLQ+cAjEZh4mwLO/xAQNWNTB2OtTsPjNS284LWfXVp9epZ9j7lODTCg9aurvRG4HTfPhY6g52Bj7kmSMPsCr9pIuGjfAmNoD6eV8Fb4YzwgvBWytiGzgPTHIi5CopiSiObE3VZK7sYat6+ttOOOOOyoEwnwTPGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288618; c=relaxed/simple;
	bh=RGW7BMHAG9A/hYmN7+fSPVSVWG+C+CK12IWxQPi+t3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnerbGNrgr0N74JuPDqCYEjozLAdi+vvj7IKaUUjnjrFxdJWc2hX4foo5J2q9ilvgfBFlGdbflt9IQ+Ejaqx9jL+aDed/PjCXBoEyh6N8kyFmV2pd1MqqqgXXQhripdgsje9tj5Pnb9X5rOama7ocZ19t/+rXgBjZhWR9ff7yLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5iQrUgt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5iQrUgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748288616; x=1779824616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RGW7BMHAG9A/hYmN7+fSPVSVWG+C+CK12IWxQPi+t3I=;
  b=g5iQrUgtZtTLAfojqLXa/c2gLIOZvYQ3rYUrQiGiWIFooizhJDA6Pfrl
   8ZcMEVabN556kaD5pT8ZvcB5msRnwHYLs2up9eDncoZfoDPNSk6zByVqr
   IXB5W4tb4aSP33TanQCAMUkPhYDopKmas30OGQmQPOL7EPvniMzPsiMKx
   ctftcMWTML0cXy/nk3x4Rp32G5ZaDFu0eSNVwMzhPBu7KThmyh8mUW3fb
   JZ9oAAgrhjfRsqT08T7GzyxI8AqU7yLZ6DCvUARKN8skcYhORe/V/LOp+
   8/w5S0PK+sOLKUX14lslKhEFPgjuSlrXzeNov6f+Ra8A7smd0VUvpn0qx
   w==;
X-CSE-ConnectionGUID: hTkMQL0HQHeGq1LhKWYD1w==
X-CSE-MsgGUID: nnMEMn+VTEGLaAtOaFNtkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="53925030"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="53925030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 12:43:34 -0700
X-CSE-ConnectionGUID: lA2DKA/HTj+YTIytcxo55Q==
X-CSE-MsgGUID: 0R/dnkAfSM6rEZdnO6PXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="147512460"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 May 2025 12:43:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJdjO-000SgW-0V;
	Mon, 26 May 2025 19:43:30 +0000
Date: Tue, 27 May 2025 03:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 13411/13629] kismet: WARNING: unmet direct
 dependencies detected for SERIAL_8250 when selected by ECONET
Message-ID: <202505270309.E7vPrW5P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
commit: 79ee1d20e37cd553cc961962fca8107e69a0c293 [13411/13629] mips: econet: Fix incorrect Kconfig dependencies
config: mips-kismet-CONFIG_SERIAL_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250527/202505270309.E7vPrW5P-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250527/202505270309.E7vPrW5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270309.E7vPrW5P-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_8250
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
