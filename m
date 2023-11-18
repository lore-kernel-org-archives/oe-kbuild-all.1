Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FBBD281
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 04:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep7YBaBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700282685; x=1731818685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLIsTAUlnnWNdPHJL7aqQFfCUCZ7L794rc7bsUh4KNo=;
  b=Ep7YBaBvsw5zSx58DS/i+V9vEBFcaMn4fRHeDn9bgFzRdHZf8mVaDxTc
   06xHATq0BJVSvNN+qvul40eV6yJd2qSsjPXZmpBj3zUZsqK6GrH6wCv+z
   ZevlMilV0C3d3iiZkGccRB/uzeWieMIuQ4P05ilcp8Bgr1yEW3k/rW3SG
   ZXlIMU8aMEYrU1+SfFc36Ggs0XymSBX+W8lrfpa30bvGKz0+DQkf/6KyL
   W+Z9/Ql0jJYfMVLBfoN0N1iyfJ1VQHIDLzHxYv7yzHg3xQG57Bi5Y3lRF
   M3Uj5p66KFI+zowQtIr+YGmiWwB8DpJ77g/sxpBAEg38ovjY1wBq3zwZJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390268786"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="390268786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 20:44:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="13668968"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 20:44:44 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DC1-0003WV-36;
	Sat, 18 Nov 2023 04:44:34 +0000
Date: Sat, 18 Nov 2023 12:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@google.com>
Subject: [krisman-unicode:for-next 3/10] fs/ecryptfs/dentry.c:33: warning:
 Function parameter or member 'name' not described in 'ecryptfs_d_revalidate'
Message-ID: <202311181251.RnhaVA7A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git for-next
head:   ea1a615cb6e7ea94b0682005400c7f30bf448f00
commit: 24084e50e5790ecce3c7107d41233be6b11fc696 [3/10] fs: Expose name under lookup to d_revalidate hooks
config: i386-buildonly-randconfig-002-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181251.RnhaVA7A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181251.RnhaVA7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181251.RnhaVA7A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ecryptfs/dentry.c:33: warning: Function parameter or member 'name' not described in 'ecryptfs_d_revalidate'


vim +33 fs/ecryptfs/dentry.c

237fead619984c Michael Halcrow         2006-10-04  17  
237fead619984c Michael Halcrow         2006-10-04  18  /**
237fead619984c Michael Halcrow         2006-10-04  19   * ecryptfs_d_revalidate - revalidate an ecryptfs dentry
237fead619984c Michael Halcrow         2006-10-04  20   * @dentry: The ecryptfs dentry
0b728e1911cbe6 Al Viro                 2012-06-10  21   * @flags: lookup flags
237fead619984c Michael Halcrow         2006-10-04  22   *
237fead619984c Michael Halcrow         2006-10-04  23   * Called when the VFS needs to revalidate a dentry. This
237fead619984c Michael Halcrow         2006-10-04  24   * is called whenever a name lookup finds a dentry in the
237fead619984c Michael Halcrow         2006-10-04  25   * dcache. Most filesystems leave this as NULL, because all their
237fead619984c Michael Halcrow         2006-10-04  26   * dentries in the dcache are valid.
237fead619984c Michael Halcrow         2006-10-04  27   *
237fead619984c Michael Halcrow         2006-10-04  28   * Returns 1 if valid, 0 otherwise.
237fead619984c Michael Halcrow         2006-10-04  29   *
237fead619984c Michael Halcrow         2006-10-04  30   */
24084e50e5790e Gabriel Krisman Bertazi 2023-08-16  31  static int ecryptfs_d_revalidate(struct dentry *dentry,
24084e50e5790e Gabriel Krisman Bertazi 2023-08-16  32  				 const struct qstr *name, unsigned int flags)
237fead619984c Michael Halcrow         2006-10-04 @33  {
2edbfbf1c1ab0a Al Viro                 2013-09-15  34  	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
5556e7e6d30e8e Tyler Hicks             2015-08-05  35  	int rc = 1;
237fead619984c Michael Halcrow         2006-10-04  36  
0b728e1911cbe6 Al Viro                 2012-06-10  37  	if (flags & LOOKUP_RCU)
34286d6662308d Nicholas Piggin         2011-01-07  38  		return -ECHILD;
34286d6662308d Nicholas Piggin         2011-01-07  39  
5556e7e6d30e8e Tyler Hicks             2015-08-05  40  	if (lower_dentry->d_flags & DCACHE_OP_REVALIDATE)
24084e50e5790e Gabriel Krisman Bertazi 2023-08-16  41  		rc = lower_dentry->d_op->d_revalidate(lower_dentry, name, flags);
5556e7e6d30e8e Tyler Hicks             2015-08-05  42  
2b0143b5c986be David Howells           2015-03-17  43  	if (d_really_is_positive(dentry)) {
5556e7e6d30e8e Tyler Hicks             2015-08-05  44  		struct inode *inode = d_inode(dentry);
ae56fb16337c88 Michael Halcrow         2006-11-16  45  
5556e7e6d30e8e Tyler Hicks             2015-08-05  46  		fsstack_copy_attr_all(inode, ecryptfs_inode_to_lower(inode));
5556e7e6d30e8e Tyler Hicks             2015-08-05  47  		if (!inode->i_nlink)
5556e7e6d30e8e Tyler Hicks             2015-08-05  48  			return 0;
ae56fb16337c88 Michael Halcrow         2006-11-16  49  	}
237fead619984c Michael Halcrow         2006-10-04  50  	return rc;
237fead619984c Michael Halcrow         2006-10-04  51  }
237fead619984c Michael Halcrow         2006-10-04  52  

:::::: The code at line 33 was first introduced by commit
:::::: 237fead619984cc48818fe12ee0ceada3f55b012 [PATCH] ecryptfs: fs/Makefile and fs/Kconfig

:::::: TO: Michael Halcrow <mhalcrow@us.ibm.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
