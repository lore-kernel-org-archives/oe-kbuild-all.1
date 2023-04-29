Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B81362
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 04:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682743315; x=1714279315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4E+5ojhsurppqih5NHCXCJqX7wNJCglta3p1DH8xuU=;
  b=ne8VKqKOvqxuf8lRUDDkFgp8EOF0NOenuK3Q9Y5kNZ8PyawIN2OmGtiF
   CfTGHi+4DFEXDmm2hvomOFJlER4OTJylGTklBeVJ/cve+lLPQgP9YYoGp
   ehNppDnd2OFNccQN8xAE8QmsHXEZZmLkUxkSEohSDuh/ut39JOutID4JU
   /2KfQQRW9f3EDGS6m7kwobQqNaHfFb3NF5CBPVQuI1TsK4Dx2eK31JCfo
   JOsNWY0SzLmr5az/7Eky9fPC23hjN2JeEi1ftPEjoRcca3Zb36x9r3n3Y
   mytN0ImVqLO5ib76k+wm8C86BAQs83hT1zM+9SGIziZyf9pPqjKXE7oru
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="332234824"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="332234824"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 21:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="869466684"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="869466684"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2023 21:41:53 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pscPA-0000tN-2F;
	Sat, 29 Apr 2023 04:41:52 +0000
Date: Sat, 29 Apr 2023 12:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382]
 drivers/spi/spi-cadence-quadspi.c:393: undefined reference to
 `spi_mem_exec_op'
Message-ID: <202304291202.Ckr1o2QZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5b69be59af422fe55a3cee133b337b1027cb98c3
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: csky-buildonly-randconfig-r003-20230428 (https://download.01.org/0day-ci/archive/20230429/202304291202.Ckr1o2QZ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291202.Ckr1o2QZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
>> drivers/spi/spi-cadence-quadspi.c:393: undefined reference to `spi_mem_exec_op'
   csky-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_find_tx_high':
   drivers/spi/spi-cadence-quadspi.c:504: undefined reference to `spi_mem_exec_op'


vim +393 drivers/spi/spi-cadence-quadspi.c

   377	
   378	static int cqspi_phy_check_pattern(struct cqspi_flash_pdata *f_pdata,
   379					   struct spi_mem *mem)
   380	{
   381		struct spi_mem_op op = f_pdata->phy_read_op;
   382		u8 *read_data;
   383		unsigned int size = sizeof(phy_tuning_pattern);
   384		int ret;
   385	
   386		read_data = kmalloc(size, GFP_KERNEL);
   387		if (!read_data)
   388			return -ENOMEM;
   389	
   390		op.data.buf.in = read_data;
   391		op.data.nbytes = size;
   392	
 > 393		ret = spi_mem_exec_op(mem, &op);
   394		if (ret)
   395			goto out;
   396	
   397		if (memcmp(read_data, phy_tuning_pattern,
   398			   ARRAY_SIZE(phy_tuning_pattern))) {
   399			ret = -EAGAIN;
   400			goto out;
   401		}
   402	
   403		ret = 0;
   404	
   405	out:
   406		kfree(read_data);
   407		return ret;
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
