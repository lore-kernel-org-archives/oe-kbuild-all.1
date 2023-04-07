Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7902AFDE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680901749; x=1712437749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1T1DQJpBhSSTBUqDzN9lE8R+GixKlaeoeJHWaLPxw4=;
  b=LNJn2IvRsYFaWdeJQDpGXkfGv48UPUEimFFXl4aQXy7HDHAYvMhyGaBy
   A/hZrUgxECGLqNqU20X+ektS+sWmAV6UrtmmiPu3+9Tga8EbOLoN72nTw
   jdNt84uaQ+LltLrWjlVXfghu84Vm00/m8E8z2kxn7sxRIKuScW4e7l0rw
   ucwO3d5TQQu6R3Bkna5FEiNCChkbExXWndG99/ChRPgJf282MGMLklPD3
   2dYLrFsDUJFjzEmJvFsxinIDByz0P8MZd/oLp42O92jbppNehCRghRcDX
   HR8mej833nz8CfFNpeIKJZv3rpqyFNxf282N1LqVyPW688zW1ZeExzIc7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405890959"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="405890959"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 14:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="1017369898"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="1017369898"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2023 14:09:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pktKT-000StD-1n;
	Fri, 07 Apr 2023 21:09:05 +0000
Date: Sat, 8 Apr 2023 05:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 15345/22735]
 drivers/usb/typec/tps6598x.c:441:6: warning: variable 'ret' set but not used
Message-ID: <202304080536.V4VdGKUf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aswath,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   e6bb059e69c106b73bfe2a10e729dbe5a5820916
commit: f29b24e22ea9fd8b14b3c02f0bb6d40791fcd93b [15345/22735] usb: typec: tps6598x: Add support for polling interrupts status when interrupt line is not connected
config: x86_64-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304080536.V4VdGKUf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout f29b24e22ea9fd8b14b3c02f0bb6d40791fcd93b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/typec/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080536.V4VdGKUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tps6598x.c:441:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   drivers/usb/typec/tps6598x.c:160:19: warning: unused function 'tps6598x_write16' [-Wunused-function]
   static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
                     ^
   drivers/usb/typec/tps6598x.c:165:19: warning: unused function 'tps6598x_write32' [-Wunused-function]
   static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
                     ^
   3 warnings generated.


vim +/ret +441 drivers/usb/typec/tps6598x.c

   437	
   438	static irqreturn_t tps6598x_interrupt(int irq, void *data)
   439	{
   440		struct tps6598x *tps = data;
 > 441		int ret;
   442	
   443		ret = tps6598x_handle_interrupt_status(tps);
   444		return IRQ_HANDLED;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
