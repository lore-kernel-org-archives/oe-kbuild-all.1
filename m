Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C3316400
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688139935; x=1719675935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8hFspGIGmxVK7KSs3HoEIOhuM7GjtEfkkVrbsr4W2rw=;
  b=cCjdAfBJAO+689OzJCtWwtrqxWqe/jcxswvkmfDjndysYgDh7JCGsVpK
   DhnmXDeoq1EkoJ+OcLgQQv2tjgEzqO6rWietExwCBHeZI0ptM8gDPi1VM
   28m/vwfpoCTEeoEWOeom32r+FlZf1j3bOncpSdRurvklPYEVveIbXpjW+
   NDnP6GsxpW+gXXK4/NDYiBhePR1NcyxTKGHBZ/KPZmcbpC8vUMW/AqoSC
   CQ1MT1drM/9k6h7NjY2jGOm5Tx+UPJUDHPsyKl7fIH3IrLMUcWjda2e2h
   ikn4C3HsRH0hQDFSccipdZ6cAfTXlb11aXGhAlGMu8dB33L1o6STi0L9E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342008742"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="342008742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 08:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711852174"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="711852174"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 08:45:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFGJQ-000F6P-1X;
	Fri, 30 Jun 2023 15:45:32 +0000
Date: Fri, 30 Jun 2023 23:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-4.14.y 407/1535]
 fs/f2fs/sysfs.c:646:37: warning: 'f2fs_seq_victim_bits_fops' defined but not
 used
Message-ID: <202306302312.llPE5jzp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yunlong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-4.14.y
head:   b13285aeee5d3e6ea997afef42b19e2d31f70925
commit: 15027cf6278c311a3b415e2906ba6b8e53098826 [407/1535] f2fs: add proc entry to show victim_secmap bitmap
config: x86_64-buildonly-randconfig-r003-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302312.llPE5jzp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302312.llPE5jzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302312.llPE5jzp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:646:37: warning: 'f2fs_seq_victim_bits_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:656:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(victim_bits);
    ^~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:646:37: warning: 'f2fs_seq_iostat_info_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:655:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(iostat_info);
    ^~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:646:37: warning: 'f2fs_seq_segment_bits_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:654:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(segment_bits);
    ^~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:646:37: warning: 'f2fs_seq_segment_info_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:653:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(segment_info);
    ^~~~~~~~~~~~~~~~~~


vim +/f2fs_seq_victim_bits_fops +646 fs/f2fs/sysfs.c

15027cf6278c31 Yunlong Song 2018-07-23  639  
8ceffcb29e61ba Chao Yu      2017-06-14  640  #define F2FS_PROC_FILE_DEF(_name)					\
8ceffcb29e61ba Chao Yu      2017-06-14  641  static int _name##_open_fs(struct inode *inode, struct file *file)	\
8ceffcb29e61ba Chao Yu      2017-06-14  642  {									\
8ceffcb29e61ba Chao Yu      2017-06-14  643  	return single_open(file, _name##_seq_show, PDE_DATA(inode));	\
8ceffcb29e61ba Chao Yu      2017-06-14  644  }									\
8ceffcb29e61ba Chao Yu      2017-06-14  645  									\
8ceffcb29e61ba Chao Yu      2017-06-14 @646  static const struct file_operations f2fs_seq_##_name##_fops = {		\
8ceffcb29e61ba Chao Yu      2017-06-14  647  	.open = _name##_open_fs,					\
8ceffcb29e61ba Chao Yu      2017-06-14  648  	.read = seq_read,						\
8ceffcb29e61ba Chao Yu      2017-06-14  649  	.llseek = seq_lseek,						\
8ceffcb29e61ba Chao Yu      2017-06-14  650  	.release = single_release,					\
8ceffcb29e61ba Chao Yu      2017-06-14  651  };
8ceffcb29e61ba Chao Yu      2017-06-14  652  

:::::: The code at line 646 was first introduced by commit
:::::: 8ceffcb29e61ba882a011b1e4d73ca03691fdc2e f2fs: move sysfs code from super.c to fs/f2fs/sysfs.c

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
