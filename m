Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7252663A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 04:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740889688; cv=none; b=bz/Js94W2uxYiVFzgRSSEuPoeZmPAPO5/J0ttaafHjpgy/C+rUe/feZD5kQOPiV4D0iSMYrcqu2Ii6Oyu/HAtbVMvGZGDtQEKUoNkS7sWpIrE1su0vzpfVNXRQjfZendgD4GK+yuypg31hNEoWyLj1yVy7wDgNbDNsG9QrXFWco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740889688; c=relaxed/simple;
	bh=CJqRPY4BG8HMPepixExZSsNQRzJjqR6pgBgQ3Q9XW4g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dy1yrVpdWAJW/0Xze61oa5XYn+umQQrLOFvBcYKgOWlxvw1w1Y2igCDSPmmMxjXy7XlNJqufco3odrRkt4MbVI4UMMmPwdK9ZOSIqPAkROX1RGzTqMw+DIVJemnek7oalLDy/Isp4SwKnWgubVyLlwOzjUM+l+/Jpa2/5SG5gP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaOweckx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaOweckx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740889686; x=1772425686;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CJqRPY4BG8HMPepixExZSsNQRzJjqR6pgBgQ3Q9XW4g=;
  b=RaOweckx3IxozkAEOCszHfCb1eOS526v2ayB71fcDIIBw4dJnb4c0e9B
   DWy8YGnlwvLrS5ixDeq7oQPupI31jtMIYH2qAEsHifqmQWV7lF6nL++TM
   3PRl+5WtOFCL6lC9Hcnb8Za+p1Sg70H+RNnbrruFU+bIm0NjrpwLw8Z9J
   glPEPzq+W8MXMg6QHDljw0S7NjHZiQr8R8dGKT0zzkmCNTaraWrWRxfRB
   How6hq9ssX7pGnDQBivt6voIExox9aW26z/7BHMqtxMvJK+sCwVV7mU5A
   j1iRfiRoE02Juf4lx0cdCbg98BnOky/DnoD6Ydr/EwjPIo/V0HaOCsFh5
   A==;
X-CSE-ConnectionGUID: DVa6TfxiTBCdca1Ie6fPUA==
X-CSE-MsgGUID: bYs6MfgnQyObXp8LOf5CMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41631547"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41631547"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 20:28:05 -0800
X-CSE-ConnectionGUID: 9l5kdUCFQSuLgbLdOE6FqA==
X-CSE-MsgGUID: 1Ab1fP5PRQ2hs5exDjCw8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118593488"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 20:28:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toavm-000H3O-04
	for oe-kbuild-all@lists.linux.dev;
	Sun, 02 Mar 2025 04:27:58 +0000
Date: Sun, 2 Mar 2025 12:26:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] arch/s390/kernel/machine_kexec_reloc.c:4:5:
 warning: no previous prototype for 'arch_kexec_do_relocs'
Message-ID: <202503021248.zE0c5hPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gerald,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 805bc0bc238f7209fca5e39c152b0d3c12046ac9 [1/1] s390/kernel: build a relocatable kernel
config: s390-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250302/202503021248.zE0c5hPi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021248.zE0c5hPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021248.zE0c5hPi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kernel/machine_kexec_reloc.c:4:5: warning: no previous prototype for 'arch_kexec_do_relocs' [-Wmissing-prototypes]
       4 | int arch_kexec_do_relocs(int r_type, void *loc, unsigned long val,
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/arch_kexec_do_relocs +4 arch/s390/kernel/machine_kexec_reloc.c

     3	
   > 4	int arch_kexec_do_relocs(int r_type, void *loc, unsigned long val,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
