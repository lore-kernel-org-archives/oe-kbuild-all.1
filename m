Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA01C2323
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727992499; cv=none; b=RlowGsjcIrjGjswN7WjvX1tl0RdWEJF+62LOw7dFtwcWVYHfG4NV7LPKzNFFSRhBuBp7crqjR8lPrvKyKLwbSaPXUxzPkq07zHrODEkhfnfypIeJ7tGO8J0md3uawT1Ak12+EZF97AI16tiLWJf1hLSXgfZ6Td+pIGRrmJArx/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727992499; c=relaxed/simple;
	bh=PPZNAG6uzFilNQkzA1JGOxKu2Rtx08HBUFRSYz+eSPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc+rxGNNjecpXLMLMKiOUakv31vAU6qUG5+gMaP7DkV7ZvvSFXXGGOPuhwicZ9X+AUbGdgrFxi/dY01TkqMsUXi9XYZr/Eq+4d+8QHbR040KQMCJIfpwIISdKtVfJeWuP+dC+J4NWsg7BRE/T2PCC1yrJLzn4KxQ+6B5N4AJ5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImZGgdR9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImZGgdR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727992498; x=1759528498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPZNAG6uzFilNQkzA1JGOxKu2Rtx08HBUFRSYz+eSPE=;
  b=ImZGgdR9bQRGFWwux7nZyfrkA6JJcCb7aS+3a24aBNra/uaEi0TKsWXo
   HLhG0krIENLzv1RoeigY8zetBLnAEOtaUGQxcwCt/vp0bxenm0j3ekZZN
   ZzfXAv0GX+gfnepDplhmEJh63tmBGxOiEI346/uO4gPctJRNS86ZnkyVq
   EW2iBT/lMyDRZ7KoPBL2BsG/QX7NajJoxuLKjgE+Vo/0HaubxOEzk7xfP
   eVNOJPjpPp55VhAKxby6/sdzweFGLvHj45ic0LamSSKBTwYbuod/A+yWw
   znomFw6e7qYC4yYOGZ32PlGB0ZUbbC4nTzaGzIHcwoCmAkast8fdlX3ur
   w==;
X-CSE-ConnectionGUID: o0h0w9e9Tva4IK1FRArPCA==
X-CSE-MsgGUID: ugZnKwBmSAuj7i3hD4gkWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37869285"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="37869285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 14:54:54 -0700
X-CSE-ConnectionGUID: 9hl8H5jQRCeDunXpNTQobg==
X-CSE-MsgGUID: AQUAiROHRuGpqrcXsy7AxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74927111"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Oct 2024 14:54:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swTmd-0000wO-0E;
	Thu, 03 Oct 2024 21:54:51 +0000
Date: Fri, 4 Oct 2024 05:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: luca.boccassi@gmail.com, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, christian@brauner.io,
	paul@paul-moore.com
Subject: Re: [PATCH] pidfd: add ioctl to retrieve pid info
Message-ID: <202410040559.LZnpGpVU-lkp@intel.com>
References: <20241002142516.110567-1-luca.boccassi@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002142516.110567-1-luca.boccassi@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on shuah-kselftest/next]
[also build test ERROR on shuah-kselftest/fixes linus/master v6.12-rc1 next-20241003]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/luca-boccassi-gmail-com/pidfd-add-ioctl-to-retrieve-pid-info/20241002-223302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20241002142516.110567-1-luca.boccassi%40gmail.com
patch subject: [PATCH] pidfd: add ioctl to retrieve pid info
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241004/202410040559.LZnpGpVU-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040559.LZnpGpVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040559.LZnpGpVU-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/pidfs.c: In function 'pidfd_info':
>> fs/pidfs.c:146:39: error: implicit declaration of function 'task_css_check' [-Wimplicit-function-declaration]
     146 |                 struct cgroup *cgrp = task_css_check(task, pids_cgrp_id, 1)->cgroup;
         |                                       ^~~~~~~~~~~~~~
>> fs/pidfs.c:146:60: error: 'pids_cgrp_id' undeclared (first use in this function)
     146 |                 struct cgroup *cgrp = task_css_check(task, pids_cgrp_id, 1)->cgroup;
         |                                                            ^~~~~~~~~~~~
   fs/pidfs.c:146:60: note: each undeclared identifier is reported only once for each function it appears in


vim +/task_css_check +146 fs/pidfs.c

   116	
   117	static long pidfd_info(struct task_struct *task, struct pid *pid, unsigned long arg)
   118	{
   119		struct pidfd_info uinfo = {}, info = {};
   120	
   121		if (copy_from_user(&uinfo, (struct pidfd_info *)arg, sizeof(struct pidfd_info)))
   122			return -EFAULT;
   123		if (uinfo.size > sizeof(struct pidfd_info))
   124			return -E2BIG;
   125		if (uinfo.size < sizeof(struct pidfd_info))
   126			return -EINVAL; /* First version, no smaller struct possible */
   127	
   128		if (uinfo.request_mask & ~(PIDFD_INFO_PID | PIDFD_INFO_CREDS | PIDFD_INFO_CGROUPID | PIDFD_INFO_SECURITY_CONTEXT))
   129			return -EINVAL;
   130	
   131		memcpy(&info, &uinfo, uinfo.size);
   132	
   133		if (uinfo.request_mask & PIDFD_INFO_PID)
   134			info.pid = pid_nr_ns(pid, task_active_pid_ns(task));
   135	
   136		if (uinfo.request_mask & PIDFD_INFO_CREDS) {
   137			const struct cred *c = get_task_cred(task);
   138			if (!c)
   139				return -ESRCH;
   140	
   141			info.uid = from_kuid_munged(current_user_ns(), c->uid);
   142			info.gid = from_kgid_munged(current_user_ns(), c->gid);
   143		}
   144	
   145		if (uinfo.request_mask & PIDFD_INFO_CGROUPID) {
 > 146			struct cgroup *cgrp = task_css_check(task, pids_cgrp_id, 1)->cgroup;
   147			if (!cgrp)
   148				return -ENODEV;
   149	
   150			info.cgroupid = cgroup_id(cgrp);
   151		}
   152	
   153		if (uinfo.request_mask & PIDFD_INFO_SECURITY_CONTEXT) {
   154			char *secctx;
   155			u32 secid, secctx_len;
   156			const struct cred *c = get_task_cred(task);
   157			if (!c)
   158				return -ESRCH;
   159	
   160			security_cred_getsecid(c, &secid);
   161			if (security_secid_to_secctx(secid, &secctx, &secctx_len))
   162				return -EFAULT;
   163	
   164			memcpy(info.security_context, secctx, min_t(u32, secctx_len, NAME_MAX-1));
   165		}
   166	
   167		if (copy_to_user((void __user *)arg, &info, uinfo.size))
   168			return -EFAULT;
   169	
   170		return 0;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
