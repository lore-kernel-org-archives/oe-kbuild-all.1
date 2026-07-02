Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085E5282F24
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782963855; cv=none; b=mTvkFhnw5Q0X0YmdhDAPxhw1aSJIY+vbAv8U2GehGZvRKPTRW8RCMDN+vxhxqd+uLxwxW+1FUDq+jSIoEhLO3DOZX/Fwe19HrbMCSCKAn+0vqZ38doRpveIr+QOA4Y7dgbACGIfQviuch/sQisPoL6SuGE6knKIxP2j+bP5BwdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782963855; c=relaxed/simple;
	bh=2Udj2CSBtPYPIq3u+gZQbgMT3GOxrD+nJjJGE4WIc6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SB2IJ8t8+jtrf9ba+sbPDA09jug2piWzagdCllJcSDo/8q1/nY2o88VnVNSe2spV0Eg+igY0ZSPdyveszwH+8BQpCuDRCdJ1q0bBlXAhzmUGIqbxGGtTpcJHh57WOzazsNw/BADCoRJEVhgeMfqU6oyaFznXQWSz1o95AvbD+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiiq46uI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiiq46uI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782963854; x=1814499854;
  h=date:from:to:cc:subject:message-id;
  bh=2Udj2CSBtPYPIq3u+gZQbgMT3GOxrD+nJjJGE4WIc6k=;
  b=jiiq46uIfNpmkhYhRDftNbLHn6jvlQQJm9nSW6JkBQdgKDDZMniqfUMW
   rBAcR3Mk/Gq5YkrbVCy2OFVmC9bxfGvHVKNcDSS4GhQ2/wcDrF08pfyTD
   pCMOQpO13Uxw1UnVtkE+jdNdfKTaKyBiC2b/V2guF0rMxfAzuiIVF1T5T
   5xOx8YaOHHB3HFiKligg+EkzXC8Eqbkzt+K3vNOKAOMGdeVFewo6MZhLe
   cPCm91khQLayugoLtReGfo/jKjUpCYe/x3x/D8PZOUBpyHca3y889UNOM
   rPy8pfrDOWypGcl0PQBtXZnHzs7mnmJ3Ic3Rpr31xsukKm2N+M62tMUMX
   A==;
X-CSE-ConnectionGUID: Z3XkQg8ZRD6DeezLHB18HA==
X-CSE-MsgGUID: oIMsj8jKQeuZCongmij+6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83696514"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83696514"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:44:14 -0700
X-CSE-ConnectionGUID: M5Gwm8ZwSMiiFngt6HaDDQ==
X-CSE-MsgGUID: vzHuQPkdSxqPYRmjvloQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251696599"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 20:44:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8LR-000000009x5-2U8S;
	Thu, 02 Jul 2026 03:44:09 +0000
Date: Thu, 02 Jul 2026 11:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/166]
 fs/smb/client/ioctl.c:324:10: warning: variable 'caps' set but not used
Message-ID: <202607021125.UubDVqRX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2a9e8b82544e3c1e2678c2c07bef3d3706156ee4
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/166] smb: move client and server files to common directory fs/smb
config: x86_64-randconfig-003-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021125.UubDVqRX-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021125.UubDVqRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021125.UubDVqRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> fs/smb/client/ioctl.c:324:10: warning: variable 'caps' set but not used [-Wunused-but-set-variable]
     324 |         __u64   caps;
         |                 ^
   2 warnings generated.


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
