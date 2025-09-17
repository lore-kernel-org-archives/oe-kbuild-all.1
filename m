Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C19036D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119076; cv=none; b=UsjCxfp0VhArgLuVDm8ka232JTK0c13yyy2eGFDMCE/IHyNzcRVePPc9FnveJ9G6MxxBNyS7LkYMizKLFAJV8U9AfIe3mYQTBtU6dLHlhbAYE0l1xeCjRzmQsdAuC6bRdQ+ZpXjWw7WmBCiYCMLm41Bexoi+1aEDf/BOJ+O/C/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119076; c=relaxed/simple;
	bh=voZsaHfUvEOg0agZTUy/w1tSUew1mMZSpwTYd6XUMVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=plXd8nKPufK5dW1gBvz2GNsZcoFcc/fmD8uQIjmTJLtJgkdc4vRZKF+Js0oU++VK1IPrQX+ZwXX3VGuRmTfN4iImMZp9p7UkJuL6KT0nMeeW9fRxctdskyMiAFwTTuPcfRS+KZC76M9cxNQOpSNpPLtz25OPR/CAhNT+5EED/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcKR+pdb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcKR+pdb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758119074; x=1789655074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=voZsaHfUvEOg0agZTUy/w1tSUew1mMZSpwTYd6XUMVg=;
  b=bcKR+pdbaCpfORcCGBMxjCcUV1nbrhTCDhFu26FPI8HHNUPzvZ8ooUF+
   Lp+dkvXJCkvlczrOztTr/snZ2JY3Rg3jMK9QTuj4JhtzWR9EbOwjwLLQU
   3GRrRv9xvjkFjnqa6ISt7gaBBDYk2/gGEjQAcA34CShirFChSNqEVb8Sv
   spLhsl0+N1fUGVQ0U/B3HvC+qDnU7b14QwPHulkqenTye/GvUDw7sfiI0
   wqrLwkESTcovQvObIDJL6ABfNr4TTLZvO4aqVz3VOxOgzQvIO048k7F9W
   QKoOCYzy/k7HchqaUxFVs9BDlRGV5bBkVFJl6sy3BRdZWvGZD2I7rNLJ2
   g==;
X-CSE-ConnectionGUID: VwXqPKkYQx+FcCH1r0TMMw==
X-CSE-MsgGUID: FNbKWtrBSJmLCQp36+yB9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64247876"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="64247876"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 07:24:33 -0700
X-CSE-ConnectionGUID: ihbI17yWQeqH8+r3gir+Uw==
X-CSE-MsgGUID: 4j0rK01+QKiWsvA1grBl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175058710"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Sep 2025 07:24:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyt5C-00026b-1Y;
	Wed, 17 Sep 2025 14:24:30 +0000
Date: Wed, 17 Sep 2025 22:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 39/39]
 drivers/clocksource/hyperv_timer.c:489:9: error: implicit declaration of
 function 'vclocks_set_used'
Message-ID: <202509172222.r8AzXIcn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sparc64-generic-2
head:   01bb38cc8c3f4afd2a1e37d78963ab031921761b
commit: 01bb38cc8c3f4afd2a1e37d78963ab031921761b [39/39] clocksource: drop include of asm/clocksource.h from linux/clocksource.h
config: x86_64-buildonly-randconfig-006-20250917 (https://download.01.org/0day-ci/archive/20250917/202509172222.r8AzXIcn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509172222.r8AzXIcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509172222.r8AzXIcn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clocksource/hyperv_timer.c: In function 'hv_cs_enable':
>> drivers/clocksource/hyperv_timer.c:489:9: error: implicit declaration of function 'vclocks_set_used' [-Werror=implicit-function-declaration]
     489 |         vclocks_set_used(VDSO_CLOCKMODE_HVCLOCK);
         |         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vclocks_set_used +489 drivers/clocksource/hyperv_timer.c

bcc80dec91ee74 Naman Jain       2024-09-17  485  
3486d2c9be652a Vitaly Kuznetsov 2021-05-13  486  #ifdef HAVE_VDSO_CLOCKMODE_HVCLOCK
eec399dd862762 Thomas Gleixner  2020-02-07  487  static int hv_cs_enable(struct clocksource *cs)
eec399dd862762 Thomas Gleixner  2020-02-07  488  {
e4ab4658f1cff1 Michael Kelley   2021-03-02 @489  	vclocks_set_used(VDSO_CLOCKMODE_HVCLOCK);
eec399dd862762 Thomas Gleixner  2020-02-07  490  	return 0;
eec399dd862762 Thomas Gleixner  2020-02-07  491  }
e4ab4658f1cff1 Michael Kelley   2021-03-02  492  #endif
eec399dd862762 Thomas Gleixner  2020-02-07  493  

:::::: The code at line 489 was first introduced by commit
:::::: e4ab4658f1cff14c82202132f7af2cb5c2741469 clocksource/drivers/hyper-v: Handle vDSO differences inline

:::::: TO: Michael Kelley <mikelley@microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
