Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F319F43A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763902975; cv=none; b=BkhetsOiB3u+x00+BIYcLOUL3ZSc9zE3xLwX6vZzTPyiDYNlm5RMXM1hr9y+EJU9LWBwR6USeLCJqZY84uW71OqT6mdBjZvSPfuYWdwUZG2ljn0TehY7TbVHqwRAOdFqDucMqdMnmK70yiAw6oloeODCOqdOJixAS8AlRbHgMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763902975; c=relaxed/simple;
	bh=mX1OmyihLPs751Izt7VAJwhktc7iaPf0T9GKK/TU5Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yw0AcO1aHafrn7x1EWxvNrzO6mLO6mOjcrmlm5pd5bSOvx4Wil7SqgcyDT5v7tbEMwoXu8MuRQOBki/hpXoi1JbYJHG3lSyO8vugyygVn+wgSn8xf5SQuHma5wCo1RzPYDGEMaetDbKdRlcx4Y2G3No+ZQ2ufeS5hxuuAS8+vNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtNESCeK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtNESCeK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763902974; x=1795438974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mX1OmyihLPs751Izt7VAJwhktc7iaPf0T9GKK/TU5Hk=;
  b=NtNESCeK0Opy/sAugdJJ48vN1hUaci32EisCtBFOruqLJU8QswOOb6dK
   Q/yeMRFI5KkKPJ7dfqREmGPAVZpHtEPQuNG3HfWop097cRKxoHHAWrDS1
   6uSMnemtIm3kKqIqPr2Sfpcwv/PiF/XCqsikJYrgFmAJn4nqdC08Mdb+2
   5ieBykiOuQhOx1F7BHIcjsVYia3C684gb4WGPAE/0MWQUmTAN4dXrmo7r
   c2SmvaDBQZUcFwVDh8xkB77IirO6Lmm5EUd99K3raUofSnc4HTBlivT7P
   oaB4JhFBTnu1OG7p6zw+MdyWAWr1fM+SVpJQQRjvVBJgPnqnTuqbtcWNA
   A==;
X-CSE-ConnectionGUID: hBSM035eTq2zxWbfYdbxeQ==
X-CSE-MsgGUID: ZQGqt6JtR8+8eGMLH8D58g==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77288352"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="77288352"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 05:02:54 -0800
X-CSE-ConnectionGUID: am7oARSxQh297YFhlfzcQQ==
X-CSE-MsgGUID: C/M1RJZySB6hwtNGaKvZeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="192209027"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 23 Nov 2025 05:02:52 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vN9ju-000000002PL-143O;
	Sun, 23 Nov 2025 13:02:50 +0000
Date: Sun, 23 Nov 2025 14:01:50 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 7/9]
 lib/crypto/tests/poly1305_kunit.c:21:9: error: implicit declaration of
 function 'poly1305_init'; did you mean 'poly1305_final'?
Message-ID: <202511231439.zmY26jGq-lkp@intel.com>
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
commit: fb3cc420c064f330263417ab3ceeb27095d918c6 [7/9] lib/crypto: poly1305: Add at_least decoration to fixed-size array params
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251123/202511231439.zmY26jGq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231439.zmY26jGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231439.zmY26jGq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/tests/poly1305_kunit.c:5:
   include/crypto/poly1305.h:62:33: error: 'at_least' undeclared here (not in a function)
      62 |                    const u8 key[at_least POLY1305_KEY_SIZE]);
         |                                 ^~~~~~~~
   include/crypto/poly1305.h:62:41: error: expected ']' before numeric constant
      62 |                    const u8 key[at_least POLY1305_KEY_SIZE]);
         |                                         ^
         |                                         ]
   lib/crypto/tests/poly1305_kunit.c: In function 'poly1305':
>> lib/crypto/tests/poly1305_kunit.c:21:9: error: implicit declaration of function 'poly1305_init'; did you mean 'poly1305_final'? [-Wimplicit-function-declaration]
      21 |         poly1305_init(&ctx, key);
         |         ^~~~~~~~~~~~~
         |         poly1305_final


vim +21 lib/crypto/tests/poly1305_kunit.c

6dd4d9f7919e73 Eric Biggers 2025-07-09  14  
6dd4d9f7919e73 Eric Biggers 2025-07-09  15  /* This probably should be in the actual API, but just define it here for now */
6dd4d9f7919e73 Eric Biggers 2025-07-09  16  static void poly1305(const u8 key[POLY1305_KEY_SIZE], const u8 *data,
6dd4d9f7919e73 Eric Biggers 2025-07-09  17  		     size_t len, u8 out[POLY1305_DIGEST_SIZE])
6dd4d9f7919e73 Eric Biggers 2025-07-09  18  {
6dd4d9f7919e73 Eric Biggers 2025-07-09  19  	struct poly1305_desc_ctx ctx;
6dd4d9f7919e73 Eric Biggers 2025-07-09  20  
6dd4d9f7919e73 Eric Biggers 2025-07-09 @21  	poly1305_init(&ctx, key);
6dd4d9f7919e73 Eric Biggers 2025-07-09  22  	poly1305_update(&ctx, data, len);
6dd4d9f7919e73 Eric Biggers 2025-07-09  23  	poly1305_final(&ctx, out);
6dd4d9f7919e73 Eric Biggers 2025-07-09  24  }
6dd4d9f7919e73 Eric Biggers 2025-07-09  25  

:::::: The code at line 21 was first introduced by commit
:::::: 6dd4d9f7919e73bc7ad247eca82e8be1c123af0a lib/crypto: tests: Add KUnit tests for Poly1305

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
