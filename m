Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636716AB4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686137363; x=1717673363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f0GPR6xqhtga8SKgHxweP6XqLfx2zmNvyIWeyBwk2fc=;
  b=PYcReyGMYibhu3HURN1RiPBxTE0lolZIaTOY/x8jdqD3jf3ug5cA4yon
   LAS6g13L5zGeVc0iRa19d2JpHnNO01MEoNw0X+F4GsRqyjcflUd98YMji
   X7XWgMCaB4YHq4o3zFB7j3LCCjZOdVb/NVs6KxxgeuEQHLrkKQT65D3Sf
   Sq8K6LxJuRzuVJNF6oaANMykpYjnE/yhNBG46lvhVZOSCKq6kOokrnIf6
   mZZ7a2F4Nqt+ovwcrynL+HgCFxKMs3uE3J9/vVcsOsBtdo0Any0qyoLpF
   wH4irX0EoXdwmzQKbOcH2hsc4A6QjrAHWEgTTyZtq4YUD2dmeb7CVnSP4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422802850"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="422802850"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 04:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883733128"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="883733128"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jun 2023 04:27:58 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6rKY-0006Vd-11;
	Wed, 07 Jun 2023 11:27:58 +0000
Date: Wed, 7 Jun 2023 19:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 2/3] ERROR: modpost: "bpf_base_func_proto"
 [arch/riscv/kvm/kvm.ko] undefined!
Message-ID: <202306071938.yVCAVTFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   044975299633da153eec3842998426f5f93cda92
commit: bb22c4e9bcd0289f0ec15ddbf04e8f1e4289fc09 [2/3] KVM: Add support for new KVM_DEV_TYPE_BPF device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230607/202306071938.yVCAVTFl-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=bb22c4e9bcd0289f0ec15ddbf04e8f1e4289fc09
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout bb22c4e9bcd0289f0ec15ddbf04e8f1e4289fc09
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071938.yVCAVTFl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bpf_base_func_proto" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
