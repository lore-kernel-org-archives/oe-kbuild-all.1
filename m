Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F771864C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 04:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719461436; cv=none; b=LNuCItDs7c3iYAkAns4QRKFSDctiQIv8EuFMr2KFYxSozQw2X4CM6bqz0Z3Tyc2I8h5egca34ieJ+5uVdqigBPZVaBAv7foNkbhOlbTK1EVzYCQDvz4TB6w9hb0KruCw0joY0fXzsOI/G0Y5o/F7/lWMFXpaT9yzxs5OuGblL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719461436; c=relaxed/simple;
	bh=NlB5ChvGz93OjJTpSgdCLWx3/LQEUGUDcZIyusahHMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9dHG7rssg3IebQV0wfHWgTVNyIQ16EwpFMakG62JnHxms1QBrHfujarZ9/M/8cxqRCZ+dxbTgERZa4zLUUQ1ZzFk5+pBEWnFcUNkmHaK8H+lgIwdPiBaaObMJxK6B+SkBXbWtfB9Ebd3O9KRl1/D47QCtISSVuOQx5HRD6XEw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ak/3B+CP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ak/3B+CP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719461435; x=1750997435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NlB5ChvGz93OjJTpSgdCLWx3/LQEUGUDcZIyusahHMg=;
  b=ak/3B+CP6XMhssZrKpw8wlJVrbLgdJj+1xtF/fU0VOlFNTEmq7qEqMDX
   sO8B5GFNk0bAcW8yBJ0khOKnX3uquekt+IsKprFR/35HDwM+XqOf/xumN
   naLqq6rS2ibltESN2VY/F/BeZSW2/orOmz7aHGdQNBPwKdSxUZOizEh0B
   go01yYFUeX+WBofeLkUQOdjKIJpiEJtP6vgnx/O9vXeubkkmkvdwhXIm3
   W0V9mtWkYp3RH9y+ztwD6mgjBLaBsPe5u/WHYgS0VL/b1tUVDzfdtUShq
   0fwhqR6blIPftknZ3OsWC9tl0QAFQVoJb3XBube2BVb/cNDB2QtwFBGao
   g==;
X-CSE-ConnectionGUID: BjA9iRhjRMyOqeZjMZStRg==
X-CSE-MsgGUID: y67fw6u8SPGfoioyuCqn/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27156073"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="27156073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 21:10:34 -0700
X-CSE-ConnectionGUID: Z/dT+eGOReSv9cTAowyf+A==
X-CSE-MsgGUID: kvH4/hKPSkGg7DR79S4EUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44206088"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2024 21:10:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMgSs-000Fre-2F;
	Thu, 27 Jun 2024 04:10:30 +0000
Date: Thu, 27 Jun 2024 12:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
Message-ID: <202406271204.0A1VPc0v-lkp@intel.com>
References: <20240625110029.606032-3-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625110029.606032-3-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on viro-vfs/for-next]
[cannot apply to brauner-vfs/vfs.all linus/master v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/vfs-add-CLASS-fd_raw/20240625-233347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
patch link:    https://lore.kernel.org/r/20240625110029.606032-3-mjguzik%40gmail.com
patch subject: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406271204.0A1VPc0v-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271204.0A1VPc0v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271204.0A1VPc0v-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/stat.c: In function '__do_sys_statx':
>> fs/stat.c:744:39: error: implicit declaration of function 'vfs_empty_path'; did you mean 'vfs_statx_path'? [-Werror=implicit-function-declaration]
     744 |         if (flags == AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
         |                                       ^~~~~~~~~~~~~~
         |                                       vfs_statx_path
   cc1: some warnings being treated as errors
--
   io_uring/statx.c: In function 'io_statx_prep':
>> io_uring/statx.c:41:45: error: implicit declaration of function 'vfs_empty_path' [-Werror=implicit-function-declaration]
      41 |         if (!(sx->flags == AT_EMPTY_PATH && vfs_empty_path(sx->dfd, path))) {
         |                                             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +744 fs/stat.c

   724	
   725	/**
   726	 * sys_statx - System call to get enhanced stats
   727	 * @dfd: Base directory to pathwalk from *or* fd to stat.
   728	 * @filename: File to stat or "" with AT_EMPTY_PATH
   729	 * @flags: AT_* flags to control pathwalk.
   730	 * @mask: Parts of statx struct actually required.
   731	 * @buffer: Result buffer.
   732	 *
   733	 * Note that fstat() can be emulated by setting dfd to the fd of interest,
   734	 * supplying "" as the filename and setting AT_EMPTY_PATH in the flags.
   735	 */
   736	SYSCALL_DEFINE5(statx,
   737			int, dfd, const char __user *, filename, unsigned, flags,
   738			unsigned int, mask,
   739			struct statx __user *, buffer)
   740	{
   741		int ret;
   742		struct filename *name;
   743	
 > 744		if (flags == AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
   745			return do_statx_fd(dfd, flags, mask, buffer);
   746	
   747		name = getname_flags(filename, getname_statx_lookup_flags(flags), NULL);
   748		ret = do_statx(dfd, name, flags, mask, buffer);
   749		putname(name);
   750	
   751		return ret;
   752	}
   753	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
