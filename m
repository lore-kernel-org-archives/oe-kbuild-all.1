Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA928E0F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764280058; cv=none; b=AWe6iTMfsjgJtgvZa9p+bdEJxhTJtQOCwjCY5h+rMI+rDCA9VUKnRnVaaexqd3F016RQFrr/QkK8Iy4I1rheeUADPE3BmDCDGAoQUNNzmNZmAK2l59ZO9ofTjea9uC+vPCjrZ5i7DZYKqOcV9XT2pC988iE6UhYNfLJNIwHu5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764280058; c=relaxed/simple;
	bh=/8fgdSdZLi/HnfH/zGAU+nruyfIWQGLA/JlW1QszFyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eY4gYg7qkeDRlBFrsdcvUB8q+gHL1eVa/znft5uRUQ2l8RO3eGbfBpMddmIVQjD/PB66a2HdKNi6zouVVzObKjh7iWl/+Lxe6u1/uEdoIkskUWwxocwAjCxnzKRTCv4srQvG1rWAA2CQzVj8AZXHuIN8Opy7Wvvt9yBKI39TqGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctp4Qt/b; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctp4Qt/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764280057; x=1795816057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8fgdSdZLi/HnfH/zGAU+nruyfIWQGLA/JlW1QszFyA=;
  b=ctp4Qt/bTgHegWOSuxwMq2x8RbEcA/8lCANURKwviQ9TmrNYemh7VYdU
   l2w+nKo5meq5ympOpgxYAPmqDjp9+ZK6MbEZfC7j9yg+OgBi73/G+pDRB
   jLDJf5gTMjbgudkmXhpCdp/lgX/gOfXXweu+wQ39WHESy3kJM0wd/NTAP
   YNT8udDuZY7XnhLSm6q+MekPcQLfq+q/O7oxhVm4AdWufJnQgxlmltX4p
   UfGx+3Ws37glV0PnAC8PqDJ/tusF1K+v+6Zhy4WEhrmEYutzs8wAsqMsk
   oF9SakzXKmI4aExqlIuLGdC+Jl4+x79Lt4eF7RzUALTGo8CTHWWhGMtaW
   w==;
X-CSE-ConnectionGUID: mpAyZVCgSS2fosXrklPnkw==
X-CSE-MsgGUID: MeuwzM2nRrKahQHlYMJAFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83933735"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83933735"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 13:47:36 -0800
X-CSE-ConnectionGUID: ZZfKfmiSTPyuS8S3cJ+LUQ==
X-CSE-MsgGUID: agWy3YU8S5KM6p4AIXbTBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="194115588"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Nov 2025 13:47:35 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOjps-000000005il-2eCu;
	Thu, 27 Nov 2025 21:47:32 +0000
Date: Fri, 28 Nov 2025 05:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12173/12398] fs/nfs/localio.c:834
 nfs_local_call_write() warn: inconsistent indenting
Message-ID: <202511280520.ML76oQvR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 8693386a36d2a29c4c5ed09a09dd34662a82f0bd [12173/12398] Merge branch 'kernel-6.19.cred' into vfs.all
config: xtensa-randconfig-r072-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280520.ML76oQvR-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280520.ML76oQvR-lkp@intel.com/

New smatch warnings:
fs/nfs/localio.c:834 nfs_local_call_write() warn: inconsistent indenting

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +834 fs/nfs/localio.c

3feec68563dda59 Mike Snitzer      2024-11-15  819  
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  820  static void nfs_local_call_write(struct work_struct *work)
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  821  {
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  822  	struct nfs_local_kiocb *iocb =
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  823  		container_of(work, struct nfs_local_kiocb, work);
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  824  	struct file *filp = iocb->kiocb.ki_filp;
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  825  	unsigned long old_flags = current->flags;
f2060bdc21d70f3 Mike Snitzer      2025-10-27  826  	bool force_done = false;
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  827  	ssize_t status;
f2060bdc21d70f3 Mike Snitzer      2025-10-27  828  	int n_iters;
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  829  
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  830  	current->flags |= PF_LOCAL_THROTTLE | PF_MEMALLOC_NOIO;
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  831  
8693386a36d2a29 Christian Brauner 2025-11-26  832  	scoped_with_creds(filp->f_cred) {
c817248fc831f54 Mike Snitzer      2025-09-19  833  	file_start_write(filp);
f2060bdc21d70f3 Mike Snitzer      2025-10-27 @834  		n_iters = atomic_read(&iocb->n_iters);
f2060bdc21d70f3 Mike Snitzer      2025-10-27  835  		for (int i = 0; i < n_iters ; i++) {
c817248fc831f54 Mike Snitzer      2025-09-19  836  			if (iocb->iter_is_dio_aligned[i]) {
c817248fc831f54 Mike Snitzer      2025-09-19  837  				iocb->kiocb.ki_flags |= IOCB_DIRECT;
6a218b9c3183ed1 Mike Snitzer      2025-11-05  838  				/* Only use AIO completion if DIO-aligned segment is last */
6a218b9c3183ed1 Mike Snitzer      2025-11-05  839  				if (i == iocb->end_iter_index) {
091bdcfcece0963 Mike Snitzer      2025-09-19  840  					iocb->kiocb.ki_complete = nfs_local_write_aio_complete;
091bdcfcece0963 Mike Snitzer      2025-09-19  841  					iocb->aio_complete_work = nfs_local_write_aio_complete_work;
091bdcfcece0963 Mike Snitzer      2025-09-19  842  				}
6a218b9c3183ed1 Mike Snitzer      2025-11-05  843  			} else
6a218b9c3183ed1 Mike Snitzer      2025-11-05  844  				iocb->kiocb.ki_flags &= ~IOCB_DIRECT;
51a491f2708de79 Mike Snitzer      2025-10-27  845  
c817248fc831f54 Mike Snitzer      2025-09-19  846  			status = filp->f_op->write_iter(&iocb->kiocb, &iocb->iters[i]);
c817248fc831f54 Mike Snitzer      2025-09-19  847  			if (status != -EIOCBQUEUED) {
6a218b9c3183ed1 Mike Snitzer      2025-11-05  848  				if (unlikely(status >= 0 && status < iocb->iters[i].count))
6a218b9c3183ed1 Mike Snitzer      2025-11-05  849  					force_done = true; /* Partial write */
f2060bdc21d70f3 Mike Snitzer      2025-10-27  850  				if (nfs_local_pgio_done(iocb, status, force_done)) {
f2060bdc21d70f3 Mike Snitzer      2025-10-27  851  					nfs_local_write_iocb_done(iocb);
c817248fc831f54 Mike Snitzer      2025-09-19  852  					break;
c817248fc831f54 Mike Snitzer      2025-09-19  853  				}
c817248fc831f54 Mike Snitzer      2025-09-19  854  			}
f2060bdc21d70f3 Mike Snitzer      2025-10-27  855  		}
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  856  		file_end_write(filp);
bff3c841f7bde56 Christian Brauner 2025-11-03  857  	}
992203a1fba51b0 Scott Mayhew      2025-08-07  858  
992203a1fba51b0 Scott Mayhew      2025-08-07  859  	current->flags = old_flags;
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  860  }
b9f5dd57f4a5299 Trond Myklebust   2024-09-05  861  

:::::: The code at line 834 was first introduced by commit
:::::: f2060bdc21d70f3d8a4753a9fd3b0b02cb48c0bc nfs/localio: add refcounting for each iocb IO associated with NFS pgio header

:::::: TO: Mike Snitzer <snitzer@kernel.org>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
