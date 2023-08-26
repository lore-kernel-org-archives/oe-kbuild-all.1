Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4337D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 05:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693026913; x=1724562913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NffoDFefEwj1srX3ynHzuqKRXVJbosJbj49SQnNJ838=;
  b=fsdnqIeYlMprXTus67YHtFDGM6SUJ+mwFChrjQ871dT37odZ0hXqu6vF
   ZBpBxV8fHQoJpXazZpHectysj77AjuPRrXrc3Cugj6CSuEInYwVsJAyWs
   JswTeC+jyhh0sDVqkStQGzDl4n3JjyJwOE8UcMPtty+2PtKxQB0u7rBdt
   wumYV7YxuNoE6siFw5/vhbtOOQ1MJm+JM/HnvUUVaTEnoSvb5g5vH5OPd
   eZxuVegTDgTcjDUiCX1nLo5i4pc78aA1QakOnZQjbQJFVB8PgVmXzXJOU
   QXFA1wBXWMxq9H0a8uhf543Uk5h9OWWPRnguqAiWBPAJpdwLsPPAk69S7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="373723043"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="373723043"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 22:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="714558032"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="714558032"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Aug 2023 22:15:11 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZlde-0004NH-18;
	Sat, 26 Aug 2023 05:15:10 +0000
Date: Sat, 26 Aug 2023 13:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] aarch64-linux-ld:
 hid-core.c:undefined reference to `uhid_hid_driver'
Message-ID: <202308261311.87MA1vP0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   e2203f1173996de0c045cbbd05bc93da6716a986
commit: 6e1d82fcd778ad4133eed7a0a7c4456e68a4110e [1/1] ANDROID: HID; Over-ride default maximum buffer size when using UHID
config: arm64-randconfig-r004-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261311.87MA1vP0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261311.87MA1vP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261311.87MA1vP0-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/hid/hid-core.o: in function `hid_report_raw_event':
   hid-core.c:(.text+0x23c0): undefined reference to `uhid_hid_driver'
   hid-core.c:(.text+0x23c0): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `uhid_hid_driver'
>> aarch64-linux-ld: hid-core.c:(.text+0x23c4): undefined reference to `uhid_hid_driver'
   aarch64-linux-ld: drivers/hid/hid-core.o: in function `hid_add_field':
   hid-core.c:(.text+0x2a40): undefined reference to `uhid_hid_driver'
   hid-core.c:(.text+0x2a40): relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against undefined symbol `uhid_hid_driver'
   aarch64-linux-ld: hid-core.c:(.text+0x2a48): undefined reference to `uhid_hid_driver'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
