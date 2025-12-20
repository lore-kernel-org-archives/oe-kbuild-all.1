Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81612C2372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247687; cv=none; b=S89AcOvyBky2hBDPvyoLmrjdvIaOUSkcpjbOpS9cSTni5V+vUSegp6jDKd0CdL8TLT+i83mxxnHuTj7wWkbjpp24S/85acKST37ohML9QsKoJgdSWXHF7eJ+nLhMFc+d/spHbOcVguv0wsgLyFVG6upVBsk13cmWo/cJea6qnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247687; c=relaxed/simple;
	bh=sg+i18uWuMlwo8ka0PYx9VP4LHpOXd2ecoBlgshrZOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UPhMPP6UfRsIfVr8TT6Dt6MkGbCPrXf7IktmK/8yZJe7F97w09y0szBI9X13QhPPVVvm6m1Yjw/FZ/SXPva4sjmrfV/Ag7uZP3uwqedVp7m1CrAZhgYSoWwi6l8Xcs14pxgxTwOUC6gEy/deyEoFk6Q8okeTZNQm+yWzyBsRbBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISSO/9AQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISSO/9AQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766247686; x=1797783686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sg+i18uWuMlwo8ka0PYx9VP4LHpOXd2ecoBlgshrZOM=;
  b=ISSO/9AQ7/eXSBHBuMysZpBUx9E3KfR4OZKoAUP4OAr9x86HGBpg9rH6
   pUjb6gK5ZMHEdwXVGtGxrwc7vgtT0DCQmP3IXwC7PLFI3azl8CsujEIMZ
   qn16cym5TB/sFFjq8K6/n9F0veekhJepz7O4M1SJC5nR6U17W8y7RQ6B9
   brHCJIkq3F54F21SQYdJvyiFEBtQ6rO5NDntFUk9aCrnWTKQnO4UP4xFj
   37C6/Z7vQffN/ASeE/TWU5/kt6FPGMZnXc3KOA0Bww9abNx4k8PVbNZ5C
   Y3Kddd4httBbPpqOPW1jdYprOvKQ9qgmhI3KmVQ2z3yftl2TS1V/WOl3K
   w==;
X-CSE-ConnectionGUID: +rAIEO4iQ/OQRtGKHwjBZQ==
X-CSE-MsgGUID: dwfNEIN0QNizr4deEtPcIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67375371"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67375371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:21:25 -0800
X-CSE-ConnectionGUID: Uk53o7AaTECoCvUiJQerGw==
X-CSE-MsgGUID: SMdVUHdiTqW3CBRcWqSoZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="222604690"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2025 08:21:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzhq-000000004rz-2sgE;
	Sat, 20 Dec 2025 16:21:22 +0000
Date: Sun, 21 Dec 2025 00:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 124/131] Warning: kernel/sys.c:1998 expecting prototype
 for sys_setuid(). Prototype was for __sys_setuid() instead
Message-ID: <202512210043.kyFnllV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 5ba9ab34fccbe3ea9a4b9bedc9b54211d613ac3e [124/131] kernel/api: add API specification for sys_setuid
config: m68k-stmark2_defconfig (https://download.01.org/0day-ci/archive/20251221/202512210043.kyFnllV8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210043.kyFnllV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210043.kyFnllV8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sys.c:1998 expecting prototype for sys_setuid(). Prototype was for __sys_setuid() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
