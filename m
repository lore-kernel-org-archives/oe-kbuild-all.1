Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1572135A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzHQ+0Pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696941169; x=1728477169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfenT9zP8u3Ly2DEbLIL2mN5sdKUWu9Wn0lgK7Zcugs=;
  b=XzHQ+0Pc1LpZwBrjZ1cqGK8Y1aqketuvlGv6k5DBW12ZZSANuOZNO/fU
   VOiM6pMZTalTpDXA4U0FteQP20iplU9NfoNZ/Kd/ZrUMKD50X5DUA8GVO
   e0P1XwD8S02ke+qgERIwnTKo1xHOj5bOSFu4/9tYq3FocQGjAD2Ltcdqj
   0asSsJCRAJJpsO5Q0lmmjUfn5xBnAcy9avIWuKmO+dIgjWI4ITk4CKcyC
   Ypuch03VuqTScGcNvWOzLcrLV8VssyAK+f2XDHd7rsKO1djilCLdu/6pw
   3gvVmGb6AwgQNc/++xqeUKR7SkfY3BsCtFeNA7pfH+8NcqXbHQ8pvIreQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="2971144"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="2971144"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823761934"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823761934"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 05:32:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqBuP-0000PE-2b;
	Tue, 10 Oct 2023 12:32:34 +0000
Date: Tue, 10 Oct 2023 20:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 16/38] checkpatch: WARNING:
 else is not generally useful after a break or return
Message-ID: <202310102033.wti7d5Rk-lkp@intel.com>
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
commit: 03dbd36c4b5c2736c6c0654c3f5f8662ab5bd59a [16/38] xtensa: xip_kc705_nommu: add defconfig and DTS
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102033.wti7d5Rk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102033.wti7d5Rk-lkp@intel.com/

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
