Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6B2C80
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691786035; x=1723322035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oeDqQBH1qgGqx0U5xMEzecFHJFGia/7lhzs6OrRcRk8=;
  b=OyzXRbGjcHIgPi1YJDYlg6aAIM5zUEnXT6R+vaidVGZxMARi/sLiBFEi
   3Jhr9+JekxGR9HpiLpBqkD8Xf/ShAGc9CUcNiNmFb4wm+Ab/RdzkIe341
   A1wv3fJvygHQaNOxIneVqzmIKMeSACkwdLws4NywjFgVAqFGCol/w7J6P
   6WO8vrrGtGxwCYRY5Db8VgLrjSGgDyQ7X3HUtre5PmSBg3O6rZYDTkPLk
   0vGUbyPeR/C0eFAPwMwtIXV8U6pjkvK3cGcf68uWoX2F4waEVnhc0B2vZ
   N6iHFkywRCPgODYf1ar19A28u3QxkVn7svT7MCN46vYGjRMkGHX6YVcnT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="361903619"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="361903619"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 13:33:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709649528"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="709649528"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 13:33:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUYpT-000812-0M;
	Fri, 11 Aug 2023 20:33:51 +0000
Date: Sat, 12 Aug 2023 04:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 2/11] drivers/bluetooth/btusb.c:3991:5:
 sparse: sparse: symbol 'btmtk_register_coredump' was not declared. Should it
 be static?
Message-ID: <202308120452.epCGWdJp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   87626937dc8c075e721c55c512705b5a97014100
commit: db9747af51a608810cd0bafd85dfe3c7b43dbc83 [2/11] FROMGIT: Bluetooth: coredump: fix building with coredump disabled
config: i386-randconfig-i063-20230811 (https://download.01.org/0day-ci/archive/20230812/202308120452.epCGWdJp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120452.epCGWdJp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120452.epCGWdJp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/bluetooth/btusb.c:2524:25: sparse: sparse: cast to restricted __le16
   drivers/bluetooth/btusb.c:2533:25: sparse: sparse: cast to restricted __le16
   drivers/bluetooth/btusb.c:2534:25: sparse: sparse: cast to restricted __le16
   drivers/bluetooth/btusb.c:2535:25: sparse: sparse: cast to restricted __le16
>> drivers/bluetooth/btusb.c:3991:5: sparse: sparse: symbol 'btmtk_register_coredump' was not declared. Should it be static?
>> drivers/bluetooth/btusb.c:4007:5: sparse: sparse: symbol 'btmtk_process_coredump' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
