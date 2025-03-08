Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8B31A9B29
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741448617; cv=none; b=LQIjBcNFNBGiuP6IFdysL78lS3canX7/WosFyXd/iD7lRf0+TvtTjCbdz2ozCF0oPsZQUeXFBz6O0Dp64FeiJd5QEB7JQurzsob2V0NGC81VXrFBN9YQms6q7PYcAkq7Nyf9fsxRfIp18NXpgUiGeBlrebSq4LvMqOdJnmtQPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741448617; c=relaxed/simple;
	bh=3NLC2xHfsjhh7DZQpP43y7jXI4Jig6o2A/+KDxJyOk8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPbzDoeNoW6sUV55mdwIGJzjIcCCCu+sBfyCB53djYd20a5vjP2t8ZkhF635tzQ9dINt/+e7I4AcU8IyV/+3qaRHYGk22MUsPSqTBb4hi9dkd23kP/0siHBqV4WQ1QDpySEiSV5xRIHHufX9ET7zjeOccJr5+0E8AemSzYISoo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FywjOAw2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FywjOAw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741448616; x=1772984616;
  h=date:from:cc:subject:message-id:mime-version;
  bh=3NLC2xHfsjhh7DZQpP43y7jXI4Jig6o2A/+KDxJyOk8=;
  b=FywjOAw2WZRJz+uj3g8xoGL4zNIRM5T+TJjn2g6MxNZfPAK6MFS8si2a
   /2SDZG0cIgdBvD7qQYDASzCw5qpfHggd2bLyJZpk5UXT0bJ5r7ESupoW3
   w1KAgOkr+Bmw2S/cpoVIBiKmtz2EP1NjlgM6y4K43oe4VNzl7q/HZqmTR
   gkOTjSVyb3doaEJ8vulsUVDy3pLUYVhzPSMStRi9QcT2149k5GDGTSnpY
   pPqVj8/OyO7P26BFM5ZQOGZyqCrHJATe/tCJqYz1AFDdJkjEf2pRL02yL
   jqO6/a6kKgPy4La395/6GUGjfuW0EsxJzipalt2s+YJx1SC40YEn7DBun
   Q==;
X-CSE-ConnectionGUID: /orP279OSuKkDKnPIdHrRw==
X-CSE-MsgGUID: 3RQp862YSRK6Id2092jKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="59893201"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="59893201"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 07:43:36 -0800
X-CSE-ConnectionGUID: fDTGtZxMSPWpv+Tqceec6A==
X-CSE-MsgGUID: MH4eIHpxSE+/LjgKGGA+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="120275194"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2025 07:43:34 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqwKq-00020i-0i
	for oe-kbuild-all@lists.linux.dev;
	Sat, 08 Mar 2025 15:43:32 +0000
Date: Sat, 8 Mar 2025 23:42:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] security/smack/smack_lsm.c:314: warning:
 Function parameter or member 'inode' not described in 'init_inode_smack'
Message-ID: <202503082319.UtUYdFF0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: afb1cbe37440c7f38b9cf46fc331cc9dfd5cce21 [1/1] LSM: Infrastructure management of the inode security
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250308/202503082319.UtUYdFF0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503082319.UtUYdFF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082319.UtUYdFF0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/smack/smack_lsm.c:314: warning: Function parameter or member 'inode' not described in 'init_inode_smack'
>> security/smack/smack_lsm.c:314: warning: Excess function parameter 'isp' description in 'init_inode_smack'
   security/smack/smack_lsm.c:400: warning: Function parameter or member 'mode' not described in 'smk_ptrace_mode'
   security/smack/smack_lsm.c:516: warning: Function parameter or member 'typefrom_file' not described in 'smack_syslog'
   security/smack/smack_lsm.c:516: warning: Excess function parameter 'type' description in 'smack_syslog'
   security/smack/smack_lsm.c:694: warning: Function parameter or member 'mnt_opts' not described in 'smack_set_mnt_opts'
   security/smack/smack_lsm.c:694: warning: Excess function parameter 'opts' description in 'smack_set_mnt_opts'
   security/smack/smack_lsm.c:1144: warning: Function parameter or member 'path' not described in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1144: warning: Excess function parameter 'mnt' description in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1144: warning: Excess function parameter 'dentry' description in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1574: warning: Function parameter or member 'file' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1574: warning: Function parameter or member 'reqprot' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1574: warning: Function parameter or member 'prot' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1574: warning: Function parameter or member 'flags' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1796: warning: Excess function parameter 'cred' description in 'smack_file_open'
   security/smack/smack_lsm.c:1824: warning: Function parameter or member 'cred' not described in 'smack_cred_alloc_blank'
   security/smack/smack_lsm.c:1824: warning: Excess function parameter 'new' description in 'smack_cred_alloc_blank'
   security/smack/smack_lsm.c:1905: warning: Function parameter or member 'cred' not described in 'smack_cred_getsecid'
   security/smack/smack_lsm.c:1905: warning: Excess function parameter 'c' description in 'smack_cred_getsecid'
   security/smack/smack_lsm.c:2062: warning: Excess function parameter 'policy' description in 'smack_task_setscheduler'
   security/smack/smack_lsm.c:2062: warning: Excess function parameter 'lp' description in 'smack_task_setscheduler'
   security/smack/smack_lsm.c:2534: warning: Function parameter or member 'sk' not described in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2534: warning: Function parameter or member 'act' not described in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2534: warning: Excess function parameter 'sock' description in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2947: warning: Function parameter or member 'ipc' not described in 'smack_shm_shmat'
   security/smack/smack_lsm.c:2947: warning: Excess function parameter 'isp' description in 'smack_shm_shmat'


vim +314 security/smack/smack_lsm.c

e114e473771c84 Casey Schaufler  2008-02-04  306  
e114e473771c84 Casey Schaufler  2008-02-04  307  /**
afb1cbe37440c7 Casey Schaufler  2018-09-21  308   * init_inode_smack - initialize an inode security blob
afb1cbe37440c7 Casey Schaufler  2018-09-21  309   * @isp: the blob to initialize
21c7eae21a2100 Lukasz Pawelczyk 2014-08-29  310   * @skp: a pointer to the Smack label entry to use in the blob
e114e473771c84 Casey Schaufler  2008-02-04  311   *
e114e473771c84 Casey Schaufler  2008-02-04  312   */
afb1cbe37440c7 Casey Schaufler  2018-09-21  313  static void init_inode_smack(struct inode *inode, struct smack_known *skp)
e114e473771c84 Casey Schaufler  2008-02-04 @314  {
afb1cbe37440c7 Casey Schaufler  2018-09-21  315  	struct inode_smack *isp = smack_inode(inode);
e114e473771c84 Casey Schaufler  2008-02-04  316  
21c7eae21a2100 Lukasz Pawelczyk 2014-08-29  317  	isp->smk_inode = skp;
e114e473771c84 Casey Schaufler  2008-02-04  318  	isp->smk_flags = 0;
e114e473771c84 Casey Schaufler  2008-02-04  319  	mutex_init(&isp->smk_lock);
e114e473771c84 Casey Schaufler  2008-02-04  320  }
e114e473771c84 Casey Schaufler  2008-02-04  321  

:::::: The code at line 314 was first introduced by commit
:::::: e114e473771c848c3cfec05f0123e70f1cdbdc99 Smack: Simplified Mandatory Access Control Kernel

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
