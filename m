Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767101EB5FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763848444; cv=none; b=gpVBqx6IACCGhwY/wYwCBDjxm48Hkcc4dFpFBP+QUwa54HWwhGqcJU9hjonamGOx67XnWZsK+vAVik4SoFGiqPC28lVNI00NeuHeH1TP6SZxm5wWlux8uZWGJItm60C7iI7J9IdsoO3VQMTQpgwUSktmYWRPNBMh/yuMoFNW1r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763848444; c=relaxed/simple;
	bh=fNrPXtZJZ2PKxBUncRLXLXJsvWJw3knlDpmiUanF0lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCh+uaa5/FOsjjhlFXBeutri0kTBqijyBQBPXwrkh8sH7BYQwlARP/W1fjIeGnnZO7pUS+pklqnJjGRzDG/W1efxgBosDMPlyzrJE4beJMWH0UEw37j83yoWC02ZtJQ1ctfmoJ+0uR1OfWjQNhHbaO1Pg1MXnt9qqxeGXY689zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BS6V6fIf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BS6V6fIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763848442; x=1795384442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNrPXtZJZ2PKxBUncRLXLXJsvWJw3knlDpmiUanF0lo=;
  b=BS6V6fIfkSs9dCO4jtNmX50Zrw7niVfyrxIWcBuV6ZLOKrDL6xS9unrl
   VFwtiL8nRLiU1FsCRfa1cejfhYM3aCUp8CwX9QUGM9eUxQObnELnUQgVr
   LulTDTGlzVb0lEw5lAidb99Vu4tBbSndsk26AfT5MPK5wSsCWoo2JzUPD
   b/7lSXvsa7fpwai7QjuOosU0YS9wpRIXTRNbHvXGdaQdRcpZXxbMl3br+
   g1FP7R3sfLWWZo2uuHUWpcG2rmY75h4Wt2SWePZSkQbHvkim2Ng6mn4+M
   tbcemVixWpOkJdCHZj3oLSpMpEIKHAN+AEfMwHQjiSa65c7ffj7A8Fm6Y
   A==;
X-CSE-ConnectionGUID: xal12noXREyFMUHIyp8BSA==
X-CSE-MsgGUID: o8DfhW2oT/qqxyBAh+w9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="64907425"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="64907425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 13:54:01 -0800
X-CSE-ConnectionGUID: 7cFRr9tuS7a9J8NtD4NX7Q==
X-CSE-MsgGUID: Nz7pm5PWS/GHKkCZm9YiIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="196276533"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2025 13:53:59 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMvYL-0007rF-1y;
	Sat, 22 Nov 2025 21:53:57 +0000
Date: Sun, 23 Nov 2025 05:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 9/9]
 arch/riscv/purgatory/purgatory.c:30:9: error: implicit declaration of
 function 'sha256_final'; did you mean 'sha256_init'?
Message-ID: <202511230501.q6G5lJGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
commit: da707520ed1dbaed0ef9666f7adfac8910423a1f [9/9] lib/crypto: sha2: Add at_least decoration to fixed-size array params
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20251123/202511230501.q6G5lJGT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230501.q6G5lJGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230501.q6G5lJGT-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                              ^~~~~~~~
   include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
         |                                      ^
         |                                      ]
   include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
     397 |                      u8 out2[at_least SHA256_DIGEST_SIZE]);
         |                      ^~
   include/crypto/sha2.h:495:31: error: 'at_least' undeclared here (not in a function)
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:495:39: error: expected ']' before numeric constant
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:510:25: error: 'at_least' undeclared here (not in a function)
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:510:33: error: expected ']' before numeric constant
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:527:37: error: 'at_least' undeclared here (not in a function)
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:527:45: error: expected ']' before numeric constant
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:606:50: error: 'at_least' undeclared here (not in a function)
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:606:58: error: expected ']' before numeric constant
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:616:48: error: 'at_least' undeclared here (not in a function)
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:616:56: error: expected ']' before numeric constant
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:704:31: error: 'at_least' undeclared here (not in a function)
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:704:39: error: expected ']' before numeric constant
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:719:25: error: 'at_least' undeclared here (not in a function)
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:719:33: error: expected ']' before numeric constant
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:736:37: error: 'at_least' undeclared here (not in a function)
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:736:45: error: expected ']' before numeric constant
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:781:50: error: 'at_least' undeclared here (not in a function)
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:781:58: error: expected ']' before numeric constant
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:791:48: error: 'at_least' undeclared here (not in a function)
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:791:56: error: expected ']' before numeric constant
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:879:31: error: 'at_least' undeclared here (not in a function)
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:879:39: error: expected ']' before numeric constant
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:894:25: error: 'at_least' undeclared here (not in a function)
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:894:33: error: expected ']' before numeric constant
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:911:37: error: 'at_least' undeclared here (not in a function)
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:911:45: error: expected ']' before numeric constant
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   arch/riscv/purgatory/purgatory.c: In function 'verify_sha256_digest':
>> arch/riscv/purgatory/purgatory.c:30:9: error: implicit declaration of function 'sha256_final'; did you mean 'sha256_init'? [-Wimplicit-function-declaration]
      30 |         sha256_final(&sctx, digest);
         |         ^~~~~~~~~~~~
         |         sha256_init


vim +30 arch/riscv/purgatory/purgatory.c

736e30af583fb6 Li Zhengyu   2022-04-08  19  
736e30af583fb6 Li Zhengyu   2022-04-08  20  static int verify_sha256_digest(void)
736e30af583fb6 Li Zhengyu   2022-04-08  21  {
736e30af583fb6 Li Zhengyu   2022-04-08  22  	struct kexec_sha_region *ptr, *end;
b86ced882b8e66 Eric Biggers 2025-06-30  23  	struct sha256_ctx sctx;
736e30af583fb6 Li Zhengyu   2022-04-08  24  	u8 digest[SHA256_DIGEST_SIZE];
736e30af583fb6 Li Zhengyu   2022-04-08  25  
b86ced882b8e66 Eric Biggers 2025-06-30  26  	sha256_init(&sctx);
736e30af583fb6 Li Zhengyu   2022-04-08  27  	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
736e30af583fb6 Li Zhengyu   2022-04-08  28  	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
b86ced882b8e66 Eric Biggers 2025-06-30  29  		sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
b86ced882b8e66 Eric Biggers 2025-06-30 @30  	sha256_final(&sctx, digest);
736e30af583fb6 Li Zhengyu   2022-04-08  31  	if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
736e30af583fb6 Li Zhengyu   2022-04-08  32  		return 1;
736e30af583fb6 Li Zhengyu   2022-04-08  33  	return 0;
736e30af583fb6 Li Zhengyu   2022-04-08  34  }
736e30af583fb6 Li Zhengyu   2022-04-08  35  

:::::: The code at line 30 was first introduced by commit
:::::: b86ced882b8e667758afddffd8d6354197842110 lib/crypto: sha256: Make library API use strongly-typed contexts

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
