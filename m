Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1021320F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 16:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692635997; x=1724171997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Io+2layf68syRT+TNxzlNfCjrJB/bIVlIGVcoEu6NZE=;
  b=GCbd9qjnGu+YJYrDIGdqPkPwu4oQhM86LoYuTNy/RC34mktsBGAF+vzF
   eZj6B7KU4ElkwHcd5Quef7u9/SN1fA9oGdBDpKgb8oxSCIKjtjqFKk5X4
   ey3LlaWwLK4e47hj9IAgbwRIGOaFZfL9RB8rKzO9jnXNz4GkXeHUBfZP2
   fasjIhyrChr+LqYYM7SO7IVNR3MbOY0ANuT5nxWf/XIUFm2XSFTyp6Teo
   aHaKqdOsTx2r+qZ4upvwKWKXllwpwVTNIpIBY2t1I/fehsUwV3/eT2+B4
   LNxq1CgQwSDgHZY9Tm5/ChJ5+iVPqS3NTa6/PysIPwCFWN6daxzH+N7rw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440020921"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="440020921"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="712845517"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="712845517"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Aug 2023 09:39:55 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY7wY-0000hQ-0p;
	Mon, 21 Aug 2023 16:39:54 +0000
Date: Tue, 22 Aug 2023 00:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Teigland <teigland@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11347/11453] fs/dlm/debug_fs.c:1031:50: warning:
 '_queued_asts' directive output may be truncated writing 12 bytes into a
 region of size between 8 and 72
Message-ID: <202308220024.7HnE6uda-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: abb75a2a7ad1155be577117b0fa88a9b7f97f338 [11347/11453] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git
config: loongarch-randconfig-r032-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220024.7HnE6uda-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220024.7HnE6uda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220024.7HnE6uda-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/dlm/debug_fs.c: In function 'dlm_create_debug_file':
   fs/dlm/debug_fs.c:1020:58: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1020 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
         |                                                          ^
   fs/dlm/debug_fs.c:1020:9: note: 'snprintf' output between 9 and 73 bytes into a destination of size 72
    1020 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/dlm/debug_fs.c:1031:50: warning: '_queued_asts' directive output may be truncated writing 12 bytes into a region of size between 8 and 72 [-Wformat-truncation=]
    1031 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
         |                                                  ^~~~~~~~~~~~
   fs/dlm/debug_fs.c:1031:9: note: 'snprintf' output between 13 and 77 bytes into a destination of size 72
    1031 |         snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/_queued_asts +1031 fs/dlm/debug_fs.c

5b2f981fde8b0d Alexander Aring    2021-05-21   973  
a48f9721e6db74 Greg Kroah-Hartman 2019-06-12   974  void dlm_create_debug_file(struct dlm_ls *ls)
e7fd41792fc0ee David Teigland     2006-01-18   975  {
5de6319b183930 David Teigland     2006-07-25   976  	char name[DLM_LOCKSPACE_LEN + 8];
5de6319b183930 David Teigland     2006-07-25   977  
d022509d1c54be David Teigland     2008-12-16   978  	/* format 1 */
d022509d1c54be David Teigland     2008-12-16   979  
5de6319b183930 David Teigland     2006-07-25   980  	ls->ls_debug_rsb_dentry = debugfs_create_file(ls->ls_name,
e7fd41792fc0ee David Teigland     2006-01-18   981  						      S_IFREG | S_IRUGO,
e7fd41792fc0ee David Teigland     2006-01-18   982  						      dlm_root,
e7fd41792fc0ee David Teigland     2006-01-18   983  						      ls,
892c4467e335e9 David Teigland     2009-01-07   984  						      &format1_fops);
d022509d1c54be David Teigland     2008-12-16   985  
d022509d1c54be David Teigland     2008-12-16   986  	/* format 2 */
5de6319b183930 David Teigland     2006-07-25   987  
5de6319b183930 David Teigland     2006-07-25   988  	memset(name, 0, sizeof(name));
d022509d1c54be David Teigland     2008-12-16   989  	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_locks", ls->ls_name);
5de6319b183930 David Teigland     2006-07-25   990  
d022509d1c54be David Teigland     2008-12-16   991  	ls->ls_debug_locks_dentry = debugfs_create_file(name,
5054e79de99984 Alexander Aring    2021-11-02   992  							0644,
5de6319b183930 David Teigland     2006-07-25   993  							dlm_root,
5de6319b183930 David Teigland     2006-07-25   994  							ls,
892c4467e335e9 David Teigland     2009-01-07   995  							&format2_fops);
d022509d1c54be David Teigland     2008-12-16   996  
d022509d1c54be David Teigland     2008-12-16   997  	/* format 3 */
5de6319b183930 David Teigland     2006-07-25   998  
9dd592d70be0db David Teigland     2007-05-29   999  	memset(name, 0, sizeof(name));
d022509d1c54be David Teigland     2008-12-16  1000  	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_all", ls->ls_name);
9dd592d70be0db David Teigland     2007-05-29  1001  
d022509d1c54be David Teigland     2008-12-16  1002  	ls->ls_debug_all_dentry = debugfs_create_file(name,
9dd592d70be0db David Teigland     2007-05-29  1003  						      S_IFREG | S_IRUGO,
9dd592d70be0db David Teigland     2007-05-29  1004  						      dlm_root,
9dd592d70be0db David Teigland     2007-05-29  1005  						      ls,
892c4467e335e9 David Teigland     2009-01-07  1006  						      &format3_fops);
d022509d1c54be David Teigland     2008-12-16  1007  
c04fecb4d9f775 David Teigland     2012-05-10  1008  	/* format 4 */
c04fecb4d9f775 David Teigland     2012-05-10  1009  
c04fecb4d9f775 David Teigland     2012-05-10  1010  	memset(name, 0, sizeof(name));
c04fecb4d9f775 David Teigland     2012-05-10  1011  	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_toss", ls->ls_name);
c04fecb4d9f775 David Teigland     2012-05-10  1012  
c04fecb4d9f775 David Teigland     2012-05-10  1013  	ls->ls_debug_toss_dentry = debugfs_create_file(name,
c04fecb4d9f775 David Teigland     2012-05-10  1014  						       S_IFREG | S_IRUGO,
c04fecb4d9f775 David Teigland     2012-05-10  1015  						       dlm_root,
c04fecb4d9f775 David Teigland     2012-05-10  1016  						       ls,
c04fecb4d9f775 David Teigland     2012-05-10  1017  						       &format4_fops);
c04fecb4d9f775 David Teigland     2012-05-10  1018  
d022509d1c54be David Teigland     2008-12-16  1019  	memset(name, 0, sizeof(name));
d022509d1c54be David Teigland     2008-12-16  1020  	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
d022509d1c54be David Teigland     2008-12-16  1021  
d022509d1c54be David Teigland     2008-12-16  1022  	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
63eab2b00bcff6 Alexander Aring    2021-11-02  1023  							  0644,
d022509d1c54be David Teigland     2008-12-16  1024  							  dlm_root,
d022509d1c54be David Teigland     2008-12-16  1025  							  ls,
d022509d1c54be David Teigland     2008-12-16  1026  							  &waiters_fops);
541adb0d4d10b4 Alexander Aring    2023-08-01  1027  
541adb0d4d10b4 Alexander Aring    2023-08-01  1028  	/* format 5 */
541adb0d4d10b4 Alexander Aring    2023-08-01  1029  
541adb0d4d10b4 Alexander Aring    2023-08-01  1030  	memset(name, 0, sizeof(name));
541adb0d4d10b4 Alexander Aring    2023-08-01 @1031  	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
541adb0d4d10b4 Alexander Aring    2023-08-01  1032  
541adb0d4d10b4 Alexander Aring    2023-08-01  1033  	ls->ls_debug_queued_asts_dentry = debugfs_create_file(name,
541adb0d4d10b4 Alexander Aring    2023-08-01  1034  							      0644,
541adb0d4d10b4 Alexander Aring    2023-08-01  1035  							      dlm_root,
541adb0d4d10b4 Alexander Aring    2023-08-01  1036  							      ls,
541adb0d4d10b4 Alexander Aring    2023-08-01  1037  							      &format5_fops);
e7fd41792fc0ee David Teigland     2006-01-18  1038  }
e7fd41792fc0ee David Teigland     2006-01-18  1039  

:::::: The code at line 1031 was first introduced by commit
:::::: 541adb0d4d10b4daf15f4b6b73c5d6b855d23eb5 fs: dlm: debugfs for queued callbacks

:::::: TO: Alexander Aring <aahringo@redhat.com>
:::::: CC: David Teigland <teigland@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
