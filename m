Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB97B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 00:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680050131; x=1711586131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzsVZpnNqIYO5XrSN8ikd/1hxUBnPuu4DtVvyOzGSX4=;
  b=ejnwQNGWIGeKxsB0zgyisdeeF9NtPa/ukqlggd4j/AULY2JyNVgxxbtV
   oHQUHOYChRxfGJZGrWLh+8nkhiAXcPyjSlDhmJpSrxHPN0RE53o4IbKPt
   dpHt1rWUDyY8A0Z/u8dRCWfmLdn6tiWAm6drEjiTdEvxFhAus2ghLA8px
   xNmo+hLlXmq5zGemULNZhPw7OYSFh9iHemORXeTfDgWt2DKOs9ERDZsYn
   dsUEef1iIG5+b1JPoixmraihAH+4tyy3D9Zx8xJDA1w1CbCpXE+byS+JZ
   bbEaPjuhUAHaQXoUsOfUxZaJymCjpAX7DCEG7h2i5W3SzbFnaVyfndhgT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338238180"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="338238180"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 17:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="677568397"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="677568397"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Mar 2023 17:35:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phJmh-000J0z-0e;
	Wed, 29 Mar 2023 00:35:27 +0000
Date: Wed, 29 Mar 2023 08:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/address-helpers 14/20] drivers/ata/sata_svw.c:323:21:
 error: implicit declaration of function 'of_property_read_reg'; did you mean
 'of_property_read_s32'?
Message-ID: <202303290800.R3gKVXBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers
head:   3a4e9c2e639e023556eefa93256ce5bf34137a60
commit: 093a93c8acb9c1667e13b77a96983c15e4c6fc32 [14/20] ata: Use of_property_read_reg()
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230329/202303290800.R3gKVXBj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=093a93c8acb9c1667e13b77a96983c15e4c6fc32
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/address-helpers
        git checkout 093a93c8acb9c1667e13b77a96983c15e4c6fc32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ata/ drivers/fsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303290800.R3gKVXBj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ata/sata_svw.c: In function 'k2_sata_show_info':
>> drivers/ata/sata_svw.c:323:21: error: implicit declaration of function 'of_property_read_reg'; did you mean 'of_property_read_s32'? [-Werror=implicit-function-declaration]
     323 |                 if (of_property_read_reg(np, 0, &reg, NULL))
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     of_property_read_s32
   cc1: some warnings being treated as errors


vim +323 drivers/ata/sata_svw.c

   302	
   303	static int k2_sata_show_info(struct seq_file *m, struct Scsi_Host *shost)
   304	{
   305		struct ata_port *ap;
   306		struct device_node *np;
   307		int index;
   308	
   309		/* Find  the ata_port */
   310		ap = ata_shost_to_port(shost);
   311		if (ap == NULL)
   312			return 0;
   313	
   314		/* Find the OF node for the PCI device proper */
   315		np = pci_device_to_OF_node(to_pci_dev(ap->host->dev));
   316		if (np == NULL)
   317			return 0;
   318	
   319		/* Match it to a port node */
   320		index = (ap == ap->host->ports[0]) ? 0 : 1;
   321		for (np = np->child; np != NULL; np = np->sibling) {
   322			u64 reg;
 > 323			if (of_property_read_reg(np, 0, &reg, NULL))
   324				continue;
   325			if (index == reg) {
   326				seq_printf(m, "devspec: %pOF\n", np);
   327				break;
   328			}
   329		}
   330		return 0;
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
