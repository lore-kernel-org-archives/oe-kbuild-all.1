Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373E447362
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYVPo+wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696941213; x=1728477213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkJD9E7jGkgCZWOCUMnC4bLgqx+8vnHa6wZRM2UzumY=;
  b=YYVPo+wd6TCAPvGo4KHfldVUwJwGyAFH14W0cPfkx1CkGlqEVrVGe7/Q
   3IO7t2VINoiF33XTaDXDdl2YP2gg+ORDFNG3sfgbHQUKdst+qLb4W/oU4
   oYZDf2/gDCxsoP2lz4GQd9GC/ebczRPrmkWIjclC0hHUNcxwSK10y/4KM
   y2j0Wg8kX6acwMy+c5X59nvRbj8D9etPryAbUqWT6O2z3Nt2nJeX94KzU
   CWso2VzAp/4MYWRUCWuV3M3qj28XPxTKNmmq08G13YxZIMR9xpEeK28VZ
   KIbqsYiLPfDNwSULZCijcdMsfJsKA6FeizO6UXDNbbIPgXbjvD6FES8RV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5937441"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5937441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="788569101"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="788569101"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Oct 2023 05:33:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqBv7-0000PK-2X;
	Tue, 10 Oct 2023 12:33:12 +0000
Date: Tue, 10 Oct 2023 20:31:46 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 14/38] checkpatch: WARNING:
 else is not generally useful after a break or return
Message-ID: <202310102025.poxDODsH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   224f43124c24326eb21de553984a58d8528a48d0
commit: 8264985b44b56ae0e4bc756d11424b7297ae34e2 [14/38] misc/esp32-ipc: introduce generic IPC for ESP32
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102025.poxDODsH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102025.poxDODsH-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#161: FILE: drivers/misc/esp32-ipc.c:112:
+			break;
+		} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
