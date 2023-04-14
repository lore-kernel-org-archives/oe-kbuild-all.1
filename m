Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2A630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 03:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681444456; x=1712980456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZeZPZ5HfT8+pDpsk9NduX5Ua7YwUJ3v+qpOLARHEAM=;
  b=YGuVonn90DT02x7l+uMXFRwdSdnSoOm7R/TobrIPnLV0/W8rcH1Ejpp/
   KVBd25M+x6YQsyis48NPKoeyyZQuUO04r39Uusdk9YhCAjOuM0/HMpcfw
   cemwY0wc2EJuzYhVyABssozXVmQ58jERGGN/jAZ0SLf2mmV3om6maf2w3
   /NjAzDJQxARc09JK/lkIxCjfTeVFdTmWXW7bWwhY5T8H0B86N9gojzPEo
   YcdKLjFIIbJUJoMe2gBWbsasMY5CvpebGfclKaXLNIm8SL2uIeGM4A5Fz
   5JSLotEuC9/x8e6IESIOBDF4DeItkKbOvo1xHR9eNbHEZgr03JcgHl/7V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="347089961"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="347089961"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 20:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="667025145"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="667025145"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Apr 2023 20:54:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnAVp-000ZCj-1A;
	Fri, 14 Apr 2023 03:54:13 +0000
Date: Fri, 14 Apr 2023 11:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 44/50]
 arch/riscv/kvm/vcpu_sbi_covg.c:221:15: warning: no previous prototype for
 'kvm_sbi_ext_covg_probe'
Message-ID: <202304141147.SvJGbcYw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: 74033a8a24fa8b1096ae1b9afb982da1d53bdcba [44/50] RISC-V: KVM: Add host side support to handle COVG SBI calls.
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230414/202304141147.SvJGbcYw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/74033a8a24fa8b1096ae1b9afb982da1d53bdcba
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout 74033a8a24fa8b1096ae1b9afb982da1d53bdcba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141147.SvJGbcYw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_sbi_covg.c:221:15: warning: no previous prototype for 'kvm_sbi_ext_covg_probe' [-Wmissing-prototypes]
     221 | unsigned long kvm_sbi_ext_covg_probe(struct kvm_vcpu *vcpu)
         |               ^~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_sbi_ext_covg_probe +221 arch/riscv/kvm/vcpu_sbi_covg.c

   220	
 > 221	unsigned long kvm_sbi_ext_covg_probe(struct kvm_vcpu *vcpu)
   222	{
   223		/* KVM COVG SBI handler is only meant for handling calls from TSM */
   224		return 0;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
