Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B7533EA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683040410; x=1714576410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NmJOOKTqBgaFQZZMWG0r05+9FwTyRJhN3R4OKZ3+8F0=;
  b=fD8uQdbPCSEuTKDhF5ixnnUTtGHGF9Dj605XzwfOD6DKQ0IKCJacOp3g
   x0c+W65OpA80N4y3Of/ANqEuSKAICURG7FGFMiLrkkaCuLAdPWA+x1dM9
   HfbiQhh+zO5mWiJo6wY+yUFKnwggEkTaky0tPJFFANOJHvo5zHeVsuS4l
   np94WGCI4Gph3/oFU1MnjRXBrKggGbqLF9hECCr7JV0pON1hlzlD0mvX3
   59Agii1+4nf0xY24ww7S0EQ3eLmsk7BQJDuz6fF9jdbrG0EtrqMX26bBE
   FG2VwyZ6w1YYWPMXlr81Nk4Q+dB6c4NTP0X+iexuF3CJGa7qL3g5oc5Oi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="411569534"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="411569534"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 08:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="870591771"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="870591771"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 May 2023 08:13:28 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptrh1-00017Q-2s;
	Tue, 02 May 2023 15:13:27 +0000
Date: Tue, 2 May 2023 23:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 1/1] ERROR: modpost: "bpf_base_func_proto"
 [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202305022307.ohmJrcth-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/bpf
head:   06b5f491544e5508642870611f9e5a494e67c8db
commit: 06b5f491544e5508642870611f9e5a494e67c8db [1/1] KVM: Add support for new KVM_DEV_TYPE_BPF device
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230502/202305022307.ohmJrcth-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=06b5f491544e5508642870611f9e5a494e67c8db
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout 06b5f491544e5508642870611f9e5a494e67c8db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022307.ohmJrcth-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bpf_base_func_proto" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
