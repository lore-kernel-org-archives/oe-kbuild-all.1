Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B0F2E371C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751746236; cv=none; b=MT7nR1hxTI1wrvzheWc/zJcAeboWTdy2mCykfBsUz92a51k38bmMfO0BqXeAx50INmCxSv6u/KwZnWzaHzwXhX0YJ5WufdbfVuQ4qZetDIshaURh7DG5UJt4mbsuv9vohNFRxBe9GHHpNRx6THOg2kgjWaDICNzEw5h5WASAjpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751746236; c=relaxed/simple;
	bh=IKd/OZ9xTGLIsYPZn42BcNOs9eAuXHBylEdjgArRxPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TEDYpv1vHWvTqlAOlmL7sCoxuLwmIoEMbeBB8Bw0ouzaitfDvn5ri+w4H0XrpaNiddRZGqon9xBNQt10Db/BekTZq7mVR1Uxa/NEusL2d5LX168esJW+SMsuRydwIwTL/eZmv3M2ue6VJCWLWwAIXzLe5Z2wkqnC4WY7moDxDAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE7Qz2pP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE7Qz2pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751746234; x=1783282234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IKd/OZ9xTGLIsYPZn42BcNOs9eAuXHBylEdjgArRxPM=;
  b=BE7Qz2pP7gttjiQYBa3FEjS1Zbx+ndTtWVdv0RQgMfIPiC4EmIj+gW5j
   JOGYfCEcrP76bYVhHddbkPnmmOT2DbMjeCc3b2x/58elG/bEUxL/RPisg
   lJWyJDNjUY+BV87MXWj/gOzU0Hgutk2APeNve+HUTWGPnir0UWBbZq2CB
   GHYTClTZMUYvgex7aTBD2X5M0NBMWCeykwqmYNErMFgs+BJkpjuTR11N5
   XBgECj4GTLoY1OPDYApC6O7v3ObTdLgwiA/5iubbHYHAAg7npZ2qHmjEh
   0SCF+nj8ePx8Mel0WM6F/6UyGJuRIAKlzRuL6FV+Qb6wHuaxlOzWz9J6u
   A==;
X-CSE-ConnectionGUID: 4MGbpOl2QF6sxTvx9uUrPg==
X-CSE-MsgGUID: frQWalIFTLKhqOutoM+Gpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54166708"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="54166708"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 13:10:34 -0700
X-CSE-ConnectionGUID: fh1Sq4iWTo+HzmOvwe9L4Q==
X-CSE-MsgGUID: kuvNi3ocRO61dgUxfM+fSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="185884502"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2025 13:10:33 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY9DS-0004hX-1b;
	Sat, 05 Jul 2025 20:10:30 +0000
Date: Sun, 6 Jul 2025 04:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
Message-ID: <202507060447.zgfR9mJb-lkp@intel.com>
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
config: x86_64-kismet-CONFIG_RESCTRL_FS-CONFIG_X86_CPU_RESCTRL-0-0 (https://download.01.org/0day-ci/archive/20250706/202507060447.zgfR9mJb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507060447.zgfR9mJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060447.zgfR9mJb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by X86_CPU_RESCTRL
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
