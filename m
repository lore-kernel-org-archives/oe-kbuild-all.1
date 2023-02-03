Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C0A1C29
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675418241; x=1706954241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wOouuMn7NbYsJwyIHhuEObA0Lb1l3jH6xggAUXU+8fM=;
  b=B22I7bCNUrWol1d9z5EcQLfHG0BpdMso8liSMAhqf2DAMrDePR/docQA
   SUCR6FsY2GWOzrs9Tgl9P4GdcyWkMlafPC6ieL7E7acbse3CoI5FoYFW4
   W4JpdM2CxbjvPTtV1nNi4PgX7ttxHhG8lV2609YV4Qo2BrTCsYxnvJ6xG
   2eedLBahwAX/f7cRIijvWDyGf0zXlE/7wRl2fDK02M2v+xV0A4aZtKaxP
   4imrby+dwYApHa897wU9isyRApBP5hdUm2KQ2chK1pKHAmS3PtVtnjd+a
   JjiR3hoP31gRZ9fqM3ZFgRweeCwJ0JjugYyeJVafEz4zHYGpHQypebt4N
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328724598"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="328724598"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 01:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="667601787"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="667601787"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2023 01:56:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNsoN-0000NF-1z;
	Fri, 03 Feb 2023 09:56:51 +0000
Date: Fri, 3 Feb 2023 17:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi A <jyothix.a@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, renjiaox <jiaojiaox.ren@intel.com>
Subject: [intel-lts:5.15/linux 18852/22285]
 drivers/net/can/m_can/m_can_pci.c:190:13: warning: variable 'cgsr_reg' set
 but not used
Message-ID: <202302031719.2oXzgpil-lkp@intel.com>
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
head:   3fcbe6a0b3dc32ae64e534484770059e644250bc
commit: 32cb6a2f6e5cb873bfc4cf06b831d90bf44080da [18852/22285] m_can_pci: Runtime power-management changes
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230203/202302031719.2oXzgpil-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/drm/bridge/imx/ drivers/gpu/drm/mcde/ drivers/net/can/m_can/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
