Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F51D688
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718591557; cv=none; b=nzsFt4d5nFK5t7MrqGovhQnUMbHS5diq4hbjqeMVf/5TsXGDNkP2ApEDgg4O2U0pYJ4oTuMf2olYocsDrQLQtrksaLjum7XGpchn5S9dNVFnpi0AcfcxqmwQR370J4XeH/YuUKnBJAA/UNfUKFIkH6u1R5XqvMi8ytlDJhp1/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718591557; c=relaxed/simple;
	bh=StH8+7j+R2iHWp6PJbNb4QDnS2oMUF6Yzot6c4QE35A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=czsE/mqFCdOL7CgEtvNVUT6z2NY+lNLcZEjODiSG20wxuX9LJZRrXjoNzCeAR6VIgPUe9GwynVg9m18faPHhCsgJZu/Dm6zaoWc+sRMlrFErwtWqli82evF+NPwxTJCCOyzXbriHRjfswVq3PYFiE/E/Y65H5m1T+vev66QRYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luV6UbKP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luV6UbKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718591556; x=1750127556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StH8+7j+R2iHWp6PJbNb4QDnS2oMUF6Yzot6c4QE35A=;
  b=luV6UbKPfOVubZVqaqP2sT06IGJl+p6MTMQaGGGuvmAQW69dxCiAPq+Z
   VowlK0oUJgSftWw9vTei0dlS93AQnCiqV0Agd8+quYrG2melyoWubE733
   dxD2st0jPmVOX1ejxGizamlkMkVJPzRqJR3EiuIa87ip7s0pfXyMa78mF
   AlBrGfPBZl6AGoaC+sVr/kS22Gnvwe4bcKS23Wo7CNcsw5gjPpMLjplTZ
   sZhgkfFUAos2U/s5cmeGmiP0mnqndQsFBSvEjFVucMFn7+3lu9LiXC9Pu
   Mgt9NN3WEgYL7YV9wcGoIJ1VHWcKFWjf2Dh29HqeHVnvxKB/jxoTUsty6
   Q==;
X-CSE-ConnectionGUID: R+GuMTgsTX6PVAz+nPzPWg==
X-CSE-MsgGUID: IZuf/SrBQcyljkwjTGu8FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="25985330"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="25985330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 19:32:33 -0700
X-CSE-ConnectionGUID: jufKA3OjQ5egtKBuCxZZ8w==
X-CSE-MsgGUID: gkI/oareRKS0wSJdxYUMIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="64263413"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2024 19:32:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ2AW-0003gC-1Z;
	Mon, 17 Jun 2024 02:32:28 +0000
Date: Mon, 17 Jun 2024 10:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
	Peng Tao <tao.peng@primarydata.com>,
	Lance Shelton <lance.shelton@hammerspace.com>
Subject: [snitzer:nfs-localio-for-6.11.v3.debug 9/19]
 fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202406171032.9ZKDSRf9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11.v3.debug
head:   051785906941a90cf1747482d796cdd0e5d47bb3
commit: 2686c0dfa0d481d7b9ef13ed24040abf775eefc4 [9/19] pnfs/flexfiles: Enable localio for flexfiles I/O
config: mips-randconfig-r133-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171032.9ZKDSRf9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce: (https://download.01.org/0day-ci/archive/20240617/202406171032.9ZKDSRf9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171032.9ZKDSRf9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *[assigned] filp @@     got struct file [noderef] __rcu *[assigned] __res @@
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     expected struct file *[assigned] filp
   fs/nfs/flexfilelayout/flexfilelayout.c:199:22: sparse:     got struct file [noderef] __rcu *[assigned] __res
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file ** @@
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     expected struct file [noderef] __rcu **f
   fs/nfs/flexfilelayout/flexfilelayout.c:205:30: sparse:     got struct file **
   fs/nfs/flexfilelayout/flexfilelayout.c: note: in included file (through include/linux/fwnode.h, include/linux/logic_pio.h, include/asm-generic/io.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/nfs/flexfilelayout/flexfilelayout.c:336:38: sparse: sparse: self-comparison always evaluates to false
   fs/nfs/flexfilelayout/flexfilelayout.c:339:62: sparse: sparse: self-comparison always evaluates to false

vim +199 fs/nfs/flexfilelayout/flexfilelayout.c

   165	
   166	static struct file *
   167	ff_local_open_fh(struct pnfs_layout_segment *lseg,
   168			 u32 ds_idx,
   169			 struct nfs_client *clp,
   170			 const struct cred *cred,
   171			 struct nfs_fh *fh,
   172			 fmode_t mode)
   173	{
   174		struct nfs4_ff_layout_mirror *mirror = FF_LAYOUT_COMP(lseg, ds_idx);
   175		struct file *filp, *new, __rcu **pfile;
   176	
   177		if (!nfs_server_is_local(clp))
   178			return NULL;
   179		if (mode & FMODE_WRITE) {
   180			/*
   181			 * Always request read and write access since this corresponds
   182			 * to a rw layout.
   183			 */
   184			mode |= FMODE_READ;
   185			pfile = &mirror->rw_file;
   186		} else
   187			pfile = &mirror->ro_file;
   188	
   189		new = NULL;
   190		rcu_read_lock();
   191		filp = rcu_dereference(*pfile);
   192		if (!filp) {
   193			rcu_read_unlock();
   194			new = nfs_local_open_fh(clp, cred, fh, mode);
   195			if (IS_ERR(new))
   196				return NULL;
   197			rcu_read_lock();
   198			/* try to swap in the pointer */
 > 199			filp = cmpxchg(pfile, NULL, new);
   200			if (!filp) {
   201				filp = new;
   202				new = NULL;
   203			}
   204		}
   205		filp = get_file_rcu(&filp);
   206		rcu_read_unlock();
   207		if (new)
   208			fput(new);
   209		return filp;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
