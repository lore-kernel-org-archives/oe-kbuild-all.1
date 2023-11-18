Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD37D281
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 05:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGJ+D5Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700284060; x=1731820060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcxGS36NhdrErlzqLH0AruC35pF3YQeNZFXGvTsUa7M=;
  b=cGJ+D5DmC3dphpOkrOdzyzntSDsJWgd6TtponQoPbxVuSzcBG4GKiGOS
   QG4kAopqwg5LohTxoEVQA1fg9h13puP07bH95CEYMmVdkToLsTbJU3fFm
   Aj/aWr+2YzU05esbzfnmWCw5OpapyuyvUeTG55pZPdgRtCpWlC9beybv5
   ohZe5GLH0PDxpJvLU4Y6UBtATQplffpz/w5/wM5o2VWc8Zj7yvmOVeV/6
   ztqqD0laZCLAqTHq9Ah3/3awaW7UmxHbfHysa6ENdrrtkT/TmsXt+xXa7
   toxXtYZ6qDhMiynP8FEkVDrZNA4J66+aJethmRD4CAUv0dA/j/Yp0Ip3N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="394256398"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="394256398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 21:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="909602827"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="909602827"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Nov 2023 21:07:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DYO-0003XP-0R;
	Sat, 18 Nov 2023 05:07:36 +0000
Date: Sat, 18 Nov 2023 13:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
	Eric Biggers <ebiggers@google.com>
Subject: [krisman-unicode:for-next 3/10] fs/gfs2/dentry.c:35: warning:
 Function parameter or member 'name' not described in 'gfs2_drevalidate'
Message-ID: <202311181319.IzIPNGpq-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20231118 (https://download.01.org/0day-ci/archive/20231118/202311181319.IzIPNGpq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181319.IzIPNGpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181319.IzIPNGpq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/dentry.c:35: warning: Function parameter or member 'name' not described in 'gfs2_drevalidate'


vim +35 fs/gfs2/dentry.c

b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  21  
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  22  /**
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  23   * gfs2_drevalidate - Check directory lookup consistency
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  24   * @dentry: the mapping to check
0b728e1911cbe6 fs/gfs2/dentry.c     Al Viro                 2012-06-10  25   * @flags: lookup flags
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  26   *
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  27   * Check to make sure the lookup necessary to arrive at this inode from its
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  28   * parent is still good.
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  29   *
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  30   * Returns: 1 if the dentry is ok, 0 if it isn't
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  31   */
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  32  
24084e50e5790e fs/gfs2/dentry.c     Gabriel Krisman Bertazi 2023-08-16  33  static int gfs2_drevalidate(struct dentry *dentry, const struct qstr *name,
24084e50e5790e fs/gfs2/dentry.c     Gabriel Krisman Bertazi 2023-08-16  34  			    unsigned int flags)
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16 @35  {
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  36  	struct dentry *parent;
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  37  	struct gfs2_sbd *sdp;
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  38  	struct gfs2_inode *dip;
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  39  	struct inode *inode;
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  40  	struct gfs2_holder d_gh;
dbb7cae2a36170 fs/gfs2/ops_dentry.c Steven Whitehouse       2007-05-15  41  	struct gfs2_inode *ip = NULL;
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  42  	int error, valid = 0;
549ae0ac3d574a fs/gfs2/ops_dentry.c Wendy Cheng             2007-02-06  43  	int had_lock = 0;
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  44  
0b728e1911cbe6 fs/gfs2/dentry.c     Al Viro                 2012-06-10  45  	if (flags & LOOKUP_RCU)
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  46  		return -ECHILD;
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  47  
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  48  	parent = dget_parent(dentry);
2b0143b5c986be fs/gfs2/dentry.c     David Howells           2015-03-17  49  	sdp = GFS2_SB(d_inode(parent));
2b0143b5c986be fs/gfs2/dentry.c     David Howells           2015-03-17  50  	dip = GFS2_I(d_inode(parent));
2b0143b5c986be fs/gfs2/dentry.c     David Howells           2015-03-17  51  	inode = d_inode(dentry);
34286d6662308d fs/gfs2/dentry.c     Nicholas Piggin         2011-01-07  52  
dbb7cae2a36170 fs/gfs2/ops_dentry.c Steven Whitehouse       2007-05-15  53  	if (inode) {
dbb7cae2a36170 fs/gfs2/ops_dentry.c Steven Whitehouse       2007-05-15  54  		if (is_bad_inode(inode))
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  55  			goto out;
dbb7cae2a36170 fs/gfs2/ops_dentry.c Steven Whitehouse       2007-05-15  56  		ip = GFS2_I(inode);
dbb7cae2a36170 fs/gfs2/ops_dentry.c Steven Whitehouse       2007-05-15  57  	}
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  58  
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  59  	if (sdp->sd_lockstruct.ls_ops->lm_mount == NULL) {
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  60  		valid = 1;
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  61  		goto out;
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  62  	}
c752666c17f870 fs/gfs2/ops_dentry.c Steven Whitehouse       2006-03-20  63  
7afd88d9166a75 fs/gfs2/ops_dentry.c Steven Whitehouse       2008-02-22  64  	had_lock = (gfs2_glock_is_locked_by_me(dip->i_gl) != NULL);
549ae0ac3d574a fs/gfs2/ops_dentry.c Wendy Cheng             2007-02-06  65  	if (!had_lock) {
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  66  		error = gfs2_glock_nq_init(dip->i_gl, LM_ST_SHARED, 0, &d_gh);
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  67  		if (error)
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  68  			goto out;
549ae0ac3d574a fs/gfs2/ops_dentry.c Wendy Cheng             2007-02-06  69  	}
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  70  
2b0143b5c986be fs/gfs2/dentry.c     David Howells           2015-03-17  71  	error = gfs2_dir_check(d_inode(parent), &dentry->d_name, ip);
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  72  	valid = inode ? !error : (error == -ENOENT);
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  73  
549ae0ac3d574a fs/gfs2/ops_dentry.c Wendy Cheng             2007-02-06  74  	if (!had_lock)
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  75  		gfs2_glock_dq_uninit(&d_gh);
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  76  out:
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  77  	dput(parent);
8c5ca11710b67b fs/gfs2/dentry.c     Bob Peterson            2019-08-06  78  	return valid;
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  79  }
b3b94faa5fe596 fs/gfs2/ops_dentry.c David Teigland          2006-01-16  80  

:::::: The code at line 35 was first introduced by commit
:::::: b3b94faa5fe5968827ba0640ee9fba4b3e7f736e [GFS2] The core of GFS2

:::::: TO: David Teigland <teigland@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
