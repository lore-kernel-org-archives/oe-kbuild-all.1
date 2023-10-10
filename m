Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C74736B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQNqKEn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696941277; x=1728477277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rw99QMfGWkmc3W6R1bE5+AMy52U9FVn5mdYDY6KCxD4=;
  b=QQNqKEn3lbVZA4Gu4AcsSLP87x5xVWYlJ0fLwW4/rht8J6tJBFrg3/nZ
   baFKtSano6bcwbaJEzGgO+qtsoIEMDvAvtxwewJcV7P646tdktIaOcOUH
   KXgd9qoROrikoJNS2uHH8UXwHYYAngqSHwYpZlr4ulacZ+XPyG12ZUs4U
   QvXOF//6l9xTZVOTY6Gl9flAilEcK/KWaExSPINxWTYrum6eJcxv1gERI
   pCMtw+Wrs3h+RlG/w1P7s4axg0DGBEsNwPz018onCyjMSoVSRgMvgA/7Y
   zTYWvydLZjc7QRZL03Ty7ZmQZpPKIwKg+J9Fs/keQ26JE49tb9UukrDUD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="2971550"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="2971550"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="819222157"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="819222157"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2023 05:34:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqBwR-0000PQ-1R;
	Tue, 10 Oct 2023 12:34:29 +0000
Date: Tue, 10 Oct 2023 20:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 18/38] checkpatch: WARNING:
 else is not generally useful after a break or return
Message-ID: <202310102002.Hnwx90NI-lkp@intel.com>
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
commit: 6d1b532fcc8a3d7caaae4b6f2c9820ccb6472e15 [18/38] WIP: xtensa: change default abi to windowed abi
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102002.Hnwx90NI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102002.Hnwx90NI-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#161: FILE: drivers/misc/esp32-ipc.c:112:
+			break;
+		} else {

WARNING:BRACES: braces {} are not necessary for single statement blocks
#340: FILE: drivers/mtd/chips/map_esp32.c:281:
+	while (esp32_ipc_tx(hw->ipc, hw->ipc_addr, NULL, NULL) != 0) {
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
