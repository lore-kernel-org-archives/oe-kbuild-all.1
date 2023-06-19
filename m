Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE09522A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687212949; x=1718748949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J7mXsZpoN5D1A5wSWkCHtGuxRRm88qR6ZJPGGdEatyM=;
  b=HWvCjIPQ+6oJx8fqu2/5N99FB0JFy7dpc8ARHqETx6i15usqDtTvU+qp
   t0RfDH0gxzXmGDMWADFfn4N7NuVQWf2FeOHp5b3zdGVJ3/6vAs0ulEMQl
   E8f4f8A5CwMoxjAda+ZC6QlHLnv7MYqpPwJvRbpVzZAjabsuIGPENSiW9
   uIBDrJr0al0VKSLlknqp8YG0uqcXDyFTorSvj8Hz4u3sYwdoijs0sl+6N
   GaHzF7FWlRu1TVYBW52Uvvdstd+w2Q3BfsdSChxcplPv32+oKKf3EhZSr
   7Go0fGh37MHztJx+c7lUigyIEIR12PEV+2GvmV4XCXojeg1qyKnTsrtQA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="340061198"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="340061198"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858345868"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="858345868"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2023 15:15:47 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBNA2-0005C8-3B;
	Mon, 19 Jun 2023 22:15:46 +0000
Date: Tue, 20 Jun 2023 06:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-07 1/1] arm-linux-gnueabi-ld:
 hid-core.c:undefined reference to `uhid_hid_driver'
Message-ID: <202306200649.LlvKODKb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-07
head:   c93516a2d02c0a1f0466b3f512977c40c1bee4f0
commit: c93516a2d02c0a1f0466b3f512977c40c1bee4f0 [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20230620/202306200649.LlvKODKb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200649.LlvKODKb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200649.LlvKODKb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/hid/hid-core.o: in function `hid_add_field':
   hid-core.c:(.text+0x25b8): undefined reference to `uhid_hid_driver'
>> arm-linux-gnueabi-ld: hid-core.c:(.text+0x25bc): undefined reference to `uhid_hid_driver'
   arm-linux-gnueabi-ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
>> (.text+0x2f08): undefined reference to `uhid_hid_driver'
>> arm-linux-gnueabi-ld: (.text+0x2f0c): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
