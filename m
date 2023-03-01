Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44D881F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 19:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677698974; x=1709234974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ImDx+ePP1dllJJ1O0NOaJFsM/keFfvuRD6qCLTsK4Pk=;
  b=Z1Gw6CCGY6iinqExS662gUTSFFl5RznNGXuRs24eQAvoJ5w32CAYlWvD
   WTgIVWiv1Rgw3tFBmda4hrnscMqp2sh3NeMSONGTkkWNEnYyzEm3gUn9+
   Zm7YdccXIhXwWkBwrqevJ4uVNJnWkimO0ymQ5KHpC47+RW+bcRgUgLQzZ
   mFzS+ACPN2Us71Fea+40mAE2GEyegRJQ5XsS50MLhzXcmiq4hbO2DrTGf
   dEbhZM0eMW/wK/3tqHdJY0cKZjX8DxV7iw3zdbpbQDDgjGOAYfsknxJy6
   lOIp21D5WQ2FjHQuQUjkOj/r7ItqsPKokfQ8We+6PNi6IPSLHlvKH41vZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318302912"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="318302912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 11:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="676879960"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="676879960"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2023 11:29:33 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXS8q-0006Mx-1E;
	Wed, 01 Mar 2023 19:29:32 +0000
Date: Thu, 2 Mar 2023 03:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-prefix-orc 5/6] arch/x86/crypto/blowfish-x86_64.o:
 warning: objtool: blowfish_dec_blk+0x0: failed to create pfx symbol
Message-ID: <202303020348.6oHztfKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-prefix-orc
head:   2b59c194afe7491e0a86fda4188c65d9322a5837
commit: 025e0ae3bb536c53a13df7ff4c3751029e4b7cd7 [5/6] objtool: Separate prefix code from stack validation code
config: x86_64-randconfig-a002 (https://download.01.org/0day-ci/archive/20230302/202303020348.6oHztfKk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=025e0ae3bb536c53a13df7ff4c3751029e4b7cd7
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-prefix-orc
        git checkout 025e0ae3bb536c53a13df7ff4c3751029e4b7cd7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020348.6oHztfKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/blowfish-x86_64.o: warning: objtool: blowfish_dec_blk+0x0: failed to create pfx symbol
>> arch/x86/crypto/blowfish-x86_64.o: warning: objtool: blowfish_dec_blk_4way+0x0: failed to create pfx symbol
--
>> arch/x86/crypto/aegis128-aesni.o: warning: objtool: crypto_aegis128_aesni_enc+0x0: failed to create pfx symbol
>> arch/x86/crypto/aegis128-aesni.o: warning: objtool: crypto_aegis128_aesni_enc_tail+0x0: failed to create pfx symbol
>> arch/x86/crypto/aegis128-aesni.o: warning: objtool: crypto_aegis128_aesni_dec+0x0: failed to create pfx symbol
>> arch/x86/crypto/aegis128-aesni.o: warning: objtool: crypto_aegis128_aesni_dec_tail+0x0: failed to create pfx symbol
--
>> arch/x86/crypto/nhpoly1305-avx2.o: warning: objtool: nh_avx2+0x0: failed to create pfx symbol
--
>> arch/x86/crypto/sm4-aesni-avx2-x86_64.o: warning: objtool: sm4_aesni_avx2_ctr_enc_blk16+0x0: failed to create pfx symbol
>> arch/x86/crypto/sm4-aesni-avx2-x86_64.o: warning: objtool: sm4_aesni_avx2_cbc_dec_blk16+0x0: failed to create pfx symbol
>> arch/x86/crypto/sm4-aesni-avx2-x86_64.o: warning: objtool: sm4_aesni_avx2_cfb_dec_blk16+0x0: failed to create pfx symbol


objdump-func vmlinux.o blowfish_dec_blk:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
