Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD641311A1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516356; cv=none; b=LQ4ZsfPnJYBWOk5YfOeGNAU/kbyTDc55gsBmOvZ2GFawLelhBfibsnZLcB6voq3ehlAH8GK9osbguyK1VYmN5TC0vci8ybSRxrUzUyx1czaxWDxAZ5OUi0uRmn/XU3cAYkga0Ix0aEBiec/JwMo2lq1wnRqjNcWzGNkbX8cd5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516356; c=relaxed/simple;
	bh=LS4Q9t6XBhgmfDjD2t37gh6JZeMPfEvprY1YX2laNX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUe2pwgs6EBqyac67s/o3ZVI9zX+PsRkq/y6cdS7UkgrWJWksHCONoobHv6YrKWREW9FudXfEDQIM6N8XF8vBCVvRK3WlztaJZwOXnD8W7LjkmHejpTV7RvVP9N6f10wCqly9gBrYvPBN+mlA06IxqRymhItAkOI3HMolSiaEMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xg2THagZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xg2THagZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717516354; x=1749052354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LS4Q9t6XBhgmfDjD2t37gh6JZeMPfEvprY1YX2laNX0=;
  b=Xg2THagZlhWXnzZKpNUtL4y8/b0g+Bl2YtBj2XyrE4tbmzoKAuB0IAiV
   /fK2Tty8BFYPzNXOL+UiFn+wxeasQPmRQn6Z2nJeL+OCp1NzIcJK8500n
   wpFOugre2RLXRpWjrBNpgIjn5nDGlgoQNrN97M2rYc2Tmx6YbE1kcB6eJ
   xM5XI72Bre4kaKoeByEyZDVmyy0s5vIF9xKCjjCewaR65Ek/EhuBcZ/lg
   t+ZHUY45kPaYToXyedkFgLUPGU1L9rDeBdlpyedBuVRC7dmDAxjOXjWU4
   scVpNxpzS/s4GyZmuvuLZmSBls71fCUWuguy8MbQajDAJSMGhWWJiiz8Y
   A==;
X-CSE-ConnectionGUID: xGSemwIKTZO+ZJ0htLPdzA==
X-CSE-MsgGUID: Ng0//J/lSWOA525vONYJkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24649786"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="24649786"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 08:52:33 -0700
X-CSE-ConnectionGUID: UEIvRZRySQqL+4uumJ7p+Q==
X-CSE-MsgGUID: By+uVZOTQu2ulOVaGEcmZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="68101689"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2024 08:52:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEWSb-00006d-37;
	Tue, 04 Jun 2024 15:52:29 +0000
Date: Tue, 4 Jun 2024 23:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Li Lingfeng <lilingfeng@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] fs: pass sb_flags to submount
Message-ID: <202406042302.tNw8vNYn-lkp@intel.com>
References: <20240604112636.236517-2-lilingfeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604112636.236517-2-lilingfeng@huaweicloud.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on cifs/for-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus mszeredi-fuse/for-next linus/master v6.10-rc2 next-20240604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Lingfeng/fs-pass-sb_flags-to-submount/20240604-192813
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240604112636.236517-2-lilingfeng%40huaweicloud.com
patch subject: [PATCH RFC 1/2] fs: pass sb_flags to submount
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240604/202406042302.tNw8vNYn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406042302.tNw8vNYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406042302.tNw8vNYn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/namespace.c: In function 'cifs_do_automount':
>> fs/smb/client/namespace.c:205:14: error: too few arguments to function 'fs_context_for_submount'
     205 |         fc = fs_context_for_submount(path->mnt->mnt_sb->s_type, mntpt);
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fs_parser.h:11,
                    from fs/smb/client/fs_context.h:14,
                    from fs/smb/client/namespace.c:23:
   include/linux/fs_context.h:132:27: note: declared here
     132 | extern struct fs_context *fs_context_for_submount(struct file_system_type *fs_type,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/fs_context_for_submount +205 fs/smb/client/namespace.c

4508ec17357094e fs/smb/client/namespace.c    Paulo Alcantara 2024-02-11  185  
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  186  /*
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  187   * Create a vfsmount that we can automount
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  188   */
0a049935e47e30c fs/smb/client/namespace.c    Paulo Alcantara 2023-08-17  189  static struct vfsmount *cifs_do_automount(struct path *path)
6d5ae0deb1641bf fs/cifs/cifs_dfs_ref.c       Igor Mammedov   2008-01-25  190  {
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  191  	int rc;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  192  	struct dentry *mntpt = path->dentry;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  193  	struct fs_context *fc;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  194  	void *page = NULL;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  195  	struct smb3_fs_context *ctx, *cur_ctx;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  196  	struct smb3_fs_context tmp;
c88f7dcd6d64291 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2021-11-03  197  	char *full_path;
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  198  	struct vfsmount *mnt;
6d5ae0deb1641bf fs/cifs/cifs_dfs_ref.c       Igor Mammedov   2008-01-25  199  
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  200  	if (IS_ROOT(mntpt))
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  201  		return ERR_PTR(-ESTALE);
6d5ae0deb1641bf fs/cifs/cifs_dfs_ref.c       Igor Mammedov   2008-01-25  202  
a18280e7fdea1f2 fs/smb/client/namespace.c    Paulo Alcantara 2023-08-17  203  	cur_ctx = CIFS_SB(mntpt->d_sb)->ctx;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  204  
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04 @205  	fc = fs_context_for_submount(path->mnt->mnt_sb->s_type, mntpt);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  206  	if (IS_ERR(fc))
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  207  		return ERR_CAST(fc);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  208  
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  209  	ctx = smb3_fc2context(fc);
8393072bab060f0 fs/cifs/cifs_dfs_ref.c       Aurelien Aptel  2018-09-20  210  
f6a9bc336b600e1 fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  211  	page = alloc_dentry_path();
348a04a8d1138c2 fs/smb/client/namespace.c    Paulo Alcantara 2023-08-17  212  	full_path = automount_fullpath(mntpt, page);
f6a9bc336b600e1 fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  213  	if (IS_ERR(full_path)) {
f6a9bc336b600e1 fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  214  		mnt = ERR_CAST(full_path);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  215  		goto out;
f6a9bc336b600e1 fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  216  	}
1c780228e9d47b9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2018-11-14  217  
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  218  	tmp = *cur_ctx;
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  219  	tmp.source = NULL;
7ad54b98fc1f141 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  220  	tmp.leaf_fullpath = NULL;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  221  	tmp.UNC = tmp.prepath = NULL;
b56bce502f55505 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2023-03-14  222  	tmp.dfs_root_ses = NULL;
4508ec17357094e fs/smb/client/namespace.c    Paulo Alcantara 2024-02-11  223  	fs_context_set_ids(&tmp);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  224  
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  225  	rc = smb3_fs_context_dup(ctx, &tmp);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  226  	if (rc) {
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  227  		mnt = ERR_PTR(rc);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  228  		goto out;
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  229  	}
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  230  
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  231  	rc = smb3_parse_devname(full_path, ctx);
7ad54b98fc1f141 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  232  	if (rc) {
7ad54b98fc1f141 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  233  		mnt = ERR_PTR(rc);
7ad54b98fc1f141 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  234  		goto out;
7ad54b98fc1f141 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  235  	}
7ad54b98fc1f141 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-12-18  236  
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  237  	ctx->source = smb3_fs_context_fullpath(ctx, '/');
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  238  	if (IS_ERR(ctx->source)) {
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  239  		mnt = ERR_CAST(ctx->source);
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  240  		ctx->source = NULL;
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  241  		goto out;
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  242  	}
5e2fd17f434d2fe fs/smb/client/namespace.c    Paulo Alcantara 2023-11-09  243  	ctx->dfs_automount = is_dfs_mount(mntpt);
5e2fd17f434d2fe fs/smb/client/namespace.c    Paulo Alcantara 2023-11-09  244  	cifs_dbg(FYI, "%s: ctx: source=%s UNC=%s prepath=%s dfs_automount=%d\n",
5e2fd17f434d2fe fs/smb/client/namespace.c    Paulo Alcantara 2023-11-09  245  		 __func__, ctx->source, ctx->UNC, ctx->prepath, ctx->dfs_automount);
49024ec8795ed2b fs/smb/client/cifs_dfs_ref.c Paulo Alcantara 2023-06-27  246  
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  247  	mnt = fc_mount(fc);
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  248  out:
9fd29a5bae6e8f9 fs/cifs/cifs_dfs_ref.c       Paulo Alcantara 2022-10-04  249  	put_fs_context(fc);
f6a9bc336b600e1 fs/cifs/cifs_dfs_ref.c       Al Viro         2021-03-05  250  	free_dentry_path(page);
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  251  	return mnt;
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  252  }
01c64feac45cea1 fs/cifs/cifs_dfs_ref.c       David Howells   2011-01-14  253  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
