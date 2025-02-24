Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED91E487
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740401545; cv=none; b=DZbq6ATUYiMPmAfjAqG+7t32DY2fgwAcvMHdB1I6+hn0MTJMKG6sX2RRti14xak59r4csjKa/JYWyWb8hlTrOYw8w+9OskCnUi1Tlkh+tN+Q4DuR8d9WV3ChHpUy9tj2zU2n9QI5j8RxkcqjatdSuiitZBIhCCOoDAXn775mNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740401545; c=relaxed/simple;
	bh=OE3dOxjMSdCJq/5ltfKNVJI7Wxgpas4dGiARDOHib8I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkZ9h+XBqQdyqrgkHB2fGPf+N51JQGrPIPnCVQwirjKuNF9aawkvFhOYLE1zgc6oNqFW3zAtN14oZ7JEZtmEX9d0O6l6klL4ckPmQjLWnA2cwp3NzDWpHhvdynEDkhHJrgzKRTIkWMjWsHM+PGqnReEygfxxBmYf8m37oCqkI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwYiYk/+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwYiYk/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740401541; x=1771937541;
  h=date:from:cc:subject:message-id:mime-version;
  bh=OE3dOxjMSdCJq/5ltfKNVJI7Wxgpas4dGiARDOHib8I=;
  b=mwYiYk/+PGxtEK/xbt57Vd2J4gWt/2whqhwwe11otwwmUpY9FiErJL0I
   lxKJ8L+TPEjE713CMWYynKVxtjFmZ+tb5we5nFT0Nuit0wsaDaALcuW1D
   olE+zIdCaytsA/ngz7jLTj7kkipsVNinhPaD1VazKYeBEbJ9WB5DINVPG
   /qi7u7qt5j9J55m8RyIy1dpwhYDX6jLbgwrhXgRM3g+/FMi7iRB6Y64lr
   D3lyGqxrSBMMElm3X8NOthSNXjA0OUR70jP1fUlETftrveWuqyLUEXc34
   IBOQaEH4ZqiBV6wJearXFW1waeEZK6yjj01LDnahrRq6cYtUw/IujdDMv
   A==;
X-CSE-ConnectionGUID: su8woWuLQMOPs2P/r1QCVw==
X-CSE-MsgGUID: 5SJoc2/TQSa+IprWVS3AEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40997931"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40997931"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 04:52:20 -0800
X-CSE-ConnectionGUID: dL8yEM+3RmC1ZH6hY5MXMQ==
X-CSE-MsgGUID: Cq3Rb57rQuWOwgoP0E78ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115778398"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2025 04:52:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmXwX-0008Jf-1I
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 12:52:17 +0000
Date: Mon, 24 Feb 2025 20:52:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] fs/f2fs/sysfs.c:448:37: warning:
 'f2fs_seq_iostat_info_fops' defined but not used
Message-ID: <202502242000.Ycal5ow2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: b0af6d491a6b5f5622fa91ac75f34f3640f862c4 [1/1] f2fs: add app/fs io stat
config: s390-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250224/202502242000.Ycal5ow2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242000.Ycal5ow2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502242000.Ycal5ow2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/sysfs.c:448:37: warning: 'f2fs_seq_iostat_info_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:457:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(iostat_info);
    ^~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:448:37: warning: 'f2fs_seq_segment_bits_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:456:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(segment_bits);
    ^~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:448:37: warning: 'f2fs_seq_segment_info_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations f2fs_seq_##_name##_fops = {  \
                                        ^
   fs/f2fs/sysfs.c:455:1: note: in expansion of macro 'F2FS_PROC_FILE_DEF'
    F2FS_PROC_FILE_DEF(segment_info);
    ^~~~~~~~~~~~~~~~~~


vim +/f2fs_seq_iostat_info_fops +448 fs/f2fs/sysfs.c

b0af6d491a6b5f5 Chao Yu 2017-08-02  441  
8ceffcb29e61ba8 Chao Yu 2017-06-14  442  #define F2FS_PROC_FILE_DEF(_name)					\
8ceffcb29e61ba8 Chao Yu 2017-06-14  443  static int _name##_open_fs(struct inode *inode, struct file *file)	\
8ceffcb29e61ba8 Chao Yu 2017-06-14  444  {									\
8ceffcb29e61ba8 Chao Yu 2017-06-14  445  	return single_open(file, _name##_seq_show, PDE_DATA(inode));	\
8ceffcb29e61ba8 Chao Yu 2017-06-14  446  }									\
8ceffcb29e61ba8 Chao Yu 2017-06-14  447  									\
8ceffcb29e61ba8 Chao Yu 2017-06-14 @448  static const struct file_operations f2fs_seq_##_name##_fops = {		\
8ceffcb29e61ba8 Chao Yu 2017-06-14  449  	.open = _name##_open_fs,					\
8ceffcb29e61ba8 Chao Yu 2017-06-14  450  	.read = seq_read,						\
8ceffcb29e61ba8 Chao Yu 2017-06-14  451  	.llseek = seq_lseek,						\
8ceffcb29e61ba8 Chao Yu 2017-06-14  452  	.release = single_release,					\
8ceffcb29e61ba8 Chao Yu 2017-06-14  453  };
8ceffcb29e61ba8 Chao Yu 2017-06-14  454  

:::::: The code at line 448 was first introduced by commit
:::::: 8ceffcb29e61ba882a011b1e4d73ca03691fdc2e f2fs: move sysfs code from super.c to fs/f2fs/sysfs.c

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
