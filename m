Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71606EDD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879711; x=1708415711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjTEs3W6AJEJZiJlgHsJLBzshSh1fFKGJgw4/hDbkrs=;
  b=bhDoLa5Wv/rgmASf8ka/SEpXic+esb9opfDyrGx+rXNUxP547nTagGyW
   00gxuGb5O1GV+8gdTyrt73pG7ZKXq4WH2arRg8Netb2NUyvSxlhJ1Y6Dn
   edlaDYJEFd5LAwCFtc8dM6LdD1f1LrFuAdyNqHXKhKQu5+j1VIMYvSXlD
   xgJ4N9ZwDeFRrkrmJAUxXZ2cWSFC5WZxzVMq8Bw8UN0YCi/uXMpoSqgKn
   ++cAEyawI5JfZ4hjCxX1Q+64Cdw1QTvobq+FBwk8ofC5xSuWtY97SxZ27
   y30/2VaxejwgRMFcH8Njs97I5bdNWx82KXt5hWMOyWvoglY55XlsHN7A3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330059126"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330059126"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 23:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="814045930"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="814045930"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 23:55:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU10s-000Dlj-2t;
	Mon, 20 Feb 2023 07:55:06 +0000
Date: Mon, 20 Feb 2023 15:54:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 5514/9999] lib/crypto/blake2s-selftest.c:632:1:
 warning: the frame size of 1096 bytes is larger than 1024 bytes
Message-ID: <202302201543.qGUeK7Qc-lkp@intel.com>
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
head:   e2c1a934fd8e4288e7a32f4088ceaccf469eb74c
commit: 3dd33a09f5dc12ccb0902923c4c784eb0f8c7554 [5514/9999] crypto: blake2s - remove shash module
config: arm-randconfig-r005-20230219 (https://download.01.org/0day-ci/archive/20230220/202302201543.qGUeK7Qc-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302201543.qGUeK7Qc-lkp@intel.com/

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
