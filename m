Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC52214812
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 05:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770873011; cv=none; b=CZJYRfqyhNx5VyTwD2lwCv6elPkLriY4QKFD+MRlmZTLT6kyLjce6lqX/b+UgD7ss8aSISKFTIroW44v7yBbW1eVBCbfVUqLpADp7WGbgvqZD2HzNfOTiWDvaB5Je86zGWGWLkm3VWWyn9/dnjIb2xPWtubOR0DxnPpA4GqnIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770873011; c=relaxed/simple;
	bh=i8qthc1wwV9rjkefpcVgFIiEiu9GJnFgfJBnFrK/oEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P8CbyqLMIgtQMrdP9fTMBlvS8UT2e31GjQvQbjJfT6Gmq1XJWxC35Ktxgrqi7fMLoxIAv/x/dKjDYLNuZU1TnEiyY1EpGoO5XqBbNr4aMNf6qAzAD/R2nLZR980bSPtlVUmwl+n/Z+bR9UkOVGwJ+2wfW58dCbgSw/8VytMYWVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXtYdnov; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXtYdnov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770873009; x=1802409009;
  h=date:from:to:cc:subject:message-id;
  bh=i8qthc1wwV9rjkefpcVgFIiEiu9GJnFgfJBnFrK/oEk=;
  b=iXtYdnovRqR2xJ0Sy/VyToHrZQ3J9DF9//TWCoOcMyIrLH1tkQ/i8hwo
   74CyD4ZKPVdhi3XDtkvbrvdnDIEETIE9VimptHibTHS5MKf9dPF3ovAQp
   +EHtJdjs2qFD6wz+MxHdLHDQ7ceVWh+hFrCa33SQlppzRqVmqVXF4/Bn+
   hfdHX+giMIgbH2TsViySZlheyNGB9rUCzzjkJPBQIRLPH8jl0MKRmpqsO
   oHoQaBKFBFdO+D+PHrP0Gs879082nJgStdm49Cz6oZpJSw5pTNSVkIQ+U
   wMpKOP9rscpjCvmz0RJum7xonZhkooS7K5X8Avh5S7HQztH6TPSN32Ddn
   Q==;
X-CSE-ConnectionGUID: 1leAjuWKSeq44MEtvRLvCw==
X-CSE-MsgGUID: bCAz+hq1QG201fAJbD/IeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71944117"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71944117"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 21:10:07 -0800
X-CSE-ConnectionGUID: llDuGdvZThS6uyT2mkmyng==
X-CSE-MsgGUID: 0DYzaWftS72b+b+chVrVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="250146137"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2026 21:10:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqOxn-00000000qiw-1x8C;
	Thu, 12 Feb 2026 05:10:03 +0000
Date: Thu, 12 Feb 2026 13:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 14/14] fs/9p/vfs_dentry.c:112
 __v9fs_lookup_revalidate() warn: inconsistent indenting
Message-ID: <202602121355.sPtkOn2q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   538ec436e9b3a340455d844e2d1fa84dcda53d25
commit: 43c36a56ccf6d9b07b4b3f4f614756e687dcdc01 [14/14] Revert "fs/9p: Refresh metadata in d_revalidate for uncached mode too"
config: i386-randconfig-141-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121355.sPtkOn2q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121355.sPtkOn2q-lkp@intel.com/

smatch warnings:
fs/9p/vfs_dentry.c:112 __v9fs_lookup_revalidate() warn: inconsistent indenting

vim +112 fs/9p/vfs_dentry.c

    63	
    64	static int __v9fs_lookup_revalidate(struct dentry *dentry, unsigned int flags)
    65	{
    66		struct p9_fid *fid;
    67		struct inode *inode;
    68		struct v9fs_inode *v9inode;
    69	
    70		if (flags & LOOKUP_RCU)
    71			return -ECHILD;
    72	
    73		inode = d_inode(dentry);
    74		if (!inode)
    75			goto out_valid;
    76	
    77		v9inode = V9FS_I(inode);
    78		if (v9inode->cache_validity & V9FS_INO_INVALID_ATTR) {
    79			int retval;
    80			struct v9fs_session_info *v9ses;
    81	
    82			fid = v9fs_fid_lookup(dentry);
    83			if (IS_ERR(fid)) {
    84				p9_debug(
    85					P9_DEBUG_VFS,
    86					"v9fs_fid_lookup: dentry = %pd (%p), got error %pe\n",
    87					dentry, dentry, fid);
    88				return PTR_ERR(fid);
    89			}
    90	
    91			v9ses = v9fs_inode2v9ses(inode);
    92			if (v9fs_proto_dotl(v9ses))
    93				retval = v9fs_refresh_inode_dotl(fid, inode);
    94			else
    95				retval = v9fs_refresh_inode(fid, inode);
    96			p9_fid_put(fid);
    97	
    98			if (retval == -ENOENT) {
    99				p9_debug(P9_DEBUG_VFS, "dentry: %pd (%p) invalidated due to ENOENT\n",
   100					 dentry, dentry);
   101				return 0;
   102			}
   103			if (v9inode->cache_validity & V9FS_INO_INVALID_ATTR) {
   104				p9_debug(P9_DEBUG_VFS, "dentry: %pd (%p) invalidated due to type change\n",
   105					 dentry, dentry);
   106				return 0;
   107			}
   108			if (retval < 0) {
   109				p9_debug(P9_DEBUG_VFS,
   110					"refresh inode: dentry = %pd (%p), got error %pe\n",
   111					dentry, dentry, ERR_PTR(retval));
 > 112			if (retval < 0)
   113				return retval;
   114			}
   115		}
   116	out_valid:
   117		p9_debug(P9_DEBUG_VFS, "dentry: %pd (%p) is valid\n", dentry, dentry);
   118		return 1;
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
