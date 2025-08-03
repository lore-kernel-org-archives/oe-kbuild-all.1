Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C1F9D6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254879; cv=none; b=ol5aEO9fHULtU53oHfrxiMe4NEQFvU4SQLFnkomPBjLAK0qLR3tfpG6UUTfZo3epIUpPjBWMvs6c84ILOAJxCHw+7xd02uI1tQ8MZ+yZWn8G+ZV1Y9Ll8Ls6z6hCNWq1OZzvBIScyHpAyICGSamWdctLSgf+EDQMT5lq0ofpibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254879; c=relaxed/simple;
	bh=DE41t4MCps+ebDcrt+x0Aj/xVc+f94/d6dhPdzGI5wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/CWPuBE7UIumCsFEIvq3XSPSXXkNp/kYvWmPO7LiItWwdCGPWF+VhcDUDRGMHYhxBxGiYo/NcGdTUSVeakKIn+mWXr9mzw5wyd7k6sFhVooLRGSWhv761TY8HJlKyh/Vy7HoCeAOtu/3/cGYSS3i6zp58GWYPgH4J3Ay1Sf7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dz7jfo9Q; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dz7jfo9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754254878; x=1785790878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DE41t4MCps+ebDcrt+x0Aj/xVc+f94/d6dhPdzGI5wA=;
  b=dz7jfo9QHQ6agQIW62YwNyMnORFNyOR1jdYCqW0NxMCUlm1tGePOdGAA
   V3UjMI8LKR2iNCArL9x7j+zsO7AtNn641M/zWd7jscBIqxK2Axv78ZN60
   QJ/861bu7YPIyvyrVt5ucia4s4iWT6Vc8PkwQdxQ6BgZ2hoIN+emcfD94
   wweZtFa4x6cdGX48eMi86FIPpwYJIQqaBYsA4dF+/dBAqp7BkYrLyK1VU
   9XdUxAFCo4IY+PrgyUpEauQ3nDspR8gSjKSInRVa6jUFliQaQGAfa3cEg
   /WmrYrfohki/EYeJTSqwOIaEkOl7PaYyG5S13I05FU9edG7dP7kAXtxJ/
   g==;
X-CSE-ConnectionGUID: AFZZPZhLS7SGvBw6kVvFmA==
X-CSE-MsgGUID: lZJxsf2CTjKGnzoieCnFgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="44105616"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44105616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 14:01:17 -0700
X-CSE-ConnectionGUID: EMtcsc1/RvGtkQIRig9pYg==
X-CSE-MsgGUID: 6PtTgWacTKyqBAQdhQtG0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168182614"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2025 14:01:16 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uifpS-0006dU-1d;
	Sun, 03 Aug 2025 21:01:14 +0000
Date: Mon, 4 Aug 2025 05:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 24/30] fs/nfsd/nfs4state.c:1346:14: warning:
 unused variable 'recalc'
Message-ID: <202508040724.a0M5KZ9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   2f82eb2efda91bd165a7ecd28e694b2847c4a1fe
commit: 2e5c7e277f6b6b52d0c0142408eb1180240dddd7 [24/30] nfsd: update the fsnotify mark when setting or removing a dir delegation
config: riscv-randconfig-002-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040724.a0M5KZ9F-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040724.a0M5KZ9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040724.a0M5KZ9F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfsd/nfs4state.c: In function 'nfsd_fsnotify_recalc_mask':
>> fs/nfsd/nfs4state.c:1346:14: warning: unused variable 'recalc' [-Wunused-variable]
    1346 |         bool recalc = false;
         |              ^~~~~~


vim +/recalc +1346 fs/nfsd/nfs4state.c

  1340	
  1341	static void nfsd_fsnotify_recalc_mask(struct nfsd_file *nf)
  1342	{
  1343		struct fsnotify_mark *mark = &nf->nf_mark->nfm_mark;
  1344		struct inode *inode = file_inode(nf->nf_file);
  1345		u32 lease_mask, set = 0, clear = 0;
> 1346		bool recalc = false;
  1347	
  1348		/* This is only needed when adding or removing dir delegs */
  1349		if (!S_ISDIR(inode->i_mode))
  1350			return;
  1351	
  1352		/* Set up notifications for any ignored delegation events */
  1353		lease_mask = inode_lease_ignore_mask(inode);
  1354	
  1355		if (lease_mask & FL_IGN_DIR_CREATE)
  1356			set |= FS_CREATE;
  1357		else
  1358			clear |= FS_CREATE;
  1359	
  1360		if (lease_mask & FL_IGN_DIR_DELETE)
  1361			set |= FS_DELETE;
  1362		else
  1363			clear |= FS_DELETE;
  1364	
  1365		if (lease_mask & FL_IGN_DIR_RENAME)
  1366			set |= FS_RENAME;
  1367		else
  1368			clear |= FS_RENAME;
  1369	
  1370		fsnotify_modify_mark_mask(mark, set, clear);
  1371	}
  1372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
