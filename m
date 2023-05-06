Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A306C10E6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 01:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683335314; x=1714871314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bx4qIGBh4qIZD2RCSTGeGuMNJ77ygSQM8k3mDT8w7T8=;
  b=VFOWH6R72OUfsLgDySPCOvYwiWVDCVh3fTpE1v1LW+sip5T9JtkOvMhF
   CLVadDYbLjHahKi38vr0DCahCMdV4DapgLbxIuLoGkaYqzPXKPm92wOQX
   lzzrNFsAUX7bFyDYurluVNwgFdDi5vKWbE3fbzrZNfRtC+ENCPxjmBATb
   VNnMffJh2mBNkH+kJrqHFpQFtq6hcMCLWY6zjyJ7vI5LgPWGy6DcptAYp
   sXN6A/YYYA8x8sHP6Aw0ML9KpMXGFYtfRmumXqXAESk0UzQiOlcyyKUvA
   aII6rJhcEw1KvVtGT258+IXr/E/4oi1Isn5N0e+hRrc2zucT/5HQe6o6Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="338531926"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="338531926"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="821937843"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="821937843"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 May 2023 18:08:33 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv6PY-00010T-1b;
	Sat, 06 May 2023 01:08:32 +0000
Date: Sat, 6 May 2023 09:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 24/236]
 drivers/char/tpm/tpm_tis_core.c:722:6: warning: variable 'ret' set but not
 used
Message-ID: <202305060920.VZPElp57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   a5a0f61c9bfcb47262ab9c603e977057330ea0f9
commit: 09e8337b145500a101e9f8a492a81c67dfef4bff [24/236] tpm, tpm_tis: Claim locality before writing interrupt registers
config: x86_64-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230506/202305060920.VZPElp57-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=09e8337b145500a101e9f8a492a81c67dfef4bff
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 09e8337b145500a101e9f8a492a81c67dfef4bff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060920.VZPElp57-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tis_core.c:27:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm_tis_core.c:722:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   2 warnings generated.


vim +/ret +722 drivers/char/tpm/tpm_tis_core.c

41a5e1cf1fe151 Christophe Ricard 2016-05-19  716  
58a522f89db8b7 Lino Sanfilippo   2022-11-24  717  static void tpm_tis_gen_interrupt(struct tpm_chip *chip)
eb5854e764b91a Jarkko Sakkinen   2016-06-12  718  {
eb5854e764b91a Jarkko Sakkinen   2016-06-12  719  	const char *desc = "attempting to generate an interrupt";
eb5854e764b91a Jarkko Sakkinen   2016-06-12  720  	u32 cap2;
eb5854e764b91a Jarkko Sakkinen   2016-06-12  721  	cap_t cap;
bfa2e4ed1d399b Lukasz Majczak    2021-02-16 @722  	int ret;
eb5854e764b91a Jarkko Sakkinen   2016-06-12  723  
923866165610d8 Jarkko Sakkinen   2021-05-10  724  	if (chip->flags & TPM_CHIP_FLAG_TPM2)
923866165610d8 Jarkko Sakkinen   2021-05-10  725  		ret = tpm2_get_tpm_pt(chip, 0x100, &cap2, desc);
923866165610d8 Jarkko Sakkinen   2021-05-10  726  	else
bfa2e4ed1d399b Lukasz Majczak    2021-02-16  727  		ret = tpm1_getcap(chip, TPM_CAP_PROP_TIS_TIMEOUT, &cap, desc, 0);
eb5854e764b91a Jarkko Sakkinen   2016-06-12  728  }
eb5854e764b91a Jarkko Sakkinen   2016-06-12  729  

:::::: The code at line 722 was first introduced by commit
:::::: bfa2e4ed1d399b2dde49307c127b2d1c48dcd72f tpm, tpm_tis: Decorate tpm_tis_gen_interrupt() with request_locality()

:::::: TO: Lukasz Majczak <lma@semihalf.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
