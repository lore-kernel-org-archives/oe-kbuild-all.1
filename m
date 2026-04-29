Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647042188D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777487497; cv=none; b=UmpF3dbO2f9aO74+yhVWTAo3LsgC+cx1CFUJ5+6U1xaD3vqEU/5+j4dHRLD6W8PEniTSgJSQXHQSqFZgX3qTCB8Ptgko0T1IsJ1w6rljurszVwCUfJGIN+VZ1U8rPPQXRW3U87Fpg/2+Npg/4uxzD2z+a5c2Hk+UG3/IPUFKDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777487497; c=relaxed/simple;
	bh=2qlb2zRtXhcARElLdCB7r6LE6EIqjovw5xWAz/VYfzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KDEX7kS2VqCvMig8g1yrDXPdV21E5E4Lr2gX6YiCLa+p9nDzIJE2dC3iStdTX8w2w1YMLC/ZvxfZ4kgkQXQHDG/dORyvVjX3ScW+1Gn8YHcPks1tQho9ZXk3i3qKXTZMSvXX2QmET+Y6DF+DAJL07LYxan6juvZr+K/xFcvf6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYRBJ4Xx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYRBJ4Xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777487495; x=1809023495;
  h=date:from:to:cc:subject:message-id;
  bh=2qlb2zRtXhcARElLdCB7r6LE6EIqjovw5xWAz/VYfzE=;
  b=CYRBJ4Xxk12UuvZGh1WinfFeph6a+8iAbrxewmpDZ/ad6muENJ3Reaw8
   zU9Sfyf60OV3ZE89fUiRUVqNWCaYMKl7rzPFxwVySm07UlreuyPTQCAti
   U9I65KejJvooueSMEhToUZ6mE5csbwij0QF1bIK/g+gDPgkwuQYiYZHVY
   B6pMZXJGEXbYGhOFnclBbAOqyPOyop8JM8IrtSG9e5AF0TiZRZGM+aNBM
   6/UVq7sHx1+2R38piE4LiUF3OOJD+lrnnbqS75GKdMAGXGeHIiPuj0R+F
   7xot11d0cm5YXHY/HO4xR0WO/igFn/2HHx5vLr9ci4s3Ja9DPQw6wttBR
   w==;
X-CSE-ConnectionGUID: R/uVlwHOTsSg+HY00hACNg==
X-CSE-MsgGUID: etH7FWKXQWO+WQUYjsHT4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82033809"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="82033809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 11:31:34 -0700
X-CSE-ConnectionGUID: O8mY1WpoRBWG1T08oEFnJA==
X-CSE-MsgGUID: cTzBApnOSXiAEK9hgsLKAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="229995088"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2026 11:31:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wI9h4-00000000BNc-0rA2;
	Wed, 29 Apr 2026 18:31:30 +0000
Date: Thu, 30 Apr 2026 02:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:bitmap_print_to_pagebuf 12/13] undefined reference to
 `cpumap_print_to_pagebuf'
Message-ID: <202604300259.E3qp3AZT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux bitmap_print_to_pagebuf
head:   09e1bcbc7572ac6d30f74e6f8ff9ea087b259a26
commit: f0db9f47a158c5333bd0d709d44a57bd700224df [12/13] cpumask: switch cpumap_print_to_pagebuf() to using scnprintf()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300259.E3qp3AZT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300259.E3qp3AZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300259.E3qp3AZT-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/pci/pci-sysfs.o: in function `local_cpulist_show':
>> (.text+0x40c): undefined reference to `cpumap_print_to_pagebuf'
>> alpha-linux-ld: (.text+0x420): undefined reference to `cpumap_print_to_pagebuf'
   alpha-linux-ld: drivers/pci/pci-sysfs.o: in function `local_cpus_show':
   (.text+0x44c): undefined reference to `cpumap_print_to_pagebuf'
   alpha-linux-ld: (.text+0x460): undefined reference to `cpumap_print_to_pagebuf'
   alpha-linux-ld: drivers/pci/pci-sysfs.o: in function `cpuaffinity_show':
   (.text+0x280c): undefined reference to `cpumap_print_to_pagebuf'
   alpha-linux-ld: drivers/pci/pci-sysfs.o:(.text+0x2820): more undefined references to `cpumap_print_to_pagebuf' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
