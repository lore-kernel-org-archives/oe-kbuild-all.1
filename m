Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B147365
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRYJo9dR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696941213; x=1728477213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vGgLzZ7EgJfXcDh2AVn+pQ5Zg+QB38kHT6wsTIB3Ns=;
  b=FRYJo9dR1S0Ideu6b3Pt+2lu+pVGq1ZBXz4o3UHd0SzJ7EhieEK9sETM
   9SZ63LkzZ0HL1p6YL047inei9uCTiEYF9gj792L9ACxTeHv5UPcm99Z5L
   UCYIrcgV0ZE+ijoyLAXEyLjMc+RVkZ/mO/fvop24E9waw0Sm8Rrow27zN
   GWj2Eb+VV2mCqbBXlSfd1Lv4LLvkPjGRI+dMbtSsWQtbpOuVs3nyk+cgt
   NOPTAz327W4eNf4+0VUDq80CW2D35ov/8280hJKcq0v09hOJOlzHIOakX
   fzXGNYBYeFUL3AqtnBtaBo/uP2pIbN/YmVUtZlC1kB/kG7yZwj3VEOGr+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="383257735"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="383257735"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 05:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703295971"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="703295971"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Oct 2023 05:33:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqBum-0000PG-2G;
	Tue, 10 Oct 2023 12:32:48 +0000
Date: Tue, 10 Oct 2023 20:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 15/38] checkpatch: WARNING:
 else is not generally useful after a break or return
Message-ID: <202310102016.6VHvX6sW-lkp@intel.com>
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
commit: aa881f41e775d9aaae141526c37941d222c6685e [15/38] drivers/mtd: add esp32 MTD support
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102016.6VHvX6sW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102016.6VHvX6sW-lkp@intel.com/

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
