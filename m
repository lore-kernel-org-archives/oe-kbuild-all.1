Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE020F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jan 2023 12:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674303260; x=1705839260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SV7SY8odkBmMbt7pcW1mYRmCFKBvlf5ldzdDv2gGURI=;
  b=FeeyvN6lA1aLlATj0yLcqnpRQBaQI6sRXF0ogmw+wOusAR9uD6zyzGSg
   /s7y6lZDijJA5a1kH2xt+uaVSaz6getOH7SqtUqpAEoPtCxaxvVo0DUgE
   Y1z+Zf8RjAxqJ1VjMI0cUqnXAO/IaNnBgBIR0C4mtRuEAaKpXk2f4XhH5
   b/H88eQrzw9UFqfxf+G73XRriSiGMvPjX7/m/4+tsAYQOnzDtvBlEizuc
   q2n0BiUJQDah6k1XEkIYOwLXr/7V0c3ns2Llko5CBYWC2wkYdx32wXeln
   oKslA6oz11EOePiUzJTen1r0svr1Va/4KsqoEuxnn1SUao/uvktk5HFDl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323468485"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="323468485"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 04:14:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="638459231"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="638459231"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2023 04:14:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJClF-00042E-2S;
	Sat, 21 Jan 2023 12:14:17 +0000
Date: Sat, 21 Jan 2023 20:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2 2/2]
 drivers/pci/hotplug/pciehp_core.c:167:32: warning: initialization of 'struct
 pci_dev *' from 'int' makes pointer from integer without a cast
Message-ID: <202301212043.CowpMXQU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pciehp_deadlock_v2
head:   f333e7ec9e2c377c76238169a1d437e929937223
commit: f333e7ec9e2c377c76238169a1d437e929937223 [2/2] PCI: pciehp: Fix AB-BA deadlock between reset_lock and device_lock
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301212043.CowpMXQU-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/f333e7ec9e2c377c76238169a1d437e929937223
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k pciehp_deadlock_v2
        git checkout f333e7ec9e2c377c76238169a1d437e929937223
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pci/hotplug/pciehp_core.c: In function 'pciehp_check_presence':
   drivers/pci/hotplug/pciehp_core.c:167:32: error: implicit declaration of function 'ctrl_dev'; did you mean 'ctrl_dbg'? [-Werror=implicit-function-declaration]
     167 |         struct pci_dev *pdev = ctrl_dev(ctrl);
         |                                ^~~~~~~~
         |                                ctrl_dbg
>> drivers/pci/hotplug/pciehp_core.c:167:32: warning: initialization of 'struct pci_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +167 drivers/pci/hotplug/pciehp_core.c

   153	
   154	/**
   155	 * pciehp_check_presence() - synthesize event if presence has changed
   156	 * @ctrl: controller to check
   157	 *
   158	 * On probe and resume, an explicit presence check is necessary to bring up an
   159	 * occupied slot or bring down an unoccupied slot.  This can't be triggered by
   160	 * events in the Slot Status register, they may be stale and are therefore
   161	 * cleared.  Secondly, sending an interrupt for "events that occur while
   162	 * interrupt generation is disabled [when] interrupt generation is subsequently
   163	 * enabled" is optional per PCIe r4.0, sec 6.7.3.4.
   164	 */
   165	static void pciehp_check_presence(struct controller *ctrl)
   166	{
 > 167		struct pci_dev *pdev = ctrl_dev(ctrl);
   168		int occupied;
   169	
   170		down_read(&pdev->reset_lock);
   171		mutex_lock(&ctrl->state_lock);
   172	
   173		occupied = pciehp_card_present_or_link_active(ctrl);
   174		if ((occupied > 0 && (ctrl->state == OFF_STATE ||
   175				  ctrl->state == BLINKINGON_STATE)) ||
   176		    (!occupied && (ctrl->state == ON_STATE ||
   177				   ctrl->state == BLINKINGOFF_STATE)))
   178			pciehp_request(ctrl, PCI_EXP_SLTSTA_PDC);
   179	
   180		mutex_unlock(&ctrl->state_lock);
   181		up_read(&pdev->reset_lock);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
