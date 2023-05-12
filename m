Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967DA138F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 06:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683873529; x=1715409529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/WEthdKf+O3lPr62I5Uvf6aYCHBcMUKpLbQANfdr7o=;
  b=hTE0E0dUPdv/kyHtmXfN9CukJb3j/YA1D/Xwd1WgB6Uad6fQV32k81OX
   pjVLRRQginyLMYItEDGHr8Qv2WJ1qFa+IChm5ado9raIlljk4YswhetZA
   K77moQ/o8h6NpanrVio33zEW9aILvMpwLhIDBeBWSODUd5yw7HultG46q
   OKiDKUelqG6zZKWFSdR6Lhbd/CxAP6KUwODfWIRb13foYY65yJihjhTav
   jVmwwv1vSoDN8+PMcFMiVIUKIncDFTkMJtzIv0SN3kpY9mvFiHRluI1Nd
   dDPXOOx1uvsgs06+QvkYfCrzeTQorOA8KVqfmNBs/pJeSje+50kldL0SE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378852758"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="378852758"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 23:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="824248000"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="824248000"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 May 2023 23:38:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxMQJ-0004be-0c;
	Fri, 12 May 2023 06:38:39 +0000
Date: Fri, 12 May 2023 14:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lino Sanfilippo <l.sanfilippo@kunbus.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 2720/3207]
 drivers/char/tpm/tpm_tis_core.c:740:13: warning: variable 'ret' set but not
 used
Message-ID: <202305121439.EctXoKJD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   11dd1b7778d07f6a9e8996e68e1fc6e175352ecb
commit: 71becf3ffea6ff13a2dea17b45f3a38c4174d2a3 [2720/3207] tpm, tpm_tis: Claim locality before writing interrupt registers
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230512/202305121439.EctXoKJD-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=71becf3ffea6ff13a2dea17b45f3a38c4174d2a3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout 71becf3ffea6ff13a2dea17b45f3a38c4174d2a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121439.EctXoKJD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm_tis_core.c: In function 'tpm_tis_gen_interrupt':
>> drivers/char/tpm/tpm_tis_core.c:740:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     740 |         int ret;
         |             ^~~


vim +/ret +740 drivers/char/tpm/tpm_tis_core.c

41a5e1cf1fe151 Christophe Ricard 2016-05-19  734  
12839c326ae5cd Lino Sanfilippo   2022-11-24  735  static void tpm_tis_gen_interrupt(struct tpm_chip *chip)
eb5854e764b91a Jarkko Sakkinen   2016-06-12  736  {
eb5854e764b91a Jarkko Sakkinen   2016-06-12  737  	const char *desc = "attempting to generate an interrupt";
eb5854e764b91a Jarkko Sakkinen   2016-06-12  738  	u32 cap2;
eb5854e764b91a Jarkko Sakkinen   2016-06-12  739  	cap_t cap;
d53a6adfb55396 Lukasz Majczak    2021-02-16 @740  	int ret;
eb5854e764b91a Jarkko Sakkinen   2016-06-12  741  
e630af7dfb450d Jarkko Sakkinen   2021-05-10  742  	if (chip->flags & TPM_CHIP_FLAG_TPM2)
e630af7dfb450d Jarkko Sakkinen   2021-05-10  743  		ret = tpm2_get_tpm_pt(chip, 0x100, &cap2, desc);
e630af7dfb450d Jarkko Sakkinen   2021-05-10  744  	else
d53a6adfb55396 Lukasz Majczak    2021-02-16  745  		ret = tpm1_getcap(chip, TPM_CAP_PROP_TIS_TIMEOUT, &cap, desc, 0);
eb5854e764b91a Jarkko Sakkinen   2016-06-12  746  }
eb5854e764b91a Jarkko Sakkinen   2016-06-12  747  

:::::: The code at line 740 was first introduced by commit
:::::: d53a6adfb553969809eb2b736a976ebb5146cd95 tpm, tpm_tis: Decorate tpm_tis_gen_interrupt() with request_locality()

:::::: TO: Lukasz Majczak <lma@semihalf.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
