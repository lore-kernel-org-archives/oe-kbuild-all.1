Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D43220F5D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763102882; cv=none; b=otIcWmjG/uWYj8csTjP8D71pWuzs0MZRBmz1Rx9yUliH99PT1xkIMXbX6+OA19cUKRRScfR28f/GDzc/QoS14A7TESJmZYxVEfLPJLO8fzsk7p0L88QGEgLo3630RZ/LQU2elzlEGKcaQm3lyuswil9y/3+wQf5pcSEeLWF5w1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763102882; c=relaxed/simple;
	bh=AAErkUiR2SnKU+sJd4PBOuhHCJDZHeshIu5XOP3UPkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egR1GbUuwKfmdhmncbltFbVBrw4dHAwib2iaTX2g761e0FFPIECuFD0nzGfFAdmBwna+yTnYJ4xB6Rd85ADsvVc2cwzdaPKb+ytHk+ZKp6kpLVstNLF8Qi0aHbZGc4Peadyb6vQM4WnPVEwa+LEYYIUQCEp9UaiyD5cT8AfBNds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adL5YKX/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adL5YKX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763102881; x=1794638881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AAErkUiR2SnKU+sJd4PBOuhHCJDZHeshIu5XOP3UPkQ=;
  b=adL5YKX/IXLFhqlTnSBnuQutMT6bEmX9Ut/AIGUB/f4uMyIhxKonQ243
   qzHa866FXdbsyq3pS6bDlV+gUiR5sWk9txxfACxUV5jkWcAGwrvdd+uAE
   4lvUP03FQS8aFhePJxHbCQqDyi5A800gsmpb3cOmVVBiAX34tG/fgtTHO
   FddrC1xH6MYgqdztLkMEUgDB7PAq+QslJKL5rCFgUsTQMe3y2t+9lCQGy
   4cJ3iT/DJyCbwneDkh/AsMZTNmDw2cLgHDDgU1fT5cfYM0mZEAWgeH8Fe
   aGADcEunaU5B+uwr8ySWG94uztvanNvbWtpxU7Gt19jYrHJOeBYC2qNQQ
   A==;
X-CSE-ConnectionGUID: aZSt4k4EShmOg5wgHUcBpQ==
X-CSE-MsgGUID: DdujcoR2RVOPuPwzuCnDZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82829288"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="82829288"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 22:48:00 -0800
X-CSE-ConnectionGUID: nynC4m2LR8WZBvkEFRiUvA==
X-CSE-MsgGUID: 6qGtF/j2TaufJhY4z50AwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190485396"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2025 22:47:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJnbB-0006Ft-1V;
	Fri, 14 Nov 2025 06:47:57 +0000
Date: Fri, 14 Nov 2025 14:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] scripts: headers_install: filter ignored configs
 via sed
Message-ID: <202511141203.lxo6340i-lkp@intel.com>
References: <20251111132021.22809-3-ddiss@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111132021.22809-3-ddiss@suse.de>

Hi David,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on masahiroy-kbuild/for-next masahiroy-kbuild/fixes v6.18-rc5]
[cannot apply to next-20251113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Disseldorp/scripts-headers_install-move-config_leak_ignores-assignment/20251111-212423
base:   linus/master
patch link:    https://lore.kernel.org/r/20251111132021.22809-3-ddiss%40suse.de
patch subject: [RFC PATCH 2/3] scripts: headers_install: filter ignored configs via sed
config: arc-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141203.lxo6340i-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141203.lxo6340i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141203.lxo6340i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: arch/arc/include/uapi/asm/swab.h leak CONFIG_ARC_HAS_SWAPE to user-space
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/asm/swab.h] Error 1 shuffle=3877595197
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1379: headers] Error 2 shuffle=3877595197
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3877595197
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3877595197
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
