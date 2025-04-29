Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEED2853E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967688; cv=none; b=qLSuz/8bkkanTgIcZnD0n9zw81gre4Old68yuva+YAy6XzS/io/oX8Hj9UXnti276Hc9DIQI56tvF8v7aX7+ZkUoaKhQwUkutxVBfkGmr5v6qSFg9Iq7gwNfXHnv7r04zVkFniu5ROf1TGfqAJpdmChN8wmwUNHF3mkn0TJaM+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967688; c=relaxed/simple;
	bh=Nmdk9NG5JIND7/ajmiPco5SsfDFh5v/wuDDgfNWYCVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvrXL7qoFzfTRyn7/Uo8+gAUs/fvXvIqODg4EEXBHzZYDqrQft+RPut4gK1N9cF1UzRqKbeOOmNC8XjcDZd+6gs9e+7t+APobEx8QA0vIe9nWJir9Tq2V2kvEpB9pA1MqqEdN3lDm+H9mK0w7ElxlQUbcufytQZb9/1UCgE+Eu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtPU31Mv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtPU31Mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745967686; x=1777503686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nmdk9NG5JIND7/ajmiPco5SsfDFh5v/wuDDgfNWYCVs=;
  b=FtPU31MvYTvm+N2JuXw5J7I/UOV7CWk194PhS/+Y7p6fr1p3AGumTNNt
   P2iLhgKj4IiJIk5ItKF2LMD4BvGtU/FvuQryua9lSjJaOt60WNBvQqexz
   yjp52zmx+s37zcMLOOxuwamis2/9nydd23Of5O4moo48/tKt+5cj5HgJR
   dsVxfQN1hBRLa6RXRkDHXGy5WkXUv+9ATlaVC8UtP6llC64LpuFEq0dOJ
   zLdGobt85fYw9EmNLx9P7AmgEmRH+jCL2lPO4npJEZ7EEZ0LAPu3cH9Hh
   Syhj2CKj/CWNW6K65wO8p02DaPgsfkvbCmCPMsIymqMlfVzLzlwOJdLln
   g==;
X-CSE-ConnectionGUID: J4rabNabQUq/5TKsfUpbkA==
X-CSE-MsgGUID: q25Pe5WJTI6SLwQeiwcbLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58975586"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58975586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 16:01:26 -0700
X-CSE-ConnectionGUID: M3CN4V41SGWIvptN5yixpw==
X-CSE-MsgGUID: YS1B4rgqS1y2J0GZhJmasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134945208"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2025 16:01:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9tx4-00030D-1A;
	Tue, 29 Apr 2025 23:01:22 +0000
Date: Wed, 30 Apr 2025 07:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:pat 5/10] drivers/scsi/st.c:21:20: warning:
 'verstr' defined but not used
Message-ID: <202504300608.5TDGNhHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux pat
head:   f60106362383c7fbbe2d6fc75c7fc17a85ed2da9
commit: 198b01f86519142d65d84243c329c8beb5f9117a [5/10] x86/mm/pat: remove old pfnmap tracking interface
config: sparc-randconfig-002-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300608.5TDGNhHU-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300608.5TDGNhHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300608.5TDGNhHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:31,
                    from drivers/scsi/st.c:29:
   include/linux/pgtable.h:1493:1: error: expected declaration specifiers or '...' before '{' token
    1493 | {
         | ^
   include/linux/pgtable.h:1766:20: error: storage class specified for parameter 'init_espfix_bsp'
    1766 | static inline void init_espfix_bsp(void) { }
         |                    ^~~~~~~~~~~~~~~
   include/linux/pgtable.h:1766:20: warning: parameter 'init_espfix_bsp' declared 'inline'
   include/linux/pgtable.h:1766:1: warning: 'gnu_inline' attribute ignored [-Wattributes]
    1766 | static inline void init_espfix_bsp(void) { }
         | ^~~~~~
   include/linux/pgtable.h:1766:20: error: 'no_instrument_function' attribute applies only to functions
    1766 | static inline void init_espfix_bsp(void) { }
         | ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1766:42: error: expected ';', ',' or ')' before '{' token
    1766 | static inline void init_espfix_bsp(void) { }
         |                                          ^
>> drivers/scsi/st.c:21:20: warning: 'verstr' defined but not used [-Wunused-variable]
      21 | static const char *verstr = "20160209";
         |                    ^~~~~~
--
   In file included from include/linux/mm.h:31,
                    from drivers/scsi/sg.c:30:
   include/linux/pgtable.h:1493:1: error: expected declaration specifiers or '...' before '{' token
    1493 | {
         | ^
   include/linux/pgtable.h:1766:20: error: storage class specified for parameter 'init_espfix_bsp'
    1766 | static inline void init_espfix_bsp(void) { }
         |                    ^~~~~~~~~~~~~~~
   include/linux/pgtable.h:1766:20: warning: parameter 'init_espfix_bsp' declared 'inline'
   include/linux/pgtable.h:1766:1: warning: 'gnu_inline' attribute ignored [-Wattributes]
    1766 | static inline void init_espfix_bsp(void) { }
         | ^~~~~~
   include/linux/pgtable.h:1766:20: error: 'no_instrument_function' attribute applies only to functions
    1766 | static inline void init_espfix_bsp(void) { }
         | ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1766:42: error: expected ';', ',' or ')' before '{' token
    1766 | static inline void init_espfix_bsp(void) { }
         |                                          ^
>> drivers/scsi/sg.c:14:12: warning: 'sg_version_num' defined but not used [-Wunused-variable]
      14 | static int sg_version_num = 30536;      /* 2 digits for each component */
         |            ^~~~~~~~~~~~~~


vim +/verstr +21 drivers/scsi/st.c

8038e6456a3e6f Kai Makisara   2016-02-09 @21  static const char *verstr = "20160209";
^1da177e4c3f41 Linus Torvalds 2005-04-16  22  

:::::: The code at line 21 was first introduced by commit
:::::: 8038e6456a3e6f5c4759e0d73c4f9165b90c93e7 st: Fix MTMKPART to work with newer drives

:::::: TO: Kai Makisara <Kai.Makisara@kolumbus.fi>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
