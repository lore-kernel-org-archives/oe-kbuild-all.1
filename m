Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3234816
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 02:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675304289; x=1706840289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nu70Q+zLfqE2sJuctJoY+qL12/n7slc1CZlV2VcZrrg=;
  b=XfTPaZDLksxDnWnjxOYe55AE/pX+Vwn6C+NdlzYIMJ5WjiP5CChgbTBz
   vSGIUrtXkswKYf/Sz9YRYvBxQvYhOgecSKOVFqFu1Q6xdEBvMQext6KaK
   Rb7LJaLTlNqXx8Um8azkZCQW9Ktw6LpfFFWN6EnAxxpOPXopMChM94yCd
   lT5R5fVKBmbVGBShf2PCN01vR7S+RND9bb0WPry+BKI+7/L6/NCXLmvWH
   YEnAT7bDdl5AakcP1NWCAYFLYf8lx2YpMq3O8wxEW8J2YT8RKxewt6JAv
   c9gzmQlX+xJ167X3OY4G6MZ0ylHtNPmUa7EWFQXkgLs52zADftQp/mOyN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326031073"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="326031073"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993901938"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="993901938"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 18:18:08 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNPAo-000622-2U;
	Thu, 02 Feb 2023 02:18:02 +0000
Date: Thu, 2 Feb 2023 10:17:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13751/28743]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers
 or '...' before string constant
Message-ID: <202302021005.3KSZUU2f-lkp@intel.com>
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
head:   7b8eb82135b171c1f11d8b0ea6d2cc691021840d
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [13751/28743] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: arm-randconfig-r046-20230129 (https://download.01.org/0day-ci/archive/20230202/202302021005.3KSZUU2f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash M=drivers/soc/qcom

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
