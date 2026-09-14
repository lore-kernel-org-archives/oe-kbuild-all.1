Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75593D410D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 10:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383344; cv=none; b=NAMcWxpMjMK1Bib2ywBsCUxWT6V9eJf0MsaO9sYqErLNxaYlUZBFLU0/xkFYTjAy3rb6B9GTwBYQzIsb9Tggkqqh3VAMHdF7ztQ6o6x8Z3qZtAM6YYK/Lk0NpP8RmDmpdpEx9ev9pJ7YvOJfbs3VJVfzG7Lco8UFwljz7rM39K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383344; c=relaxed/simple;
	bh=bcZu5AdhBB7O7Jgak0zf5lpKY2UwOCiPUrPJOZNIMhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X6u2Lt0XwDBf8LgvgNUFMC2zdhrI4qPRRNtJpjhZjBDvxm7+wBOKm5zUHjhTk3W2OTf8avEJsfg6VSAxV4y13Y5AdH2Ew0dfz55izQ8OXtdl6YafAHwdNkXpvTazHsBw9r7N0h+1VFwXPiHf9eoo8+uaG9yFDhSNH00FlhilSlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ek4FZkKi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek4FZkKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789383341; x=1820919341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcZu5AdhBB7O7Jgak0zf5lpKY2UwOCiPUrPJOZNIMhY=;
  b=ek4FZkKilAOD6mQ+S8wvZP4AyMLueDlzMea4UpUW6oSPYNYSfGWk+OJs
   cRZbxc+MYdf01MZEDxPWjIFCoBX29vK3JGxAjj0oA6j2257KyJ8utJ9Bq
   MUF2XDU/gsQVocGh0K4Kv7U14JOPLR/4ZRKhNT02TwQt++3SbvpKTGJw1
   VMG+99enIS0gXFrKqYaEHVn2FloLAZ+0GH4V49JWxUoGUMKZZnJReK2Dr
   Z1Ho7rOJ2poVp7nRaangHdbK4HGzchjN7bSqABL+eoyXtaOVzTAIkmAl4
   s9M3KfHYgPn5ANVO4hnnLYMw804DhyDvNuT7t/Z2jVMj996jJMn9wGY09
   A==;
X-CSE-ConnectionGUID: tP8pLhTNQk6sRvFJCLNumw==
X-CSE-MsgGUID: 0yZNYbQjTDez0nuX6Cl0TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="112503149"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="112503149"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 03:55:37 -0700
X-CSE-ConnectionGUID: eO+pTJlJTCqAlDiv2NXDBw==
X-CSE-MsgGUID: 7EVSnZwZTRWODR608vUZ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="277876575"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Sep 2026 03:55:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x64LU-000000002nJ-1p9h;
	Mon, 14 Sep 2026 10:55:32 +0000
Date: Mon, 14 Sep 2026 18:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:ksyms-tune 5/6] scripts/kallsyms.c:49:27: warning:
 variable '_text' set but not used
Message-ID: <202609141829.cQCchGgp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git ksyms-tune
head:   bc5ee628d6230f6c491f1b868aa7a201bf2ee513
commit: 06196ddaa223ca1846bf133c6c24e1db2a82a962 [5/6] kallsyms: Pack symbols into fixed-length buckets to drop length prefixes
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260914/202609141829.cQCchGgp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141829.cQCchGgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141829.cQCchGgp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/kallsyms.c:49:27: warning: variable '_text' set but not used [-Wunused-but-set-global]
      49 | static unsigned long long _text;
         |                           ^
   1 warning generated.
   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/riscv/kernel/vdso/Makefile:78: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:156: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/_text +49 scripts/kallsyms.c

17b1f0de79dbdf Mike Frysinger 2009-06-08  48  
17b1f0de79dbdf Mike Frysinger 2009-06-08 @49  static unsigned long long _text;
78eb71594b3265 Kees Cook      2014-03-17  50  static struct addr_range text_ranges[] = {
17b1f0de79dbdf Mike Frysinger 2009-06-08  51  	{ "_stext",     "_etext"     },
17b1f0de79dbdf Mike Frysinger 2009-06-08  52  	{ "_sinittext", "_einittext" },
17b1f0de79dbdf Mike Frysinger 2009-06-08  53  };
17b1f0de79dbdf Mike Frysinger 2009-06-08  54  #define text_range_text     (&text_ranges[0])
17b1f0de79dbdf Mike Frysinger 2009-06-08  55  #define text_range_inittext (&text_ranges[1])
17b1f0de79dbdf Mike Frysinger 2009-06-08  56  

:::::: The code at line 49 was first introduced by commit
:::::: 17b1f0de79dbdf5cfb2686b63a7fb9ecc440da7c kallsyms: generalize text region handling

:::::: TO: Mike Frysinger <vapier@gentoo.org>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
