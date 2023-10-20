Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595535507
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGlVTcmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845957; x=1729381957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFRyeYPLmPRNrAdhzNIWkkwIPrUiIj+uIDMiPq0HJRU=;
  b=mGlVTcmPJNZI0iC97GSu7iuoXW5wBYs7tYIdkbO4JXqIUHKZtDHqNLcp
   3twpa/kQREKa4uutTQAmH610NGBXU8Vs/Gg+Ujm4O5yZbEI8vKlaeRfTj
   zK/vVWtW7IvFrndRRqvIybD85RkSn8BlzbQnqxAWWxPeEBkLfpEOwtuto
   fwp8pEk9tcjdEwSgMI9WuIOwl/QRN4PUD+vYkRXyKVcrATvZTXfuahEse
   uikNHpDN9roldFQkB5SeYnhi9YwOxxBL9RpPXzt1svPN9IXJslV/9I2tK
   gsukYe8/vnBI1DcfKnfd50R+a4nsRJD1/b/JZaIwa+yYb03Xl3x1c2s+P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417726322"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417726322"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="751080460"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="751080460"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Oct 2023 16:52:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzI9-00047i-1m;
	Fri, 20 Oct 2023 23:52:33 +0000
Date: Sat, 21 Oct 2023 07:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 18/43] checkpatch: WARNING:
 braces {} are not necessary for single statement blocks
Message-ID: <202310210702.7xjPx82v-lkp@intel.com>
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
commit: d0901f64c4025656651468461f9af66b53a25614 [18/43] drivers/mtd: add esp32 MTD support
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210702.7xjPx82v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210702.7xjPx82v-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#340: FILE: drivers/mtd/chips/map_esp32.c:281:
+	while (esp32_ipc_tx(hw->ipc, hw->ipc_addr, NULL, NULL) != 0) {
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
