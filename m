Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306B23E327
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142212; cv=none; b=IzH2ji4NUkYZybFKwqqQMx88tpgIY5IA9TnjVhacVDrdkGcUaVkiRX8k9M3uAvc/D1UmQM4x7QVG9DHbGi1HX8WNP+CE8+Y5XQdcUCO8kq/yk4ICv6Ae4qsRH0Fv4yu6gZIKXIoLUufE0dS+1wsj5ky7STUz0V43giCHZsu6hBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142212; c=relaxed/simple;
	bh=btcEVW3awm6FjsPfKE4BxyoUl1mBQeEJbsmDLJRy+Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vc24KSDhSfGpiMbiT4iy2w6NINFwP0ZxBW6TemVLtVBg9pyEVLX0nlgSDckYWTqmkQ9U5CSzwJ9uLO7qCJMSlPSCTU1/bF/1rkPbxbGAdvwLYjdVwrN8lsNdn+4i5cWvrQpXFtTB3Jqn009Mxg/VSKMANcLDr082NbJ+52DJ5nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9n6+bKX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9n6+bKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744142211; x=1775678211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btcEVW3awm6FjsPfKE4BxyoUl1mBQeEJbsmDLJRy+Ro=;
  b=H9n6+bKXdOppg1CAcr6giDDsvq70o2YEVgPLmxNznW/13U1FUAVD3L1G
   uKXdrVmkNBm+QPYHk+WzegDVcMqa/rPgcm2EyidS0HScl5ION002adRyK
   Jn53JZHQWpoBo6ZgK94VitcquOpNTXHGq1vLno85z+JVpV1L/WzVlaNvp
   /PiMdPv3MTxYJmqQfuGNQYq/sB0ggob8rwTfIDiqMbDVsp51RJCAWZeQk
   xR0REN7iukP0WbOEIh4mA6CM5sJrV838/Am4y5v1GQGXEKpO/0A38MMxE
   tpxDsX126EmwwmqKPhUWpbnA5y2Yqd/yMtVS5MH04JHMhTpVWkwdJZdn/
   g==;
X-CSE-ConnectionGUID: Vz3xOWAVQQmAbKdKPRp7vQ==
X-CSE-MsgGUID: Pe2Jcg7MRiqnnzlBs7s4sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48303095"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="48303095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 12:56:50 -0700
X-CSE-ConnectionGUID: CRvVUEPLTvS3gFGx5h2//g==
X-CSE-MsgGUID: 6Hz/Y94pRP2NbFNG30IcgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="151549801"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 12:56:50 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2F3v-0007wC-05;
	Tue, 08 Apr 2025 19:56:47 +0000
Date: Wed, 9 Apr 2025 03:56:37 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202504090329.bFzvof14-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [9/9] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250409/202504090329.bFzvof14-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250409/202504090329.bFzvof14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090329.bFzvof14-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=n])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
