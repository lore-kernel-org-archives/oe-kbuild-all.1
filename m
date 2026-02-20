Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A765280324
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619013; cv=none; b=BOi+V1WyV1tm+7wH6G3QMwlDBlKk3nizaaZyLBS3TnSnwOgS+tgF/RrJ264GnUBMdGpBFLn27bnFXlAWkDNKHDtgdMm78uOg9TojO2X6ES3K7fUqmaOUS7xQvKEaruA+kpwrD82h6UIREx3/6OjMdxyhEU/fERmTdP2HBqZD9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619013; c=relaxed/simple;
	bh=VW7gqAhQGJeEPX4535oVHfTYvfT2lf7ccyx10rHOQP8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uiMJl4Bk6LJ0M/5Wul5PcTZF99tFr3yeKXAX1POjSUkK2WJwilwd9poxsnFuTMwqK09gjO2atbfyTYBVO48GncgIseuOQ9PiC1OkmTjXixuTLBUT6aOOXJht0Gzak52qK9RE+zdP1taxcBwZxGWtVyfo5gckgOrqXe5L8Rsrl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzujQF/r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzujQF/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771619012; x=1803155012;
  h=date:from:to:cc:subject:message-id;
  bh=VW7gqAhQGJeEPX4535oVHfTYvfT2lf7ccyx10rHOQP8=;
  b=GzujQF/rM5jD1lCykckJpSkR6Zw5fUm8Jg0coITgXEmzYilFtcWPDGZE
   ljDmruaUFnP5p2wjaiczbM/+ifmC2guWqzeHGbqxa0ch+aJ/T9hf0P6RU
   kjhKyn75nWHCjozWZHZ6UQNRSHbtTRB17aG+XFtrPrFT3qnRNnXzktuDI
   PgUPy8l8+3QRgZQuEkHwrpUlvJQIpShJBC59vzItIvKNkUx4ZUz4N+pHR
   iJnNXlcyGUPhMqrgINCzf8KWiO68T/SJR/GRaKBPftb7r95KKQjoqTbQ5
   f/LbnUyRZblgcIyrWt6qmP0GOPSmBsIF/0o6yEmksXuT6Z7UqbLxOhz6k
   Q==;
X-CSE-ConnectionGUID: RuCyBcf5TRi95V7Y/V59Jw==
X-CSE-MsgGUID: imMmaxwPQxifyh1Rw3ycmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76578502"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76578502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 12:23:31 -0800
X-CSE-ConnectionGUID: 3U97ou+TTRK1CWUdEDBLfQ==
X-CSE-MsgGUID: kVRbDWX5TYSurmLsYegw9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219457861"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2026 12:23:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtX26-000000014SS-47ww;
	Fri, 20 Feb 2026 20:23:26 +0000
Date: Sat, 21 Feb 2026 04:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:iino-u64 2/29] fs/crypto/keysetup.c:94:15: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 2 has
 type 'u64' {aka 'const long long unsigned int'}
Message-ID: <202602210422.ai9mEoqW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git iino-u64
head:   5aef1b33e04ec98ed6f4a02ce457ecdc39b794dd
commit: a84299eafee5781e2616860a83f947d8b2c7daee [2/29] vfs: change i_ino from unsigned long to u64
config: m68k-randconfig-r072-20260221 (https://download.01.org/0day-ci/archive/20260221/202602210422.ai9mEoqW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210422.ai9mEoqW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210422.ai9mEoqW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/crypto/skcipher.h:11,
                    from fs/crypto/keysetup.c:11:
   fs/crypto/keysetup.c: In function 'select_encryption_mode':
>> fs/crypto/keysetup.c:94:15: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'u64' {aka 'const long long unsigned int'} [-Wformat=]
     WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        inode->i_ino, (inode->i_mode & S_IFMT));
        ~~~~~~~~~~~~
   include/linux/printk.h:134:11: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
              ^~~
   include/asm-generic/bug.h:219:41: note: in expansion of macro 'WARN'
    #define WARN_ONCE(condition, format...) WARN(condition, format)
                                            ^~~~
   fs/crypto/keysetup.c:94:2: note: in expansion of macro 'WARN_ONCE'
     WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
     ^~~~~~~~~


vim +94 fs/crypto/keysetup.c

e3b1078bedd323 fs/crypto/keysetup.c Eric Biggers  2020-05-15  81  
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  82  static struct fscrypt_mode *
5dae460c2292db fs/crypto/keysetup.c Eric Biggers  2019-08-04  83  select_encryption_mode(const union fscrypt_policy *policy,
5dae460c2292db fs/crypto/keysetup.c Eric Biggers  2019-08-04  84  		       const struct inode *inode)
8f39850dffa9cb fs/crypto/keyinfo.c  Eric Biggers  2016-09-15  85  {
3ceb6543e9cf6e fs/crypto/keysetup.c Eric Biggers  2020-10-23  86  	BUILD_BUG_ON(ARRAY_SIZE(fscrypt_modes) != FSCRYPT_MODE_MAX + 1);
3ceb6543e9cf6e fs/crypto/keysetup.c Eric Biggers  2020-10-23  87  
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  88  	if (S_ISREG(inode->i_mode))
85af90e57ce969 fs/crypto/keysetup.c Eric Biggers  2019-12-09  89  		return &fscrypt_modes[fscrypt_policy_contents_mode(policy)];
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  90  
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  91  	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
85af90e57ce969 fs/crypto/keysetup.c Eric Biggers  2019-12-09  92  		return &fscrypt_modes[fscrypt_policy_fnames_mode(policy)];
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  93  
b7e7cf7a66a27e fs/crypto/keyinfo.c  Daniel Walter 2017-06-19 @94  	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
b7e7cf7a66a27e fs/crypto/keyinfo.c  Daniel Walter 2017-06-19  95  		  inode->i_ino, (inode->i_mode & S_IFMT));
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers  2018-05-18  96  	return ERR_PTR(-EINVAL);
8f39850dffa9cb fs/crypto/keyinfo.c  Eric Biggers  2016-09-15  97  }
8f39850dffa9cb fs/crypto/keyinfo.c  Eric Biggers  2016-09-15  98  

:::::: The code at line 94 was first introduced by commit
:::::: b7e7cf7a66a27e62c5f873a0068cee34094bf5d7 fscrypt: add support for AES-128-CBC

:::::: TO: Daniel Walter <dwalter@sigma-star.at>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
