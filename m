Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C713AD26
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763923162; cv=none; b=YqoHebokZF0HD6nqT83J5bHwaKtDEF2XXYQ/tPIcCBEXXHTjoSVzOkmKiIwmqjYq9rtUBNqVHxCQAcH5fzgJg63enEzA+/WJ0cO4R/XgTN76dhS76nE0ba6jBS2ZMEm6OU+QXQY0c1LIcPIW54bylENDyYq6UbL0wSgBkSz6Zus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763923162; c=relaxed/simple;
	bh=G5ywtp2uqJd1w7MjxiQLKk2lmYsbYqJDwiS12/hD4xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mX158+8Ztud6t0EgBhXa1RWJmyYGdWsLWVKeu9jo+kmXkPdvpSmHTFcn2oKikGkhOmkOQX8XxXVxqAw8Y0Enr38YeBlbEtGUF0SeoZgyx0oJcdz8gWDXqDelN2YaHniqZ8QfnSTCV9xvF4EILMV+5HHJ2K0o2TPq/hw/BoHWVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JlXmZS0k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JlXmZS0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763923160; x=1795459160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G5ywtp2uqJd1w7MjxiQLKk2lmYsbYqJDwiS12/hD4xg=;
  b=JlXmZS0k2l8ms+ecMQKvJpP6EkZguLgK4G0zY+Kx8yktX8F49N8dJ/uP
   aRf781DSB4PPOlUoI7CFSlsv9puXjlRzZ/bXSBKT7/7eq9jqFDAQCh1lu
   WMg6/MG2CHi7qKXvn7d4x+65fw0YI6aj8LKtVX6hZqr32yrl9j6vDjk8x
   6yXaoa59jSHEqN23lELZLTS12EjIW7PNm7n4474TSkFcP28cKhjOvHrRg
   7iInahYMXRog1hHCZJ2s0TZU65gsNcR7WzLiDxGIZhDR3LckAUNxuGQ4W
   lImASc9GTT2nnH5u7id96yZT2D26omMrGqO9xMS90RDnZNSOcOnT6lngW
   Q==;
X-CSE-ConnectionGUID: wAraY/PVTIWMO8xqbzTDWw==
X-CSE-MsgGUID: b6GVjgsbRneiVSHAmc6kdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77406729"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="77406729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 10:39:19 -0800
X-CSE-ConnectionGUID: a0FRhlmfRLa5C3kLn6CTHQ==
X-CSE-MsgGUID: HiVdekBwQnOj0Wbh04L0Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="197071270"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Nov 2025 10:39:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNEzT-00000000033-3w2f;
	Sun, 23 Nov 2025 18:39:15 +0000
Date: Sun, 23 Nov 2025 19:39:03 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 7/9]
 lib/crypto/poly1305.c:25:6: warning: no previous prototype for
 'poly1305_init'
Message-ID: <202511231932.WEsEtHmG-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251123/202511231932.WEsEtHmG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231932.WEsEtHmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231932.WEsEtHmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/crypto/internal/poly1305.h:9,
                    from lib/crypto/poly1305.c:10:
   include/crypto/poly1305.h:62:33: error: 'at_least' undeclared here (not in a function)
      62 |                    const u8 key[at_least POLY1305_KEY_SIZE]);
         |                                 ^~~~~~~~
   include/crypto/poly1305.h:62:41: error: expected ']' before numeric constant
      62 |                    const u8 key[at_least POLY1305_KEY_SIZE]);
         |                                         ^
         |                                         ]
>> lib/crypto/poly1305.c:25:6: warning: no previous prototype for 'poly1305_init' [-Wmissing-prototypes]
      25 | void poly1305_init(struct poly1305_desc_ctx *desc,
         |      ^~~~~~~~~~~~~


vim +/poly1305_init +25 lib/crypto/poly1305.c

b646b782e522da Eric Biggers   2025-08-29  24  
10a6d72ea355b7 Herbert Xu     2025-04-28 @25  void poly1305_init(struct poly1305_desc_ctx *desc,
8d195e7a8ada68 Arnd Bergmann  2021-03-22  26  		   const u8 key[POLY1305_KEY_SIZE])
a1d93064094cc5 Ard Biesheuvel 2019-11-08  27  {
a1d93064094cc5 Ard Biesheuvel 2019-11-08  28  	desc->s[0] = get_unaligned_le32(key + 16);
a1d93064094cc5 Ard Biesheuvel 2019-11-08  29  	desc->s[1] = get_unaligned_le32(key + 20);
a1d93064094cc5 Ard Biesheuvel 2019-11-08  30  	desc->s[2] = get_unaligned_le32(key + 24);
a1d93064094cc5 Ard Biesheuvel 2019-11-08  31  	desc->s[3] = get_unaligned_le32(key + 28);
a1d93064094cc5 Ard Biesheuvel 2019-11-08  32  	desc->buflen = 0;
b646b782e522da Eric Biggers   2025-08-29  33  	poly1305_block_init(&desc->state, key);
a1d93064094cc5 Ard Biesheuvel 2019-11-08  34  }
10a6d72ea355b7 Herbert Xu     2025-04-28  35  EXPORT_SYMBOL(poly1305_init);
a1d93064094cc5 Ard Biesheuvel 2019-11-08  36  

:::::: The code at line 25 was first introduced by commit
:::::: 10a6d72ea355b730aa9702da0fd36aef0898a80e crypto: lib/poly1305 - Use block-only interface

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
