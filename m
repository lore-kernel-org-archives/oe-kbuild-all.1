Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F831A8F84
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 21:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751750501; cv=none; b=HaYZPcyTJimeedjuRynHuGFUc0Z2eZ1E9ig8KTavIaQgAVk5x+TIdVfrwB/tIJNCfAP+zBEuqTYs3iaSmWroR1i1EvlI/4vW19lOHG9dnykx2nmtVLIxlrJoLzVi88ruyRN6Q7BBBNXERXGVChLxfEBjaagq10aZgLeMMAGqRJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751750501; c=relaxed/simple;
	bh=JfGbmQVe98a+tlCWvm+NZuETMuLbOP0dqbEoGDsZ9gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsIaUACznCPTe5Kiby2pVJKVVVd2zPDMYqeoYDVlAnuJRG7NK0/bj9tHkD0eoPsdQ8ahdYATYOvlfDRF1zr4iUASL9s8/RLC/W63hcLfZGCkZJHMExy5q2T4O3NJ1p7wuDm1wOB+KZq1keuDKyAuGbOK7r7/QgXhVf+uEABAOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNbbkQV5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNbbkQV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751750499; x=1783286499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JfGbmQVe98a+tlCWvm+NZuETMuLbOP0dqbEoGDsZ9gs=;
  b=PNbbkQV5nn3BmR6bFZXAhzkeAUOA9riv0nZuwvLXuLbg6731xcwtpeXj
   a/vYyvkWeg2/tmbBc/+NcrL1xIwgnKnMkjocLi3eN6nvBZF1AIqOdl59E
   JTIxUDMG9k/WcdXTBVT6MEIqGIvSu/sFP+6LF0K6sWZ1P/Me6xZz7egzC
   dDNPdnidLiWfgJpjYwHeHme6gHWgHdR7B/fzOFexnRDFoqsCHG5Ux7g7c
   Wat1B4P89difRKKIh5ef+6YdRWiCoPzbpxd0aiw/uSvn3d6UG9Rd7Wboo
   w1Gs+ejWh/LRwQ30N0wsCiurdvLdsWRUEw/JPvXizShld9qJgVdpOinis
   Q==;
X-CSE-ConnectionGUID: BZAk5ef6RTKSAAag/ckcng==
X-CSE-MsgGUID: 4yv1YredQBCL1UNoWUhYQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="53890493"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="53890493"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 14:21:39 -0700
X-CSE-ConnectionGUID: 1Vvv/XnVS2er6zEdgbFYeA==
X-CSE-MsgGUID: aVSe6CgvRHST/rlQAddQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="159426734"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Jul 2025 14:21:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYAKF-0004jH-27;
	Sat, 05 Jul 2025 21:21:35 +0000
Date: Sun, 6 Jul 2025 05:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by
 X86_CPU_RESCTRL
Message-ID: <202507060558.p3SWNaLA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   d969457e60e9ea507680a1751a06b04ed0e952fa
commit: 6a17ffc470497d45d1824185813aecdb8fcf9062 [1/1] fs/resctrl: Add boiler plate for external resctrl code
config: x86_64-kismet-CONFIG_RESCTRL_FS_PSEUDO_LOCK-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250706/202507060558.p3SWNaLA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507060558.p3SWNaLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060558.p3SWNaLA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK when selected by X86_CPU_RESCTRL
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
