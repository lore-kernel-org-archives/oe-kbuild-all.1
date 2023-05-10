Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B16AA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683734920; x=1715270920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VoVOsNw5qV+NIAKZ6egaKDbn1wEgIwkBUsmP2ziA0w=;
  b=MqukmpvDkzWcP7A8XAZHI46l/uT4rP1QMRvtnyWEV0dG6Wwo+NL1d3Fz
   U8U/aGGGPkwSgnclx5uKAc1mYB9cR4GsvSxZ8dS5zWonhUxM7NK4XZLKM
   zK7J2dydn/FVpGwsH5I2SEuM1734TdFF+f6+5ruJ5aJsYBzioGgh+NG8c
   yF+ewuWJT26BKni12o7mHx88GWFDA0mSKCbTtUlB2kECpxITY81gcTkjO
   k9vIibmpA/7QaVbnAnXHfWF4mPw3G474v9aC0d2LH/Y3sDF74FQ9w2F81
   Yqod3j453yqnKOMy3R64gQtX9n2PhlSk9X4PyBx3F8qxKdJiwmP/zo4HX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347715121"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="347715121"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 09:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="1029269884"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="1029269884"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 May 2023 09:08:39 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwmMo-0003Px-1I;
	Wed, 10 May 2023 16:08:38 +0000
Date: Thu, 11 May 2023 00:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 310/311]
 drivers/bus/mhi/host/boot.c:368:6: warning: variable 'i' set but not used
Message-ID: <202305102347.untxyK2g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   bf21b325043d8e72a54f32ae9a83cd204e057e37
commit: 537f6477ac4e8769575ac27aa356647be27c79d4 [310/311] bus: mhi: Move host MHI code to "host" directory
config: hexagon-randconfig-r041-20230509 (https://download.01.org/0day-ci/archive/20230510/202305102347.untxyK2g-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=537f6477ac4e8769575ac27aa356647be27c79d4
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.10
        git checkout 537f6477ac4e8769575ac27aa356647be27c79d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bus/mhi/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102347.untxyK2g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/boot.c:368:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int i = 0;
               ^
   1 warning generated.


vim +/i +368 drivers/bus/mhi/host/boot.c

cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  360  
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  361  static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  362  			      const struct firmware *firmware,
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  363  			      struct image_info *img_info)
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  364  {
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  365  	size_t remainder = firmware->size;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  366  	size_t to_cpy;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  367  	const u8 *buf = firmware->data;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20 @368  	int i = 0;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  369  	struct mhi_buf *mhi_buf = img_info->mhi_buf;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  370  	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  371  
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  372  	while (remainder) {
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  373  		to_cpy = min(remainder, mhi_buf->len);
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  374  		memcpy(mhi_buf->buf, buf, to_cpy);
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  375  		bhi_vec->dma_addr = mhi_buf->dma_addr;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  376  		bhi_vec->size = to_cpy;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  377  
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  378  		buf += to_cpy;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  379  		remainder -= to_cpy;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  380  		i++;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  381  		bhi_vec++;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  382  		mhi_buf++;
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  383  	}
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  384  }
cd457afb166705 drivers/bus/mhi/core/boot.c Manivannan Sadhasivam 2020-02-20  385  

:::::: The code at line 368 was first introduced by commit
:::::: cd457afb16670501f00354eb0e705a7d8a50d79d bus: mhi: core: Add support for downloading firmware over BHIe

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
