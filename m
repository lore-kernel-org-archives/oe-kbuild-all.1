Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B441A30FF26
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681547; cv=none; b=CmHNL2QDwD1vp7epEL7PN8a9gR3VStIO1HNn1BwBdxQiO5ZZZpDPEWD6baJ0DQ4/8MEjpjKBqeIwW9oa3A0L4FVkHZGTu9s0b6pIFKpQ3bs79NgK7Gfw8qAHT97ftZpPZnhtDDBlMHmoa/dFblXh+3v97a3nq2blV5Gn6bxgiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681547; c=relaxed/simple;
	bh=8FBjGLKnfV/Zth0Hv+NDZDaXF0xoFMRZC8OShqB9No4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YHXF4lvCjh26Glr7l6R8Er9ONgzLiHGWDfiSQeLj7l2t1mabchqcWFHak6EB8vmKFodBw0QCgDN/nj0DQF351J0ewRvrSu+iBYKSDiscOy+8PJgzL364hDzStfdZve1FfnIHtTKOXv/AYcRMaPIG3LANZeXlLJi2obKS8woaqBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6zhQIB8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6zhQIB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770681546; x=1802217546;
  h=date:from:to:cc:subject:message-id;
  bh=8FBjGLKnfV/Zth0Hv+NDZDaXF0xoFMRZC8OShqB9No4=;
  b=J6zhQIB8DEydZZgUeB4xAexg9iaWTHp9l6dsnm15XHufDmM6V43nK4SK
   LIqUJbaCDW74Og2fafXDF1UDNq/d0rKAwPAcaFRW3qWWia+wkxl8zzHvn
   ySmIxTWG1OpW6mjsvKImOhMCTEl8G9vQ/JLO/nnnYfcKstjress6BOXbE
   Anr56QB2Kpp3PStWMzSolRsuTULKx1dsRf6KjJn3Ty160R9qg/Qq+mse+
   N3XAAzx9SZCGprqK/OHXD/rlP7eLCDIs7TaPSJh2Y9hNiZxQ8aKQC3WLe
   8QQ+gmwcJEA2qj/g8D18DoYGg+rGv6jJD0WhUbpL4wDqqa1Jb1BoaYPg3
   Q==;
X-CSE-ConnectionGUID: C4DiQNGKS6uTlCj8T4+YIA==
X-CSE-MsgGUID: b0tpqow6ReSyUQpe+T6OsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71902988"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71902988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 15:59:05 -0800
X-CSE-ConnectionGUID: CuDHrJ8rTPa83kgZ0VNasA==
X-CSE-MsgGUID: L5Acrxj5RAqieJdwtTTOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210862918"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2026 15:59:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpb9h-00000000oQm-2qAA;
	Mon, 09 Feb 2026 23:59:01 +0000
Date: Tue, 10 Feb 2026 07:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 11/14] fs/namespace.c:4437:17:
 error: too many arguments to function 'move_from_ns'; expected 1, have 2
Message-ID: <202602100746.VS4vb6Mq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   36f59ee3019d623c30b66df95200a51c85043bdc
commit: f7965848b0b2b744e86cf56c17b2c5f01c591db9 [11/14] containers, vfs: Honour CONTAINER_NEW_EMPTY_FS_NS
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602100746.VS4vb6Mq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100746.VS4vb6Mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100746.VS4vb6Mq-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namespace.c: In function 'set_container_root':
>> fs/namespace.c:4437:17: error: too many arguments to function 'move_from_ns'; expected 1, have 2
    4437 |                 move_from_ns(mnt, &tmp); /* Obtain the namespace's ref */
         |                 ^~~~~~~~~~~~      ~~~~
   In file included from fs/pnode.h:11,
                    from fs/namespace.c:39:
   fs/mount.h:199:20: note: declared here
     199 | static inline void move_from_ns(struct mount *mnt)
         |                    ^~~~~~~~~~~~


vim +/move_from_ns +4437 fs/namespace.c

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
