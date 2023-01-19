Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CFE7485
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674142860; x=1705678860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQrvrM/VyK9ozy/qmKAx4/42CUJLA/AtokauIIlKK1Y=;
  b=IB7OAXMd4eRvFj6GG5nvzy8K0SNnppLPiciGHUttqscBRuVXmzG8HAEy
   RFk8eI+bNIPzpA6m0RTwvLxAxB8eGng559jqvnGhsgZydii47N5URoo3g
   +50QGCZsmgm3bzsjB1uqu4e64fJyYfy8PnCOfVdVgl+HI9bsKJwSepHZ/
   l2jXNWrGVjaxsWi6OX41FWTqebCUIl+zTwturjf5H4Inal/iebig8H6K+
   3OmfLYn/vzECNbhEkaqwsDBRHk4T7GMDBwPjrs9kiPbirvWvqJiNJA6Eb
   gWZnWY2KTLd1x2ZjS1ttosrg8cpoDXJ2iAMQ/IKUC687ukF8iIKzm/Jax
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="308892025"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="308892025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 07:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="834011423"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="834011423"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Jan 2023 07:40:57 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIX28-0001a6-2T;
	Thu, 19 Jan 2023 15:40:56 +0000
Date: Thu, 19 Jan 2023 23:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jiri Kosina <jkosina@suse.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 210/6276] ERROR: modpost:
 "input_ff_create_memless" [drivers/hid/hid-mf.ko] undefined!
Message-ID: <202301192344.1r9Ogbd2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa5c49149a823599764e6953229b028e4bf6e9cc
commit: 25621bcc89762fe1329ae9c9dab75bc70ef1aee0 [210/6276] HID: Kconfig: split HID support and hid-core compilation
config: loongarch-randconfig-r005-20230119 (https://download.01.org/0day-ci/archive/20230119/202301192344.1r9Ogbd2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=25621bcc89762fe1329ae9c9dab75bc70ef1aee0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 25621bcc89762fe1329ae9c9dab75bc70ef1aee0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD aa5c49149a823599764e6953229b028e4bf6e9cc builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "input_ff_create_memless" [drivers/hid/hid-mf.ko] undefined!
>> ERROR: modpost: "input_ff_create_memless" [drivers/hid/hid-gaff.ko] undefined!
>> ERROR: modpost: "input_ff_create_memless" [drivers/hid/hid-wiimote.ko] undefined!
>> ERROR: modpost: "rmi_unregister_transport_device" [drivers/input/rmi4/rmi_i2c.ko] undefined!
>> ERROR: modpost: "rmi_dbg" [drivers/input/rmi4/rmi_i2c.ko] undefined!
>> ERROR: modpost: "rmi_register_transport_device" [drivers/input/rmi4/rmi_i2c.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RMI4_CORE
   Depends on [m]: INPUT [=m]
   Selected by [y]:
   - HID_RMI [=y] && HID_SUPPORT [=y] && HID [=y]
   WARNING: unmet direct dependencies detected for INPUT_VIVALDIFMAP
   Depends on [m]: INPUT [=m]
   Selected by [y]:
   - HID_VIVALDI [=y] && HID_SUPPORT [=y] && HID [=y]
   WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
   Depends on [m]: INPUT [=m]
   Selected by [y]:
   - HID_EMS_FF [=y] && HID_SUPPORT [=y] && HID [=y]
   - HID_MICROSOFT [=y] && HID_SUPPORT [=y] && HID [=y]
   Selected by [m]:
   - HID_MAYFLASH [=m] && HID_SUPPORT [=y] && HID [=y]
   - GREENASIA_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_GREENASIA [=m]
   - HID_WIIMOTE [=m] && HID_SUPPORT [=y] && HID [=y] && LEDS_CLASS [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
