Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F9C8C1F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Dec 2025 21:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765141353; cv=none; b=UL4RYsI+xR0tNcGIYYzNe400V6zjvfjOeBeeg0r9LwGoCPI+Y/W+yFe/lcp9le5XIsJju6wvBhcTGOdoKT/Hxh9HCSYg5lbIw0ZouQYqAeUSBWRpCIA8Me90Z5im3rSwqE949NZNJ1DQMoKjixhel1AiCgz0dYhXriSIIGMafXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765141353; c=relaxed/simple;
	bh=uTB1O/84ZyLOpOvWGJhuYBhgvZ+y87y5pDh+Lo8TNxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOS5wZOP9HFcTM3CAB6Xnc8z/IcA0jolAneFKSMWV0RTXXbU2mLfV/4Z0grm0lq+tXnEvg4Lys6NRMw96PTposxcPETGElCtPFPsABelpjTqWYWTHXwksh0dnKaMqDkDt5TrD+MWPCVZSyl3ILQqf/W2Ai9IguC+bg9r35EW3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvMZRck7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvMZRck7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765141352; x=1796677352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTB1O/84ZyLOpOvWGJhuYBhgvZ+y87y5pDh+Lo8TNxw=;
  b=CvMZRck76jcedeydNZ4TO5toLInwuT1t+W9K6AKSAcC//Wd7/cK+wUGD
   JMDEhealZwwxspEj9ndV2YXIWUboc3jkic5Zqss+SIjXYVYc4Zok9+4Lw
   OLmnCgCtesYoEafSiw58vg+iWi92NSooi6siqMydAnAw7CE7DWhTKPNI7
   3kDtXthrk61YsLeqdj/q7e0/UvmdlRrAAFYWoxgdBzQ+T2zLOS+AeWwq6
   5W0dqDernp60VrJc8d+WJLlF5mychYe0XOPoMn9b/f4t1Gs2uv/WJfar7
   VYjrH/5SdasyKB93dabo6v7WYsFc2MLOIDuwya9amgm9JVULOA9uK4+zV
   A==;
X-CSE-ConnectionGUID: lTVaKMtbRpGFoWscNe4mJw==
X-CSE-MsgGUID: BbZAHPskTRC+x6aOO6nYfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67139076"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="67139076"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 13:02:31 -0800
X-CSE-ConnectionGUID: Drre6Ui3TlelohvGn7lgCQ==
X-CSE-MsgGUID: LzXqxREPT+OK4l4AQoAYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195394556"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Dec 2025 13:02:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSLtj-00000000Jdd-2s63;
	Sun, 07 Dec 2025 21:02:27 +0000
Date: Mon, 8 Dec 2025 05:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 1097/1100] include/linux/dcache.h:59:24:
 error: initializer element is not constant
Message-ID: <202512080422.MzH5TxUy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   0b07bb15ac367a76fb63295e637b104506f34747
commit: 7df2fb43bb8830f27b55ca1820e397a7258e6141 [1097/1100] bcachefs: split out create_lostfound()
config: nios2-randconfig-001-20251208 (https://download.01.org/0day-ci/archive/20251208/202512080422.MzH5TxUy-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512080422.MzH5TxUy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512080422.MzH5TxUy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:9,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from fs/bcachefs/bcachefs.h:202,
                    from fs/bcachefs/fs/check.c:2:
>> include/linux/dcache.h:59:24: error: initializer element is not constant
    #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
                           ^
   include/linux/dcache.h:60:36: note: in expansion of macro 'QSTR_INIT'
    #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
                                       ^~~~~~~~~
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
    #define QSTR(n) QSTR_LEN(n, strlen(n))
                    ^~~~~~~~
   fs/bcachefs/fs/check.c:113:36: note: in expansion of macro 'QSTR'
    static struct qstr lostfound_str = QSTR("lost+found");
                                       ^~~~
   include/linux/dcache.h:59:24: note: (near initialization for 'lostfound_str')
    #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
                           ^
   include/linux/dcache.h:60:36: note: in expansion of macro 'QSTR_INIT'
    #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
                                       ^~~~~~~~~
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
    #define QSTR(n) QSTR_LEN(n, strlen(n))
                    ^~~~~~~~
   fs/bcachefs/fs/check.c:113:36: note: in expansion of macro 'QSTR'
    static struct qstr lostfound_str = QSTR("lost+found");
                                       ^~~~
   include/linux/dcache.h:60:23: error: initializer element is not constant
    #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
                          ^
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
    #define QSTR(n) QSTR_LEN(n, strlen(n))
                    ^~~~~~~~
   fs/bcachefs/fs/check.c:113:36: note: in expansion of macro 'QSTR'
    static struct qstr lostfound_str = QSTR("lost+found");
                                       ^~~~
--
   In file included from include/linux/fs.h:9,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from ././bcachefs.h:202,
                    from fs/check.c:2:
>> include/linux/dcache.h:59:24: error: initializer element is not constant
    #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
                           ^
   include/linux/dcache.h:60:36: note: in expansion of macro 'QSTR_INIT'
    #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
                                       ^~~~~~~~~
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
    #define QSTR(n) QSTR_LEN(n, strlen(n))
                    ^~~~~~~~
   fs/check.c:113:36: note: in expansion of macro 'QSTR'
    static struct qstr lostfound_str = QSTR("lost+found");
                                       ^~~~
   include/linux/dcache.h:59:24: note: (near initialization for 'lostfound_str')
    #define QSTR_INIT(n,l) { { { .len = l } }, .name = n }
                           ^
   include/linux/dcache.h:60:36: note: in expansion of macro 'QSTR_INIT'
    #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
                                       ^~~~~~~~~
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
    #define QSTR(n) QSTR_LEN(n, strlen(n))
                    ^~~~~~~~
   fs/check.c:113:36: note: in expansion of macro 'QSTR'
    static struct qstr lostfound_str = QSTR("lost+found");
                                       ^~~~
   include/linux/dcache.h:60:23: error: initializer element is not constant
    #define QSTR_LEN(n,l) (struct qstr)QSTR_INIT(n,l)
                          ^
   include/linux/dcache.h:61:17: note: in expansion of macro 'QSTR_LEN'
    #define QSTR(n) QSTR_LEN(n, strlen(n))
                    ^~~~~~~~
   fs/check.c:113:36: note: in expansion of macro 'QSTR'
    static struct qstr lostfound_str = QSTR("lost+found");
                                       ^~~~


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
