Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAEB10F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687857405; x=1719393405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Tr2GWKLEeM1kwhZIkOnr84CAsJffp66+s3s4dJ2YVQ=;
  b=FIKlpshjg+ijJh3o0JkGGLNckqxBBaDE7TlBQP/oYwLkhriasNNv1S2W
   ysulyKWbh6cuz3XH9R8U2LesZLXOtlz4f+/0WW6DSO04aADcd/KHX3xmo
   JqhFFBHTa5sY7XSVXlJZABP27rmuTwsQt6yeTuNEakGkMPm2Zo0ylZcav
   28a0m3MCORYcXZdfi7BDQf6Zx2FxCj771L05WeOHw4Uby9vwvjrmGyd49
   HHxG4Ep4C1hsxdeiBj5KFRYhgG38j8NOJMUp2C/LX0pKmDShoWEZAs7YN
   nclz5y3uTg+njqSDuMidvzDXbRB6cY1YnPabVXVOax5w1fBUCL2OLz3Kk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341862804"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="341862804"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 02:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="693785758"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="693785758"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jun 2023 02:16:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qE4nq-000Bql-1r;
	Tue, 27 Jun 2023 09:16:02 +0000
Date: Tue, 27 Jun 2023 17:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:linux-6.1.y 7106/7107]
 fs/smb/client/ioctl.c:324:17: warning: variable 'caps' set but not used
Message-ID: <202306271715.FGaP9NUA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.1.y
head:   8c805fb9757e69c239188ee683605520ff73b913
commit: 8a28095394a353ab8a32dc919038ca6c4d59226a [7106/7107] smb: move client and server files to common directory fs/smb
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230627/202306271715.FGaP9NUA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230627/202306271715.FGaP9NUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306271715.FGaP9NUA-lkp@intel.com/

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
