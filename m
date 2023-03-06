Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D97473
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678141418; x=1709677418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+BT0BAcZlSIAgHAK8Bv90MbHPBNdwX+aL6Sa8GIFzg=;
  b=UN+cbmsNrHWEPGvGToOEp3A4fjhPV4xCQ5wJSlobd48gGG6CkJK1/uuW
   IDUPemmOJ7z323qrZFN92knSKv8GIzNyGuhnGg+AswpRyRhGMNMsTxwzC
   Phlgj7qrrYLCpOzq4jxKkcxqDR0vUfM37fT0Urhn4itqTjOG3FtBFL52D
   R7ZifkZ6QvGaNZkJlqbcqpL3VKIWIkzi2kk9n6NWvU67fhFcFYqyvT1nK
   NN3Lb3mha5OguEk9/0PGhqOF+TftNzGJ/3qvED+MxmXLG7/ZrRCsC3nuR
   HyUsbs8FGqP3sl3PghPNq7T6PudK/Oq6w6VWtlaGaJc/4RzqjeDz5ZIxY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400517545"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="400517545"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 14:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745223927"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="745223927"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2023 14:23:37 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZJF2-0000gB-2E;
	Mon, 06 Mar 2023 22:23:36 +0000
Date: Tue, 7 Mar 2023 06:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Palacios <hector.palacios@digi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [miquelraynal:nand/next 2/4]
 drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse: sparse: invalid
 assignment: |=
Message-ID: <202303070644.Kvs6l6g9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nand/next
head:   fa07e65008e7068b7d11d09dc932326ee1245ee3
commit: 2e3927b0ea56ffae4d05477691210b7b06f9b599 [2/4] mtd: rawnand: hynix: fix up bit 0 of sdr_timing_mode
config: parisc-randconfig-s053-20230305 (https://download.01.org/0day-ci/archive/20230307/202303070644.Kvs6l6g9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/miquelraynal/linux-0day/commit/2e3927b0ea56ffae4d05477691210b7b06f9b599
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nand/next
        git checkout 2e3927b0ea56ffae4d05477691210b7b06f9b599
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070644.Kvs6l6g9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse: sparse: invalid assignment: |=
>> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse:    left side has type restricted __le16
>> drivers/mtd/nand/raw/nand_hynix.c:740:29: sparse:    right side has type unsigned long

vim +740 drivers/mtd/nand/raw/nand_hynix.c

   730	
   731	static void hynix_fixup_onfi_param_page(struct nand_chip *chip,
   732						struct nand_onfi_params *p)
   733	{
   734		/*
   735		 * Certain chips might report a 0 on sdr_timing_mode field
   736		 * (bytes 129-130). This has been seen on H27U4G8F2GDA-BI.
   737		 * According to ONFI specification, bit 0 of this field "shall be 1".
   738		 * Forcibly set this bit.
   739		 */
 > 740		p->sdr_timing_modes |= BIT(0);
   741	}
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
