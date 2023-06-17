Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BE137C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 22:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687040517; x=1718576517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ig7UovnYQ3AAw272IDll3u/8DJxqi19m0zyxit84Zr8=;
  b=H7FrqXIlMCpTKB1yZ5cvqhWKDkurew90vjpWI+z9nTSawyOfVKHIS7qC
   BvetcKnSPoLOUdPNPDLUFs2JXeITKJamp3rBPF33Fhc1rRnGkumxAzgWj
   8v5YqnyGVpd0T8A1beX6zG5bGMSw0SHE1sw4Cf8tLaSVGYoCQfYokf+2g
   XeBtFhmlch4Ew718Os7mTh13mpkZCPCYjVFgqirUIxeRIFLt3ps7IBgRZ
   2x3lNz38Teadn3pKacEh5ZFiVixp6OA6CDvbAq/JIualgsrtf9VviKkMQ
   qh2CmrwbkGPnxlpGCcBnrxtgEyvWmVQl/KweKAGnQxAOShQX2YsfXoRfP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="359438163"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="359438163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 15:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837425270"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="837425270"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Jun 2023 15:21:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAeIq-0003AA-0p;
	Sat, 17 Jun 2023 22:21:52 +0000
Date: Sun, 18 Jun 2023 06:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 35/38] ERROR: modpost: "rfc1042_header"
 [drivers/staging/rtl8192e/rtllib.ko] undefined!
Message-ID: <202306180620.Ew55XtKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   f99bbb4412ceffba7e85b9a9227de44c214c68ca
commit: d88b46ce5ab8160a3c5d4efde27197d7545ec19a [35/38] staging: rtl8192e: Add cfg80211.h and remove defined variables
config: csky-randconfig-r024-20230617 (https://download.01.org/0day-ci/archive/20230618/202306180620.Ew55XtKJ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180620.Ew55XtKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306180620.Ew55XtKJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rfc1042_header" [drivers/staging/rtl8192e/rtllib.ko] undefined!
>> ERROR: modpost: "bridge_tunnel_header" [drivers/staging/rtl8192e/rtllib.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
