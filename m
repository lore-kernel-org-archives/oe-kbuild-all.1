Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604461B28D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720897965; cv=none; b=aa0Lfz3dQH/fzYYKOWEAnDYO6W6g4MEOkCA20//PayAHn4b/uDIRf3EJiQX8aulW8TDs04XlEsO9hBAIzaTLx3RSA7dzBMlUX08Qufuf8rIFQD1wMsnqQ1WBuZhKdFKEGS923teDy8bWkchbN2kiDVrItC0PxSIbuB9HvdH1gkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720897965; c=relaxed/simple;
	bh=lB18i+duSM41WCNSRA38kZEuYkNxldA3FoqPxs3Ma/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaMnoGwS1f0suURU93SSVdkvpb1yE6f8C5sVrtSekK4pI1UU4/ARMFcGAVZYjzOJbaY1xnMzm+1pgVm97KJDZ4GNm83lz56V0Krg7WZ/aFYNyG3XTmzd7j7G6fEfFoo6z7vvGTPsTodrv+w616IBtVUhSgYBUTzDAcmw/h1T8RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGLXaf1o; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGLXaf1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720897964; x=1752433964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lB18i+duSM41WCNSRA38kZEuYkNxldA3FoqPxs3Ma/0=;
  b=VGLXaf1oewi+ObTl5Givxgnb884xb72ArexFrJ8DPvtbqrIz4aOiEjUf
   SkjMb2kvhA0mr/iW02CKt6oPW66UFzwzGy13Y2BwwTHC+zONYIbQsl8D+
   q6mCIaZtRqmBeQ4p7K6wh322QfOCZVOauN1D+DCCjYia+HDCXf01bFLqk
   uohSxuCsyHO1KuPpcCsCw70lxxWnJHAVdAr7B0Sg6cjJ9AVVAmDVQMSkd
   2yOXZ+65YAsHiD1xg1nRBWCGZWLH4vxATnzJKR6lBGMgz8UGR+RyTjHbU
   yNqk72Lh9gKzKxvpNwjmzD8p7dfYtKrp4CruKk9R9f0e3ovU1mOHgkbLp
   g==;
X-CSE-ConnectionGUID: cM9EQRqYSua+HK6jbnFflQ==
X-CSE-MsgGUID: iCTjCoqFSS+irNpFq8rcaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18167088"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="18167088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 12:12:43 -0700
X-CSE-ConnectionGUID: H2283+wVQNeQEmLjhOV7uA==
X-CSE-MsgGUID: k6XQwb2oTCuOJ3KzEF5S1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49302257"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jul 2024 12:12:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSiAh-000ceo-2o;
	Sat, 13 Jul 2024 19:12:39 +0000
Date: Sun, 14 Jul 2024 03:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 3/23] fs/nfs/nfs2xdr.c:65:12: warning:
 'nfs_stat_to_errno' used but never defined
Message-ID: <202407140320.S1BJSqmB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   85d53fa650a024c154c0befa31a72b4484290c47
commit: 85c08fd7310ca8076283e88773002df86cf23ac6 [3/23] nfs_common: factor out nfs_errtbl and nfs_stat_to_errno
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240714/202407140320.S1BJSqmB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407140320.S1BJSqmB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407140320.S1BJSqmB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nfs/nfs2xdr.c:65:12: error: static declaration of 'nfs_stat_to_errno' follows non-static declaration
      65 | static int nfs_stat_to_errno(enum nfs_stat);
         |            ^~~~~~~~~~~~~~~~~
   In file included from fs/nfs/nfs2xdr.c:25:
   include/linux/nfs_common.h:14:5: note: previous declaration of 'nfs_stat_to_errno' with type 'int(enum nfs_stat)'
      14 | int nfs_stat_to_errno(enum nfs_stat status);
         |     ^~~~~~~~~~~~~~~~~
>> fs/nfs/nfs2xdr.c:65:12: warning: 'nfs_stat_to_errno' used but never defined
      65 | static int nfs_stat_to_errno(enum nfs_stat);
         |            ^~~~~~~~~~~~~~~~~


vim +/nfs_stat_to_errno +65 fs/nfs/nfs2xdr.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  64  
5e7e5a0da28216 Bryan Schumaker 2012-05-10 @65  static int nfs_stat_to_errno(enum nfs_stat);
25a0866cc63281 Chuck Lever     2010-12-14  66  

:::::: The code at line 65 was first introduced by commit
:::::: 5e7e5a0da28216fb9d0a49e93ee27668ef4f04f7 NFS: Create an NFS v3 stat_to_errno()

:::::: TO: Bryan Schumaker <bjschuma@netapp.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
