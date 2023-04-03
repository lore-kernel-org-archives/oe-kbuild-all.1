Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E26FA1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Apr 2023 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680537808; x=1712073808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Yhe+han+HLekrthbGNyghjPMDf4OiGRhUCZp4aYsa0=;
  b=VaH9El9ZbzDoI6sn0rPps2RlcMzijLYZylidyS0WD7k5a/U78Rn73IvC
   OgguLXGIXA7u3CxY1/qL+PoY6NiarnFVfikUKv6hJ79DVk3t0idMwKg9C
   e5mkBoqA5zsAJdq8ply19j2SxbFy8Qxzhk9QIU380+glk692rmiNl56E+
   +HCV/9mn0tC0cevapnyByNh241kkaq0vJgw8QpKW4inFiggzpBt8odTXD
   wVT3qdzcYtYNpBmteBuAnuNs/8RTKSZvDIiSS2EhBKwtQjA+DnX1qjZOF
   hpHAEG3FIIncD8zkv9pS5mpHE1l7SroErU3TPWe8v3iptNkdYFP+7SuDo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428227970"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="428227970"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 09:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="755306628"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="755306628"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Apr 2023 09:03:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjMeR-000OUh-0a;
	Mon, 03 Apr 2023 16:03:23 +0000
Date: Tue, 4 Apr 2023 00:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13751/29323]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers
 or '...' before string constant
Message-ID: <202304032330.csYX9bCb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   f198e0a1afd4eb444e4a5885b8d101bd3a9b36c2
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [13751/29323] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: arm64-randconfig-r015-20230403 (https://download.01.org/0day-ci/archive/20230403/202304032330.csYX9bCb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash M=drivers/soc/qcom

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304032330.csYX9bCb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +697 drivers/soc/qcom/rpmh-rsc.c

   696	
 > 697	MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
