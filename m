Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42952CCAA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Aug 2024 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724339838; cv=none; b=a3gZQg9iRSKa/BtYNfjporAHRSHMsUYiRUB9J1Pe4mg6BzWdxo20Rdn+W9icvLi1jZApnLieeJmral6CjIaC5LLSOhJzUnVJKThWIJpRyypF8a225svL4H1D9mm5tLWAJKl3a41/TC6+BoeW27UO/ubRD5veOaVjkdAPh8dtcSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724339838; c=relaxed/simple;
	bh=2u8CFF+IiUYdXkHiHMkS4+PiMscoCq2on95Rhly2C2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHWrWseZL//QlyGcEkN4nbST2bKwjj1qeLdDV8qS8KWDtXkC+JD29Azk1dSg3lBLyVeHWdM+ohZx8TATusqnVs/AS8cn1oZqnsBS/n0JQ7/CDs0illLuZZ3Suirz5RkCA7a/5p4ggYKNJIfO1KNIskJBvIa02i3m/iR0aq1a5vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSaaUYZz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSaaUYZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724339836; x=1755875836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2u8CFF+IiUYdXkHiHMkS4+PiMscoCq2on95Rhly2C2g=;
  b=FSaaUYZzxVP3Ej/TJY9aR2dGss4I80932zTDneq3NYp+ScboRwtTp4QT
   n7JWOQrRS0vadVbYkkaso5jrqvcQk7lts0nF87uaNGqyZqXDu8OANiUWE
   AA+lJw7bfw6FwHINTWo2lhkM6B/X4ZG7q9p/ASTvic71pRRnpOX8laNIr
   UbCCKgxbUOdN7SzGoqUPcMTc0AGqnW5yEtJj6xskvR8KhrT2/rtd+2VFd
   XJZgwBJkapEFmWEMSCTEj0z188g2G8/Mj88/gmQI16yF3FGE36uG4VFwj
   h4ar+SpwWoPHuWIrhyZFhPHYld9jCqMQIvrpxgoYIr66L3jtUPfzeWOOo
   Q==;
X-CSE-ConnectionGUID: lvXzt1o+TTu2qcQX03UQOg==
X-CSE-MsgGUID: ezC1CCDfS4SCoKh2GCA0hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22891420"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22891420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 08:17:16 -0700
X-CSE-ConnectionGUID: F0ngjSoHR4+6K/iX0xR/pw==
X-CSE-MsgGUID: chc6OP1WTLaQe/B8gsuzJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61622696"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2024 08:17:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh9Yn-000Ctw-0J;
	Thu, 22 Aug 2024 15:17:13 +0000
Date: Thu, 22 Aug 2024 23:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] avoid extra path_get/path_put cycle in path_openat()
Message-ID: <202408222326.EcwoqWu5-lkp@intel.com>
References: <20240822004149.GR504335@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822004149.GR504335@ZenIV>

Hi Al,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Al-Viro/lift-grabbing-path-into-caller-of-do_dentry_open/20240822-093519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240822004149.GR504335%40ZenIV
patch subject: [PATCH 3/3] avoid extra path_get/path_put cycle in path_openat()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240822/202408222326.EcwoqWu5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222326.EcwoqWu5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222326.EcwoqWu5-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/open.c: In function 'finish_open':
>> fs/open.c:1049:22: error: passing argument 1 of 'dget' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1049 |                 dget(&file->f_path.dentry);
         |                      ^~~~~~~~~~~~~~~~~~~~
         |                      |
         |                      struct dentry **
   In file included from include/linux/fs.h:8,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1127,
                    from fs/open.c:9:
   include/linux/dcache.h:337:50: note: expected 'struct dentry *' but argument is of type 'struct dentry **'
     337 | static inline struct dentry *dget(struct dentry *dentry)
         |                                   ~~~~~~~~~~~~~~~^~~~~~
   cc1: some warnings being treated as errors


vim +/dget +1049 fs/open.c

  1022	
  1023	/**
  1024	 * finish_open - finish opening a file
  1025	 * @file: file pointer
  1026	 * @dentry: pointer to dentry
  1027	 * @open: open callback
  1028	 *
  1029	 * This can be used to finish opening a file passed to i_op->atomic_open().
  1030	 *
  1031	 * If the open callback is set to NULL, then the standard f_op->open()
  1032	 * filesystem callback is substituted.
  1033	 *
  1034	 * NB: the dentry reference is _not_ consumed.  If, for example, the dentry is
  1035	 * the return value of d_splice_alias(), then the caller needs to perform dput()
  1036	 * on it after finish_open().
  1037	 *
  1038	 * Returns zero on success or -errno if the open failed.
  1039	 */
  1040	int finish_open(struct file *file, struct dentry *dentry,
  1041			int (*open)(struct inode *, struct file *))
  1042	{
  1043		int err;
  1044		BUG_ON(file->f_mode & FMODE_OPENED); /* once it's opened, it's opened */
  1045	
  1046		file->f_path.dentry = dentry;
  1047		err = do_dentry_open(file, open);
  1048		if (file->f_mode & FMODE_OPENED)
> 1049			dget(&file->f_path.dentry);
  1050		return err;
  1051	}
  1052	EXPORT_SYMBOL(finish_open);
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
