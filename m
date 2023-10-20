Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742B3551D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 23:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRgcvURk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845961; x=1729381961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sa45hFZVHUyiE54OMbmn8atL2Av7WjsQl29mJ3fuHgg=;
  b=SRgcvURkhc2nfKp+RVBe8JjQ6OGjWF6c7pLV+3/3/p9aRnssL5AuoXJf
   ewPeyyg+ZT44Uwy4+p7e75mthH61m6fmUQ3tUGIfjjGjFEoNn7k0pmMso
   2y9vOLJt/fbf7ec4vlmG03Zku7OGZaqOnL6V4CJWplTi7UnYdJUOlfxix
   VbmiloVBSoyHyP9VBnjTrA7+qtxRacDzQ0dhwUGSG6/CeBb60M5nY2GPf
   sQGaPmdgVhH3wEsf+txN/OiFnFSItDxLAhGxUN4ErJh8p8kp8BedURpud
   wEFipuru1lbqY0P5k7N3mAPOm8hqz4fjpeNXqlYW30jey6LP+mm2gGk1s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417726324"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417726324"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="751080459"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="751080459"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2023 16:52:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzI9-00047g-1e;
	Fri, 20 Oct 2023 23:52:33 +0000
Date: Sat, 21 Oct 2023 07:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 17/43] checkpatch: WARNING:
 else is not generally useful after a break or return
Message-ID: <202310210735.Nqgtvslx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: d47c36a16f04c89188f6503841dd4097e9457bc0 [17/43] misc/esp32-ipc: introduce generic IPC for ESP32
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210735.Nqgtvslx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210735.Nqgtvslx-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#161: FILE: drivers/misc/esp32-ipc.c:112:
+			break;
+		} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
