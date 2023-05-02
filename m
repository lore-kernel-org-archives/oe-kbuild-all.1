Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B883FDF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683040410; x=1714576410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4BMdgjkzsh/7IiIApAXMwCEpd+4mQnMcUytsnZty9Ms=;
  b=LMR6WCW6FbJg04DG3eikJnPvnIP90cDM558NXK8NaGzmtnrEigW11JQ+
   H42D1FRo7IAJLHBt4xl0rEv41dXrg9gOOnjvRh+mtFybAYi8G4bNpY7Lg
   3naOUXOiD5WQa+t5GZdD/RYBYpUfRkLoANAWDXQKdO//WrsdGavfF6ezh
   igilZganYsxRGpAu8yuO5GlAGOjh/guYjYJ8LEvQKz8pC0p6m/CzOvCsb
   LPL9GFg0LCJe0aIHcsEqKjAuOiTWUmXzomA4Aojf+jITLRyhGMum+8xDZ
   OUUPihLHi+IjUMAkA2+U/hYruwI0C/DAowcTfLJuJ2vCTmp9I31yzk+M+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="345902473"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="345902473"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 08:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="646568392"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="646568392"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 May 2023 08:13:28 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptrh1-00017S-2w;
	Tue, 02 May 2023 15:13:27 +0000
Date: Tue, 2 May 2023 23:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/bpf 1/1] ERROR: modpost: "bpf_base_func_proto"
 [arch/riscv/kvm/kvm.ko] undefined!
Message-ID: <202305022322.Fv4MotEe-lkp@intel.com>
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
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230502/202305022322.Fv4MotEe-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?id=06b5f491544e5508642870611f9e5a494e67c8db
        git remote add arm-perf https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
        git fetch --no-tags arm-perf kvm/bpf
        git checkout 06b5f491544e5508642870611f9e5a494e67c8db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022322.Fv4MotEe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bpf_base_func_proto" [arch/riscv/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
