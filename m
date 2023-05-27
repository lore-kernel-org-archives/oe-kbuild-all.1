Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F2D7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685172362; x=1716708362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iyNVlXjfQwacZ7X/zuK+HMPBvKI11zROleMOhRosigs=;
  b=caonrAVvPRAGUKhPwA+CStESFZdVeBhuI2OP7gNy7nKemRHR+rv6vG9t
   e+G1/27B6BbBuYuTpBGNqx8YwF1Rc/2gRqHtlJvoKSNc+vBVQU2Egs/oR
   jDZ67CzOdq2WFu1f33/6hKQJULGiA01sq6RGCV4xeBm+6ttamcTWsladT
   YXx7rFjZdGVa8bSlz1enJzj0zs8P44x+JeMpDcD7PntVT6dD9KufFOybk
   lpg9r9Ng9Xhgeqx3z7FD9ff/wbTgURQdH7E6SGP3MwkK3KWXd3b56PSeZ
   QiRwiF3iPSzI0MQrAvl4YN27Y0vh9yGosRrs9bKSwoHEM6DAxXIpvFHCz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354386491"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="354386491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770541545"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="770541545"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 May 2023 00:25:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2oJH-000Jpu-0m;
	Sat, 27 May 2023 07:25:55 +0000
Date: Sat, 27 May 2023 15:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/smb/client/ioctl.c:324:17: warning: variable 'caps' set but not
 used
Message-ID: <202305271550.A77PrVv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   49572d5361298711207ab387a6c318407deb963a
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   2 days ago
config: i386-randconfig-i063-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271550.A77PrVv9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38c8a9a52082579090e34c033d439ed2cd1a462d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 38c8a9a52082579090e34c033d439ed2cd1a462d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/smb/client/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271550.A77PrVv9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/smb/client/ioctl.c: In function 'cifs_ioctl':
>> fs/smb/client/ioctl.c:324:17: warning: variable 'caps' set but not used [-Wunused-but-set-variable]
     324 |         __u64   caps;
         |                 ^~~~


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
