Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D799944D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364199; x=1709900199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X0WZY0TMtT9//AzD4K3mS0ObiNxh7eT3kTPvNZBmUDQ=;
  b=IWHXUSbqldh2NagiLxCnGoprV6QKq0Iz2LrLHYF6zgH0G/3QemuQwoyD
   FkiyMeKrgtdeVeSYOElJ+zYqxd416Sw9TaA0MiBSzM6BfGvDRaEO6QRZp
   KDzk8JueI7ABcgQqu2Yoyp5vtkawGkMQiIDoWS6KWJ1En7qqADKrcpfRm
   7fffnLHhDWuCJ+o9JFjC0vP9Hemom1CVdWVTHn5Sn6cL/dfp6P8CTLu6V
   yaIV3hnL2y2drCND/8IDmpxuxNgi9Q7jRYK6JmvCWhG7uhab6Ifh6H4y2
   QbQd4C5I+cNS3rB11oI2Hb3HwwCDAOUQkVlfrJGZ/8bWOofCEuVDUbqq4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320258698"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="320258698"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:16:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679739916"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="679739916"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 04:16:24 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paFC3-0002wB-1S;
	Thu, 09 Mar 2023 12:16:23 +0000
Date: Thu, 9 Mar 2023 20:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi A <jyothix.a@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 18852/23027]
 drivers/net/can/m_can/m_can_pci.c:190:13: warning: variable 'cgsr_reg' set
 but not used
Message-ID: <202303092047.0hUuVxOA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jyothi,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   2533aa36ba52e96057d68a4ab377a6293b91c1fc
commit: 32cb6a2f6e5cb873bfc4cf06b831d90bf44080da [18852/23027] m_can_pci: Runtime power-management changes
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303092047.0hUuVxOA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/32cb6a2f6e5cb873bfc4cf06b831d90bf44080da
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 32cb6a2f6e5cb873bfc4cf06b831d90bf44080da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/counter/ drivers/gpu/drm/bridge/imx/ drivers/gpu/drm/mcde/ drivers/media/i2c/ drivers/net/can/m_can/ drivers/pwm/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092047.0hUuVxOA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/can/m_can/m_can_pci.c: In function 'm_can_pci_runtime_suspend':
>> drivers/net/can/m_can/m_can_pci.c:190:13: warning: variable 'cgsr_reg' set but not used [-Wunused-but-set-variable]
     190 |         u32 cgsr_reg;
         |             ^~~~~~~~


vim +/cgsr_reg +190 drivers/net/can/m_can/m_can_pci.c

   183	
   184	static int __maybe_unused m_can_pci_runtime_suspend(struct device *dev)
   185	{
   186		struct pci_dev *pdev = container_of(dev, struct pci_dev, dev);
   187		struct net_device *ndev = pci_get_drvdata(pdev);
   188		struct m_can_classdev *mcan_class = netdev_priv(ndev);
   189		u32 d0i3c_reg;
 > 190		u32 cgsr_reg;
   191		unsigned long j0, j1, delay;
   192	
   193		delay = msecs_to_jiffies(100);
   194		j0 = jiffies;
   195		j1 = j0 + delay;
   196	
   197		cgsr_reg = iomap_read_reg(mcan_class, M_CAN_CGSR);
   198		iomap_write_reg(mcan_class, M_CAN_CGSR, M_CAN_CGSR_CG);
   199	
   200		d0i3c_reg = iomap_read_reg(mcan_class, M_CAN_D0I3C);
   201	
   202		if (d0i3c_reg & M_CAN_D0I3_CIP) {
   203			dev_info(dev, "%s d0i3c CIP detected", __func__);
   204		} else {
   205			iomap_write_reg(mcan_class, M_CAN_D0I3C, M_CAN_D0I3_EN);
   206			d0i3c_reg = iomap_read_reg(mcan_class, M_CAN_D0I3C);
   207		}
   208	
   209		while (time_before(jiffies, j1)) {
   210			d0i3c_reg = iomap_read_reg(mcan_class, M_CAN_D0I3C);
   211			if (!(d0i3c_reg & M_CAN_D0I3_CIP))
   212				break;
   213		}
   214	
   215		if (d0i3c_reg & M_CAN_D0I3_CIP)
   216			dev_info(dev, "%s d0i3c timeout waiting CIP to be cleared", __func__);
   217	
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
