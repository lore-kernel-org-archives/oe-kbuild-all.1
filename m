Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D71D4A12
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JERWULqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700983460; x=1732519460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zssHBGvqtCYDQzHs/1vdxXp/Te0E3UkaxWLbx7PX4VQ=;
  b=JERWULqFaaEmpndwiq0Q0aHFA/hCuvC8+7bAkn4OFGLZJC/mioSo6OU+
   Pv8vKnK1JlOyo/9pSaVNtlhxJl5Bs8rpJh5myHZCAsuWrpQLFQC8k+SbW
   bNfvOTkT0y3RqSZIoa6kE46pLPkIWKQnQ1fBNUnBCUUI9mmMywYSCSRkf
   fflxNozDlbxD+OH4TxpLllE5t4IFQeJOfP3HEJk3vqfn7z1T9/NQ2kJ85
   Gep10PdsObP/swkXGvn9Ngugmw63Y6UKb2ugjO11M6jfSK4LGGAR3Mh74
   tXTTsEPpTEaiLv7R15uqXdrYl1s1oxacwEH9hvUB1/r0G0i/yBSczm+lo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="459048199"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="459048199"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 23:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="744242887"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="744242887"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Nov 2023 23:24:18 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r79V2-0004wT-0X;
	Sun, 26 Nov 2023 07:24:16 +0000
Date: Sun, 26 Nov 2023 15:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 4/9] landlock: Add IOCTL access right
Message-ID: <202311261403.9hYewImp-lkp@intel.com>
References: <20231124173026.3257122-5-gnoack@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231124173026.3257122-5-gnoack@google.com>

Hi Günther,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.7-rc2]
[cannot apply to next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/G-nther-Noack/selftests-landlock-Rename-permitted-to-allowed-in-ftruncate-tests/20231125-023121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20231124173026.3257122-5-gnoack%40google.com
patch subject: [PATCH v6 4/9] landlock: Add IOCTL access right
config: powerpc64-randconfig-r123-20231126 (https://download.01.org/0day-ci/archive/20231126/202311261403.9hYewImp-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311261403.9hYewImp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261403.9hYewImp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/landlock/fs.c:195:16: error: static_assert expression is not an integral constant expression
           static_assert((ioctl_groups & LANDLOCK_MASK_ACCESS_FS) == ioctl_groups);
           ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   1 error generated.


vim +195 security/landlock/fs.c

   181	
   182	/**
   183	 * landlock_expand_access_fs() - Returns @access with the synthetic IOCTL group
   184	 * flags enabled if necessary.
   185	 *
   186	 * @handled: Handled FS access rights.
   187	 * @access: FS access rights to expand.
   188	 *
   189	 * Returns: @access expanded by the necessary flags for the synthetic IOCTL
   190	 * access rights.
   191	 */
   192	static access_mask_t landlock_expand_access_fs(const access_mask_t handled,
   193						       const access_mask_t access)
   194	{
 > 195		static_assert((ioctl_groups & LANDLOCK_MASK_ACCESS_FS) == ioctl_groups);
   196	
   197		return access |
   198		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_WRITE_FILE,
   199				    LANDLOCK_ACCESS_FS_IOCTL_GROUP1 |
   200					    LANDLOCK_ACCESS_FS_IOCTL_GROUP2 |
   201					    LANDLOCK_ACCESS_FS_IOCTL_GROUP4) |
   202		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_FILE,
   203				    LANDLOCK_ACCESS_FS_IOCTL_GROUP1 |
   204					    LANDLOCK_ACCESS_FS_IOCTL_GROUP2 |
   205					    LANDLOCK_ACCESS_FS_IOCTL_GROUP3) |
   206		       expand_ioctl(handled, access, LANDLOCK_ACCESS_FS_READ_DIR,
   207				    LANDLOCK_ACCESS_FS_IOCTL_GROUP1);
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
