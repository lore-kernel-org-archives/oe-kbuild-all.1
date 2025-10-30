Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67872638BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 15:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839593; cv=none; b=JhJu6QwOYyzJtVIUNhT2mV9laLEM92mNqRjoP5HUrJSeA8Ym1PZfvQ3icvp0ixSfc65oildIWVquwOVgfFACiEb3y4BLPY8MPdF4AAorT3MhNjnSyNTJmf912jtGx+NcqAvNZzABdWSOuNQIPptlXwT9ExtD+G0dRCS2H6cmRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839593; c=relaxed/simple;
	bh=ysjTrrFLGF7qLv7by5sW5n+VMbUZnNLgVvsqS7VgeuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHtBUadjS8daGnuxkLebOTRdBm10k2YMVC1gj4P/wwBZpGyeMx37tANRD8yy9HXj6zz6CmkJMQUF8mbzMay6ov9a7Oha+ecvTsqN2B0MYH1OPEDpCEjGTyjFo2wv7hA8YZGZAzS1jiw6C6W21huljhuwlzmNk8TZQvvggq+ugzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HY/czU1i; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HY/czU1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761839592; x=1793375592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ysjTrrFLGF7qLv7by5sW5n+VMbUZnNLgVvsqS7VgeuM=;
  b=HY/czU1ivxiJtJbFIVqGvGeIcwpoLN4UG2OPwhYNrY8Cguc4qsuDYkZe
   MothHoQnQ98OWaTJ0mKMvrNgmZkOv7eKLcGK2STNiP3/gHHTISja2Lt/B
   GBJFrewvd0yp7HbJwVjT1iFUn/+85hfue2Tccqt0AwGnca+suFBW/+vhC
   wlVFCs6nimekZvMYFIyGL/4KskJ0CaT1gnK1+ZGHWsCZg1lY7iQC+2VPS
   aOv8iljhIFyyhY5T7XuSPjsEYPsGSaCaGiFfTluu9uLfknaRzOjW7p9cS
   HogdBmj69Xs+5JASA02YTe7mqPAkkERyfFS4xRLMBppsT/BXKATleAIZO
   g==;
X-CSE-ConnectionGUID: HWkvyYG+SL+jhKyZxKtx+w==
X-CSE-MsgGUID: mGeEGi0WSqOs8B29Em512g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81614175"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="81614175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 08:53:11 -0700
X-CSE-ConnectionGUID: 2fbyIj4BSEOakjoRtooE8Q==
X-CSE-MsgGUID: 7k2CrnViR162ckLNnHq55Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185680987"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2025 08:53:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEUxT-000MAo-21;
	Thu, 30 Oct 2025 15:53:05 +0000
Date: Thu, 30 Oct 2025 23:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 39/57] lib/test_lvalue.c:14:2: error: cannot take
 the address of an rvalue of type 'int'
Message-ID: <202510302309.CE6qxOYq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: c9e3678d985bd976c1406f81620d1d04adfb9f78 [39/57] linux/highuid.h: Use __lvalue() in SET_UID/GID
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510302309.CE6qxOYq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302309.CE6qxOYq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302309.CE6qxOYq-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_lvalue.c:13:2: error: expression is not assignable
      13 |         swap(1, 2);
         |         ^~~~~~~~~~
   include/linux/minmax.h:308:34: note: expanded from macro 'swap'
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                     ~~~ ^
   lib/test_lvalue.c:13:2: error: expression is not assignable
      13 |         swap(1, 2);
         |         ^~~~~~~~~~
   include/linux/minmax.h:308:45: note: expanded from macro 'swap'
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                ~~~ ^
>> lib/test_lvalue.c:14:2: error: cannot take the address of an rvalue of type 'int'
      14 |         SET_UID(1, 1);
         |         ^       ~
   include/linux/highuid.h:70:61: note: expanded from macro 'SET_UID'
      70 | #define SET_UID(var, uid) do { (var) = __convert_uid(sizeof(__lvalue(var)), (uid)); } while (0)
         |                                                             ^        ~~~
   include/linux/compiler.h:213:31: note: expanded from macro '__lvalue'
     213 | #define __lvalue(x)             ({ (void)__must_be_lval(x); x; })
         |                                          ^              ~
   include/linux/compiler.h:210:52: note: expanded from macro '__must_be_lval'
     210 | #define __must_be_lval(a)       __BUILD_BUG_ON_ZERO_MSG(!__is_lval(a),  \
         |                                                          ^         ~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:507:74: note: expanded from macro '__same_type'
     507 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/compiler.h:197:84: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/highuid.h:57:3: note: expanded from macro '__convert_uid'
      57 |         (size >= sizeof(uid) ? (uid) : high2lowuid(uid))
         |          ^~~~
   lib/test_lvalue.c:14:2: error: expression is not assignable
      14 |         SET_UID(1, 1);
         |         ^~~~~~~~~~~~~
   include/linux/highuid.h:70:38: note: expanded from macro 'SET_UID'
      70 | #define SET_UID(var, uid) do { (var) = __convert_uid(sizeof(__lvalue(var)), (uid)); } while (0)
         |                                ~~~~~ ^
   lib/test_lvalue.c:15:2: error: expression is not assignable
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^                              ~
   include/acpi/platform/acenv.h:248:60: note: expanded from macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) acquired = 1
         |                                                   ~~~~~~~~ ^
   lib/test_lvalue.c:16:19: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct pci_dev *' [-Wint-conversion]
      16 |         for_each_pci_dev(1);
         |                          ^
   include/linux/pci.h:2041:27: note: passing argument to parameter 'from' here
    2041 |                                              struct pci_dev *from)
         |                                                              ^
   lib/test_lvalue.c:16:2: error: expression is not assignable
      16 |         for_each_pci_dev(1);
         |         ^                ~
   include/linux/pci.h:576:39: note: expanded from macro 'for_each_pci_dev'
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                     ~ ^
   7 errors generated.


vim +/int +14 lib/test_lvalue.c

6d0e01538bf8aa Jim Cromie 2025-10-29   9  
6d0e01538bf8aa Jim Cromie 2025-10-29  10  static void __used __init test_lvalue_macros(void)
6d0e01538bf8aa Jim Cromie 2025-10-29  11  {
6d0e01538bf8aa Jim Cromie 2025-10-29  12  	/* These should all fail to compile */
6d0e01538bf8aa Jim Cromie 2025-10-29 @13  	swap(1, 2);
6d0e01538bf8aa Jim Cromie 2025-10-29 @14  	SET_UID(1, 1);

:::::: The code at line 14 was first introduced by commit
:::::: 6d0e01538bf8aa880118f706ea96e92d3df34fab lib/test_lvalues.c: test __lvalue() atal

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
