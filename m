Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5310A1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 05:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709616097; cv=none; b=HmdPzAUqmXoqGsnPZnWWbNpmmWN7cPO5xrGMseMLDr9ka42e+syEwEFwMiQ1EypO/o5EUKbMjU8JdKsKmEHMco7pH3kJGyZmC+9P/iPYGZ1pZxPQgH1LBxsBxnorRLI3ZsAjr2OK0S9kox0rwU2AwVLVEEA14/5rRJ5VHBGPurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709616097; c=relaxed/simple;
	bh=m71VnIs/p2NtoHFlCLMdqZ9zg1WIJ7vQtd9p3/441Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcFwM6RdCtcMc2ceCMvR+IAJsUcLQTNcYTulpsSzTw1ri/HXhM88SNI5jGWi7iLB3TeV5UyIFbdqbmMeV9ctEePLS/1SwMohEccFpkuQVY5sZwQQvkADium9LqBcTXwURzg/6XEiIN0KuDOTJWxJD2sr0/BioAtWx00nM551DbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzoMGxLu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzoMGxLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709616095; x=1741152095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m71VnIs/p2NtoHFlCLMdqZ9zg1WIJ7vQtd9p3/441Vk=;
  b=IzoMGxLuwhFtXuT7FSgiLS6AncMaKJs+rCmjpb7HGUZ5emFzWi7whuKO
   Xlc1Z/YIQott8K1v9oa1QOKJBQQpcfqRVLWmF1k3ZhjfmhZLOUKc1SxoQ
   IkjjHV1+spRzRieoU9q2hmcbvl8u8kX6JuL7EMzw6fRMhNVnHAJQz/0bU
   X6tzrKA3IQSXZLDIQp6xiTd7pLWmGLsgtdXoZaSnUjwZSvp1ySnsJispm
   m9KlljzzImZNfEL/Uo5HaPilh4u44GZUt3ZLuyO7KcwfzV0FIa0lXN2qI
   pZl59hcy9mIUp64fuOXY5TlLn46M7VeZ0oYCJOcFGznWFHlwUvCifUOUN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="29569839"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="29569839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 21:21:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9827092"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Mar 2024 21:21:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhNF5-00033l-0o;
	Tue, 05 Mar 2024 05:21:31 +0000
Date: Tue, 5 Mar 2024 13:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 181/303] fs/xfs/xfs_ioctl.c:2003:16:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202403051323.bRAerMNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   801d4ca6aa1e9e7ddcd6042ff9972609c4130e93
commit: ec940b80ef8c955db632458bb2307639ce0c57dc [181/303] xfs: introduce new file range commit ioctls
config: x86_64-randconfig-r113-20240305 (https://download.01.org/0day-ci/archive/20240305/202403051323.bRAerMNN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051323.bRAerMNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051323.bRAerMNN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/xfs/xfs_ioctl.c:2003:19: sparse: sparse: cast removes address space '__user' of expression
>> fs/xfs/xfs_ioctl.c:2003:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xfs_commit_range_fresh [noderef] __user *user_f @@     got struct xfs_commit_range_fresh * @@
   fs/xfs/xfs_ioctl.c:2003:16: sparse:     expected struct xfs_commit_range_fresh [noderef] __user *user_f
   fs/xfs/xfs_ioctl.c:2003:16: sparse:     got struct xfs_commit_range_fresh *

vim +2003 fs/xfs/xfs_ioctl.c

  1977	
  1978	static long
  1979	xfs_ioc_start_commit(
  1980		struct file			*file,
  1981		struct xfs_commit_range __user	*argp)
  1982	{
  1983		struct xfs_exchrange		fxr = {
  1984			.file2			= file,
  1985		};
  1986		struct xfs_commit_range		args;
  1987		struct xfs_commit_range_fresh	*kern_f;
  1988		struct xfs_commit_range_fresh	__user *user_f;
  1989	
  1990		BUILD_BUG_ON(sizeof(struct xfs_commit_range_fresh) !=
  1991			     sizeof(args.file2_freshness));
  1992	
  1993		xfs_exchrange_freshness(&fxr);
  1994	
  1995		kern_f = (struct xfs_commit_range_fresh *)&args.file2_freshness;
  1996		memset(kern_f, 0, sizeof(*kern_f));
  1997		kern_f->file2_ino		= fxr.file2_ino;
  1998		kern_f->file2_mtime		= fxr.file2_mtime.tv_sec;
  1999		kern_f->file2_mtime_nsec	= fxr.file2_mtime.tv_nsec;
  2000		kern_f->file2_ctime		= fxr.file2_ctime.tv_sec;
  2001		kern_f->file2_ctime_nsec	= fxr.file2_ctime.tv_nsec;
  2002	
> 2003		user_f = (struct xfs_commit_range_fresh *)&argp->file2_freshness;
  2004		if (copy_to_user(user_f, kern_f, sizeof(*kern_f)))
  2005			return -EFAULT;
  2006	
  2007		return 0;
  2008	}
  2009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
