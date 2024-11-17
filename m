Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7141D89FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 13:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731851746; cv=none; b=bNMtsI0/bLCUs0hbpiMb+mJhP4tRnivYPx1dI2Rm870EDTwtLw5ZFGB11iZq6rI4Wc0lqQX+/LQu9TfB5ChcHceXmcIHMWfmCITgsTf7cxjx/yBy6bJg9ierjCwldfL/7PdsgcnkRMbj7JQr1P0qKzN0kEfKaVxCSitV4KKv7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731851746; c=relaxed/simple;
	bh=ZnWwzhzjq3EVipy+S579m9+IKoorxIz4gfhS4Fl6WO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwTfYkF1p8cuwLW88NXU5RMMTzaWoH1XvUWgh8+zIIfXMX4r3IAdqD/7qmrR0WIDpdueDiit5tVJeoSGeg8b62V8Ta4rtDoPds0yOeAMAxamc46UK2CEiluxGOx/cqHUWCKCP0EHwBNbEW4vMrvaJFvPESdNd4bUAir1ymWMe2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxSIEySq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxSIEySq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731851741; x=1763387741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZnWwzhzjq3EVipy+S579m9+IKoorxIz4gfhS4Fl6WO0=;
  b=mxSIEySqxWfSpMU/+/eHIjvi5wmNj8xi8UgwDHLYqpKwVKlnekqF2+n7
   Xibls7+rRJfdh2/k6pSbyYZ0ldM3NMnDAAHR1J+bbATMmNuaH5Cg6Tkzp
   NFwHeSnYpkPYnd0h+cpmmZIf40/MRGqkRvjJ0sLUsHy81qu6we18RhcpZ
   11iqKO6bsrWhmJpVWcnk3OxwTqhVgqqmnMMld32KJF+Jq3oQ5wMb6xgYr
   2oku03XMXHERZ9sK/EoIJKhrJ6v6oZmqgfaF/MmRmyhbP+hx9C5+8WN4x
   93BZQdN/0kX12xCj4qf8MRBFS8tEn+atUZUArbEzdWC1ZH9qfulC0lh9+
   A==;
X-CSE-ConnectionGUID: ZRu7GFAkTKaR8N3Y9bxA0w==
X-CSE-MsgGUID: 9CFRiMNTQh++PWGQOc7ZNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="49243746"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="49243746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 05:55:39 -0800
X-CSE-ConnectionGUID: l7UYDLSUQIaBWRSrkp7dDQ==
X-CSE-MsgGUID: 6TrdMa6cRQOyg10Szi/GOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="93921668"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2024 05:55:38 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCfkV-0001mT-34;
	Sun, 17 Nov 2024 13:55:35 +0000
Date: Sun, 17 Nov 2024 21:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC/PATCH v2 bpf-next fanotify 1/7] fanotify: Introduce
 fanotify fastpath handler
Message-ID: <202411172133.PG0LOTlo-lkp@intel.com>
References: <20241114084345.1564165-2-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114084345.1564165-2-song@kernel.org>

Hi Song,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on jack-fs/fsnotify]
[also build test WARNING on linus/master bpf/master v6.12-rc7 next-20241115]
[cannot apply to bpf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fanotify-Introduce-fanotify-fastpath-handler/20241114-164824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
patch link:    https://lore.kernel.org/r/20241114084345.1564165-2-song%40kernel.org
patch subject: [RFC/PATCH v2 bpf-next fanotify 1/7] fanotify: Introduce fanotify fastpath handler
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411172133.PG0LOTlo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172133.PG0LOTlo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172133.PG0LOTlo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/notify/fanotify/fanotify_fastpath.c: In function 'fanotify_fastpath_add':
>> fs/notify/fanotify/fanotify_fastpath.c:219:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     219 |                         if (copy_from_user(init_args, (void __user *)args.init_args,
         |                                                       ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +219 fs/notify/fanotify/fanotify_fastpath.c

   153	
   154	/*
   155	 * fanotify_fastpath_add - Add a fastpath handler to fsnotify_group.
   156	 *
   157	 * Add a fastpath handler from fp_list to a fsnotify_group.
   158	 *
   159	 * @group:	fsnotify_group that will have add
   160	 * @argp:	fanotify_fastpath_args that specifies the fastpath handler
   161	 *		and the init arguments of the fastpath handler.
   162	 *
   163	 * Returns:
   164	 *	0	- on success;
   165	 *	-EEXIST	- fastpath handler of the same name already exists.
   166	 */
   167	int fanotify_fastpath_add(struct fsnotify_group *group,
   168				  struct fanotify_fastpath_args __user *argp)
   169	{
   170		struct fanotify_fastpath_hook *fp_hook;
   171		struct fanotify_fastpath_ops *fp_ops;
   172		struct fanotify_fastpath_args args;
   173		void *init_args = NULL;
   174		int ret = 0;
   175	
   176		ret = copy_from_user(&args, argp, sizeof(args));
   177		if (ret)
   178			return -EFAULT;
   179	
   180		if (args.version != 1 || args.flags || args.init_args_size > FAN_FP_ARGS_MAX)
   181			return -EINVAL;
   182	
   183		args.name[FAN_FP_NAME_MAX - 1] = '\0';
   184	
   185		fsnotify_group_lock(group);
   186	
   187		if (rcu_access_pointer(group->fanotify_data.fp_hook)) {
   188			fsnotify_group_unlock(group);
   189			return -EBUSY;
   190		}
   191	
   192		fp_hook = kzalloc(sizeof(*fp_hook), GFP_KERNEL);
   193		if (!fp_hook) {
   194			ret = -ENOMEM;
   195			goto out;
   196		}
   197	
   198		spin_lock(&fp_list_lock);
   199		fp_ops = fanotify_fastpath_find(args.name);
   200		if (!fp_ops || !try_module_get(fp_ops->owner)) {
   201			spin_unlock(&fp_list_lock);
   202			ret = -ENOENT;
   203			goto err_free_hook;
   204		}
   205		spin_unlock(&fp_list_lock);
   206	
   207		if (!capable(CAP_SYS_ADMIN) && (fp_ops->flags & FAN_FP_F_SYS_ADMIN_ONLY)) {
   208			ret = -EPERM;
   209			goto err_module_put;
   210		}
   211	
   212		if (fp_ops->fp_init) {
   213			if (args.init_args_size) {
   214				init_args = kzalloc(args.init_args_size, GFP_KERNEL);
   215				if (!init_args) {
   216					ret = -ENOMEM;
   217					goto err_module_put;
   218				}
 > 219				if (copy_from_user(init_args, (void __user *)args.init_args,
   220						   args.init_args_size)) {
   221					ret = -EFAULT;
   222					goto err_free_args;
   223				}
   224	
   225			}
   226			ret = fp_ops->fp_init(fp_hook, init_args);
   227			if (ret)
   228				goto err_free_args;
   229			kfree(init_args);
   230		}
   231		fp_hook->ops = fp_ops;
   232		rcu_assign_pointer(group->fanotify_data.fp_hook, fp_hook);
   233	
   234	out:
   235		fsnotify_group_unlock(group);
   236		return ret;
   237	
   238	err_free_args:
   239		kfree(init_args);
   240	err_module_put:
   241		module_put(fp_ops->owner);
   242	err_free_hook:
   243		kfree(fp_hook);
   244		goto out;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
