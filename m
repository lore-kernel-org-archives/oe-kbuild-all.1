Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B43111A5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705782056; cv=none; b=amoqY59MdLumwmX9TsLp6LW21PPvu/0yUZJkftKF+5xz0AdwTHQcUFZqaIvn7uBFYF9WsVD9OCutPVlb0984flY2griPCxvo/a/1mrJ12703w/nKRBVisfYCzlOVuLzpiMVnwW6QxXe5ZQgVnHPES+N4gWr05UXAh0i8Rna+PUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705782056; c=relaxed/simple;
	bh=ov0pCBDarYfIwUFwtKStfaDkh3GeS5SY052Mfpmrm8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHA61RNPi0McaCTUQS+HeezFz9vQEDTwFAYdtI6oB9COX2ITFmba+zx7viH+8UJtUh+V6KLcsOOj421O3RL0sI3hlFUavcXbRB0t38Kysi5uCFGaAYrLvN7F7pwc8o1Ij+A4iiKdSXVNg7LLT8n1QmjRVoSWmNn02+wu2UEUVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jp/MwKNC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jp/MwKNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705782055; x=1737318055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ov0pCBDarYfIwUFwtKStfaDkh3GeS5SY052Mfpmrm8w=;
  b=Jp/MwKNCzJBlyMnzyvxwqPkvlow7SnGlC3xpoKNI9se70c7kgPYhc7np
   ngRdHilhZrY3cu3bF4NP7nSaYLWfGCukJDa41LXAsmyLhMFpIF+47FWpr
   gRnPzy5VpeOcJBaHfMU8GvziBq0S48Fx1GrT3KoDAofGbu0MzLO0fIAti
   3YN7Mzf9QndK21+VwtAWt7O2iyQ6v8WmelWSmD6sEFN88JKsH1/S2Slbt
   IJeY1q0SLPsgSOfCHy+zD5fSwNi8VOy1gItL2JvcWU6j331r38vVOmrU+
   OBAeG7lIqxl7gcNwNwURjfcLpRT73zbknEoA/z1QeNNh7Z6HgYolcBh2L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="861833"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="861833"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 12:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="778256584"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="778256584"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2024 12:20:51 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRHpi-0005Pt-0V;
	Sat, 20 Jan 2024 20:20:50 +0000
Date: Sun, 21 Jan 2024 04:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 10/15]
 drivers/watchdog/cros_ec_wdt.c:196:40: warning: unused variable
 'cros_ec_wdt_id'
Message-ID: <202401210445.kextK5Gj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   7f175f0bf825dee166acb7576e12c21018e4d0e1
commit: 572008c38acc91ca3202f2e72b4f1683de544f2e [10/15] BACKPORT: FROMLIST: watchdog: Add ChromeOS EC-based watchdog driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240121/202401210445.kextK5Gj-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210445.kextK5Gj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401210445.kextK5Gj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/cros_ec_wdt.c:196:40: warning: unused variable 'cros_ec_wdt_id' [-Wunused-const-variable]
     196 | static const struct platform_device_id cros_ec_wdt_id[] = {
         |                                        ^~~~~~~~~~~~~~
   1 warning generated.


vim +/cros_ec_wdt_id +196 drivers/watchdog/cros_ec_wdt.c

   195	
 > 196	static const struct platform_device_id cros_ec_wdt_id[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
