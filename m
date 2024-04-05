Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CEC1643D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 03:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712289209; cv=none; b=fbPAFkmj9b6x10S6VTt0Ufxho1j3ve+WJBubphS4Ko+pR+kkDMZs60ObxzddM2mtTiOIqw33vvGFLL7cZ5ImSu/QcjlWh9RzqCywTonCdBjeE4sftMGWZ1OwhaPoXpcy6ifsf91YQyV/pNL8NpM9Pz75NoVrQy/tAF4mbQesBOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712289209; c=relaxed/simple;
	bh=1ic5CqQd3wrR+ZffjOvd6x2YKKg6Q7tJqeuV69vqn9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jHJeQ5SDD39VC7dGeneEkVCJZnk7svXJy/xe2yd+kMIQ3pc2LjpEbRIPzOUAf5GMOv2UxFbjWE0Dboogxv7BTNWv/UfwneMJO9z9tMzsCbMIjD9J6x45nKtN7q2DApBGUYEHzg1fiC7wJmmV5HufRI9v/iZ7GUXPkuq0UxIp3jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlvO6nYo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlvO6nYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712289207; x=1743825207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ic5CqQd3wrR+ZffjOvd6x2YKKg6Q7tJqeuV69vqn9U=;
  b=AlvO6nYoaWGg4kHcx+rvlmVL1PLvtQ7X4d+l/xO7wDhjRdAWlzHlGYIb
   et1WUCCy9EueEgQAlDAaVM7idVO7epVOlsVYnAh7YIPMz47m8enFvAWkQ
   jcmJrH1d6Vqy+HpfOOq72Fdx+rk/ecZPXNZk/RwDicIUhCqE+//uAY/KW
   5o0q4+cmoC7uyQXnm9YnAd/N1m5GQyES9XAm56/rtPTluHjYmR8c/WPcf
   MRWH8sBfEUx0tcf9VmiOXsV+WkT2h9TPkTfMRNi301+iwS6cYNH4+s51B
   hr4ZvQeIS+SlWUYhLEU1c3hRMFSaqXPyE8Djtc9aQZYbP1VHu+sA14qNN
   Q==;
X-CSE-ConnectionGUID: MQjTtzNeTCuhy1LpimY7cA==
X-CSE-MsgGUID: To0hlaKnQ3uwd0qsKnaKLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7709042"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7709042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 20:53:26 -0700
X-CSE-ConnectionGUID: qPFejWctSSqkiXS2iy8Fzg==
X-CSE-MsgGUID: b4JvlIpySaWMi0aV1X8Dwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23498898"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2024 20:53:25 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsadn-0001rV-0O;
	Fri, 05 Apr 2024 03:53:23 +0000
Date: Fri, 5 Apr 2024 11:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-inode 1/1] fs/fuse/file.c:1365:27: warning:
 unused variable 'ff'
Message-ID: <202404051111.zB1J7oLZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-inode
head:   e338520c6e80245ceb176abe67a85f212c6bf221
commit: e338520c6e80245ceb176abe67a85f212c6bf221 [1/1] fuse: fix iomode state changes from parallel dio write
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240405/202404051111.zB1J7oLZ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051111.zB1J7oLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051111.zB1J7oLZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/file.c: In function 'fuse_dio_lock':
>> fs/fuse/file.c:1365:27: warning: unused variable 'ff' [-Wunused-variable]
    1365 |         struct fuse_file *ff = iocb->ki_filp->private_data;
         |                           ^~
   fs/fuse/file.c: In function 'fuse_dio_unlock':
   fs/fuse/file.c:1391:27: warning: unused variable 'ff' [-Wunused-variable]
    1391 |         struct fuse_file *ff = iocb->ki_filp->private_data;
         |                           ^~


vim +/ff +1365 fs/fuse/file.c

699cf8246ee4c2 Bernd Schubert 2023-08-22  1360  
9bbb6717dfd286 Bernd Schubert 2023-12-24  1361  static void fuse_dio_lock(struct kiocb *iocb, struct iov_iter *from,
9bbb6717dfd286 Bernd Schubert 2023-12-24  1362  			  bool *exclusive)
9bbb6717dfd286 Bernd Schubert 2023-12-24  1363  {
9bbb6717dfd286 Bernd Schubert 2023-12-24  1364  	struct inode *inode = file_inode(iocb->ki_filp);
205c1d80268357 Amir Goldstein 2024-02-09 @1365  	struct fuse_file *ff = iocb->ki_filp->private_data;
9bbb6717dfd286 Bernd Schubert 2023-12-24  1366  
9bbb6717dfd286 Bernd Schubert 2023-12-24  1367  	*exclusive = fuse_dio_wr_exclusive_lock(iocb, from);
9bbb6717dfd286 Bernd Schubert 2023-12-24  1368  	if (*exclusive) {
9bbb6717dfd286 Bernd Schubert 2023-12-24  1369  		inode_lock(inode);
9bbb6717dfd286 Bernd Schubert 2023-12-24  1370  	} else {
9bbb6717dfd286 Bernd Schubert 2023-12-24  1371  		inode_lock_shared(inode);
9bbb6717dfd286 Bernd Schubert 2023-12-24  1372  		/*
205c1d80268357 Amir Goldstein 2024-02-09  1373  		 * New parallal dio allowed only if inode is not in caching
205c1d80268357 Amir Goldstein 2024-02-09  1374  		 * mode and denies new opens in caching mode. This check
205c1d80268357 Amir Goldstein 2024-02-09  1375  		 * should be performed only after taking shared inode lock.
205c1d80268357 Amir Goldstein 2024-02-09  1376  		 * Previous past eof check was without inode lock and might
205c1d80268357 Amir Goldstein 2024-02-09  1377  		 * have raced, so check it again.
9bbb6717dfd286 Bernd Schubert 2023-12-24  1378  		 */
205c1d80268357 Amir Goldstein 2024-02-09  1379  		if (fuse_io_past_eof(iocb, from) ||
e338520c6e8024 Amir Goldstein 2024-04-04  1380  		    fuse_inode_uncached_io_start(inode, NULL) != 0) {
9bbb6717dfd286 Bernd Schubert 2023-12-24  1381  			inode_unlock_shared(inode);
9bbb6717dfd286 Bernd Schubert 2023-12-24  1382  			inode_lock(inode);
9bbb6717dfd286 Bernd Schubert 2023-12-24  1383  			*exclusive = true;
9bbb6717dfd286 Bernd Schubert 2023-12-24  1384  		}
9bbb6717dfd286 Bernd Schubert 2023-12-24  1385  	}
9bbb6717dfd286 Bernd Schubert 2023-12-24  1386  }
9bbb6717dfd286 Bernd Schubert 2023-12-24  1387  

:::::: The code at line 1365 was first introduced by commit
:::::: 205c1d8026835746d8597e1aa70c370e014e83fa fuse: allow parallel dio writes with FUSE_DIRECT_IO_ALLOW_MMAP

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
