Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068842045B7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761997166; cv=none; b=IV8p+EpKHw/+M30aOd36ExiEiNYSnPC9SAFps2+FuUnEvlDAc4Ivg5JqAPwUfQ17ytlZGRkc3/qoqCqq9YZb8qLe9wR3Qx81q82sgSbKCVVe8nC7k8XC1BAMo+zWTNZomZS+wQ5qssZX1dU5uwlk2rnENBRY3Zz8/JsA0kInfmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761997166; c=relaxed/simple;
	bh=NnLAEPF/DsgRatrQnCGQ/IuW0NQD1E03jybDia8WuWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0myoUWZ/dIoqfwCWypXYpAP6yYVz76KGcWc5/lotgZRjZRBbpVY7srC+SE5hzHyTWKglKOwJeWPXstTlLAC0vXsjTTi8UsD7CBiwDWG/3Eop847IkRprnAeY2qB6J9pfgpoRpsVUTmWQgUSaHZ5fcLjMyxEeCGEfJzBFPuVskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCag+rzg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCag+rzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761997165; x=1793533165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NnLAEPF/DsgRatrQnCGQ/IuW0NQD1E03jybDia8WuWY=;
  b=FCag+rzgfeJStwgE86qswbQVSw2MJ2mZIZtXssLDwaj9UbEru0VHzvW3
   RJmGHcBpMI9jz1JZHSD2YWWK/HPw4f2IcCfUnmDGBoT/LYT85AqBTzc7Q
   dfWkTO+r84YSSDDqhMAYuWnXqbyYjoZdM8hsJ63+gq1andSqZMKNOIkSi
   HR5KXeA8I6bHfk7aL6Azpvw294ZPo7HoNW5Fj5iXPqM8z+H3JAPqZF+vI
   35qudKBRWS3VtTM/W7QgSNzptqoGlBnNASbPdh+0AIBPt2+BzBCcUW9Ub
   6FOYbdUtpyGX232+gpmtwng8wkpUZyrVYa7UzCVymOGTO5FucaFEiYMJ5
   w==;
X-CSE-ConnectionGUID: t57KMAjeQk6V4YaIhBt0Qw==
X-CSE-MsgGUID: edk3ojA3SUGjlSN79bhGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="68004218"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="68004218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:39:24 -0700
X-CSE-ConnectionGUID: 4ZPYWzlXQv2K7LYpxnuPtw==
X-CSE-MsgGUID: e0AehywxRUaAtbAWWCws+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="185669858"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Nov 2025 04:39:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9wu-000ODG-2v;
	Sat, 01 Nov 2025 11:39:15 +0000
Date: Sat, 1 Nov 2025 19:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg-ro 10/18] fs/overlayfs/overlayfs.h:242:45: error:
 'excl' undeclared
Message-ID: <202511011950.XMLhzXHt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg-ro
head:   11745d0a0c6d135c474313a710719825fbe81aed
commit: bc283d81b7ed9334c956382e7d234954aac17c03 [10/18] vfs: add struct createdata for passing arguments to vfs_create()
config: sh-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011950.XMLhzXHt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011950.XMLhzXHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011950.XMLhzXHt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/overlayfs/dir.c:18:
   fs/overlayfs/overlayfs.h: In function 'ovl_do_create':
>> fs/overlayfs/overlayfs.h:242:45: error: 'excl' undeclared (first use in this function)
     242 |                                     .excl = excl };
         |                                             ^~~~
   fs/overlayfs/overlayfs.h:242:45: note: each undeclared identifier is reported only once for each function it appears in


vim +/excl +242 fs/overlayfs/overlayfs.h

   233	
   234	static inline int ovl_do_create(struct ovl_fs *ofs,
   235					struct inode *dir, struct dentry *dentry,
   236					umode_t mode)
   237	{
   238		struct createdata cargs = { .idmap = ovl_upper_mnt_idmap(ofs),
   239					    .dir = dir,
   240					    .dentry = dentry,
   241					    .mode = mode,
 > 242					    .excl = excl };
   243		int err = vfs_create(&cargs);
   244	
   245		pr_debug("create(%pd2, 0%o) = %i\n", dentry, mode, err);
   246		return err;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
