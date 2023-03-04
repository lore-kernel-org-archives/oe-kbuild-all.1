Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371623AD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 12:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677933657; x=1709469657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kmZXGR6dDY2P99x4SRNqhX7/NRPQA0BNcyHo/cc4iHo=;
  b=KoOZdtkrzFT1e7t+OZfmMupu/fw8/FVFs927BtBPf/dFm4mGwgL+3uKr
   KgiWAD39ONFZ60BNdoJXMSLvHAU5D/CAcPcV4o/gpXQCj14a+5q9k1caG
   RGkCAMEMJ9pKTCViML93Iuxyk3VexozMnQ9OQQMeRCTPWOss6d2v9DACc
   EOZPfDb9R5XxckX8rxI+dEjpiM+70YZktQEDlDScRX9USZoJg8/5H15zS
   nCwGBJKWoIhPcG8/RYtgQhuslyb1MP+YqHADvIq0/nnFXVa6Y7cn1952b
   1TRMwxzRnxRrLGP/1d66OnzRCf/FzRJ0X53jxsQyo6MQuEGsSLZrY6CHP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400074898"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400074898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 04:40:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="675655467"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="675655467"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Mar 2023 04:40:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYRC0-0002A0-35;
	Sat, 04 Mar 2023 12:40:52 +0000
Date: Sat, 4 Mar 2023 20:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Pronin <apronin@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Aaron Durbin <adurbin@chromium.org>,
	Duncan Laurie <dlaurie@google.com>
Subject: [jsarha:topic/cros-sof-v4.19 772/6555] ERROR: "cr50_resume"
 [drivers/char/tpm/cr50_spi.ko] undefined!
Message-ID: <202303042034.mVIa8jzM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 722461fef031402a909333db43a4eb1ac7d100ca [772/6555] CHROMIUM: tpm: control deep-sleep for cr50
config: mips-randconfig-s033-20230302 (https://download.01.org/0day-ci/archive/20230304/202303042034.mVIa8jzM-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/722461fef031402a909333db43a4eb1ac7d100ca
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 722461fef031402a909333db43a4eb1ac7d100ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303042034.mVIa8jzM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "cr50_resume" [drivers/char/tpm/cr50_spi.ko] undefined!
>> ERROR: "cr50_suspend" [drivers/char/tpm/cr50_spi.ko] undefined!
   ERROR: "cr50_control_deep_sleep" [drivers/char/tpm/cr50_spi.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SSB_EMBEDDED
   Depends on [n]: SSB [=y] && SSB_DRIVER_MIPS [=y] && SSB_PCICORE_HOSTMODE [=n]
   Selected by [y]:
   - BCM47XX_SSB [=y] && BCM47XX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
