Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172271D5174
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755945060; cv=none; b=HJteO21tTbGPtLpglXxPYN5cfm2lPS4FoVoAJUxGKK+K70tVWTlgGnLrkF3bsylYHT3tKy20mEHUcBeX7VE7xS5ze64KrQ/3oMKVwVsa8xcwyO/H6U7tGYg9gY9JL9UZsSQZ+ddEtAF1kwAFYIGyCCAV6+fWD/S3lSTqFswhl30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755945060; c=relaxed/simple;
	bh=zxU0gKog4AmOxOZMNAR4caFGLFVt3jgcv4XS2qkXLb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ON9ydiX9zDn0HFK60jVhUrAFtT1keTT0YoTUEWLuhGo7oq7oL1m2xu4c6sH7eL+SSwFKtuL3phFJXty5FK9jskJ36bSrZnPB6NO0fsP7qVvbKTLXKEUOcUtMRQCdpIxSw86c1WY7VN5viFRD9lOBbuvFgEtmBzilgTObV6X4fdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klAixF8r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klAixF8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755945059; x=1787481059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zxU0gKog4AmOxOZMNAR4caFGLFVt3jgcv4XS2qkXLb8=;
  b=klAixF8rhQvw+3AdUTiaIl/WhgtyNKygU2mtY+ENIebZFFwHkwhiUdRP
   rrhoUMKhuzL7vQvbKgMoeEjsmv7BLdxwfiCLo3mVZ4jMntfLlzrr1MZoX
   RWxTMauoC5KJOdQP35IVpBDdAPlrLiRLHQFrfmb0hcwvF71quI4A1DVJi
   D20qR/n1G1HXHiYTubw7Ewq1v8ZPjnt/4LNpK26y4moOzmk7NOlrMu0le
   wOyyIUQTVeW3CL9XQ45DzjI8VSLv0Fz6tE8EvaikYRnewXkYtsW7vWBlf
   8b4AykAZvwoKcuCUglgFo1fvwESv81qkmVwV7PlLpr+IsmdOJI8olzmEt
   A==;
X-CSE-ConnectionGUID: mxyI5yieSpSN+OesWCOUZg==
X-CSE-MsgGUID: Xr6X/MRPR/W26Z6L19Xm9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57253817"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57253817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 03:30:58 -0700
X-CSE-ConnectionGUID: KjJ7lMppSnejfm8hXRSy+w==
X-CSE-MsgGUID: 3feKYJWKS3CU+AeDL2GsYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168798098"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2025 03:30:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uplWR-000MFj-0Y;
	Sat, 23 Aug 2025 10:30:55 +0000
Date: Sat, 23 Aug 2025 18:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.17-rc2 138/139]
 include/linux/arm_mpam.h:12:10: fatal error: asm/mpam.h: No such file or
 directory
Message-ID: <202508231856.mXymSQmu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.17-rc2
head:   4c30cf5050a1d18551d882cb084196e0f8f1fbff
commit: b92df4c6ee221885399e840277f1e4449d624251 [138/139] HACK: fs/resctrl: Add cranky debug for reading CPU msr values
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250823/202508231856.mXymSQmu-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508231856.mXymSQmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508231856.mXymSQmu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/resctrl/mpam_devices.c:7:
>> include/linux/arm_mpam.h:12:10: fatal error: asm/mpam.h: No such file or directory
      12 | #include <asm/mpam.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +12 include/linux/arm_mpam.h

    11	
  > 12	#include <asm/mpam.h>
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
