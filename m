Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D21DDCE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721145909; cv=none; b=i95g7aYvpgz2ZW5fYJhJvoWjBM8TQd5kZpiro43wPUdz6wp8AgK40soNnqVYRd0JdAWsCK/lzcTwnWsK4ViixRe9i1kzXL2vaY+k2s59DzTMzmJaTFIt2Hso5SqOJvcRXeHIXEd/lqIPDNky0bdKkFd4/MSC1Q7jzeBvaJAgSag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721145909; c=relaxed/simple;
	bh=jJjoW6+L+1/O6ruErEQZn8916F04emivLmE3xzF+Oko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6XvZknirDU8/AsWQwTLuf3PbJiZHGjCQSGvP+EONme2tvXUz36zc2wqzQCdKsVMCHl/NAajyUAgUpgQgLnTuEsotUi+r2WxOFA8DTYceLJgkfTJzpAfrC6krkfn+DaVXaBDWJ0ZVN1UqqmhA89an2259QgSxj5LV9Ew2f11LRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjlh4Fvr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjlh4Fvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721145908; x=1752681908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJjoW6+L+1/O6ruErEQZn8916F04emivLmE3xzF+Oko=;
  b=gjlh4FvrYgqls5S8weE6LcTnbeeAId3rq0270lN0B8M9tY51gDyGpv8h
   kc0TlQ/XikKsItNSi4/10Q1QQEQFroBTQ4s2Hm34ry1aP8U3pUJeyy0y1
   yeb1YFWWsdUPJEExklIZeyxGdaMawERiyN1kfksow/pNGfsmPBBhJ4dCH
   E9vyKf36TSFAvaMRLYAWHxazbBeYH5C0wSn5IL2Ph7sfV7ZAUFGejpVFC
   oASUzMPhrAdqfksCvm4aKqVb/oDzF+W4M7LcvaUHJ2HwiUW/hU4lKj72M
   yjK/BVniVKZpE9roId79Yb+InVjMVpk765nf4XIB49b1+0lTEYAg3BP2U
   Q==;
X-CSE-ConnectionGUID: hWLNsE9wRcWTSh313+NZfA==
X-CSE-MsgGUID: +Sl70VFuSjqdZgL4t5J3yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18467487"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18467487"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 09:05:06 -0700
X-CSE-ConnectionGUID: XU7UK7aBTeqwWxAtRs+ILQ==
X-CSE-MsgGUID: 9elA989gTNq44xjr9AU2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50669093"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jul 2024 09:05:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTkfm-000fQA-2U;
	Tue, 16 Jul 2024 16:05:02 +0000
Date: Wed, 17 Jul 2024 00:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 6/8] include/linux/elfnote.h:72:24: error:
 parameter names (without types) in function declaration
Message-ID: <202407162355.5fQgzOwf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   bc3cdfe89249cdc982760e0fb48820b399935d43
commit: 0701df056a78b76d97ad9fe64c364e98f234a71c [6/8] todo
config: arm-randconfig-004-20240716 (https://download.01.org/0day-ci/archive/20240716/202407162355.5fQgzOwf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407162355.5fQgzOwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407162355.5fQgzOwf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/vdso/note.c:11:
>> include/linux/elfnote.h:72:24: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
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
   include/linux/elfnote.h:71:16: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
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
   include/linux/elfnote.h:72:24: error: function '__UNIQUE_ID' is initialized like a variable
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
   include/linux/elfnote.h:72:24: warning: braces around scalar initializer
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
   include/linux/elfnote.h:83:25: error: invalid initializer
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
   include/linux/elfnote.h:84:25: warning: excess elements in scalar initializer
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
   arch/arm/vdso/note.c:14:20: warning: excess elements in scalar initializer
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
   ./include/generated/uapi/linux/version.h:1:28: warning: excess elements in scalar initializer
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
>> include/linux/elfnote.h:72:24: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
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
   include/linux/elfnote.h:71:16: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
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
   include/linux/elfnote.h:72:24: error: function '__UNIQUE_ID' is initialized like a variable
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
   include/linux/elfnote.h:77:11: error: conflicting types for '__UNIQUE_ID'; have 'struct <anonymous>()'
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
   include/linux/elfnote.h:72:24: warning: braces around scalar initializer
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


vim +72 include/linux/elfnote.h

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
0701df056a78b7 Josh Poimboeuf      2024-07-03  67   * be a literal string, and "desc" must be passed by value.
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  68   */
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  69  #define _ELFNOTE_PASTE(a,b)	a##b
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  70  #define _ELFNOTE(size, name, unique, type, desc)			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  71  	static const struct {						\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25 @72  		struct elf##size##_note _nhdr;				\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  73  		unsigned char _name[sizeof(name)]			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  74  		__attribute__((aligned(sizeof(Elf##size##_Word))));	\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  75  		typeof(desc) _desc					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  76  			     __attribute__((aligned(sizeof(Elf##size##_Word)))); \
0701df056a78b7 Josh Poimboeuf      2024-07-03  77  	} __UNIQUE_ID(_note_)						\
3ff6eecca4e5c4 Adrian Bunk         2008-01-24  78  		__used							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  79  		__attribute__((section(".note." name),			\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  80  			       aligned(sizeof(Elf##size##_Word)),	\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  81  			       unused)) = {				\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  82  		{							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  83  			sizeof(name),					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  84  			sizeof(desc),					\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  85  			type,						\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  86  		},							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  87  		name,							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  88  		desc							\
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  89  	}
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  90  #define ELFNOTE(size, name, type, desc)		\
0701df056a78b7 Josh Poimboeuf      2024-07-03  91  	_ELFNOTE(size, name, __COUNTER__, type, desc)
9c9b8b388296ad Jeremy Fitzhardinge 2006-09-25  92  

:::::: The code at line 72 was first introduced by commit
:::::: 9c9b8b388296ad5a306ab238dc677cfe6ff4cb12 [PATCH] x86: put .note.* sections into a PT_NOTE segment in vmlinux

:::::: TO: Jeremy Fitzhardinge <jeremy@xensource.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
