Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23391FB9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690352507; x=1721888507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G26OgeZO5h0obDN+JxbZBz/gmpRCdcG+JogZz4zL+ug=;
  b=kQVi2mVdisrF4cL8NeV/PpqXwOoK6pWplSq3RadVOMgwpCZV1kLxeBFt
   nJCCQUaBxwKuY0vahvzOniX2ph5utlcmnTzDAlw1+nVyGf0E5NdrvVfh2
   EN4s9hjPaXMaB4fVZGffKnEPXDnk75zrTSKDqcOeNiBPZiwc0fvQVbvTd
   6KcpGhLEHMC4YFexb7AZ72sUXhlbnPwn7XhsPD0P1VB1dEGlcsr6s14jP
   V8USr+4CvNipfy3RE8ITTHoNtzl+CFn/NjfUVt8cjlrpF/+8tOk7WZ3Um
   1aFVG+oogDQhYZ9AOGKq9nyigMib8heiP0E7f6dhdVbP+ttkZhmSc1wqz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398854707"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="398854707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="676537524"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="676537524"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Jul 2023 23:21:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOXu4-0000jT-2e;
	Wed, 26 Jul 2023 06:21:44 +0000
Date: Wed, 26 Jul 2023 14:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 326/358] fs/nfsd/vfs.c:328:33: error:
 implicit declaration of function 'setattr_should_drop_sgid'
Message-ID: <202307261408.y2vTEsUA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   643df3563d38a49189f970269b48469e47dd5a20
commit: 82431e343141e11002fa6fb0fa74e6f35d4fe0ca [326/358] nfsd: use vfs setgid helper
config: s390-randconfig-r014-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261408.y2vTEsUA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261408.y2vTEsUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261408.y2vTEsUA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sunrpc/svc.h:17,
                    from fs/nfsd/nfsd.h:19,
                    from fs/nfsd/xdr.h:8,
                    from fs/nfsd/xdr3.h:11,
                    from fs/nfsd/vfs.c:36:
   include/linux/sunrpc/xdr.h: In function 'xdr_stream_decode_uint32_array':
   include/linux/sunrpc/xdr.h:539:17: warning: comparison is always false due to limited range of data type [-Wtype-limits]
     539 |         if (len > SIZE_MAX / sizeof(*p))
         |                 ^
   fs/nfsd/vfs.c: In function 'nfsd_sanitize_attrs':
>> fs/nfsd/vfs.c:328:33: error: implicit declaration of function 'setattr_should_drop_sgid' [-Werror=implicit-function-declaration]
     328 |                                 setattr_should_drop_sgid(&nop_mnt_idmap, inode);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/vfs.c:328:59: error: 'nop_mnt_idmap' undeclared (first use in this function)
     328 |                                 setattr_should_drop_sgid(&nop_mnt_idmap, inode);
         |                                                           ^~~~~~~~~~~~~
   fs/nfsd/vfs.c:328:59: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/setattr_should_drop_sgid +328 fs/nfsd/vfs.c

   301	
   302	/*
   303	 * Go over the attributes and take care of the small differences between
   304	 * NFS semantics and what Linux expects.
   305	 */
   306	static void
   307	nfsd_sanitize_attrs(struct inode *inode, struct iattr *iap)
   308	{
   309		/* sanitize the mode change */
   310		if (iap->ia_valid & ATTR_MODE) {
   311			iap->ia_mode &= S_IALLUGO;
   312			iap->ia_mode |= (inode->i_mode & ~S_IALLUGO);
   313		}
   314	
   315		/* Revoke setuid/setgid on chown */
   316		if (!S_ISDIR(inode->i_mode) &&
   317		    ((iap->ia_valid & ATTR_UID) || (iap->ia_valid & ATTR_GID))) {
   318			iap->ia_valid |= ATTR_KILL_PRIV;
   319			if (iap->ia_valid & ATTR_MODE) {
   320				/* we're setting mode too, just clear the s*id bits */
   321				iap->ia_mode &= ~S_ISUID;
   322				if (iap->ia_mode & S_IXGRP)
   323					iap->ia_mode &= ~S_ISGID;
   324			} else {
   325				/* set ATTR_KILL_* bits and let VFS handle it */
   326				iap->ia_valid |= ATTR_KILL_SUID;
   327				iap->ia_valid |=
 > 328					setattr_should_drop_sgid(&nop_mnt_idmap, inode);
   329			}
   330		}
   331	}
   332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
