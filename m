Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B69C19E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeymoImN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697847279; x=1729383279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCMLtNOBNMWQm46Tv2aVX1EvH3fVEhwRB2BoO9Y6t6A=;
  b=FeymoImNXcn5rzeebtc/giicYvBeWzINcthDCLsIkaXh4GcT2Bbb2BSg
   aOQg8N4E+EO6ulwbRqTPQGi/uDkZ8r884GXcDmoomQrtZz6PtvWEXx/wU
   QylH961sYBU2cuKyNJ6/R85r9d1OyzwmuvaHx7xMf4my7xfPq+S26pOn8
   DXxZ9SpsJCsc6904irARyuBfzXl9po1lO+mKFAe323xBMkmn3CsbE6PPl
   nHhv9gI+XOnrTaV2ZkXT8o9LBlYRBUBHd7AVgb//VeqaegdDwCIhuCpnG
   STaLYFoG4oP7XWQ8GDEaxbr8ntfuRqI0Wf66KOZK0KVaXIl1LDASo9ds+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="389448018"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="389448018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:14:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707376152"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="707376152"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Oct 2023 17:14:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzdT-00049W-03;
	Sat, 21 Oct 2023 00:14:35 +0000
Date: Sat, 21 Oct 2023 08:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 24/43] checkpatch: WARNING:
 suspect code indent for conditional statements (8, 15)
Message-ID: <202310210859.znnipbfd-lkp@intel.com>
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
commit: bc0f1640b580ec203008b42df02b139ba6b65967 [24/43] esp_wifi: drop static esp_adapter and esp_get_adapter()
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210859.znnipbfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210859.znnipbfd-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#60: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:623:
+	if (test_bit(ESP_CLEANUP_IN_PROGRESS, &esp_dev->adapter->state_flags)) {
                return;

WARNING:BRACES: braces {} are not necessary for single statement blocks
#60: FILE: drivers/net/wireless/espressif/esp32-ng/esp_cfg80211.c:623:
+	if (test_bit(ESP_CLEANUP_IN_PROGRESS, &esp_dev->adapter->state_flags)) {
                return;
 	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
