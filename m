Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4313EBF39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 00:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681799; cv=none; b=QRel98b/b3+qvOKGsUFCZqLjysMjlKY6KucubHLfSztIzDj54585JK64v5h4Ilyr9X5sTaQd69bDF3Z8vug21t1V6SayUm9FwWWMjdhSfDnTNuxAjHek0VraaxK5cHe5v3vFHIBAqwfY6nAZQ27wBm5Tf/xYvfaM1NHwrggyFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681799; c=relaxed/simple;
	bh=qDXKG9I6HR0YT/dyyrMWMCK6MKt04uazPEsGGP2S/wo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X9nHqlK7uf75XR/txp78HcxrDfRDTNcV7iVhvbvjAQvK77vRrEF8nFyCtdBLd2ofsHlDzzVQfVNizgAgI4Wy0IlL0HJDJT4knQhKzOypkJASmfEG781oF7mjFcij8ly/bBpGZn0hT59ZSU55tsdM4G2UoUeMiWsGjBQgaW+6ceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMepnAOM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMepnAOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770681799; x=1802217799;
  h=date:from:to:cc:subject:message-id;
  bh=qDXKG9I6HR0YT/dyyrMWMCK6MKt04uazPEsGGP2S/wo=;
  b=AMepnAOMUSmdYaMt3knObap1XFKclSFKzJKdRTdbYAYrOUH5RBdDYJ8b
   M6LJsve2YM4Ml82p7h5tkOd2zo9QEZLnTx8/4X3LpkmfLENFVFNaWWin8
   xld7vlABvMo7ifCBZLzDUrKwuvAmJ0iHBvWryqUgIFGAa+8NP7aj7ZnXd
   QqTSjNXty/VnwZoGN8mzS92njJXA00+trn/NSD5f0HCtnwcxW23H69Eyf
   ZGFX3tnf2qmbSexSEv78FEMnzJ+zIpDKx6crPpR0H9fIbS7sbBaGO5V/v
   x9Xfoho/qmG0wEZprbIJ+x45F0IGW+ByPfHtSbSk2hJmdRw8U+voGl18e
   A==;
X-CSE-ConnectionGUID: m04GYIqlTROym2WUwFM8pA==
X-CSE-MsgGUID: xzm2BtvVRDyyS8XiMAG8PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82908791"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82908791"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:03:04 -0800
X-CSE-ConnectionGUID: iiNT7bYBRQeUhS22P2MaDw==
X-CSE-MsgGUID: JuAHyXWCSLKEIUPoL2uNfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249367009"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Feb 2026 16:03:02 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpbDY-000000000W9-1V9q;
	Tue, 10 Feb 2026 00:03:00 +0000
Date: Tue, 10 Feb 2026 01:02:31 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 11/14] fs/namespace.c:4437:21:
 error: too many arguments to function call, expected single argument 'mnt',
 have 2 arguments
Message-ID: <202602100102.qbFp2Diq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   fab743c086b010cfeff5b9910d0d04564676eac1
commit: f7965848b0b2b744e86cf56c17b2c5f01c591db9 [11/14] containers, vfs: Honour CONTAINER_NEW_EMPTY_FS_NS
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602100102.qbFp2Diq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100102.qbFp2Diq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100102.qbFp2Diq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namespace.c:4437:21: error: too many arguments to function call, expected single argument 'mnt', have 2 arguments
    4437 |                 move_from_ns(mnt, &tmp); /* Obtain the namespace's ref */
         |                 ~~~~~~~~~~~~      ^~~~
   fs/mount.h:199:20: note: 'move_from_ns' declared here
     199 | static inline void move_from_ns(struct mount *mnt)
         |                    ^            ~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/mnt +4437 fs/namespace.c

  4400	
  4401	/*
  4402	 * Create a mount namespace for a container and set the root mount in it.
  4403	 */
  4404	static int set_container_root(struct path *path, int fd)
  4405	{
  4406		struct mnt_namespace *mnt_ns;
  4407		struct container *container;
  4408		struct mount *mnt = real_mount(path->mnt);
  4409		struct fd f;
  4410		LIST_HEAD(tmp);
  4411		int ret;
  4412	
  4413		f = fdget(fd);
  4414		if (fd_empty(f))
  4415			return -EBADF;
  4416		ret = -EINVAL;
  4417		if (!is_container_file(fd_file(f)))
  4418			goto out_fd;
  4419	
  4420		ret = -EBUSY;
  4421		container = fd_file(f)->private_data;
  4422		if (container->ns->mnt_ns)
  4423			goto out_fd;
  4424	
  4425		mnt_ns = alloc_mnt_ns(container->cred->user_ns, false);
  4426		if (IS_ERR(mnt_ns)) {
  4427			ret = PTR_ERR(mnt_ns);
  4428			goto out_fd;
  4429		}
  4430	
  4431		ret = -EBUSY;
  4432		namespace_lock();
  4433		lock_mount_hash();
  4434		spin_lock(&container->lock);
  4435	
  4436		if (!container->ns->mnt_ns) {
> 4437			move_from_ns(mnt, &tmp); /* Obtain the namespace's ref */
  4438			list_del(&mnt->mnt_list);
  4439	
  4440			mnt_ns->root = mnt;
  4441			mnt_ns->nr_mounts = 1;
  4442			mnt_add_to_ns(mnt_ns, mnt); /* Give ref to namespace */
  4443	
  4444			container->ns->mnt_ns = mnt_ns;
  4445	
  4446			path_get(path);
  4447			write_seqcount_begin(&container->seq);
  4448			container->root = *path;
  4449			write_seqcount_end(&container->seq);
  4450	
  4451			mnt_ns = NULL;
  4452			ret = 0;
  4453		}
  4454	
  4455		spin_unlock(&container->lock);
  4456		unlock_mount_hash();
  4457		namespace_unlock();
  4458	
  4459		if (ret < 0)
  4460			put_mnt_ns(mnt_ns);
  4461	out_fd:
  4462		fdput(f);
  4463		return ret;
  4464	}
  4465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
