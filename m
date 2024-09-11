Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B41836FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 11:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054496; cv=none; b=pTOsHjah/FzI0FZfpYZ/rzB8TOvtQBdXUJs6wSoz8l2MrpuWvfMleoEsZt8Xr0hZMqQHTfvRoR71oVM8P+5fwwFcS2jtineLohOaNE4cz+ZJAEI42D4rjyDtSR1BS/qduSRTrq/nKAF+na7GNQk6DwDnameypP3USvbr5JtYFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054496; c=relaxed/simple;
	bh=XrcuRgxyB6IMldI2kcqGThV8MtJy2EnySp46Z/hVTjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FEDu61ItYld+5XLTW63tpuTekY1AgDoIbkitJQGL/L3Jsb+X/4XGBC27ZlpcaZ6kK988eqPBU0UFyk3hHLDtb8RmGZaEN7jVdlx7WDzzQEvqzScc/gZcvaN0tlh1XkwUKTyEHBo5MojvEGJKB05ztpzGiXGvwkvpJ7GUVCZpl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MErWA5z4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MErWA5z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726054494; x=1757590494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XrcuRgxyB6IMldI2kcqGThV8MtJy2EnySp46Z/hVTjU=;
  b=MErWA5z4l3Nj1hjW1e6y6gXny+HGCjX2zbtaOdBQq7I+iRuV6eJmw3cB
   8HbT+1lDgmi0Str2zgBVFXTBDgU7gafl4HMwy/S8bNOWT1xf1IBWC7XmX
   b6INANLGY49DFFakqKDQ5DKuyU6u1thGzbY8R1S8xzqr0h9XtVQzohm0P
   k8nz9GbgKGcKrGeMyBsmegLlCmuwP+pszKVc9Fy4vuwvzcaoca8li6Kof
   +RLys2daw7ylc3xwy1d5X7CZ7PCkuqIMk9wVbwkOcijURAGXMReg0Q1TW
   ozLIDRfXNi9WUGXHTNapafVZKL3ycaIpAoccyEv7Y0Yjb/C0OR0moMK84
   w==;
X-CSE-ConnectionGUID: hI6N+lv/QSCxxRMksJkSiQ==
X-CSE-MsgGUID: L4mmeFYwRaSqIZKK9DTt5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42326104"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="42326104"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 04:34:51 -0700
X-CSE-ConnectionGUID: EjtlxFq4RNasyJaBCfacXA==
X-CSE-MsgGUID: brdzsN97Q0yOD1IpUoC3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67355737"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Sep 2024 04:34:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soLcU-0003T8-20;
	Wed, 11 Sep 2024 11:34:46 +0000
Date: Wed, 11 Sep 2024 19:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build-v1.5 6/33] include/linux/elfnote.h:71:24: error:
 parameter names (without types) in function declaration
Message-ID: <202409111942.A54CyXac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-v1.5
head:   2abe29f4f173c4090c0030c43c30053694b1658a
commit: f1cb9326e751c8ea49d315b984a72384794707a0 [6/33] elfnote: Use __UNIQUE_ID() for note symbols
config: arm-hisi_defconfig (https://download.01.org/0day-ci/archive/20240911/202409111942.A54CyXac-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111942.A54CyXac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111942.A54CyXac-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/vdso/note.c:11:
>> include/linux/elfnote.h:71:24: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:70:16: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      70 |         static const struct {                                           \
         |                ^~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:71:24: error: function '__UNIQUE_ID' is initialized like a variable
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:71:24: warning: braces around scalar initializer
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:71:24: note: (near initialization for '__UNIQUE_ID')
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
>> include/linux/elfnote.h:82:25: error: invalid initializer
      82 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:82:25: note: (near initialization for '__UNIQUE_ID')
      82 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:83:25: warning: excess elements in scalar initializer
      83 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:83:25: note: (near initialization for '__UNIQUE_ID')
      83 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:20: warning: excess elements in scalar initializer
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                    ^
   include/linux/elfnote.h:84:25: note: in definition of macro 'ELFNOTE'
      84 |                         type,                                           \
         |                         ^~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:20: note: (near initialization for '__UNIQUE_ID')
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                    ^
   include/linux/elfnote.h:84:25: note: in definition of macro 'ELFNOTE'
      84 |                         type,                                           \
         |                         ^~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:11: warning: excess elements in scalar initializer
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |           ^~~~~~~
   include/linux/elfnote.h:86:17: note: in definition of macro 'ELFNOTE'
      86 |                 name,                                                   \
         |                 ^~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:11: note: (near initialization for '__UNIQUE_ID')
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |           ^~~~~~~
   include/linux/elfnote.h:86:17: note: in definition of macro 'ELFNOTE'
      86 |                 name,                                                   \
         |                 ^~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   ./include/generated/uapi/linux/version.h:1:28: warning: excess elements in scalar initializer
       1 | #define LINUX_VERSION_CODE 396032
         |                            ^~~~~~
   include/linux/elfnote.h:87:17: note: in definition of macro 'ELFNOTE'
      87 |                 desc                                                    \
         |                 ^~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:23: note: in expansion of macro 'LINUX_VERSION_CODE'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                       ^~~~~~~~~~~~~~~~~~
   ./include/generated/uapi/linux/version.h:1:28: note: (near initialization for '__UNIQUE_ID')
       1 | #define LINUX_VERSION_CODE 396032
         |                            ^~~~~~
   include/linux/elfnote.h:87:17: note: in definition of macro 'ELFNOTE'
      87 |                 desc                                                    \
         |                 ^~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   arch/arm/vdso/note.c:14:23: note: in expansion of macro 'LINUX_VERSION_CODE'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         |                       ^~~~~~~~~~~~~~~~~~
>> include/linux/elfnote.h:71:24: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:70:16: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      70 |         static const struct {                                           \
         |                ^~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:71:24: error: function '__UNIQUE_ID' is initialized like a variable
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:76:11: error: conflicting types for '__UNIQUE_ID'; have 'struct <anonymous>()'
      76 |         } __UNIQUE_ID(note)                                             \
         |           ^~~~~~~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:76:11: note: previous declaration of '__UNIQUE_ID' with type 'struct <anonymous>()'
      76 |         } __UNIQUE_ID(note)                                             \
         |           ^~~~~~~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   arch/arm/vdso/note.c:14:1: note: in expansion of macro 'ELFNOTE32'
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^~~~~~~~~
   include/linux/elfnote.h:71:24: warning: braces around scalar initializer
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:71:24: note: (near initialization for '__UNIQUE_ID')
      71 |                 struct elf##size##_note _nhdr;                          \
         |                        ^~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
>> include/linux/elfnote.h:82:25: error: invalid initializer
      82 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:82:25: note: (near initialization for '__UNIQUE_ID')
      82 |                         sizeof(name),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:83:25: warning: excess elements in scalar initializer
      83 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/elfnote.h:83:25: note: (near initialization for '__UNIQUE_ID')
      83 |                         sizeof(desc),                                   \
         |                         ^~~~~~
   include/linux/elfnote.h:90:37: note: in expansion of macro 'ELFNOTE'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^~~~~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/build-salt.h:6:40: warning: excess elements in scalar initializer
       6 | #define LINUX_ELFNOTE_BUILD_SALT       0x100
         |                                        ^~~~~
   include/linux/elfnote.h:84:25: note: in definition of macro 'ELFNOTE'
      84 |                         type,                                           \
         |                         ^~~~
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
   include/linux/elfnote.h:84:25: note: in definition of macro 'ELFNOTE'
      84 |                         type,                                           \
         |                         ^~~~
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
   include/linux/elfnote.h:86:17: note: in definition of macro 'ELFNOTE'
      86 |                 name,                                                   \
         |                 ^~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;
         | ^~~~~~~~~~
   include/linux/build-salt.h:16:18: note: (near initialization for '__UNIQUE_ID')
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |                  ^~~~~~~
   include/linux/elfnote.h:86:17: note: in definition of macro 'ELFNOTE'
      86 |                 name,                                                   \
         |                 ^~~~
   include/linux/build-salt.h:16:8: note: in expansion of macro 'ELFNOTE32'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^~~~~~~~~
   arch/arm/vdso/note.c:15:1: note: in expansion of macro 'BUILD_SALT'
      15 | BUILD_SALT;


vim +71 include/linux/elfnote.h

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
f1cb9326e751c8 Josh Poimboeuf      2024-08-01  67   * be a literal string, and "desc" must be passed by value.
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  68   */
f1cb9326e751c8 Josh Poimboeuf      2024-08-01  69  #define ELFNOTE(size, name, type, desc)			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @70  	static const struct {						\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @71  		struct elf##size##_note _nhdr;				\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  72  		unsigned char _name[sizeof(name)]			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  73  		__attribute__((aligned(sizeof(Elf##size##_Word))));	\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  74  		typeof(desc) _desc					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  75  			     __attribute__((aligned(sizeof(Elf##size##_Word)))); \
f1cb9326e751c8 Josh Poimboeuf      2024-08-01 @76  	} __UNIQUE_ID(note)						\
3ff6eecca4e5c4 Adrian Bunk         2008-01-24  77  		__used							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  78  		__attribute__((section(".note." name),			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  79  			       aligned(sizeof(Elf##size##_Word)),	\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  80  			       unused)) = {				\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  81  		{							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @82  			sizeof(name),					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  83  			sizeof(desc),					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  84  			type,						\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  85  		},							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  86  		name,							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  87  		desc							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  88  	}
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  89  
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @90  #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  91  #define ELFNOTE64(name, type, desc) ELFNOTE(64, name, type, desc)
f1cb9326e751c8 Josh Poimboeuf      2024-08-01  92  

:::::: The code at line 71 was first introduced by commit
:::::: 9c9b8b388296ad5a306ab238dc677cfe6ff4cb12 [PATCH] x86: put .note.* sections into a PT_NOTE segment in vmlinux

:::::: TO: Jeremy Fitzhardinge <jeremy@xensource.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
