Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC417CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 04:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674101083; x=1705637083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKjvgId7Q4gwwFO+AZFkTsWxfvpjuHbj8XLbhdRM3N4=;
  b=C6SvaO/Qf6wKwzXZlraJ6Jn/Ehvd+NujhNDBtxTZg/w5IORA/XoOpDQV
   z4Rw4VGuvkO/NkDFciZ3q4U/TIDlSeKM7LWIS4yKktVf40ajr5tIw4BCQ
   alZKVABRFZ4cDnMSvo/g74SQ9hxeMcIPVRSE8RAr97TJdJIwb/1hV1IGL
   yb87/NTepQ3isswku8ZceBRUvtkNs0kAZ4Biz7Roc62t4/lMVoGcMwpu5
   NZtNDwzvTRFLcWCz/fHVRvEAeOjaqALqaEKyJrXZj0CLIgiOSbsE8GHXk
   rsCFsyaY1rr1c5BIL+dKrDpPGTajAMuG2Nc3fdtprkahVEIryHQ8U/xYT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411428267"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411428267"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 20:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768033958"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="768033958"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 20:04:31 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIMAA-000146-26;
	Thu, 19 Jan 2023 04:04:30 +0000
Date: Thu, 19 Jan 2023 12:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2 1/1] drivers/pci/hotplug/../pci.h:356:9:
 sparse: sparse: cast from restricted pci_channel_state_t
Message-ID: <202301191241.2aXfyHp7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pciehp_deadlock_v2
head:   8a4896509c9d687898b0a9606a486d1b13b610ea
commit: 8a4896509c9d687898b0a9606a486d1b13b610ea [1/1] PCI: hotplug: Allow marking devices as disconnected during bind/unbind
config: alpha-randconfig-s041-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191241.2aXfyHp7-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/l1k/linux/commit/8a4896509c9d687898b0a9606a486d1b13b610ea
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k pciehp_deadlock_v2
        git checkout 8a4896509c9d687898b0a9606a486d1b13b610ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/pci/hotplug/pciehp_pci.c: note: in included file:
>> drivers/pci/hotplug/../pci.h:356:9: sparse: sparse: cast from restricted pci_channel_state_t
>> drivers/pci/hotplug/../pci.h:356:9: sparse: sparse: cast to restricted pci_channel_state_t

vim +356 drivers/pci/hotplug/../pci.h

   353	
   354	static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
   355	{
 > 356		xchg(&dev->error_state, pci_channel_io_perm_failure);
   357	
   358		return 0;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
