Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA38BE8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709487481; cv=none; b=t/ikVJKlR9g8wWlrIb1sqT1kE76ktGBMzVQHG66Ravc8N/fq1+7C7K/A2IoBT3PYgU2IUHRknn5YabYUPYUw17Kk5txKzAUxGJOjzSnSvLJN/MXjbdtefNyvfwZ2NnM0aL0ZDp+3iFbS0pXZ/OV9HZb7wFAsDvlakVCFzXKZ/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709487481; c=relaxed/simple;
	bh=XyOLbvtMTzFfDHgwgW5e2adtPM5UVyK4oyOiNackJOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acb3OiguWMF0suEY1OKQb8WvLGWQB+yIA888GgA2qw9bHbICQ4XPORWDlK2c6KvjNgDZSmUAxAsLO0EsLwsoiD3IoXzI8NwiOMQPzb2Ni19RUrRREGo3WwgLhC4fZoYL976Coa1zhQIJMU89KOzoVIDw2LbpNi26NHvrx5+G2qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFPQursR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFPQursR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709487480; x=1741023480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XyOLbvtMTzFfDHgwgW5e2adtPM5UVyK4oyOiNackJOk=;
  b=bFPQursRSUaGWb3zN8Xb3nuv9+rPctWH9QFRhT2AB7A4aTuXX0m10GZ6
   Uo/QRk3I7vn+vxuEPDgBbejscmiqAhwLa/FS+gBOTYS8L09VxQbrMy2sk
   EN50+8h5NgFrTVJxffmDJ8PZKs7WAR7Tq2VGa0MUOnnHJwhkB8GtXa3nr
   1+MedCm/dI87eQ3mb2lljLe3qVMKjjyZEcusli9J6iz0kFVUoVB3GT1q5
   SD3UZ0gyRhvAnhJ1U+VPctH4G+8+lCXwLiz0oVC6GmvK4ynCQbD3UhQjQ
   lM59zupyYedDPOU14OoqQ5TO/i6c0NUrpEY/KJc434ZIBgGOxoYASwWuP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3902289"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="3902289"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 09:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8815008"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Mar 2024 09:37:57 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgpmc-0001zE-1j;
	Sun, 03 Mar 2024 17:37:54 +0000
Date: Mon, 4 Mar 2024 01:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:notmuch-cover.1708709155.git.john@groves.net 23/23]
 fs/famfs/famfs_internal.h:101:9: error: case label does not reduce to an
 integer constant
Message-ID: <202403040107.STV8X22X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux notmuch-cover.1708709155.git.john@groves.net
head:   c8318dd2a63c230e5e731bc14750a466d7891ddc
commit: c8318dd2a63c230e5e731bc14750a466d7891ddc [23/23] famfs: Add Kconfig and Makefile plumbing
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040107.STV8X22X-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040107.STV8X22X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040107.STV8X22X-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/famfs/famfs_inode.c:36:
   fs/famfs/famfs_internal.h: In function 'famfs_inc_fault_counter_by_order':
>> fs/famfs/famfs_internal.h:101:9: error: case label does not reduce to an integer constant
     101 |         case PMD_ORDER:
         |         ^~~~
   fs/famfs/famfs_internal.h:104:9: error: case label does not reduce to an integer constant
     104 |         case PUD_ORDER:
         |         ^~~~
--
   In file included from fs/famfs/famfs_file.c:20:
   fs/famfs/famfs_internal.h: In function 'famfs_inc_fault_counter_by_order':
>> fs/famfs/famfs_internal.h:101:9: error: case label does not reduce to an integer constant
     101 |         case PMD_ORDER:
         |         ^~~~
   fs/famfs/famfs_internal.h:104:9: error: case label does not reduce to an integer constant
     104 |         case PUD_ORDER:
         |         ^~~~
   fs/famfs/famfs_file.c: In function 'famfs_file_init_dax':
   fs/famfs/famfs_file.c:168:33: warning: variable 'sb' set but not used [-Wunused-but-set-variable]
     168 |         struct super_block     *sb;
         |                                 ^~
   fs/famfs/famfs_file.c:167:33: warning: variable 'fsi' set but not used [-Wunused-but-set-variable]
     167 |         struct famfs_fs_info   *fsi;
         |                                 ^~~
   fs/famfs/famfs_file.c:163:33: warning: variable 'tfs_extents' set but not used [-Wunused-but-set-variable]
     163 |         struct famfs_extent    *tfs_extents = NULL;
         |                                 ^~~~~~~~~~~


vim +101 fs/famfs/famfs_internal.h

ab0d141a2f682f John Groves 2024-02-23   92  
ab0d141a2f682f John Groves 2024-02-23   93  static inline void famfs_inc_fault_counter_by_order(struct famfs_fault_counters *fc, int order)
ab0d141a2f682f John Groves 2024-02-23   94  {
ab0d141a2f682f John Groves 2024-02-23   95  	int pgf = -1;
ab0d141a2f682f John Groves 2024-02-23   96  
ab0d141a2f682f John Groves 2024-02-23   97  	switch (order) {
ab0d141a2f682f John Groves 2024-02-23   98  	case 0:
ab0d141a2f682f John Groves 2024-02-23   99  		pgf = FAMFS_PTE;
ab0d141a2f682f John Groves 2024-02-23  100  		break;
ab0d141a2f682f John Groves 2024-02-23 @101  	case PMD_ORDER:
ab0d141a2f682f John Groves 2024-02-23  102  		pgf = FAMFS_PMD;
ab0d141a2f682f John Groves 2024-02-23  103  		break;
ab0d141a2f682f John Groves 2024-02-23  104  	case PUD_ORDER:
ab0d141a2f682f John Groves 2024-02-23  105  		pgf = FAMFS_PUD;
ab0d141a2f682f John Groves 2024-02-23  106  		break;
ab0d141a2f682f John Groves 2024-02-23  107  	}
ab0d141a2f682f John Groves 2024-02-23  108  	famfs_inc_fault_counter(fc, pgf);
ab0d141a2f682f John Groves 2024-02-23  109  }
ab0d141a2f682f John Groves 2024-02-23  110  

:::::: The code at line 101 was first introduced by commit
:::::: ab0d141a2f682fa4c170db5611a062677426458f famfs: Add fault counters

:::::: TO: John Groves <John@Groves.net>
:::::: CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
