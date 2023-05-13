Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B21868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683972673; x=1715508673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRzsCyQYQaEjIXVtYh52dSY+xbfaaIbbvtZS3sBR0S8=;
  b=lhGfCYcms3zTbo8fl9hGFCzQqfwL2wSEBglFl6CMrjpkkhLZ/otBszlL
   z7xSqRZVL6wRLIqy/RJXwEcyjOpcC+fPYDTWWEz2mnaG2oIPJ0kVlxcmg
   ZcIOAFW5oYYWLZynAkx73KWmRDeKMIsqusaU4XlxdUC5H3hiac7R+L072
   F8OcZCTRZL5fHRvbzpfHshOFuZG88i3oaeGvhAMVadoK8JETmNQcdybNe
   MucQcwrAXWfTUyipCrpOqS/h58+tSneHdZQgHNe7oe26ee9jdj8Zd77ET
   qwAnhFoiqBxd56jI/okOj/dzIoFHw5SngwZyWCLDSi2gCHo11ia7CEArp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340278995"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="340278995"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 03:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="733329071"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="733329071"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 May 2023 03:11:09 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxmDU-0005Ry-1a;
	Sat, 13 May 2023 10:11:08 +0000
Date: Sat, 13 May 2023 18:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [kvalo-ath:pending 50/51] mac.c:(.text+0xeb3c): multiple definition
 of `ath11k_tm_wmi_event'; riscv32-linux-ld: DWARF error: could not find
 abbrev number 96
Message-ID: <202305131811.xFAUtLOz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   229ea354bdd24bf3c33c9447674fab8d609e24a2
commit: f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c [50/51] wifi: ath11k: factory test mode support
config: riscv-randconfig-c032-20230510 (https://download.01.org/0day-ci/archive/20230513/202305131811.xFAUtLOz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout f3d1f7ae115e12108ba7d7fa0ea6374b9e28869c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131811.xFAUtLOz-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: riscv32-linux-ld: DWARF error: could not find abbrev number 178438570
   drivers/net/wireless/ath/ath11k/mac.o: in function `ath11k_tm_wmi_event':
>> mac.c:(.text+0xeb3c): multiple definition of `ath11k_tm_wmi_event'; riscv32-linux-ld: DWARF error: could not find abbrev number 96
   drivers/net/wireless/ath/ath11k/wmi.o:wmi.c:(.text+0x821c): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
