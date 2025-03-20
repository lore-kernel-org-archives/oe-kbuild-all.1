Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5EE33E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742465952; cv=none; b=acT25YBlHD1difvAtso05NIoGu5NHfrxpyNe/JZTFBkRMpqvrTZm1yZ9H0PdXL9B1tDbs+6fKoH6ABMTBcRhGK8vHu1zX2zdrdYpWMWvCHPG/wwpMVwoQh5QohOtjN22kXbBNBoSSXc5bacQRlWx/SdNhu4ugLhw4lI6+PUUzxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742465952; c=relaxed/simple;
	bh=VCbjVFRFKHUQtXh4jUDXLuh9QdrNw/4gUGUKr4Oak5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A38dRYwaSi297po6kRsHZ37PXFGxae1hUnrlmEiGHlesxr1GeZTnisdyZtXj5ZiJpluIyJBbF7f/ziYcuNKxH6BM1d+ZTLOItYeKhCDoUWhJSGlJjAUu2jwVktaVQHeWsd3X8P7GaFilnynNV3lZ9DTj09iuHGBzgZxzYN5FUH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpW2udNP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpW2udNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742465951; x=1774001951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VCbjVFRFKHUQtXh4jUDXLuh9QdrNw/4gUGUKr4Oak5I=;
  b=LpW2udNPHclA+PIwPZMFdKsJ30Y27w8kpz/6aVWyWGJTTtZWrP3TRezC
   I8F26OD4xOUpCEeetzEoh00dt3Ba3WlVcrvHrZ6auSihSNpo4orUkFMio
   uOIID9tGkgNEieVnEc99lOU2i1Hpi3QpBhrtguFE4U2ZAmfnKbkUHtEM3
   PSCxEKpo9e6UdJ89cQGQtvbqcEOF81VcboOfdThUT6msCYApFVXJRVrx/
   WuHOOeOdfjrj8DnVUHSnxoM08M25VwmY9gn280QKl0q36UPjJTf760xGS
   2QeNXUJg76kqA96ie84TFXkKe3TOEf+Ioke9SuR3bqzLPjyh9ocKTIsKn
   g==;
X-CSE-ConnectionGUID: 4Azn197eRz6DPF9T7zHyyw==
X-CSE-MsgGUID: tBVzTWYwQZODzwfqBCzm8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="66150343"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="66150343"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 03:19:09 -0700
X-CSE-ConnectionGUID: lSzX0AXsQeONzagg9aBlBw==
X-CSE-MsgGUID: bTdkHwDmR76rJwYPREMGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; 
   d="scan'208";a="128143940"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 03:19:09 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvCzS-0000Mr-26;
	Thu, 20 Mar 2025 10:19:06 +0000
Date: Thu, 20 Mar 2025 18:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 8/17] ld: vmlinux.o:undefined reference to
 `oxygen_pci_pm'
Message-ID: <202503201853.7kB0BPRw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   765fee28fe0e7d6a5ff8f2eeb7990b7d3ad20825
commit: 5ea0a2206b58356779cc686630b6548a3402991c [8/17] ALSA: oxygen: Convert to EXPORT_SIMPLE_DEV_PM_OPS()
config: x86_64-buildonly-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503201853.7kB0BPRw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201853.7kB0BPRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201853.7kB0BPRw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: vmlinux.o:(.data+0x57d120): undefined reference to `oxygen_pci_pm'
   ld: vmlinux.o:(.data+0x57d620): undefined reference to `oxygen_pci_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
