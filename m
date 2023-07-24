Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12038D505
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690211457; x=1721747457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ijrb7Kbi8t0/xalwSmGi8rw5fjcPD4uOZ10y+fkNW/M=;
  b=a4NsiDS4gQYLzANjejt7RNyZT2h3XB16VLLZbF59l5zwAth4qiiixL9t
   hkrLLqHPnjyBX6Jwst3DAZIz1r8tNkBOEd39vJMdZpSJx0GjsTatk2NUY
   bka58ij9JhbpDdvzH2rEw4pBAcX90Ws4K1Olr+wLy0zHD3cwifbwrPYzH
   HDQTZF2tYU8Yz+nGh2irgqNBVPWh87av1ZHn1mtWyFXae4+o+mWsIQhiw
   qt7DC1XCTes3fuUNmM/5kaweL5OiCAe9qAALMMkxpHgDWPpbTqms7CxRi
   7aImu/m25duTdu7S+425sEFtEq7lSEv3IR7ABGAnEz8Qx/xcNlGvojcN5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367493023"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="367493023"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 08:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="815866669"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="815866669"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2023 08:10:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNxCw-0009no-2r;
	Mon, 24 Jul 2023 15:10:46 +0000
Date: Mon, 24 Jul 2023 23:10:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 2070/9999] lib/crypto/blake2s-selftest.c:632:1:
 warning: the frame size of 1096 bytes is larger than 1024 bytes
Message-ID: <202307242339.zYNDqd8i-lkp@intel.com>
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
head:   cdd3cdb682f4939aa1adeff025b97e75a9a0f5b3
commit: 3dd33a09f5dc12ccb0902923c4c784eb0f8c7554 [2070/9999] crypto: blake2s - remove shash module
config: arm-randconfig-r046-20230724 (https://download.01.org/0day-ci/archive/20230724/202307242339.zYNDqd8i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307242339.zYNDqd8i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307242339.zYNDqd8i-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
