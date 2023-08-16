Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C82BA40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 06:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692167324; x=1723703324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgQ6U51S21zNLCoXlpmivdEhxfb4AfiUYwYQ1g/c4Os=;
  b=iaKck1+6dUrl5r8d0c8TDgWTk8LgONPAyld9bgLFKCcKUYbW6WG6/5YM
   2dZ9ZgxmSumG+9Q/m4OIoeueZpBRno/Ziz4dD3Q0tecolBzOOiG1JDaj/
   JxjKjDJmgAYALoZpW8jkm1WeCMQwzrACG/baW2VY8bAdef8kYUYsj54c5
   qfquXhCQ9THFHdJETDTJNKI82P+fOTdAbeBwjFxHcOI0hdNtanfYAP3M9
   gz2k82V+nkQRg00dm9pvLVwc/lIx3hZbNYWjiKpbspxQj1gUY196IP/g+
   ehza31F9XTeeE1GFjppTtGjkYusrl4YTeZ/ZdsUy527vqz9YInePIwp4B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362606802"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="362606802"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 23:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769074782"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200"; 
   d="scan'208";a="769074782"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Aug 2023 23:28:42 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWA0e-00003t-04;
	Wed, 16 Aug 2023 06:28:21 +0000
Date: Wed, 16 Aug 2023 14:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 113/141]
 drivers/bus/mhi/host/boot.c:368:6: warning: variable 'i' set but not used
Message-ID: <202308161421.HDcElLhf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   82320ddb4a62efc1d70c8839bddb59ef879e4fb1
commit: 59ece6f3781db3baf16a1d0e286491a6d463f62f [113/141] bus: mhi: Move host MHI code to "host" directory
config: powerpc-randconfig-r013-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161421.HDcElLhf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161421.HDcElLhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161421.HDcElLhf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/boot.c:368:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     368 |         int i = 0;
         |             ^
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
https://github.com/intel/lkp-tests/wiki
