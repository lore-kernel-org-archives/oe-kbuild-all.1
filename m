Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4C72E7179
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 04:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765513586; cv=none; b=EYpxOLgoj53g6QJIH0neRRUjXcDFVy5hcaXDaWldssXAbDG/CfQFiPwK0i+2dsuOJTxS0OYfEra7Dsm4wgGH6Gb9wmWJhQzUhtv9QFkOXhW56aw4IEXzYpMNU/a0HrQa594rtRCNl8GP/QrKK8xSUl+cX+Z/SWZ6AH//ytZD0Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765513586; c=relaxed/simple;
	bh=Hw6BF8KyMB3fFZVYjuCiA5TLgQCe9GrLFCJhEQA9dE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dXq3cG1AJDRIt3XwckAS2ex+F++xKFZUsvHuI3Ok8V55n61PMDUvy0VHN+vJzW/f8MZaMwLV2c2rCvu3l02zmDRZ92Z0gTUmhlpw2XnTvqVTrPDX1sZdBbR++vOonESClry9sMxtR90n36rCp/b06SZ4RQeMcnauMGNACqi+Ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYMRrKEe; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYMRrKEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765513583; x=1797049583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hw6BF8KyMB3fFZVYjuCiA5TLgQCe9GrLFCJhEQA9dE0=;
  b=fYMRrKEeuBk4tBjtsM31+S/CPsvpjSE6Yb+sxmeW326oYUM5tjnJMSh7
   jHV+FLYNWw50O7RuAJqauKYff3GcpjbYr/76zn1AzRRVwCsohjpvq1wHq
   nS0Kr5PqrL483XA+eeznWGSEdAIRPY6zQ73KMy3Dn92GzlTwRACeHPYY4
   8v27sZ3ZW7Gwh00xb/OUwmnWdPnIxpM4jV83pwScwkDnZQW/IuNIoKeTP
   0widuP6Yys12Hhg3ezuSwNk2SxnatR0LVBUH9szJykfnM4XL87oNQnvwo
   qY9t1/StCsLoKEotzqZlA5OK3hLB4+y3jzxq+49f/G1qRdVHczBtTBhUa
   Q==;
X-CSE-ConnectionGUID: zgu9YGbwTB6eIrY4Uf3r5A==
X-CSE-MsgGUID: SjXv+duUSVOcHuX22htZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84912750"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="84912750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 20:26:22 -0800
X-CSE-ConnectionGUID: ZiBEUSIaRFqjyc2/ZdOifg==
X-CSE-MsgGUID: qSXAl02LRjKXp/M9PD57gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196972821"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 20:26:22 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTujT-000000005V5-1w7T;
	Fri, 12 Dec 2025 04:26:19 +0000
Date: Fri, 12 Dec 2025 12:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] WARNING: modpost: EXPORT symbol
 "cpufreq_frequency_table_verify" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <202512121245.rdiuFZbZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6200e441dba51518e2ddf4ae8d430d8faaa8b598
commit: 31980a7be4ebf9e0e902935408e2a7990880d8ef [2/2] Merge 054570267d23 ("Merge tag 'lsm-pr-20250323' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm") into android-mainline
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121245.rdiuFZbZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121245.rdiuFZbZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121245.rdiuFZbZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "cpufreq_frequency_table_verify" [vmlinux] version generation failed, symbol will not be versioned.
Is "cpufreq_frequency_table_verify" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
