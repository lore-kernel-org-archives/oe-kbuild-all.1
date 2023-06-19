Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B61EA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687214196; x=1718750196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+9zZrlli79tIjSakHM4JulkT4tHkmn4ExgcmWkYXNY=;
  b=IQkqYn47mT6cw1F+rw0rAbWPChTXGyxUnLDRmiDvZbgJSbWpAUZVZX9Q
   UdiQWdqxGlA5TPAtMRFOVQ6m6Kg7T9vRZ5trsx0CJKKihPRZJHgJK+IxP
   /K7a3QgPNFHvBlLekPORNtBzl16s0XJvolo3inrkF7bORVSWL3rpZrx+1
   rUoiWFM87hovpXG7Fyxp5qyRathYW2//AskCE0GwezLpAbhaj2YGbaHnF
   ozB0uAydagPHFY3n4aQxemAHpsarqGJxtuyMFlKe1vgFzS5nWQhlP6fhI
   1nhTreC3JDNMl99pw12PsU/D0HMrUBgi7M1AciWcSVfgoOs/u1SrdtvGq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="446099582"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="446099582"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="1044018434"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="1044018434"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jun 2023 15:36:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBNUA-0005Cq-28;
	Mon, 19 Jun 2023 22:36:34 +0000
Date: Tue, 20 Jun 2023 06:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 3/3] undefined reference to
 `uhid_hid_driver'
Message-ID: <202306200634.ra0vHlrA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   ee7f5996159f1d04fc0564e4564f7c66c8d87b21
commit: ee7f5996159f1d04fc0564e4564f7c66c8d87b21 [3/3] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20230620/202306200634.ra0vHlrA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200634.ra0vHlrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200634.ra0vHlrA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/hid/hid-core.o: in function `hid_add_field':
   hid-core.c:(.text+0x256c): undefined reference to `uhid_hid_driver'
   arm-linux-gnueabi-ld: hid-core.c:(.text+0x2570): undefined reference to `uhid_hid_driver'
   arm-linux-gnueabi-ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> (.text+0x2ebc): undefined reference to `uhid_hid_driver'
>> arm-linux-gnueabi-ld: (.text+0x2ec0): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
