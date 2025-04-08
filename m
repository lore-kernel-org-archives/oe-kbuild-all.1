Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2189221766A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131641; cv=none; b=GUCOaFBxHmhx7qiy0rDGcWlwMtamybUar+rSfEnuytxcriNcEAeRVzGJD/PEUr3HXMWfyCTE9URS3dXkpgrp8BQLknWcyqCoiIWclN7bUmIN1DLO1+71dos72JoMKuEXUSkQTG4KfhjcpIddgwLH9JqawEeGSi9wUpn0n9aGLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131641; c=relaxed/simple;
	bh=ZunJAMjGu9FaWhdYTkevbgjQJZE7oc6H+1Pm3dA7Q5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mBMjDfsdTyfAiI63I3YEga8h9HU/frb/7M4X63BMW5qy0rTls+1A6aavQnbtkKcPgAb77jlMq04je4m+whVPWp1iQPS9BK8Uk+XVzgLeSWJzSLubdhbdbAYvl9l6H7WJwGLGVpv8qJwFA4j6oEetfo4gzz5xh43TRkVCYRDYti0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOCv9WIT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOCv9WIT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744131639; x=1775667639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZunJAMjGu9FaWhdYTkevbgjQJZE7oc6H+1Pm3dA7Q5g=;
  b=BOCv9WITo+5OCpjSoC5HcyOwcPINmM3xFFYRVfyDwC3SzcEz5kLZy4S8
   8ToREwSGRDtaGGcldpKlIf2zPlHcK2V1DSwoo3x4GOuMpsB0Dg9g+58Ll
   qh/m0gI700GDrClK83HlrR+O/F15kMnYNYZvQvzhHj1xcA/TEpvk0ny0t
   kOqfS9aErGfExN+sEOHtGj78RljBgkcZV7zWtHAMy21cLHcT4g+2wnb9P
   SRJCgm6zqGErFJ5yQrSn22wKpqL3AlB8QNg2zayjB1pHSnQPwUaYfVgR3
   wR6PrCHKRxX4VFLyNe61vDr+8zKQEqA7v0ldEhHe0lcY2UdywrUzS1/nV
   g==;
X-CSE-ConnectionGUID: csK81TxvSm+NrDT+UMit/Q==
X-CSE-MsgGUID: 1yMvYMVzSFmyvDfR2c+Qwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45471679"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45471679"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 10:00:27 -0700
X-CSE-ConnectionGUID: WDWq03zbThCLHnLT3DQYSg==
X-CSE-MsgGUID: a3gvw2+eSv28uFHnSXxrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="129288424"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2025 10:00:26 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2CJE-0007kB-04;
	Tue, 08 Apr 2025 17:00:24 +0000
Date: Wed, 9 Apr 2025 00:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1/1] WARNING: modpost:
 "policy_has_boost_freq" [drivers/cpufreq/cpufreq-dt.ko] has no CRC!
Message-ID: <202504090013.0UisnOuh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   9cf857734495ccd5d1642350d0877e47fb484ee5
commit: 858a257b8cabd8923251cba5e22b9aecf978241b [1/1] Merge fd8c09ad0d87 ("Merge tag 'kbuild-v6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20250409/202504090013.0UisnOuh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090013.0UisnOuh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090013.0UisnOuh-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "policy_has_boost_freq" [vmlinux] version generation failed, symbol will not be versioned.
Is "policy_has_boost_freq" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: "policy_has_boost_freq" [drivers/cpufreq/cpufreq-dt.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
