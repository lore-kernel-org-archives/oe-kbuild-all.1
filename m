Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB4A806
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 02:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JC13A1Py"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698632961; x=1730168961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d9iZwmjTqmwIbeVsKBqY2J+kUrasyouWXzKGdrC+zfU=;
  b=JC13A1Py627XIdWkjP5WGhpcKzmoNtNUAsqstRNxjtfYBZe6j0OgpgTN
   I9KwjeyTBngdHhm+2qUao8rHyDyUtgvvtVkHChW3VnzTsvdvhXKyQVfTu
   T16cB34fxe/0KJyKBD2SDy+rqi7All2i3ifYQJwi6KZ35Twk3+myRauAv
   Muy/XFF/U3KP3RWgX6pn+Ik60udF1nEYJ6dIQCUj32JtvatD3Z1TuwPkC
   kpumOzwGngm7N7rAImex0lN039OojFac/j3gnrCvO1/P0Q2gBQagYWwCn
   QS9kBigUCRSVlX2Ot5bld6HDWffwaBgnMw+CwNwURDRHjIAObLV/PNPwc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="368215620"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="368215620"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 19:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="795139286"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="795139286"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Oct 2023 19:29:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxI1k-000CzL-1l;
	Mon, 30 Oct 2023 02:29:16 +0000
Date: Mon, 30 Oct 2023 10:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 8/32] arch/x86/include/asm/string_32.h:150:25:
 warning: '__builtin_memcpy' reading 56 bytes from a region of size 20
Message-ID: <202310301045.KP5glOIs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   47b1b814ae97d7320abbb07741d88b53adb01c1e
commit: 4a80414da4624100d049ee91b156a8cefed0d2a0 [8/32] ZEN: Disable stack conservation for GCC
config: i386-buildonly-randconfig-002-20231030 (https://download.01.org/0day-ci/archive/20231030/202310301045.KP5glOIs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301045.KP5glOIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301045.KP5glOIs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:20,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/aead.h:13,
                    from include/crypto/engine.h:10,
                    from drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:10:
   In function 'virtio_crypto_alg_akcipher_init_session',
       inlined from 'virtio_crypto_rsa_set_key' at drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:425:9:
>> arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' reading 56 bytes from a region of size 20 [-Wstringop-overread]
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:9: note: in expansion of macro 'memcpy'
     131 |         memcpy(&ctrl->u, para, sizeof(ctrl->u));
         |         ^~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c: In function 'virtio_crypto_rsa_set_key':
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:375:52: note: source object 'para' of size 20
     375 |         struct virtio_crypto_akcipher_session_para para;
         |                                                    ^~~~


vim +/__builtin_memcpy +150 arch/x86/include/asm/string_32.h

^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  149  
ff60fab71bb3b4 arch/x86/include/asm/string_32.h Arjan van de Ven 2009-09-28 @150  #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  151  

:::::: The code at line 150 was first introduced by commit
:::::: ff60fab71bb3b4fdbf8caf57ff3739ffd0887396 x86: Use __builtin_memset and __builtin_memcpy for memset/memcpy

:::::: TO: Arjan van de Ven <arjan@infradead.org>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
