Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01ED6AAD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717208513; cv=none; b=RDtTGFr+R08WYGUAxjkfNpKTDnpCU/pM4dpZotEUmVS+5yxLL/tHRP0rcZsHJrn8NEMG4q07cUwyJWWj1FcEq3T7JlGdyrQ1uGMEu5llR1tEyl+moVJpr7hNiBFNxt3blETF7cLsvc6B87okgW4BBruTFpcXe9kcqzZS9e7Qc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717208513; c=relaxed/simple;
	bh=Ddjh324BX2gWPIGDLQuVX7+GF/l1eleRDLGXyuuDxn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1TPRaokqBp9Nm3gPyH3ftfGXUR9KJYBA2Fw4GWYlP2ntwxIOOm2Ed5Hla+jNr5EKMi3WZB5aGq2WTWLZxNJxa9MyP3K+s4V1Rgep5AY++3zzbrtvwiF6GzhRXejFeTRM9SFRdkUO9pntCSF2hOKYYXLSf3240vlXjVvzUP1bfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AV2fEnL+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AV2fEnL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717208510; x=1748744510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ddjh324BX2gWPIGDLQuVX7+GF/l1eleRDLGXyuuDxn0=;
  b=AV2fEnL+MWPZUYfQ8OvQ3F1HawWsWobgZR1Xt1FYcP5N4QGEdEfkpqRO
   2DsDEJDf8frDYRuAD20em8H5IcOquSB9vIJE6JMKizFjNM3UIzabYzbSy
   qyev403hbYzZVQEIcWH4XnGZxwujCzPk5CqG7Wdlnqq4BgbgB+ecYVjKE
   Oylp3aR4BSSuSn3Ua2OFcP32Z2gcSIeBATjWAK+vuW9L0UBPJYA3qU4l3
   RFdPH+HmuU9ywiE18PL24uMfu0crFPPiLn/eq7M1H6MMmbXpBxo2gVHnK
   brOP13pTqMtaVB0/gz60gg4ookbNXqMcv7J+D/dT0iBxKxhP8YFywMOVs
   A==;
X-CSE-ConnectionGUID: sE7BPrjASpGfqudfxyu/uA==
X-CSE-MsgGUID: PMF7bfSsQMmsjxuR/55JRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13994792"
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="13994792"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 19:21:49 -0700
X-CSE-ConnectionGUID: F4tsQ87XRZapVXwrN4/8Bw==
X-CSE-MsgGUID: 0jsrL8LPTgyd2QS0l1dtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,206,1712646000"; 
   d="scan'208";a="67181850"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 May 2024 19:21:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDENA-000IAD-1E;
	Sat, 01 Jun 2024 02:21:39 +0000
Date: Sat, 1 Jun 2024 10:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 1/3] include/linux/elfnote.h:72:24: error:
 function '__UNIQUE_ID' is initialized like a variable
Message-ID: <202406011043.n4dRPEQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   c400d5b1cd1124fd45c7b1a966ce9caad1e406fc
commit: 6a1b99664af09b91f30739d6ecaa83f17545654a [1/3] todo
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406011043.n4dRPEQe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011043.n4dRPEQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011043.n4dRPEQe-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/vdso/note.c:11:
>> include/linux/elfnote.h:72:24: warning: parameter names (without types) in function declaration
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:71:16: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      71 |         static const struct {                                           \
         |                ^~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:72:24: error: function '__UNIQUE_ID' is initialized like a variable
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:72:24: warning: braces around scalar initializer
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:72:24: note: (near initialization for '__UNIQUE_ID')
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:83:25: error: invalid initializer
      83 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:83:25: note: (near initialization for '__UNIQUE_ID')
      83 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:84:25: warning: excess elements in scalar initializer
      84 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:84:25: note: (near initialization for '__UNIQUE_ID')
      84 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> arch/arm/vdso/note.c:14:20: warning: excess elements in scalar initializer
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                    ^
   include/linux/elfnote.h:85:25: note: in definition of macro '_ELFNOTE'
      85 |                         type,                                           \
         |                         ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:20: note: (near initialization for '__UNIQUE_ID')
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                    ^
   include/linux/elfnote.h:85:25: note: in definition of macro '_ELFNOTE'
      85 |                         type,                                           \
         |                         ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:11: warning: excess elements in scalar initializer
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |           ^~~~~~~
   include/linux/elfnote.h:87:17: note: in definition of macro '_ELFNOTE'
      87 |                 name,                                                   \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:11: note: (near initialization for '__UNIQUE_ID')
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |           ^~~~~~~
   include/linux/elfnote.h:87:17: note: in definition of macro '_ELFNOTE'
      87 |                 name,                                                   \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> ./include/generated/uapi/linux/version.h:1:28: warning: excess elements in scalar initializer
       1 | #define LINUX_VERSION_CODE 395520
         |                            ^~~~~~
   include/linux/elfnote.h:88:17: note: in definition of macro '_ELFNOTE'
      88 |                 desc                                                    \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:23: note: in expansion of macro 'LINUX_VERSION_CODE'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                       ^~~~~~~~~~~~~~~~~~
   ./include/generated/uapi/linux/version.h:1:28: note: (near initialization for '__UNIQUE_ID')
       1 | #define LINUX_VERSION_CODE 395520
         |                            ^~~~~~
   include/linux/elfnote.h:88:17: note: in definition of macro '_ELFNOTE'
      88 |                 desc                                                    \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:23: note: in expansion of macro 'LINUX_VERSION_CODE'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                       ^~~~~~~~~~~~~~~~~~
>> include/linux/elfnote.h:72:24: warning: parameter names (without types) in function declaration
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:71:16: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      71 |         static const struct {                                           \
         |                ^~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:72:24: error: function '__UNIQUE_ID' is initialized like a variable
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:77:11: error: conflicting types for '__UNIQUE_ID'; have 'struct <anonymous>()'
      77 |         } __UNIQUE_ID(_note_)                                           \
         |           ^~~~~~~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:77:11: note: previous declaration of '__UNIQUE_ID' with type 'struct <anonymous>()'
      77 |         } __UNIQUE_ID(_note_)                                           \
         |           ^~~~~~~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:72:24: warning: braces around scalar initializer
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:72:24: note: (near initialization for '__UNIQUE_ID')
      72 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:83:25: error: invalid initializer
      83 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:83:25: note: (near initialization for '__UNIQUE_ID')
      83 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:84:25: warning: excess elements in scalar initializer
      84 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:84:25: note: (near initialization for '__UNIQUE_ID')
      84 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:91:9: note: in expansion of macro '_ELFNOTE'
      91 |         _ELFNOTE(size, name, __COUNTER__, type, desc)
         |         ^~~~~~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/build-salt.h:6:40: warning: excess elements in scalar initializer
       6 | #define LINUX_ELFNOTE_BUILD_SALT       0x100
         |                                        ^~~~~
   include/linux/elfnote.h:85:25: note: in definition of macro '_ELFNOTE'
      85 |                         type,                                           \
         |                         ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   include/linux/build-salt.h:16:27: note: in expansion of macro 'LINUX_ELFNOTE_BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/build-salt.h:6:40: note: (near initialization for '__UNIQUE_ID')
       6 | #define LINUX_ELFNOTE_BUILD_SALT       0x100
         |                                        ^~~~~
   include/linux/elfnote.h:85:25: note: in definition of macro '_ELFNOTE'
      85 |                         type,                                           \
         |                         ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   include/linux/build-salt.h:16:27: note: in expansion of macro 'LINUX_ELFNOTE_BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/build-salt.h:16:18: warning: excess elements in scalar initializer
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                  ^~~~~~~
   include/linux/elfnote.h:87:17: note: in definition of macro '_ELFNOTE'
      87 |                 name,                                                   \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/build-salt.h:16:18: note: (near initialization for '__UNIQUE_ID')
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                  ^~~~~~~
   include/linux/elfnote.h:87:17: note: in definition of macro '_ELFNOTE'
      87 |                 name,                                                   \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> ./include/generated/autoconf.h:2556:27: warning: excess elements in scalar initializer
    2556 | #define CONFIG_BUILD_SALT ""
         |                           ^~
   include/linux/elfnote.h:88:17: note: in definition of macro '_ELFNOTE'
      88 |                 desc                                                    \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   include/linux/build-salt.h:16:53: note: in expansion of macro 'CONFIG_BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                                                     ^~~~~~~~~~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   ./include/generated/autoconf.h:2556:27: note: (near initialization for '__UNIQUE_ID')
    2556 | #define CONFIG_BUILD_SALT ""
         |                           ^~
   include/linux/elfnote.h:88:17: note: in definition of macro '_ELFNOTE'
      88 |                 desc                                                    \
         |                 ^~~~
   include/linux/elfnote.h:93:37: note: in expansion of macro 'ELFNOTE'
      93 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   include/linux/build-salt.h:16:53: note: in expansion of macro 'CONFIG_BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                                                     ^~~~~~~~~~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~


vim +/__UNIQUE_ID +72 include/linux/elfnote.h

810bab448e563f Jeremy Fitzhardinge 2007-07-17  55  
810bab448e563f Jeremy Fitzhardinge 2007-07-17  56  #define ELFNOTE(name, type, desc)		\
51da9dfb7f2091 Nick Desaulniers    2020-06-04  57  	ELFNOTE_START(name, type, "a")		\
810bab448e563f Jeremy Fitzhardinge 2007-07-17  58  		desc			;	\
810bab448e563f Jeremy Fitzhardinge 2007-07-17  59  	ELFNOTE_END
810bab448e563f Jeremy Fitzhardinge 2007-07-17  60  
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  61  #else	/* !__ASSEMBLER__ */
b558051725c5f7 Vincenzo Frascino   2020-03-20  62  #include <uapi/linux/elf.h>
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  63  /*
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  64   * Use an anonymous structure which matches the shape of
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  65   * Elf{32,64}_Nhdr, but includes the name and desc data.  The size and
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  66   * type of name and desc depend on the macro arguments.  "name" must
6a1b99664af09b Josh Poimboeuf      2024-03-23  67   * be a literal string, and "desc" must be passed by value.
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  68   */
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  69  #define _ELFNOTE_PASTE(a,b)	a##b
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  70  #define _ELFNOTE(size, name, unique, type, desc)			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @71  	static const struct {						\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @72  		struct elf##size##_note _nhdr;				\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  73  		unsigned char _name[sizeof(name)]			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  74  		__attribute__((aligned(sizeof(Elf##size##_Word))));	\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  75  		typeof(desc) _desc					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  76  			     __attribute__((aligned(sizeof(Elf##size##_Word)))); \
6a1b99664af09b Josh Poimboeuf      2024-03-23 @77  	} __UNIQUE_ID(_note_)						\
3ff6eecca4e5c4 Adrian Bunk         2008-01-24  78  		__used							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  79  		__attribute__((section(".note." name),			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  80  			       aligned(sizeof(Elf##size##_Word)),	\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  81  			       unused)) = {				\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  82  		{							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @83  			sizeof(name),					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @84  			sizeof(desc),					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  85  			type,						\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  86  		},							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  87  		name,							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  88  		desc							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  89  	}
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  90  #define ELFNOTE(size, name, type, desc)		\
6a1b99664af09b Josh Poimboeuf      2024-03-23 @91  	_ELFNOTE(size, name, __COUNTER__, type, desc)
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  92  
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @93  #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  94  #define ELFNOTE64(name, type, desc) ELFNOTE(64, name, type, desc)
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  95  #endif	/* __ASSEMBLER__ */
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  96  

:::::: The code at line 72 was first introduced by commit
:::::: 9c9b8b388296ad5a306ab238dc677cfe6ff4cb12 [PATCH] x86: put .note.* sections into a PT_NOTE segment in vmlinux

:::::: TO: Jeremy Fitzhardinge <jeremy@xensource.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
