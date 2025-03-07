Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A04B19DF8B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741381269; cv=none; b=pu6QdUt6zWfyy8NfZNYOcnUaBhg8oWJUCqHJTUYbVPg6C33ess3E6Hfe5HET0Xr9kT/IpU1BXIQG8oj0IlLPWvbkoNAu2bkpve0PDxeJIWjH+rS0Z2/SrDmuPNzRSQLz32lbwrd1v1R9vHljfLvowmM88VGXavg+aPsFGjiwwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741381269; c=relaxed/simple;
	bh=Y/SvABzE+q4Gx1lUzQIChsiHprVVBNhdd3im6hbON5U=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1APIFwhsw7y0J4/mx0AWABUtl7phGJyb5QS1Gie4mAMJel4qYXd08XUI8Qv/EywdnxZrOCvjnV51d4ey4UMqHj26Eudb2qJ4xjyVq/sGcbWBS1D1poiL3DLxEdx2SAcYeq+UjFZ89Ibcd3mY0AWtvm0Dc9BrmPodZyUSp2vbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCP+i/Eo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCP+i/Eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741381267; x=1772917267;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Y/SvABzE+q4Gx1lUzQIChsiHprVVBNhdd3im6hbON5U=;
  b=JCP+i/Eo3bP7upy/SvJJ+GKtjg+5VwP5ZJ5l011iDDvCgxs0+4UBEEtR
   9EN6kqsrAosty/0p+CDbmbH6zf4U5zpj9EgoqbwXBdKowThN5BWGqmKH8
   KOkeNgj3ZfF7Mr+mMx5Au00fbdkEtB1YXya+/YmNvOGZI1BODwEDzpfeY
   uNG5yjwAXjzTeMn5MOMxrp+tJrcNNJtUsPI0le38mJkVi8sZ6FWZDq/JX
   2bOPoBJuwfWf4WME7eSvTk81e32DBXC12Or/U5U3leILoUKDT+h3hNpS0
   E169iC4XFaG+GtIffiibO4+cKeLnGgesco5upwNEMsMbTa7ujThZO+AMX
   A==;
X-CSE-ConnectionGUID: Eeo26zU7TYiWtVA/XKgHqg==
X-CSE-MsgGUID: qu0xFWMRQN+Wl1NOBbZ+1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="59998823"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="59998823"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 13:01:07 -0800
X-CSE-ConnectionGUID: wrduOAwbSF2PZ0qmhPKFOQ==
X-CSE-MsgGUID: LmHggyLzQRqkfsjwL+T/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="119251141"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2025 13:01:06 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqeoJ-00012z-0F
	for oe-kbuild-all@lists.linux.dev;
	Fri, 07 Mar 2025 21:00:50 +0000
Date: Sat, 8 Mar 2025 04:59:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] security/smack/smack_lsm.c:1983: warning:
 Function parameter or member 'cred' not described in 'smack_cred_getsecid'
Message-ID: <202503080453.mM3lz0u6-lkp@intel.com>
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
commit: b17103a8b8ae9c9ecc5e1e6501b1478ee2dc6fe4 [1/1] Smack: Abstract use of cred security blob
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250308/202503080453.mM3lz0u6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080453.mM3lz0u6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080453.mM3lz0u6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/smack/smack_lsm.c:415: warning: Function parameter or member 'mode' not described in 'smk_ptrace_mode'
   security/smack/smack_lsm.c:531: warning: Function parameter or member 'typefrom_file' not described in 'smack_syslog'
   security/smack/smack_lsm.c:531: warning: Excess function parameter 'type' description in 'smack_syslog'
   security/smack/smack_lsm.c:709: warning: Function parameter or member 'mnt_opts' not described in 'smack_set_mnt_opts'
   security/smack/smack_lsm.c:709: warning: Excess function parameter 'opts' description in 'smack_set_mnt_opts'
   security/smack/smack_lsm.c:1195: warning: Function parameter or member 'path' not described in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1195: warning: Excess function parameter 'mnt' description in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1195: warning: Excess function parameter 'dentry' description in 'smack_inode_getattr'
   security/smack/smack_lsm.c:1637: warning: Function parameter or member 'file' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1637: warning: Function parameter or member 'reqprot' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1637: warning: Function parameter or member 'prot' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1637: warning: Function parameter or member 'flags' not described in 'smack_mmap_file'
   security/smack/smack_lsm.c:1855: warning: Excess function parameter 'cred' description in 'smack_file_open'
   security/smack/smack_lsm.c:1883: warning: Function parameter or member 'cred' not described in 'smack_cred_alloc_blank'
   security/smack/smack_lsm.c:1883: warning: Excess function parameter 'new' description in 'smack_cred_alloc_blank'
>> security/smack/smack_lsm.c:1983: warning: Function parameter or member 'cred' not described in 'smack_cred_getsecid'
>> security/smack/smack_lsm.c:1983: warning: Excess function parameter 'c' description in 'smack_cred_getsecid'
   security/smack/smack_lsm.c:2140: warning: Excess function parameter 'policy' description in 'smack_task_setscheduler'
   security/smack/smack_lsm.c:2140: warning: Excess function parameter 'lp' description in 'smack_task_setscheduler'
   security/smack/smack_lsm.c:2612: warning: Function parameter or member 'sk' not described in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2612: warning: Function parameter or member 'act' not described in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:2612: warning: Excess function parameter 'sock' description in 'smk_ipv6_port_check'
   security/smack/smack_lsm.c:3025: warning: Function parameter or member 'ipc' not described in 'smack_shm_shmat'
   security/smack/smack_lsm.c:3025: warning: Excess function parameter 'isp' description in 'smack_shm_shmat'


vim +1983 security/smack/smack_lsm.c

ee18d64c1f6320 David Howells   2009-09-02  1974  
3ec30113264a7b Matthew Garrett 2018-01-08  1975  /**
3ec30113264a7b Matthew Garrett 2018-01-08  1976   * smack_cred_getsecid - get the secid corresponding to a creds structure
3ec30113264a7b Matthew Garrett 2018-01-08  1977   * @c: the object creds
3ec30113264a7b Matthew Garrett 2018-01-08  1978   * @secid: where to put the result
3ec30113264a7b Matthew Garrett 2018-01-08  1979   *
3ec30113264a7b Matthew Garrett 2018-01-08  1980   * Sets the secid to contain a u32 version of the smack label.
3ec30113264a7b Matthew Garrett 2018-01-08  1981   */
b17103a8b8ae9c Casey Schaufler 2018-11-09  1982  static void smack_cred_getsecid(const struct cred *cred, u32 *secid)
3ec30113264a7b Matthew Garrett 2018-01-08 @1983  {
3ec30113264a7b Matthew Garrett 2018-01-08  1984  	struct smack_known *skp;
3ec30113264a7b Matthew Garrett 2018-01-08  1985  
3ec30113264a7b Matthew Garrett 2018-01-08  1986  	rcu_read_lock();
b17103a8b8ae9c Casey Schaufler 2018-11-09  1987  	skp = smk_of_task(smack_cred(cred));
3ec30113264a7b Matthew Garrett 2018-01-08  1988  	*secid = skp->smk_secid;
3ec30113264a7b Matthew Garrett 2018-01-08  1989  	rcu_read_unlock();
3ec30113264a7b Matthew Garrett 2018-01-08  1990  }
3ec30113264a7b Matthew Garrett 2018-01-08  1991  

:::::: The code at line 1983 was first introduced by commit
:::::: 3ec30113264a7bcd389f51d1738e42da0f41bb5a security: Add a cred_getsecid hook

:::::: TO: Matthew Garrett <mjg59@google.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
