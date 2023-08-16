Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B33218029
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 20:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692216833; x=1723752833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Do7cxzYbbIvyHSgoRfEbt2mo+gHkBC6EWCwoasDqWMM=;
  b=HLjO4U30OKy/SxoOSiWBHQM9YX6Ay95fPCNOpmm7ZYgb384XzqOIx2n6
   PvMMNMdf+j1LvV0GLIjnA8OIvseLr7wgkUJXTVh1K84fwMmu8jsQekEs4
   UVDlPAfp8s7I0k7k7JwkVv8LAWGI5r5fyjH6cB6YcsJAVVIzaS3AbCdAT
   a2/RF+X300vihbOuEj8UonGhbqmnnid25pxB+EwNnkw0rrUEqSdh0IIHu
   7rAAYV4RZ5cpYMhYjbM5gs9qPmRsXe48YsC/pH5Hexyz/tjKC2xI8b+r+
   xD0OrD67BUyi8JLo0ICRDccWlMDbpGucdGebOfyIuc7LMYYBdtn9QoHKs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352215120"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="352215120"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 13:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734355441"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="734355441"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Aug 2023 13:13:51 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWMtq-0000X9-1S;
	Wed, 16 Aug 2023 20:13:50 +0000
Date: Thu, 17 Aug 2023 04:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/4]
 kernel/module/gki_module.c:31:6: warning: no previous declaration for
 'gki_is_module_unprotected_symbol'
Message-ID: <202308170450.j3FPwDNI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   64302bc801132ef90fff0073f5fb586a9b77c2a2
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [4/4] ANDROID: GKI: Add module load time symbol protection
config: x86_64-randconfig-m001-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170450.j3FPwDNI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170450.j3FPwDNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170450.j3FPwDNI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:31:6: warning: no previous declaration for 'gki_is_module_unprotected_symbol' [-Wmissing-declarations]
    bool gki_is_module_unprotected_symbol(const char *name)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
