Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85518C16
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 11:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684497309; x=1716033309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=toHxbtn6az1Iif8PKSJUhxj8yPw2n1M/FuYET+fPq5k=;
  b=B9xqYB2jTZfOo2riqYByQETwcB6VfrTxVmi5P8GEsTw7UH7+1wCoYRWM
   C8CFTQexb8Qn5+yb5l4fu+PAXY+LF54jPC0AMGL3Fg9JSKnc0FHXFc0LI
   bJyqkxiP33kasvJXR6nEP1FjlnO/Wgx/RAyp3rykRmCR6CEKlX75NhEOt
   V62M8EeQ69/D7KGyfJ6koLvl9uapUikrKrZNoM/2R8V1VkkYU07vPdpl4
   /y4NLgDIWMq6xR30SI7oUiDPjS+afWVMwAJYykgs7cupphffaMTNiZb24
   soCsU020kH4lj9VHegi5LDzWrgzwHsv5EWyotDB+2HismNh/2NiEZ44VM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355580583"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="355580583"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 04:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="792353782"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="792353782"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 May 2023 04:55:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzyhP-000AoM-2V;
	Fri, 19 May 2023 11:55:07 +0000
Date: Fri, 19 May 2023 19:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org
Subject: [herbert-cryptodev-2.6:master 17/22]
 arch/arm64/crypto/sha256-glue.c:194:1: warning: data definition has no type
 or storage class
Message-ID: <202305191953.PIB1w80W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
head:   7883d1b28a2b0e62edcacea22de6b36a1918b15a
commit: 6c19f3bfff0344cdc02e7b074062a9acd026f010 [17/22] crypto: lib/sha256 - Use generic code from sha256_base
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230519/202305191953.PIB1w80W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=6c19f3bfff0344cdc02e7b074062a9acd026f010
        git remote add herbert-cryptodev-2.6 https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
        git fetch --no-tags herbert-cryptodev-2.6 master
        git checkout 6c19f3bfff0344cdc02e7b074062a9acd026f010
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191953.PIB1w80W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/crypto/sha256-glue.c:18:20: error: expected declaration specifiers or '...' before string constant
      18 | MODULE_DESCRIPTION("SHA-224/SHA-256 secure hash for arm64");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:19:15: error: expected declaration specifiers or '...' before string constant
      19 | MODULE_AUTHOR("Andy Polyakov <appro@openssl.org>");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:20:15: error: expected declaration specifiers or '...' before string constant
      20 | MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:21:16: error: expected declaration specifiers or '...' before string constant
      21 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   In file included from include/crypto/internal/hash.h:11,
                    from arch/arm64/crypto/sha256-glue.c:11:
   arch/arm64/crypto/sha256-glue.c:22:21: error: expected ')' before string constant
      22 | MODULE_ALIAS_CRYPTO("sha224");
         |                     ^~~~~~~~
   include/crypto/algapi.h:44:55: note: in definition of macro 'MODULE_ALIAS_CRYPTO'
      44 |                 __MODULE_INFO(alias, alias_userspace, name);    \
         |                                                       ^~~~
   include/crypto/algapi.h:45:52: error: expected ')' before string constant
      45 |                 __MODULE_INFO(alias, alias_crypto, "crypto-" name)
         |                                                    ^~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:22:1: note: in expansion of macro 'MODULE_ALIAS_CRYPTO'
      22 | MODULE_ALIAS_CRYPTO("sha224");
         | ^~~~~~~~~~~~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:23:21: error: expected ')' before string constant
      23 | MODULE_ALIAS_CRYPTO("sha256");
         |                     ^~~~~~~~
   include/crypto/algapi.h:44:55: note: in definition of macro 'MODULE_ALIAS_CRYPTO'
      44 |                 __MODULE_INFO(alias, alias_userspace, name);    \
         |                                                       ^~~~
   include/crypto/algapi.h:45:52: error: expected ')' before string constant
      45 |                 __MODULE_INFO(alias, alias_crypto, "crypto-" name)
         |                                                    ^~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:23:1: note: in expansion of macro 'MODULE_ALIAS_CRYPTO'
      23 | MODULE_ALIAS_CRYPTO("sha256");
         | ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/crypto/sha256-glue.c:194:1: warning: data definition has no type or storage class
     194 | module_init(sha256_mod_init);
         | ^~~~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:194:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
>> arch/arm64/crypto/sha256-glue.c:194:1: warning: parameter names (without types) in function declaration
   arch/arm64/crypto/sha256-glue.c:195:1: warning: data definition has no type or storage class
     195 | module_exit(sha256_mod_fini);
         | ^~~~~~~~~~~
   arch/arm64/crypto/sha256-glue.c:195:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]
   arch/arm64/crypto/sha256-glue.c:195:1: warning: parameter names (without types) in function declaration
   arch/arm64/crypto/sha256-glue.c:173:19: warning: 'sha256_mod_init' defined but not used [-Wunused-function]
     173 | static int __init sha256_mod_init(void)
         |                   ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +194 arch/arm64/crypto/sha256-glue.c

7918ecef073fe8 Ard Biesheuvel 2016-11-20  193  
7918ecef073fe8 Ard Biesheuvel 2016-11-20 @194  module_init(sha256_mod_init);

:::::: The code at line 194 was first introduced by commit
:::::: 7918ecef073fe80eeb399a37d8d48561864eedf1 crypto: arm64/sha2 - integrate OpenSSL implementations of SHA256/SHA512

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
