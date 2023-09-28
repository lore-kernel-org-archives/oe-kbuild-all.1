Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A72E64F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695886349; x=1727422349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J3X5CMCKL1P/23rm+UPIpvvk2cR1JV83hHUHkbtZJvM=;
  b=kJ7lf4zeHk2/Fto1wVlg6cHuLY2oWGctaq7YZUPvtDq82eBOOoBrUyWm
   slQukAiPB6Dh5Xh0Cy6+qNjLGwoQJuVuOs9KRSaHCEPvTPaaQuqMo4Iar
   +ngy8HFXE8yivwxF+0S3rAeAMrl9QNlXa5iC51YsnO1EQLnKXIwrPgzRZ
   zxots9HrMEv0m9TfK9XhFPEtoOmVtUWKQrHl8Evvuqfqr0ofg87FX9iMJ
   xCYBsn+0ncKfd35CPiTk6goY4urYD/7/ZWdIzKSvgrg3F1gLo51exdbpf
   x2hjVDnKAh708AiXQk1FEOnYuCPEP/Q1cYkps9Tw8lVmyDIVLQhYVjsBg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3558764"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="3558764"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 00:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="815150330"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="815150330"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2023 00:32:25 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qllVR-0001En-03;
	Thu, 28 Sep 2023 07:32:17 +0000
Date: Thu, 28 Sep 2023 15:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Avraham Stern <avraham.stern@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1126:5-8: Unneeded
 variable: "ret". Return "  0" on line 1154
Message-ID: <202309281538.TJc5nQNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   633b47cb009d09dc8f4ba9cdb3a0ca138809c7c7
commit: 057381ddac0593c6e4ca8f58732830d8542b9c4e wifi: iwlwifi: pcie: avoid a warning in case prepare card failed
date:   5 weeks ago
config: x86_64-randconfig-101-20230927 (https://download.01.org/0day-ci/archive/20230928/202309281538.TJc5nQNH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309281538.TJc5nQNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281538.TJc5nQNH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1126:5-8: Unneeded variable: "ret". Return "  0" on line 1154

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
