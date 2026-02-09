Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4682032AACA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 23:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770679025; cv=none; b=Pv4BAEmVY5ODnOCNSOk8YwAaDCkI9V2M3H+RPd/hlqlZx0B+hwqq3fqgJX97DBhLPSd1MiPxS3MjKUiS3BBcmY+BubAjIH9zmWlVnbzk8JLi8Rz/K4k8dfCj8PUerZRR1WT7dGpoZQ+bINYFBFiX6fOm1RkBAtYmhBB6jGL5boY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770679025; c=relaxed/simple;
	bh=iywfeCVxyn3/HRiBC3vqicrGSDTNkMMhOLiBrQxjR7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sNztX4thpwYJN9lYhJi7izC4ONGbAVduRPeTjhi6YJXWCZfHmcJxYtDAYDHU4pkOfbw6FYRpQYYWQo8vsSzwdeU68+vNC/L7quna+byfpvMjwZaJKjH6F5a2ottEiqeYWvHq9gbz8jLv4oxWorsveesAniWeB2IqnoR3IvOx0/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=boFev/tw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="boFev/tw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770679024; x=1802215024;
  h=date:from:to:cc:subject:message-id;
  bh=iywfeCVxyn3/HRiBC3vqicrGSDTNkMMhOLiBrQxjR7I=;
  b=boFev/twiiBenede4BL2v691l1c5DA+i3GMSYOghoxP2JuAReEjhIObD
   pz/W5QveKaeKnZ7ACWIAM1Kdhhwmo6PS8fZ6OasBazh78TCSXZO100ikU
   ejIPNftytcr6z/Y/R2GYU3RJV1lYpcic0OzUsmGtKxhf4B78DueofR56N
   TvuCoBbUiVDOudosYPac/ZQynnJ729R1zfKOYb5jV1Jpte3KmLv7ej+kc
   efXK3RvD4cOjktFNNKp9joDG/kA6JAINByz8w8zmjljvIet4uJQZjDemq
   1SD6vLT36K7LTRQnqfGw5d4ZuUS4vFkSRwMnvDizHHVpBAjOZntmX170J
   A==;
X-CSE-ConnectionGUID: TjI10CpXQ1enAifrjHN+Vw==
X-CSE-MsgGUID: ECSmcCKWSuSqn7W9lP4tWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82906718"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82906718"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 15:17:03 -0800
X-CSE-ConnectionGUID: 8cwmrB6GThaUa8NliyRoIw==
X-CSE-MsgGUID: Z4odzbD8SeOBDV1dsem8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211804076"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 15:17:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpaV1-00000000oOu-3v1V;
	Mon, 09 Feb 2026 23:16:59 +0000
Date: Tue, 10 Feb 2026 07:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 11/14] fs/namespace.c:4437:21:
 error: too many arguments to function call, expected single argument 'mnt',
 have 2 arguments
Message-ID: <202602100714.sJy7VFwC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   36f59ee3019d623c30b66df95200a51c85043bdc
commit: f7965848b0b2b744e86cf56c17b2c5f01c591db9 [11/14] containers, vfs: Honour CONTAINER_NEW_EMPTY_FS_NS
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602100714.sJy7VFwC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100714.sJy7VFwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100714.sJy7VFwC-lkp@intel.com/

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
