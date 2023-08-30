Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF67747B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 19:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693424384; x=1724960384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rN5kd32+w0uRI+OhKDZoa9K49LZZClHhC0+r4efMOqY=;
  b=Znv7dNV6w52SKgPXLApODwatv+SA6+He5qjanXHwk64aWDybJGhRF5m9
   49RXAQA1MeZ93VT2MJZvsJj1AHLIbXqsyUfC/JbMV/SfClBGhjUrCbe/F
   PJnsDlTek6jMJGZdSGjPYuFUGniH8ITE8QV1cH6dthTtVHQ2baxe8Krjm
   ImJqRn85UJkBB9l7ELyF+jlCGEgrTTV70N0j/G0mOMGi5Z4Ycgjq/wk31
   nuAKA5xo9USQMLuihGpof/ypHFLiX/+xNCCo6j6UvUT9AVqIUEkRzGBFH
   1qrvR7fzx6jHwdsN8Bkwki2s3thgJvwaFi+UgMs0KbCvm/Ed2C5CYUBaY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="378449986"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="378449986"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 12:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="742362883"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="742362883"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2023 12:39:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbR26-000AAT-2G;
	Wed, 30 Aug 2023 19:39:26 +0000
Date: Thu, 31 Aug 2023 03:38:39 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-evm-lsms-v2-devel-v6 23/25]
 security/integrity/evm/evm_main.c:930:5: warning: no previous prototype for
 'evm_inode_init_security'
Message-ID: <202308310335.FCDCwTrB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux ima-evm-lsms-v2-devel-v6
head:   8d3db5840032b2f14a363ad273bc13baeaec3cc5
commit: 07adc69271289ead1d641de66c78e118ce1e4672 [23/25] evm: Move to LSM infrastructure
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230831/202308310335.FCDCwTrB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310335.FCDCwTrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310335.FCDCwTrB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/evm/evm_main.c:930:5: warning: no previous prototype for 'evm_inode_init_security' [-Wmissing-prototypes]
     930 | int evm_inode_init_security(struct inode *inode, struct inode *dir,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/evm_inode_init_security +930 security/integrity/evm/evm_main.c

66dbc325afcef9 Mimi Zohar            2011-03-15  926  
cb72318069d5e9 Mimi Zohar            2011-03-09  927  /*
9eea2904292c2d Roberto Sassu         2021-05-14  928   * evm_inode_init_security - initializes security.evm HMAC value
cb72318069d5e9 Mimi Zohar            2011-03-09  929   */
6db7d1dee80039 Roberto Sassu         2023-06-10 @930  int evm_inode_init_security(struct inode *inode, struct inode *dir,
6db7d1dee80039 Roberto Sassu         2023-06-10  931  			    const struct qstr *qstr, struct xattr *xattrs,
6db7d1dee80039 Roberto Sassu         2023-06-10  932  			    int *xattr_count)
cb72318069d5e9 Mimi Zohar            2011-03-09  933  {
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  934  	struct evm_xattr *xattr_data;
c31288e56c1a7b Roberto Sassu         2023-06-10  935  	struct xattr *xattr, *evm_xattr;
c31288e56c1a7b Roberto Sassu         2023-06-10  936  	bool evm_protected_xattrs = false;
cb72318069d5e9 Mimi Zohar            2011-03-09  937  	int rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  938  
c31288e56c1a7b Roberto Sassu         2023-06-10  939  	if (!(evm_initialized & EVM_INIT_HMAC) || !xattrs)
c31288e56c1a7b Roberto Sassu         2023-06-10  940  		return 0;
c31288e56c1a7b Roberto Sassu         2023-06-10  941  
c31288e56c1a7b Roberto Sassu         2023-06-10  942  	/*
c31288e56c1a7b Roberto Sassu         2023-06-10  943  	 * security_inode_init_security() makes sure that the xattrs array is
c31288e56c1a7b Roberto Sassu         2023-06-10  944  	 * contiguous, there is enough space for security.evm, and that there is
c31288e56c1a7b Roberto Sassu         2023-06-10  945  	 * a terminator at the end of the array.
c31288e56c1a7b Roberto Sassu         2023-06-10  946  	 */
c31288e56c1a7b Roberto Sassu         2023-06-10  947  	for (xattr = xattrs; xattr->name; xattr++) {
c31288e56c1a7b Roberto Sassu         2023-06-10  948  		if (evm_protected_xattr(xattr->name))
c31288e56c1a7b Roberto Sassu         2023-06-10  949  			evm_protected_xattrs = true;
c31288e56c1a7b Roberto Sassu         2023-06-10  950  	}
c31288e56c1a7b Roberto Sassu         2023-06-10  951  
c31288e56c1a7b Roberto Sassu         2023-06-10  952  	/* EVM xattr not needed. */
c31288e56c1a7b Roberto Sassu         2023-06-10  953  	if (!evm_protected_xattrs)
5a4730ba9517cf Mimi Zohar            2011-08-11  954  		return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  955  
6db7d1dee80039 Roberto Sassu         2023-06-10  956  	evm_xattr = lsm_get_xattr_slot(xattrs, xattr_count);
c31288e56c1a7b Roberto Sassu         2023-06-10  957  	/*
c31288e56c1a7b Roberto Sassu         2023-06-10  958  	 * Array terminator (xattr name = NULL) must be the first non-filled
c31288e56c1a7b Roberto Sassu         2023-06-10  959  	 * xattr slot.
c31288e56c1a7b Roberto Sassu         2023-06-10  960  	 */
c31288e56c1a7b Roberto Sassu         2023-06-10  961  	WARN_ONCE(evm_xattr != xattr,
c31288e56c1a7b Roberto Sassu         2023-06-10  962  		  "%s: xattrs terminator is not the first non-filled slot\n",
c31288e56c1a7b Roberto Sassu         2023-06-10  963  		  __func__);
6db7d1dee80039 Roberto Sassu         2023-06-10  964  
cb72318069d5e9 Mimi Zohar            2011-03-09  965  	xattr_data = kzalloc(sizeof(*xattr_data), GFP_NOFS);
cb72318069d5e9 Mimi Zohar            2011-03-09  966  	if (!xattr_data)
cb72318069d5e9 Mimi Zohar            2011-03-09  967  		return -ENOMEM;
cb72318069d5e9 Mimi Zohar            2011-03-09  968  
650b29dbdf2caf Thiago Jung Bauermann 2019-06-11  969  	xattr_data->data.type = EVM_XATTR_HMAC;
6db7d1dee80039 Roberto Sassu         2023-06-10  970  	rc = evm_init_hmac(inode, xattrs, xattr_data->digest);
cb72318069d5e9 Mimi Zohar            2011-03-09  971  	if (rc < 0)
cb72318069d5e9 Mimi Zohar            2011-03-09  972  		goto out;
cb72318069d5e9 Mimi Zohar            2011-03-09  973  
cb72318069d5e9 Mimi Zohar            2011-03-09  974  	evm_xattr->value = xattr_data;
cb72318069d5e9 Mimi Zohar            2011-03-09  975  	evm_xattr->value_len = sizeof(*xattr_data);
9548906b2bb7ff Tetsuo Handa          2013-07-25  976  	evm_xattr->name = XATTR_EVM_SUFFIX;
cb72318069d5e9 Mimi Zohar            2011-03-09  977  	return 0;
cb72318069d5e9 Mimi Zohar            2011-03-09  978  out:
cb72318069d5e9 Mimi Zohar            2011-03-09  979  	kfree(xattr_data);
cb72318069d5e9 Mimi Zohar            2011-03-09  980  	return rc;
cb72318069d5e9 Mimi Zohar            2011-03-09  981  }
cb72318069d5e9 Mimi Zohar            2011-03-09  982  EXPORT_SYMBOL_GPL(evm_inode_init_security);
cb72318069d5e9 Mimi Zohar            2011-03-09  983  

:::::: The code at line 930 was first introduced by commit
:::::: 6db7d1dee8003921b353d7e613471fe8995f46b5 evm: Align evm_inode_init_security() definition with LSM infrastructure

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
