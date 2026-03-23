Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C43B6C08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278796; cv=none; b=J7OqDVClEYfz4072qDqkpTdrprJFmF1H60Msj06Ke2KbfDnwrwTzHorfM0/YnZ2a3NfKm4EJ8TYNprr1DqOD9aG5tBfgYtw/pEi6bC/i38HdHCitXVy+hx0MlVhuf7DHyjZ3avZAXneQ3k9OKuiMLKRkAo3/qqurlxQ3nDbPxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278796; c=relaxed/simple;
	bh=e4Sadjcl0NPch2mahjTvqk07x8c1/Rn7Cff8DpnB6QU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qQw6fVoztwQ1IxNKnZslRcihFj7IBH366wceEtd/FJJbu66oXOJFfuWsmA1ZZz36bNzhb8bsYe1VQGQcCfQdX6ino+i+hYseilAbUQf+yNWwNWsONFg85f3zDytfBSWK4PLt6kebfhjWhQciVQzQcJ1gllKRXmOSA9k00T+cSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVy3otf/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVy3otf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774278794; x=1805814794;
  h=date:from:to:cc:subject:message-id;
  bh=e4Sadjcl0NPch2mahjTvqk07x8c1/Rn7Cff8DpnB6QU=;
  b=JVy3otf/MBgVvSniqxWhE1Ncj40Yal/FHACaOYr3x3KW1xnmES0+nrQK
   TSIxrtzvl7aKJbutcbASUuiwN8MaLsR/IXwQp0e6AZNzJeobexGHNryJv
   pK0II2xkpMv8vIXnkuSN5udEELvOA5TX9qXSB3rgZMIyNhkaluTld6dDf
   Y1vle5Lbr8L3aeORtEXLNol/zGMGYF0EFH/EqPRN75yaFsnGpYFVoScds
   CHVh98KYHtcgOS4yZcl04toXgokEqzT8aq99ZO4zndXbIcb27cCbPr1b3
   mBi3Zdc1O+kXdkz7goweWP24glEkHCk2UxxrzGpRQyxPVeZSjho0m5jrn
   A==;
X-CSE-ConnectionGUID: SaEWE752QcieuOlV12+Dgw==
X-CSE-MsgGUID: nZT6Y0lKQg2r2RnjNa22Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97898787"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97898787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:13:12 -0700
X-CSE-ConnectionGUID: guT875YOTRK3tFfSsuG0jw==
X-CSE-MsgGUID: mrZmy0ODScy4iPil1YnrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228782862"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 08:13:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4gxo-000000001hh-42oD;
	Mon, 23 Mar 2026 15:13:08 +0000
Date: Mon, 23 Mar 2026 23:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5/5]
 fs/smb/client/ioctl.c:324:10: warning: variable 'caps' set but not used
Message-ID: <202603232208.eSW7Y4n5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b8fc2a67e08ecb1e9ba7f5f5ee2352b956ca941e
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [5/5] smb: move client and server files to common directory fs/smb
config: x86_64-randconfig-102-20260322 (https://download.01.org/0day-ci/archive/20260323/202603232208.eSW7Y4n5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232208.eSW7Y4n5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232208.eSW7Y4n5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/ioctl.c:324:10: warning: variable 'caps' set but not used [-Wunused-but-set-variable]
     324 |         __u64   caps;
         |                 ^
   1 warning generated.
--
>> fs/smb/client/cifsroot.c:83:12: warning: no previous prototype for function 'cifs_root_data' [-Wmissing-prototypes]
      83 | int __init cifs_root_data(char **dev, char **opts)
         |            ^
   fs/smb/client/cifsroot.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | int __init cifs_root_data(char **dev, char **opts)
         | ^
         | static 
   1 warning generated.


vim +/caps +324 fs/smb/client/ioctl.c

7ba3d1cdb7988c fs/cifs/ioctl.c Steve French    2021-05-02  312  
f9ddcca4cf7d95 fs/cifs/ioctl.c Steve French    2008-05-15  313  long cifs_ioctl(struct file *filep, unsigned int command, unsigned long arg)
^1da177e4c3f41 fs/cifs/ioctl.c Linus Torvalds  2005-04-16  314  {
496ad9aa8ef448 fs/cifs/ioctl.c Al Viro         2013-01-23  315  	struct inode *inode = file_inode(filep);
7e7db86c7e1088 fs/cifs/ioctl.c Steve French    2019-09-19  316  	struct smb3_key_debug_info pkey_inf;
^1da177e4c3f41 fs/cifs/ioctl.c Linus Torvalds  2005-04-16  317  	int rc = -ENOTTY; /* strange error - but the precedent */
6d5786a34d98bf fs/cifs/ioctl.c Pavel Shilovsky 2012-06-20  318  	unsigned int xid;
ba00ba64cf0895 fs/cifs/ioctl.c Jeff Layton     2010-09-20  319  	struct cifsFileInfo *pSMBFile = filep->private_data;
96daf2b09178d8 fs/cifs/ioctl.c Steve French    2011-05-27  320  	struct cifs_tcon *tcon;
a77592a70081ed fs/cifs/ioctl.c Ronnie Sahlberg 2020-07-09  321  	struct tcon_link *tlink;
d26c2ddd335696 fs/cifs/ioctl.c Steve French    2020-02-06  322  	struct cifs_sb_info *cifs_sb;
f654bac2227adc fs/cifs/ioctl.c Steve French    2005-04-28  323  	__u64	ExtAttrBits = 0;
618763958b2291 fs/cifs/ioctl.c Jeff Layton     2010-11-08 @324  	__u64   caps;

:::::: The code at line 324 was first introduced by commit
:::::: 618763958b2291a09057dbfa553da6ded93dcfad cifs: make cifs_ioctl handle NULL filp->private_data correctly

:::::: TO: Jeff Layton <jlayton@redhat.com>
:::::: CC: Steve French <sfrench@us.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
