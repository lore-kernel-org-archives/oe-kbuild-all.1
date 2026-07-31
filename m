Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2454502F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460352; cv=none; b=mhRgYouMhFtXgnGcPGtmTeUGiFQE53DV07z12Pa6RU95bAUxPQFAHLAQvJdai5MKPGjR2ic6Bfs2M6SgbK0YfBBfl5rG4JUU6Zrd/wbaewn/5q6u8HZ51QUS7TyyMcscYmkxhgu0dmoyJ3KySG4LUICM6Bn27Q1Ij7UPEfGKCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460352; c=relaxed/simple;
	bh=IM8CAvE7Z8NXIybFurRfO35Lq1W+2rvoKfBciByIRFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j/WvZKpJXi8tjGo+XnlzqGXJboKmZhZaAZ8ir1HYl8xZCDrjYvDINk2+px39JcDBCqSpgD4K3q4Lqpca7+7x2zZjMMzUNHV72p3QvxBwl8AwQbQ5zQuH85ZJfHQZjV71J4jnLU7EEuNANq5QQgoWCI2T3n/lazE1vNqz/itXoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4620888; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4620888"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785460350; x=1816996350;
  h=date:from:to:cc:subject:message-id;
  bh=IM8CAvE7Z8NXIybFurRfO35Lq1W+2rvoKfBciByIRFo=;
  b=Z4620888IGc5uBIu2vx8ty4w3NWH9iSn8aZekjlR2b65h2d8mmtWH2MF
   4HR5RAXOSqe78kqbbJfMtvfuIqA6Fzi39N12O5CZTk0wvIzTQqT9TIn2K
   4P3rSavgLq1ywCMjnYCRmv22W/7DtlnJXvse4qPqog7oV1URyq0ImhC5L
   LMMydTKnGJsm8P3nWPZx6dL/Fq9O7ane8XcVbe7WNE3rtwhHlkosseECl
   AyLY1WUL8SrpoYlj7f/sbsbetZhH/S8snp8jg6Wt9XlI2yoMXHZh7hQ6l
   2xTXUpqIrbwVschux4HTaEoQdvDicWL8fynEHMQCFBUW74WAjWpUhyZah
   g==;
X-CSE-ConnectionGUID: qpSuYmBMSQ6Niri3cNPZUA==
X-CSE-MsgGUID: 6X5BaidDTOiZp3fc8ihf8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86166707"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86166707"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 18:12:29 -0700
X-CSE-ConnectionGUID: x7TKT27VQzmK6siI40jrRQ==
X-CSE-MsgGUID: /g6zYv8mTMGvHiDpnLl1zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="290396469"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2026 18:12:28 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpbnV-00000000hm0-361T;
	Fri, 31 Jul 2026 01:12:25 +0000
Date: Fri, 31 Jul 2026 09:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 199/222] fs/nfsd/nfs4proc.c:224:47:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202607310858.MvSOuLmM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   67be65963a6470b667125cc648b56161ed3dfdce
commit: 5143cf703ab5386a0f67df40998acf5a882eabf2 [199/222] nfsd: separate out VFS-specific code from nfsd4_create_file()
config: m68k-randconfig-r122-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310858.MvSOuLmM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310858.MvSOuLmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310858.MvSOuLmM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/nfsd/nfs4proc.c:179:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int @@
   fs/nfsd/nfs4proc.c:179:24: sparse:     expected restricted __be32
   fs/nfsd/nfs4proc.c:179:24: sparse:     got int
   fs/nfsd/nfs4proc.c:181:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int @@
   fs/nfsd/nfs4proc.c:181:24: sparse:     expected restricted __be32
   fs/nfsd/nfs4proc.c:181:24: sparse:     got int
   fs/nfsd/nfs4proc.c:182:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int @@
   fs/nfsd/nfs4proc.c:182:16: sparse:     expected restricted __be32
   fs/nfsd/nfs4proc.c:182:16: sparse:     got int
>> fs/nfsd/nfs4proc.c:224:47: sparse: sparse: incorrect type in initializer (different base types) @@     expected int err @@     got restricted __be32 @@
   fs/nfsd/nfs4proc.c:224:47: sparse:     expected int err
   fs/nfsd/nfs4proc.c:224:47: sparse:     got restricted __be32
   fs/nfsd/nfs4proc.c:541:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int errno @@     got restricted __be32 @@
   fs/nfsd/nfs4proc.c:541:47: sparse:     expected int errno
   fs/nfsd/nfs4proc.c:541:47: sparse:     got restricted __be32

vim +224 fs/nfsd/nfs4proc.c

   198	
   199	static struct file *do_lookup_open(struct path *parent,
   200					   struct qstr *name,
   201					   unsigned int oflags,
   202					   umode_t mode)
   203	{
   204		struct file *filp = NULL;
   205		struct path path;
   206		struct dentry *child;
   207		int want_write_err = 0;
   208	
   209		want_write_err = mnt_want_write(parent->mnt);
   210	
   211		child = start_creating(&nop_mnt_idmap, parent->dentry, name);
   212		if (IS_ERR(child)) {
   213			filp = ERR_CAST(child);
   214			goto out;
   215		}
   216		path.mnt = parent->mnt;
   217		path.dentry = child;
   218	
   219		if (d_really_is_positive(child)) {
   220			/*
   221			 * open the file so that we consistently have a valid
   222			 * op_filp and consequently a valid ->f_path.dentry.
   223			 */
 > 224			int err = nfsd_check_obj_isreg(child);
   225	
   226			if (err)
   227				filp = ERR_PTR(err);
   228			else
   229				filp = dentry_open(&path, oflags, current_cred());
   230		} else if (!(oflags & O_CREAT)) {
   231			filp = ERR_PTR(-ENOENT);
   232		} else if (want_write_err) {
   233			filp = ERR_PTR(want_write_err);
   234		} else {
   235			filp = dentry_create(&path, oflags, mode, current_cred());
   236			child = path.dentry;
   237		}
   238		end_creating(child);
   239	out:
   240		if (!want_write_err)
   241			mnt_drop_write(parent->mnt);
   242		return filp;
   243	}
   244	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
