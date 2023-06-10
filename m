Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ACB1FAE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686392372; x=1717928372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHgrM62E7b3380p3KPaUf+mG3fcBhQRyvHEPjlGMUHU=;
  b=dFmqBu8wuVVHOuQ53NEK7NlpEUeEIUa2Tlm9jDGLGmzxiGC/sYYxlIDd
   bgwxK4Ih6UgfpHng3Rcq7IkmXFFRx0fgKUY74f/GNoasZX/tvCteUEIj2
   vrv1y2/9i0RgF3vtfGjtv2IwAS4fh5ANIAg1Dz7H3OFnzQuMQoa+toHgc
   0Vv5bdm9zgONW6inoCea64Ks4PfKGSIBesvHlApM2OaLvR6WBSulLPzUE
   mblPjvcJeAxrKyu7lwp/Tgh6emMjgcSfRjcFoFLXULk+pnkEmN1z2+kK5
   bbq/MYJrl3DnHhj+6tKwf5u0N83vEwQAoaf9d677IwB7Vzsg0Jk+IkZzl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="444119711"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="444119711"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 03:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="661034989"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="661034989"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jun 2023 03:19:29 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7vgu-000A0I-3D;
	Sat, 10 Jun 2023 10:19:28 +0000
Date: Sat, 10 Jun 2023 18:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] ERROR: modpost:
 "dvb_ca_en50221_release" [drivers/media/pci/mantis/mantis_core.ko]
 undefined!
Message-ID: <202306101804.BEO2AMIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lecopzer,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3c816bcc11de4a5e8a40fb4ba3a94ad0da3ed5c5
commit: a46280457e55aa3405f8327459f27cce648c921e [2/2] FROMLIST: media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
config: x86_64-randconfig-a001-20230610 (https://download.01.org/0day-ci/archive/20230610/202306101804.BEO2AMIV-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15
        git checkout a46280457e55aa3405f8327459f27cce648c921e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101804.BEO2AMIV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: module dax uses symbol inode_init_once from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module dax uses symbol unlock_new_inode from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
ERROR: modpost: module dax uses symbol iget5_locked from namespace VFS_internal_I_am_really_a_filesystem_and_am_NOT_a_driver, but does not import it.
>> ERROR: modpost: "dvb_ca_en50221_release" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_ca_en50221_camready_irq" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_ca_en50221_init" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_ca_en50221_camchange_irq" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_unregister_adapter" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_dmx_release" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_dmxdev_release" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_frontend_detach" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_unregister_frontend" [drivers/media/pci/mantis/mantis_core.ko] undefined!
>> ERROR: modpost: "dvb_register_frontend" [drivers/media/pci/mantis/mantis_core.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
