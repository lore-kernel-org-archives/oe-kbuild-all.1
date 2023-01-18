Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F062A2F3A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 13:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674049490; x=1705585490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qPo02E1yuZv2Pi8+el1iWjAfZLZPx1EJSTuFA3NW6AU=;
  b=Pna/mDQyf/6R8R5tZTJAzlLloZkZH7AbT/AOBTvt5j2ey3VI1UjWQwEt
   vaaGAZEhNb2oxCJMCTtahPfXccVqjJYOk1NOPhHymEz3eSJLxEo5H9yUL
   ke+wfE4YUhzRj4teHistUmpKY5tXQ5qP2JUEPNGFl7/QDy3ru+C3FhIOP
   M1nq8kUcqsLZbR5ObQ/rCIt7iMC59PcMYroV3lhaorbZz6x/lfbfWsUpq
   zDX2zb9xR7MFs0cNAwwHPq3XkCxFMU8vacOFuvDICrHraL12JoBU78Kgy
   bXqcmVBg4OP8ygXua4EhH9Ce2ejWrkSoc8bixd3uNQpe1r5Q0yJoBtxrG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308542905"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="308542905"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 05:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="728202301"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="728202301"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 05:44:48 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pI8kB-0000M0-2h;
	Wed, 18 Jan 2023 13:44:47 +0000
Date: Wed, 18 Jan 2023 21:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 6045/9999] lib/crypto/blake2s-selftest.c:632:1:
 warning: the frame size of 1096 bytes is larger than 1024 bytes
Message-ID: <202301182103.XY4Twwoa-lkp@intel.com>
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
head:   3bcc86eb3ed952c22ceecce8932dde72ea01f8cc
commit: 3dd33a09f5dc12ccb0902923c4c784eb0f8c7554 [6045/9999] crypto: blake2s - remove shash module
config: powerpc-randconfig-r011-20230118 (https://download.01.org/0day-ci/archive/20230118/202301182103.XY4Twwoa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=3dd33a09f5dc12ccb0902923c4c784eb0f8c7554
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 3dd33a09f5dc12ccb0902923c4c784eb0f8c7554
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash lib/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
