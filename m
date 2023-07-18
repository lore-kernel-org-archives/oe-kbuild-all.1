Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511714A85
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689704167; x=1721240167;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kVuh0zLDZ5IuamrCDOpfMsDVo0OoLvNZr4jbdtyKBrs=;
  b=RRapBc9F5dJRZqGXvcc1S9UE6eUaEuqvRqFpiEU/UgxOrP2BboPv+xO2
   1HndofWtF7wEXvJsfk7xdnVUFI25sxc8zA543ZDB0tsLkK8QebeSH/KBo
   amoYSWHMgjNlBp/SORMVRpH8epZbSPaUvekxxwbJD6u48FxsAgSQXbjhz
   FQT3XiI9NUsi+sBd4WQKXDbWou+yTUMT1WhDwA7Tq2KCNP7Q8Yjnf1gFI
   EnR6Vj/WdZwe1+MUeRY1FoGAgtbx+sWfwVN0yhgyv5LaIp1ONhKrfyWqy
   KaeJaC8YT2Xv489sJ525M8kCTPrMfmxTaAPrOWou+0GjrNVS1JqDuB3uV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="351147690"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="351147690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 11:16:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="758885872"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="758885872"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Jul 2023 11:16:06 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLpEx-0003oN-1G
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Jul 2023 18:16:04 +0000
Date: Wed, 19 Jul 2023 02:15:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2245/26803]
 security/keys/encrypted-keys/encrypted.c:52: warning: "HASH_SIZE" redefined
Message-ID: <202307190210.gXLhwfma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   9ebe966c9db2389fa11b6997119b22b7374fd44d
commit: 60e68d0164109523ae13de76a60082656a8e05a5 [2245/26803] clocksource/timer-imx-gpt: turn into user-visible MMIO clocksource
config: arm-randconfig-r016-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190210.gXLhwfma-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190210.gXLhwfma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190210.gXLhwfma-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from security/keys/encrypted-keys/encrypted.c:15:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   security/keys/encrypted-keys/encrypted.c: At top level:
>> security/keys/encrypted-keys/encrypted.c:52: warning: "HASH_SIZE" redefined
      52 | #define HASH_SIZE SHA256_DIGEST_SIZE
         | 
   In file included from include/linux/clocksource.h:16,
                    from include/vdso/datapage.h:119,
                    from arch/arm/include/asm/vdso_datapage.h:14,
                    from arch/arm/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19:
   include/linux/hashtable.h:27: note: this is the location of the previous definition
      27 | #define HASH_SIZE(name) (ARRAY_SIZE(name))
         | 


vim +/HASH_SIZE +52 security/keys/encrypted-keys/encrypted.c

7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23 @15  #include <linux/module.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  16  #include <linux/init.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  17  #include <linux/slab.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  18  #include <linux/parser.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  19  #include <linux/string.h>
93ae86e7592997 security/keys/encrypted_defined.c        Mimi Zohar    2010-11-29  20  #include <linux/err.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  21  #include <keys/user-type.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  22  #include <keys/trusted-type.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  23  #include <keys/encrypted-type.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  24  #include <linux/key-type.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  25  #include <linux/random.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  26  #include <linux/rcupdate.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  27  #include <linux/scatterlist.h>
79a73d188726b4 security/keys/encrypted.c                Roberto Sassu 2011-06-27  28  #include <linux/ctype.h>
456bee986e0a37 security/keys/encrypted-keys/encrypted.c Herbert Xu    2016-09-20  29  #include <crypto/aes.h>
0f534e4a13496b security/keys/encrypted-keys/encrypted.c Eric Biggers  2017-06-08  30  #include <crypto/algapi.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  31  #include <crypto/hash.h>
a24d22b225ce15 security/keys/encrypted-keys/encrypted.c Eric Biggers  2020-11-12  32  #include <crypto/sha2.h>
c3917fd9dfbc8e security/keys/encrypted-keys/encrypted.c Herbert Xu    2016-01-24  33  #include <crypto/skcipher.h>
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  34  
b9703449347603 security/keys/encrypted.c                Mimi Zohar    2011-01-18  35  #include "encrypted.h"
79a73d188726b4 security/keys/encrypted.c                Roberto Sassu 2011-06-27  36  #include "ecryptfs_format.h"
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  37  
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  38  static const char KEY_TRUSTED_PREFIX[] = "trusted:";
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  39  static const char KEY_USER_PREFIX[] = "user:";
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  40  static const char hash_alg[] = "sha256";
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  41  static const char hmac_alg[] = "hmac(sha256)";
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  42  static const char blkcipher_alg[] = "cbc(aes)";
4e561d388feff1 security/keys/encrypted.c                Roberto Sassu 2011-06-27  43  static const char key_format_default[] = "default";
79a73d188726b4 security/keys/encrypted.c                Roberto Sassu 2011-06-27  44  static const char key_format_ecryptfs[] = "ecryptfs";
9db67581b91d9e security/keys/encrypted-keys/encrypted.c Dave Jiang    2018-12-04  45  static const char key_format_enc32[] = "enc32";
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  46  static unsigned int ivsize;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  47  static int blksize;
7e70cb4978507c security/keys/encrypted_defined.c        Mimi Zohar    2010-11-23  48  
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  49  #define KEY_TRUSTED_PREFIX_LEN (sizeof (KEY_TRUSTED_PREFIX) - 1)
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  50  #define KEY_USER_PREFIX_LEN (sizeof (KEY_USER_PREFIX) - 1)
79a73d188726b4 security/keys/encrypted.c                Roberto Sassu 2011-06-27  51  #define KEY_ECRYPTFS_DESC_LEN 16
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13 @52  #define HASH_SIZE SHA256_DIGEST_SIZE
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  53  #define MAX_DATA_SIZE 4096
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  54  #define MIN_DATA_SIZE  20
9db67581b91d9e security/keys/encrypted-keys/encrypted.c Dave Jiang    2018-12-04  55  #define KEY_ENC32_PAYLOAD_LEN 32
3b1826cebe1d53 security/keys/encrypted_defined.c        Mimi Zohar    2010-12-13  56  

:::::: The code at line 52 was first introduced by commit
:::::: 3b1826cebe1d534ec05417a29b9a9f82651a5cb5 encrypted-keys: style and other cleanup

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
