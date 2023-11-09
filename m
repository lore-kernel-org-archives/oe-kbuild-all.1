Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8808838F94
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmb7Aw0D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699568884; x=1731104884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghok6jgB3gmVO88odaxIyY3hvp+aOLsF5qGNyLEsz00=;
  b=mmb7Aw0DKHoSmyhcQX79/9sF7d/PEbGuxZH0p+NWfXQmY0T6zMadWPOZ
   Hvel0nw/TslP10d1lYmso/Nug1hdYgNmWGoHzxnOXJrntRf/0tZursgIO
   f/A1bvcHDkYfLIByxTkwFebSA1DE0YbMUM/H5bDkmWDOQOsOyOlnQyuW1
   llr8zbcxfQF2Myxwbq9OPcdptUBUUhivpzW+C1WKHeoabMnLhwOXXINIg
   jypA6z4uaOKIPBL8pn2VIYH90p5nheLxfhUu1f42k0ueCsWse1ypxmXpt
   20JSqfzI9dmyzv3ZRgZPTel3tOXK3qyzFRK4rvmngNewc7j7UcKCK7JEr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456580150"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="456580150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829458464"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="829458464"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2023 14:28:02 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1DVI-0009Cs-1I;
	Thu, 09 Nov 2023 22:28:00 +0000
Date: Fri, 10 Nov 2023 06:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-fixes 38/41]
 arch/openrisc/include/asm/cmpxchg.h:131:24: error: call to
 '__cmpxchg_called_with_bad_pointer' declared with attribute error: Bad
 argument size for cmpxchg
Message-ID: <202311100655.77BkcEl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-fixes
head:   75a3bc7cc3bd84295e596d1a3c2528f5d6d60b67
commit: bc26e7ef4162b576dfc97aa50aab49830cedad9f [38/41] afs: Parse the VolSync record in the reply of a number of RPC ops
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231110/202311100655.77BkcEl2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100655.77BkcEl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100655.77BkcEl2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/openrisc/include/asm/atomic.h:131,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/openrisc/include/asm/bitops.h:41,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from fs/afs/validation.c:8:
   In function '__cmpxchg',
       inlined from 'afs_update_volume_creation_time' at fs/afs/validation.c:49:6,
       inlined from 'afs_update_volume_state' at fs/afs/validation.c:111:3:
>> arch/openrisc/include/asm/cmpxchg.h:131:24: error: call to '__cmpxchg_called_with_bad_pointer' declared with attribute error: Bad argument size for cmpxchg
     131 |                 return __cmpxchg_called_with_bad_pointer();
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/openrisc/include/asm/cmpxchg.h:131:24: error: call to '__cmpxchg_called_with_bad_pointer' declared with attribute error: Bad argument size for cmpxchg
   In function '__cmpxchg',
       inlined from 'afs_update_volume_update_time' at fs/afs/validation.c:93:6,
       inlined from 'afs_update_volume_state' at fs/afs/validation.c:113:3:
>> arch/openrisc/include/asm/cmpxchg.h:131:24: error: call to '__cmpxchg_called_with_bad_pointer' declared with attribute error: Bad argument size for cmpxchg
     131 |                 return __cmpxchg_called_with_bad_pointer();
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/openrisc/include/asm/cmpxchg.h:131:24: error: call to '__cmpxchg_called_with_bad_pointer' declared with attribute error: Bad argument size for cmpxchg


vim +/__cmpxchg_called_with_bad_pointer +131 arch/openrisc/include/asm/cmpxchg.h

489e0f802db708c Stafford Horne 2017-03-23  113  
489e0f802db708c Stafford Horne 2017-03-23  114  /*
489e0f802db708c Stafford Horne 2017-03-23  115   * This function doesn't exist, so you'll get a linker error
489e0f802db708c Stafford Horne 2017-03-23  116   * if something tries to do an invalid cmpxchg().
489e0f802db708c Stafford Horne 2017-03-23  117   */
489e0f802db708c Stafford Horne 2017-03-23  118  extern unsigned long __cmpxchg_called_with_bad_pointer(void)
489e0f802db708c Stafford Horne 2017-03-23  119  	__compiletime_error("Bad argument size for cmpxchg");
489e0f802db708c Stafford Horne 2017-03-23  120  
489e0f802db708c Stafford Horne 2017-03-23  121  static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
489e0f802db708c Stafford Horne 2017-03-23  122  		unsigned long new, int size)
489e0f802db708c Stafford Horne 2017-03-23  123  {
489e0f802db708c Stafford Horne 2017-03-23  124  	switch (size) {
489e0f802db708c Stafford Horne 2017-03-23  125  	case 1:
489e0f802db708c Stafford Horne 2017-03-23  126  	case 2:
489e0f802db708c Stafford Horne 2017-03-23  127  		return cmpxchg_small(ptr, old, new, size);
489e0f802db708c Stafford Horne 2017-03-23  128  	case 4:
489e0f802db708c Stafford Horne 2017-03-23  129  		return cmpxchg_u32(ptr, old, new);
489e0f802db708c Stafford Horne 2017-03-23  130  	default:
489e0f802db708c Stafford Horne 2017-03-23 @131  		return __cmpxchg_called_with_bad_pointer();
489e0f802db708c Stafford Horne 2017-03-23  132  	}
489e0f802db708c Stafford Horne 2017-03-23  133  }
489e0f802db708c Stafford Horne 2017-03-23  134  

:::::: The code at line 131 was first introduced by commit
:::::: 489e0f802db708c69004f64d92a3e1b70731614a openrisc: add 1 and 2 byte cmpxchg support

:::::: TO: Stafford Horne <shorne@gmail.com>
:::::: CC: Stafford Horne <shorne@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
