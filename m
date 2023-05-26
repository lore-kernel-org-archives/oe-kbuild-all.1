Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874817C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 01:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685064401; x=1716600401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yw+uLg9ngwYHTDWh5cjVFQcwtMCGpCBGym+nqm07YNs=;
  b=EmsxUHknnjUD9S4MIFmd0QmRoGNiv84jeSNhyGJzRj17o8yvkGgTCbvz
   C+i5lNvCigtFQpOlLW0vs4EUOBJ9a+lK2yUKuUKtth2pRGyOeiRjbNlds
   r9d3Bd+llQefvTHKtjQnRsxwLwZikBipCZGxXiLBC4BxUYnMswXk0XsxW
   EknPIo9MR6YPKATED8uBw9yaDY1vc/foQdBWm2fFa+EuUGxwbGK61pcLX
   dBsODrm7qyls1rWhQKqQIWuE0FBhvsUMGcZ73QqPa6A8sL8Biy0TV0sCQ
   IpeD9c/grEML88X9S9vzV9tvvvmITmIm+aKSo5YAENMuRw5f7dHmDqZ7J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="382326016"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; 
   d="scan'208";a="382326016"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 18:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="770166833"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; 
   d="scan'208";a="770166833"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 May 2023 18:26:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2ME3-000HX3-2N;
	Fri, 26 May 2023 01:26:39 +0000
Date: Fri, 26 May 2023 09:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13751/29509]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers
 or '...' before string constant
Message-ID: <202305260913.D246hoNm-lkp@intel.com>
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
head:   fee4b79c4cbab8a2322b92474b85f4bcbd940505
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [13751/29509] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: arm-randconfig-r046-20230524 (https://download.01.org/0day-ci/archive/20230526/202305260913.D246hoNm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash M=drivers/soc/qcom

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305260913.D246hoNm-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
