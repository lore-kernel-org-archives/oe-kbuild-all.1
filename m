Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B706D7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 00:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692749155; x=1724285155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tF1W8D+jD7sudCytVh/TT3jWSV3/OYtf05cHxPfHLgw=;
  b=GFVB3XOltzQNA68wPR7irCojPwDjnJoI9C8Au+neNgBrfw6xfKYC0hWp
   5D3J1+4rBAQs6MctUz3kKEqsrfbVJmnJj+wg4FS9XkrtgVfvyrDd7UdLR
   V0CE+6gh9TG8Ff2ueyjlU7nViKvlSGKYRI55WsEE+F3SeWGQM7AphDez5
   2b9vaanopFgpGrOAJYEFcaKZ8bzVAnC5EDqtawhB7NeDLBSnfItNR+rjP
   RYwRfCwDeEWOkaIS1Ybcr3QqdasccDk3vf59oteAdwIo6ckNxVzx5pKdC
   zOSU5+wbnwi71af3KTh5yrdZ1B60Obk9keffH9MhCmMLvd0MEPpMMw5L6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372910965"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="372910965"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 17:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983070484"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="983070484"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 17:05:51 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYbNe-0000di-2D;
	Wed, 23 Aug 2023 00:05:50 +0000
Date: Wed, 23 Aug 2023 08:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 4666/27207] ERROR:
 "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!
Message-ID: <202308230751.BPk8icSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   d62f1fc1623efbeb110e393379097ee39766655d
commit: 3ebeb5687243e405fbf34032249cada998ee4779 [4666/27207] FROMGIT: power: supply: Allow charger manager can be built as a module
config: x86_64-randconfig-103-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230751.BPk8icSA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230751.BPk8icSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230751.BPk8icSA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "alarmtimer_get_rtcdev" [drivers/power/supply/charger-manager.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
