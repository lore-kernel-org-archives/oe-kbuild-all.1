Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9906C1FD1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677925012; x=1709461012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0gMwGHtph5mlVMXCZn63hAimS621zdPXy3AFHfqZc8k=;
  b=hL0O6WUD2G53/uRxW7+PI8dQSjp/dJme/esBHqGD2XUc4j7T0mab9p+/
   CFH8X9I1UliAZm6dTV0Wa6SskdUVSk1JK2hv70F8K3RAburBAuooR00aF
   Mb3UE7Wjg0otj8MjOv6N1+cIRagS+FSSP+9csZeQckADQrfoJe3QVbblC
   EPQw3HofCyZf2nVJCrArqi5fk5r1VqNBC7Nay9b7pbmgYSI0tpsxxJBGQ
   ST4/8fo43FpsBylL7st4E7atE+jQT5Y5XAnjmrrnY4f/T+/AoRAGmShH4
   3NSUOIiFZ93e/1staalhpcDZdc6vDI4Sa0wy7VNlvEQ0b1Tjs6XIR5s25
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="315645735"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="315645735"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 02:16:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="739783302"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="739783302"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Mar 2023 02:16:49 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYOwa-00024O-2u;
	Sat, 04 Mar 2023 10:16:48 +0000
Date: Sat, 4 Mar 2023 18:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: Schspa Shi <schspa@gmail.com>, tglx@linutronix.de, longman@redhat.com,
	swboyd@chromium.org, linux@roeck-us.net, wuchi.zero@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Schspa Shi <schspa@gmail.com>
Subject: Re: [PATCH v2 2/2] debugobject: add unit test for static debug object
Message-ID: <202303041802.KTXFKBzL-lkp@intel.com>
References: <20230303183147.934793-2-schspa@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303183147.934793-2-schspa@gmail.com>

Hi Schspa,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.2 next-20230303]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Schspa-Shi/debugobject-add-unit-test-for-static-debug-object/20230304-024247
patch link:    https://lore.kernel.org/r/20230303183147.934793-2-schspa%40gmail.com
patch subject: [PATCH v2 2/2] debugobject: add unit test for static debug object
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230304/202303041802.KTXFKBzL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54cf5a36c1c89cb79463e38bdbd636a016a80c66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Schspa-Shi/debugobject-add-unit-test-for-static-debug-object/20230304-024247
        git checkout 54cf5a36c1c89cb79463e38bdbd636a016a80c66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041802.KTXFKBzL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "regs_get_register" [lib/test_static_debug_object.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
WARNING: modpost: suppressed 16 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
