Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F793016F5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 03:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789271215; cv=none; b=cdJAhx/xPqdDPXfOmRcy+fPTlK2BGsS2efBeb8+PndG0ifdBlqWJydL05HMiOKkNRsrp5zTp1PO7ndtXQpwWecrRajIdzhAxaAXtEgmDOZwy3/ai2/9cqtsLA9Lb2QwPtoucjuyQorRquK1dVVOAMZpzeNThVznAxJLYSDvpXwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789271215; c=relaxed/simple;
	bh=DWZXz+mZpklKmfsfsnSjJ1N3VEHlhl9pwNEf9um96rA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tVZzQo8NpqfF3jvmK+Z4VVEZXbrRpLmdnm0g8ZUrO5Bf53BQB3O8ZpETuN4rVCfNLH27J1eQE60EWqeEps+rHe+DGg3OlX5EPsSsFZL58ervDYvG+1Yx0kUq2bHy9EDCztg9JMQ9DAdlywOzDrnSdED9YrvU/ZeQDFat3OouC/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjkFmVty; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjkFmVty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789271213; x=1820807213;
  h=date:from:to:cc:subject:message-id;
  bh=DWZXz+mZpklKmfsfsnSjJ1N3VEHlhl9pwNEf9um96rA=;
  b=hjkFmVtyhPihhmlYwAyUsAgjM9sNDnLbKwKKnel4NIXJ1qYBt/s+j5/d
   +XmDsVsSFXJmZtAen+ic+K6eD5WFtuqr6dn3wq7Syc6gkk4YvKvJJM1yF
   QmTIeGJT7mTbmJRhKR59YK4EKbBSR/UZslh+WwpGsg+3JkPFRkBT4miGy
   gGp6PHJtsQ1b9XjNM97mNFABehNCYC9WWdBPdqJ0ll3kRMb0mCL1DCWif
   KKXgrvMzQ4KiNWJsE6NSuMtUP3dN5hDOyYU9gNFV8MfEURxnl8FP+DwoB
   2+Wp3PiZSul03VMl8XqqkHQ/RlTAlHUwJVu6wQSJW9dJKEt+ji0BC1adA
   Q==;
X-CSE-ConnectionGUID: OgqAFcA1QQKM1TYhoQVYiA==
X-CSE-MsgGUID: GK422I9RT0SUSnSih+8n8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89806063"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89806063"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 20:46:53 -0700
X-CSE-ConnectionGUID: ayL8DLugQNasfjUFA4JwdA==
X-CSE-MsgGUID: QZ49jFUuSOm6Y9L9pjUsYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="266118353"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 12 Sep 2026 20:46:51 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5bB3-000000001VL-27OH;
	Sun, 13 Sep 2026 03:46:49 +0000
Date: Sun, 13 Sep 2026 05:46:21 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 1091/1155] include/linux/dcache.h:59:24:
 error: initializer element is not constant
Message-ID: <202609130509.zTDMLOZt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: 8ed85840adf72d951032bb4eb397c8ca4ebda2bb [1091/1155] bcachefs: split out create_lostfound()
config: xtensa-randconfig-r073-20260913 (https://download.01.org/0day-ci/archive/20260913/202609130509.zTDMLOZt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130509.zTDMLOZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130509.zTDMLOZt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:9,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from fs/bcachefs/bcachefs.h:202,
                    from fs/bcachefs/fs/check.c:2:
>> include/linux/dcache.h:59:24: error: initializer element is not constant
      59 | #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
         |                        ^
   include/linux/dcache.h:60:36: note: in expansion of macro 'QSTR_INIT'
      60 | #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
         |                                    ^~~~~~~~~
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
      61 | #define QSTR(n) QSTR_LEN(n, strlen(n))
         |                 ^~~~~~~~
   fs/bcachefs/fs/check.c:113:36: note: in expansion of macro 'QSTR'
     113 | static struct qstr lostfound_str = QSTR("lost+found");
         |                                    ^~~~
   include/linux/dcache.h:59:24: note: (near initialization for 'lostfound_str')
      59 | #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
         |                        ^
   include/linux/dcache.h:60:36: note: in expansion of macro 'QSTR_INIT'
      60 | #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
         |                                    ^~~~~~~~~
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
      61 | #define QSTR(n) QSTR_LEN(n, strlen(n))
         |                 ^~~~~~~~
   fs/bcachefs/fs/check.c:113:36: note: in expansion of macro 'QSTR'
     113 | static struct qstr lostfound_str = QSTR("lost+found");
         |                                    ^~~~
   include/linux/dcache.h:60:23: error: initializer element is not constant
      60 | #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
         |                       ^
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
      61 | #define QSTR(n) QSTR_LEN(n, strlen(n))
         |                 ^~~~~~~~
   fs/bcachefs/fs/check.c:113:36: note: in expansion of macro 'QSTR'
     113 | static struct qstr lostfound_str = QSTR("lost+found");
         |                                    ^~~~


vim +59 include/linux/dcache.h

^1da177e4c3f41 Linus Torvalds 2005-04-16  58  
26fe5750287039 Linus Torvalds 2012-05-10 @59  #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
5741909697a31c NeilBrown      2025-03-19  60  #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
5741909697a31c NeilBrown      2025-03-19  61  #define QSTR(n) QSTR_LEN(n, strlen(n))
26fe5750287039 Linus Torvalds 2012-05-10  62  

:::::: The code at line 59 was first introduced by commit
:::::: 26fe575028703948880fce4355a210c76bb0536e vfs: make it possible to access the dentry hash/len as one 64-bit entry

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
