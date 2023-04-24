Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7872F58
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682368983; x=1713904983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3RxK+LBGDjuVfjOMbG6aMImdbQBuc74hhLNPwGlEDW4=;
  b=h2eJJVALWuD+KeeMdB8z5GZbIDUcZrES5W+cCgQzGztaFxtvbAN6q9v1
   +zYpOufBNoOT6/YX60hurDKiaNosOje8yWhvYI7ZlDy7aFns7JtBvKH2Q
   r3uFPimj6UKWg1huvyb6WZwAPyspKn0AemD9H0FTguGu8ICLP1EyFLPoX
   xramme63Ba8F0BQ9qVfNfwyBCWYaWOxHiCoegcBjrjyk0gGezc5UCnDCH
   g0N9KIW+hpbsHdJ8nqob1MTHSu4gEMg3EbahIeW8QouQbFdn6lto0yjKm
   F+31TJ4jeSp7Xuuo6m6/zPm6hAvKQuu3hH6oDpSpHaAzVhK8iLJgefSQA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349361892"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="349361892"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 13:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="782541224"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; 
   d="scan'208";a="782541224"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2023 13:43:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pr31X-000ieK-2e;
	Mon, 24 Apr 2023 20:42:59 +0000
Date: Tue, 25 Apr 2023 04:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 3981/9999] lib/crypto/blake2s-selftest.c:632:1:
 warning: the frame size of 1096 bytes is larger than 1024 bytes
Message-ID: <202304250404.fRyQqjil-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   3299fb36854fdc288bddc2c4d265f8a2e5105944
commit: 3dd33a09f5dc12ccb0902923c4c784eb0f8c7554 [3981/9999] crypto: blake2s - remove shash module
config: arm-randconfig-r033-20230424 (https://download.01.org/0day-ci/archive/20230425/202304250404.fRyQqjil-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3dd33a09f5dc12ccb0902923c4c784eb0f8c7554
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 3dd33a09f5dc12ccb0902923c4c784eb0f8c7554
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash lib/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250404.fRyQqjil-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/crypto/blake2s-selftest.c: In function 'blake2s_selftest':
>> lib/crypto/blake2s-selftest.c:632:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     632 | }
         | ^


vim +632 lib/crypto/blake2s-selftest.c

3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  614  
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  615  		memcpy(&state1, &state, sizeof(state1));
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  616  		blake2s_compress(&state1, blocks, 1, BLAKE2S_BLOCK_SIZE);
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  617  		for (l = 1; l < TEST_ALIGNMENT; ++l) {
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  618  			memcpy(unaligned_block + l, blocks,
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  619  			       BLAKE2S_BLOCK_SIZE);
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  620  			memcpy(&state2, &state, sizeof(state2));
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  621  			blake2s_compress(&state2, unaligned_block + l, 1,
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  622  					 BLAKE2S_BLOCK_SIZE);
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  623  			if (memcmp(&state1, &state2, sizeof(state1))) {
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  624  				pr_err("blake2s random compress align %d self-test %d: FAIL\n",
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  625  				       l, i + 1);
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  626  				success = false;
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  627  			}
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  628  		}
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  629  	}
3dd33a09f5dc12 Jason A. Donenfeld 2022-05-28  630  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  631  	return success;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08 @632  }

:::::: The code at line 632 was first introduced by commit
:::::: 66d7fb94e4ffe5acc589e0b2b4710aecc1f07a28 crypto: blake2s - generic C library implementation and selftest

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
