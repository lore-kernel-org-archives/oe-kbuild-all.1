Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C0155725
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 01:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779006; cv=none; b=FB7Lo486SS5C7goRWleVwZE/fI4RRXgmJCTjnIY69tbuu263ZQipOuZz93+huQmDziZfJT6HHuY8tM1IVrQmhdt4D0BhuVUcHeCOuQR2JQqFTedZIkmRlVq8ksUiFnDpKFqF2IAAsa7wI2KfIx3f/jkerxYGeJQpI2TT8WV1YLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779006; c=relaxed/simple;
	bh=dyyl/uMe28uO8s8rgq95fxYZc/1ltH42eBqmR6wn7Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jcIWrwpZqcXDESTqX8vCrRtCHIx/h2sz+yA353Mt6U0AMrE/RAmwmEDrpBwml4iGSVGsVk7lj2Nv4jFNa/+sWCSG3AsT+TtmX5f25Lk6BRLy2wMFTsAJgbb9eWx/p1miJnLdFmk2jTcEMBnm6zqcOfpS2f4kdNs3ang70gGRM4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJtawae7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJtawae7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749779005; x=1781315005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dyyl/uMe28uO8s8rgq95fxYZc/1ltH42eBqmR6wn7Wo=;
  b=LJtawae7LLZxZxOMg5QzWEHSkzctR+tyCQnVoONqAkz6ZpetSof5bFs9
   /TBOvcpiXhgW1y9eP+oc2qqUhKUQ3GHf2zxHorVYbjomlp/wgFDh2HF63
   Y1eIA6IhIxjrHg/a2FrFrEivF1NZz/uplwdQXGdPV41My/cl8kj3uTJbH
   FvxNlk4uDIR2moMUrIA3EC0WUINGFJO9GZaLIjFrFLjJjRfCMSPCmn3jz
   RQ5N54uZRi3ihqzvTaXN2MQg4t9lLpCDlSY6VVj8QmaASC6O6GYTgT/0X
   zYqlJKXMpCHj2yV7AA8IICRCylII9F3U60eBlPfDGrl/KUqn2LE9iRY5q
   A==;
X-CSE-ConnectionGUID: FctFalDXRTOpot79/q1Z1Q==
X-CSE-MsgGUID: ukqAtNFHQK2p8jS0C6Su+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69554452"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="69554452"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 18:43:25 -0700
X-CSE-ConnectionGUID: VLdJuTqcSUm+5pNdzXkGDA==
X-CSE-MsgGUID: Lwvc4v9wRmynnCS9rKm1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="148238621"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jun 2025 18:43:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPtRx-000C80-0h;
	Fri, 13 Jun 2025 01:43:21 +0000
Date: Fri, 13 Jun 2025 09:42:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 10/12] fs/namespace.c:4736
 __do_sys_move_mount() warn: unsigned 'nlen' is never less than zero.
Message-ID: <202506130933.nIPalZtt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   9c7dfe5d079eae551e81631cf2ec09d4f1de43b0
commit: fa4df9e25bfe66b9d92d6eefa8afb384787bbfd8 [10/12] vfs: Allow mounting to other namespaces
config: i386-randconfig-r071-20250612 (https://download.01.org/0day-ci/archive/20250613/202506130933.nIPalZtt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130933.nIPalZtt-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4736 __do_sys_move_mount() warn: unsigned 'nlen' is never less than zero.
fs/namespace.c:4777 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'
fs/namespace.c:4736 __do_sys_move_mount() warn: unsigned 'nlen' is never less than zero.
fs/namespace.c:4777 __do_sys_move_mount() warn: fd re-used after fget(): 'to_dfd'

Old smatch warnings:
fs/namespace.c:5050 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +/nlen +4736 fs/namespace.c

  4687	
  4688	/*
  4689	 * Move a mount from one place to another.  In combination with
  4690	 * fsopen()/fsmount() this is used to install a new mount and in combination
  4691	 * with open_tree(OPEN_TREE_CLONE [| AT_RECURSIVE]) it can be used to copy
  4692	 * a mount subtree.
  4693	 *
  4694	 * Note the flags value is a combination of MOVE_MOUNT_* flags.
  4695	 */
  4696	SYSCALL_DEFINE5(move_mount,
  4697			int, from_dfd, const char __user *, from_pathname,
  4698			int, to_dfd, const char __user *, to_pathname,
  4699			unsigned int, flags)
  4700	{
  4701		struct path to_path __free(path_put) = {};
  4702		struct path from_path __free(path_put) = {};
  4703		struct filename *to_name __free(putname) = NULL;
  4704		struct filename *from_name __free(putname) = NULL;
  4705		unsigned int lflags, uflags;
  4706		enum mnt_tree_flags_t mflags = 0;
  4707		char buf[2];
  4708		int ret = 0;
  4709	
  4710		if (!may_mount())
  4711			return -EPERM;
  4712	
  4713		if (flags & ~MOVE_MOUNT__MASK)
  4714			return -EINVAL;
  4715	
  4716		if ((flags & (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP)) ==
  4717		    (MOVE_MOUNT_BENEATH | MOVE_MOUNT_SET_GROUP))
  4718			return -EINVAL;
  4719	
  4720		if (flags & MOVE_MOUNT_SET_GROUP)	mflags |= MNT_TREE_PROPAGATION;
  4721		if (flags & MOVE_MOUNT_BENEATH)		mflags |= MNT_TREE_BENEATH;
  4722	
  4723		lflags = 0;
  4724		if (flags & MOVE_MOUNT_F_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
  4725		if (flags & MOVE_MOUNT_F_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
  4726		uflags = 0;
  4727		if (flags & MOVE_MOUNT_F_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
  4728		from_name = getname_maybe_null(from_pathname, uflags);
  4729		if (IS_ERR(from_name))
  4730			return PTR_ERR(from_name);
  4731	
  4732		if (unlikely(flags & MOVE_MOUNT_T_CONTAINER_ROOT)) {
  4733			if (flags & MOVE_MOUNT_T_EMPTY_PATH)
  4734				return -EINVAL;
  4735			size_t nlen = strncpy_from_user(buf, to_pathname, 2);
> 4736			if (nlen < 0)
  4737				return -EFAULT;
  4738			if (nlen < 1)
  4739				return -EINVAL;
  4740			if (buf[0] == '/' && buf[1] == '\0') {
  4741				/* Set the root.  This might be better done by
  4742				 * requiring to_pathname to be NULL.
  4743				 */
  4744				ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
  4745				if (ret)
  4746					return ret;
  4747				return set_container_root(&from_path, to_dfd);
  4748			}
  4749	
  4750			/* Check the fd is a container handle.  This isn't a perfect
  4751			 * check as another thread can jump in and change the fd
  4752			 * between now and when pathwalk looks it up.
  4753			 */
  4754			if (buf[0] == '/')
  4755				return -EINVAL;
  4756			struct fd f = fdget(to_dfd);
  4757			if (fd_empty(f))
  4758				return -EBADF;
  4759			if (!is_container_file(fd_file(f))) {
  4760				fdput(f);
  4761				return -EINVAL;
  4762			}
  4763			fdput(f);
  4764			mflags |= MNT_TREE_CONTAINER;
  4765		}
  4766	
  4767		lflags = 0;
  4768		if (flags & MOVE_MOUNT_T_SYMLINKS)	lflags |= LOOKUP_FOLLOW;
  4769		if (flags & MOVE_MOUNT_T_AUTOMOUNTS)	lflags |= LOOKUP_AUTOMOUNT;
  4770		uflags = 0;
  4771		if (flags & MOVE_MOUNT_T_EMPTY_PATH)	uflags = AT_EMPTY_PATH;
  4772		to_name = getname_maybe_null(to_pathname, uflags);
  4773		if (IS_ERR(to_name))
  4774			return PTR_ERR(to_name);
  4775	
  4776		if (!to_name && to_dfd >= 0) {
> 4777			CLASS(fd_raw, f_to)(to_dfd);
  4778			if (fd_empty(f_to))
  4779				return -EBADF;
  4780	
  4781			to_path = fd_file(f_to)->f_path;
  4782			path_get(&to_path);
  4783		} else {
  4784			ret = filename_lookup(to_dfd, to_name, lflags, &to_path, NULL);
  4785			if (ret)
  4786				return ret;
  4787		}
  4788	
  4789		if (!from_name && from_dfd >= 0) {
  4790			CLASS(fd_raw, f_from)(from_dfd);
  4791			if (fd_empty(f_from))
  4792				return -EBADF;
  4793	
  4794			return vfs_move_mount(&fd_file(f_from)->f_path, &to_path, mflags);
  4795		}
  4796	
  4797		ret = filename_lookup(from_dfd, from_name, lflags, &from_path, NULL);
  4798		if (ret)
  4799			return ret;
  4800	
  4801		return vfs_move_mount(&from_path, &to_path, mflags);
  4802	}
  4803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
