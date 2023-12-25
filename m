Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A8410FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 05:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJ1VP4vC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703483854; x=1735019854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHvjizpXKxFecC6mFUHu54dkxpbZJVh7WCjX8t44aL4=;
  b=fJ1VP4vCx9ZkGyQ50Laf5yMXF16ZQ9GuDox2wrfbPYai7L882QTSFLlx
   JFaIVQuBd90bisf5IABDdl/Xys50WHgv6yA2tS8agsoSrBAN6n3oYZ//f
   FzweFJ+o35RlBLMonAulZeSJxVsMiSFgwnhvpKtq7901mgCV09jXqJcaV
   AbBOgevfQ16p7V7muqvDlZ96RaR4eHqjaZ3w72IcAsjTBx24h7sj1k+e5
   WmBqjHkmZb74DvKTLnblTXNMZTLa9hkZPurh4YiojkMONmob2Q4xaKPHg
   uUc2g0TKuLmIrtTkYf+fCg6wDMVE71q22apcCP4rAM/K5LWy7iw2fvYl8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3081943"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="3081943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 21:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="25987784"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2023 21:57:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHdwm-000D0f-3C;
	Mon, 25 Dec 2023 05:56:39 +0000
Date: Mon, 25 Dec 2023 13:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:cifs-netfs 50/53] fs/smb/client/inode.c:38:2: error:
 too few arguments to function 'netfs_inode_init'
Message-ID: <202312251309.e3Qq0u7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   4eaec420b0b0b7fab9042432c8a3aaf665d6052f
commit: 89290190eb6aafd8831b148797ec5f781ed1c596 [50/53] cifs: Cut over to using netfslib
config: i386-randconfig-012-20231225 (https://download.01.org/0day-ci/archive/20231225/202312251309.e3Qq0u7K-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251309.e3Qq0u7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251309.e3Qq0u7K-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/inode.c: In function 'cifs_set_netfs_context':
>> fs/smb/client/inode.c:38:2: error: too few arguments to function 'netfs_inode_init'
     netfs_inode_init(&cifs_i->netfs, &cifs_req_ops);
     ^~~~~~~~~~~~~~~~
   In file included from fs/smb/client/cifsglob.h:22:0,
                    from fs/smb/client/inode.c:19:
   include/linux/netfs.h:465:20: note: declared here
    static inline void netfs_inode_init(struct netfs_inode *ctx,
                       ^~~~~~~~~~~~~~~~


vim +/netfs_inode_init +38 fs/smb/client/inode.c

    29	
    30	/*
    31	 * Set parameters for the netfs library
    32	 */
    33	static void cifs_set_netfs_context(struct inode *inode)
    34	{
    35		struct cifsInodeInfo *cifs_i = CIFS_I(inode);
    36		struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
    37	
  > 38		netfs_inode_init(&cifs_i->netfs, &cifs_req_ops);
    39		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_STRICT_IO)
    40			__set_bit(NETFS_ICTX_WRITETHROUGH, &cifs_i->netfs.flags);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
