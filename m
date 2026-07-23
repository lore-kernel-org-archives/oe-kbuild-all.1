Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9DE34B1AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 03:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777985; cv=none; b=CrXOv94QCCUnbxkvdD15LNnPPdULDEEePXswvPSKCr13zlnjUumbPyRpUOoPz0vbz1BothT4U4dE7a5SWB2/LTyO+bo4579pr8IHp2UpAdihvnfqHiOqVimLsdPVM18r65qXH8bfRweHGYOHJnjNMQ6d1zluX+6iJPjBsuQcV7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777985; c=relaxed/simple;
	bh=GLL/BeuRi/to5lkQynFM9YoR7oDwFKZxApI5rMUJumg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d9QNmc8YqmpV1FjihmDGP8K9MX+mygr+xmzFlr0SvuMS7QHq8rZXBFoUUaqqgXlOKcZFlvi+sV/RlIOIPYSr42BdExDUptgsKJSsi6RtYZSxAn9iIyaTtEEDZR8bcgdceDcK3+nYQKfnE/MJq1SnuAjOHi7fn4vbHFZDEkvZgsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=en0XjJ5u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="en0XjJ5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784777983; x=1816313983;
  h=date:from:to:cc:subject:message-id;
  bh=GLL/BeuRi/to5lkQynFM9YoR7oDwFKZxApI5rMUJumg=;
  b=en0XjJ5ud2OCpWNvB2pp4EenL1uNFMl2pVUBzFPVKPicdgxFEbaOow7G
   ksvr9DLs8x/2i1XrRJpKeg4TnhfARGnRCxp5qAY5FhnW6XQBgHxN96yJ4
   v2mVhmstN0sIsMoFivjVCUMNzNlwxG3Y4PXnGOLLnrlMbhrMyQWg5qvmQ
   Wk6J7LZPr1saMvi0U/5Fz8wJv/rZKoNX92DVv0DV/RkD6/mfrkHyrDKlJ
   hXuqnSvm52WsJ++ywMy3oyIwcCdjLq8HtU63SWWbmznBMn/1KDwOrpsnb
   +wsYvqYBDK8BNR/J8LRttlfRDJIbYygbeBzaK0FVkfCE/QBSNV0mlkqoT
   A==;
X-CSE-ConnectionGUID: K8oBffzdSECUcxcuDPd8aA==
X-CSE-MsgGUID: LvUNXHY0Q/S7RA8UO98lKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84401333"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="84401333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 20:39:42 -0700
X-CSE-ConnectionGUID: dcfpJFH9Tha+deV4jqQ07A==
X-CSE-MsgGUID: 5NIwzO+vT86ifiUh/rAdgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="254357402"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2026 20:39:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmkHZ-00000000ZDB-32w7;
	Thu, 23 Jul 2026 03:39:37 +0000
Date: Thu, 23 Jul 2026 11:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neil@brown.name>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <cel@kernel.org>,
 Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 214/240] fs/nfsd/vfs.c:286:52: sparse:
 sparse: incorrect type in initializer (different base types)
Message-ID: <202607231124.uNKNJtSO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   e2407463212ffde400eb33dbee5098af3f02f346
commit: f0212435e29b1624ee539b04611cd4658497a5be [214/240] nfsd: move check_nfsd_access() call into nfsd_cross_mnt()
config: i386-randconfig-r112-20260722 (https://download.01.org/0day-ci/archive/20260723/202607231124.uNKNJtSO-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231124.uNKNJtSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231124.uNKNJtSO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/nfsd/vfs.c:286:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected int nfserr @@     got restricted __be32 @@
   fs/nfsd/vfs.c:286:52: sparse:     expected int nfserr
   fs/nfsd/vfs.c:286:52: sparse:     got restricted __be32
>> fs/nfsd/vfs.c:291:40: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __be32 @@     got int nfserr @@
   fs/nfsd/vfs.c:291:40: sparse:     expected restricted __be32
   fs/nfsd/vfs.c:291:40: sparse:     got int nfserr
   fs/nfsd/vfs.c:2435:27: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/nfsd/vfs.c:2435:27: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/nfsd/vfs.c:2435:27: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'

vim +286 fs/nfsd/vfs.c

   249	
   250	__be32
   251	nfsd_lookup_dentry(struct svc_rqst *rqstp, struct svc_fh *fhp,
   252			   const char *name, unsigned int len,
   253			   struct svc_export **exp_ret, struct dentry **dentry_ret)
   254	{
   255		struct svc_export	*exp;
   256		struct dentry		*dparent;
   257		struct dentry		*dentry;
   258		int			host_err;
   259	
   260		trace_nfsd_vfs_lookup(rqstp, fhp, name, len);
   261	
   262		dparent = fhp->fh_dentry;
   263		exp = exp_get(fhp->fh_export);
   264	
   265		/* Lookup the name, but don't follow links */
   266		if (name_is_dot_dotdot(name, len)) {
   267			if (len==1)
   268				dentry = dget(dparent);
   269			else if (dparent != exp->ex_path.dentry)
   270				dentry = dget_parent(dparent);
   271			else if (!EX_NOHIDE(exp) && !nfsd_v4client(rqstp))
   272				dentry = dget(dparent); /* .. == . just like at / */
   273			else {
   274				/* checking mountpoint crossing is very different when stepping up */
   275				host_err = nfsd_lookup_parent(rqstp, dparent, &exp, &dentry);
   276				if (host_err)
   277					goto out_nfserr;
   278			}
   279		} else {
   280			dentry = lookup_one_unlocked(&nop_mnt_idmap,
   281						     &QSTR_LEN(name, len), dparent);
   282			host_err = PTR_ERR(dentry);
   283			if (IS_ERR(dentry))
   284				goto out_nfserr;
   285			if (nfsd_mountpoint(dentry, exp)) {
 > 286				int nfserr = nfsd_cross_mnt(rqstp, &dentry, &exp);
   287	
   288				if (nfserr) {
   289					dput(dentry);
   290					exp_put(exp);
 > 291					return nfserr;
   292				}
   293			}
   294		}
   295		*dentry_ret = dentry;
   296		*exp_ret = exp;
   297		return 0;
   298	
   299	out_nfserr:
   300		exp_put(exp);
   301		return nfserrno(host_err);
   302	}
   303	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
