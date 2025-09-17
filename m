Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C8E33AEBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114015; cv=none; b=Q9a9vqVHqk+xsDSGnuIwL+jqSZLYxIr2Zfwz7klL5yxPJkBkQOsMxBJ6EvSLIpP28xR9pAVM6qcyRrGdTlBJh6VJjP4hbKQyH0arRnEHqJ+s22jHQy1c209sBmgZPqOWjg/Nqp0qiHY2CwtS+hxK2929COSPhO3Y5gIKFu3NBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114015; c=relaxed/simple;
	bh=vIbk5psdC9HQ1y1gdCnC8Mq3AKfK/fdpZesgWHBA5mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYzbJD9MN4GBFqm7rgBvM+F/1sKxcBae+hke2QFPvZ+5j2ha8BKt53ay3GvVD4sY5c6qAGCeaw7B6KpRyhwwj0tHIvYfHiUksFy2NFyRF5p2ZFaIvkpvzWE2i3UEMdLtWxsnlgtkslMFwI+Ncg5P5QXmfSOSNChlM+Mj+nhPW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLTosgZV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLTosgZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758114012; x=1789650012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIbk5psdC9HQ1y1gdCnC8Mq3AKfK/fdpZesgWHBA5mQ=;
  b=JLTosgZVFIXRR2xtae9Odvcat2wzZZll7WSnsfv+vkTXh0hFCZF/PJPN
   0VVyrmDfDW8TewLIXrc9kndhPCtMMYbAc4ZH5z2TypmvuKFLuIa9WB1Cb
   U725HYf4b5iRyDrCxPz/dVvu0kepBGnmglemsXjQ52C+wX3eXrYMLdzfP
   N+8Hls+i8ZZn+ECLcJlICW6esJ3EQ67UHaIcdpAFFNY5qe3H45C/g/ZhD
   Ed6Aq6nI0CX1557YyXQBbUIAZU/l4usu9YGwJBLfjZuqd23TUH6DNkWny
   UEdQ843WfIIUTCB8x2KWQmIVRR0wXk17sTquotd/tjNlg6DooT+zxvm0l
   w==;
X-CSE-ConnectionGUID: dfYqlrB+RWq95iLlyZy+CA==
X-CSE-MsgGUID: EpRputfnRWCIbgW+7yvjQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60113040"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="60113040"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 06:00:12 -0700
X-CSE-ConnectionGUID: TANB5sOoQQKF/JrsbSrgGA==
X-CSE-MsgGUID: A+zpIAj8TS2XEOYSRvPXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175669748"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2025 06:00:10 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyrlY-0001qO-1V;
	Wed, 17 Sep 2025 13:00:08 +0000
Date: Wed, 17 Sep 2025 20:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
	John Johansen <john.johansen@canonical.com>,
	Casey Schaufler <casey@schaufler-ca.com>
Subject: [pcmoore-lsm:working-lsm_init_rework 9/41]
 security/lsm_init.c:400:25: sparse: sparse: cast removes address space
 '__rcu' of expression
Message-ID: <202509172014.2AWygxKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git working-lsm_init_rework
head:   8ea7358ca612bb85eef9179ae746edeb5f1dc9ac
commit: 9cb4dac58e465101fea4aa4f9169f1ea04149da8 [9/41] lsm: split the init code out into lsm_init.c
config: nios2-randconfig-r133-20250917 (https://download.01.org/0day-ci/archive/20250917/202509172014.2AWygxKf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509172014.2AWygxKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509172014.2AWygxKf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/lsm_init.c:400:25: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +400 security/lsm_init.c

   348	
   349	static void __init ordered_lsm_init(void)
   350	{
   351		struct lsm_info **lsm;
   352	
   353		if (chosen_lsm_order) {
   354			if (chosen_major_lsm) {
   355				pr_warn("security=%s is ignored because it is superseded by lsm=%s\n",
   356					chosen_major_lsm, chosen_lsm_order);
   357				chosen_major_lsm = NULL;
   358			}
   359			ordered_lsm_parse(chosen_lsm_order, "cmdline");
   360		} else
   361			ordered_lsm_parse(builtin_lsm_order, "builtin");
   362	
   363		for (lsm = ordered_lsms; *lsm; lsm++)
   364			prepare_lsm(*lsm);
   365	
   366		report_lsm_order();
   367	
   368		init_debug("cred blob size       = %d\n", blob_sizes.lbs_cred);
   369		init_debug("file blob size       = %d\n", blob_sizes.lbs_file);
   370		init_debug("ib blob size         = %d\n", blob_sizes.lbs_ib);
   371		init_debug("inode blob size      = %d\n", blob_sizes.lbs_inode);
   372		init_debug("ipc blob size        = %d\n", blob_sizes.lbs_ipc);
   373	#ifdef CONFIG_KEYS
   374		init_debug("key blob size        = %d\n", blob_sizes.lbs_key);
   375	#endif /* CONFIG_KEYS */
   376		init_debug("msg_msg blob size    = %d\n", blob_sizes.lbs_msg_msg);
   377		init_debug("sock blob size       = %d\n", blob_sizes.lbs_sock);
   378		init_debug("superblock blob size = %d\n", blob_sizes.lbs_superblock);
   379		init_debug("perf event blob size = %d\n", blob_sizes.lbs_perf_event);
   380		init_debug("task blob size       = %d\n", blob_sizes.lbs_task);
   381		init_debug("tun device blob size = %d\n", blob_sizes.lbs_tun_dev);
   382		init_debug("xattr slots          = %d\n", blob_sizes.lbs_xattr_count);
   383		init_debug("bdev blob size       = %d\n", blob_sizes.lbs_bdev);
   384		init_debug("bpf map blob size    = %d\n", blob_sizes.lbs_bpf_map);
   385		init_debug("bpf prog blob size   = %d\n", blob_sizes.lbs_bpf_prog);
   386		init_debug("bpf token blob size  = %d\n", blob_sizes.lbs_bpf_token);
   387	
   388		/*
   389		 * Create any kmem_caches needed for blobs
   390		 */
   391		if (blob_sizes.lbs_file)
   392			lsm_file_cache = kmem_cache_create("lsm_file_cache",
   393							   blob_sizes.lbs_file, 0,
   394							   SLAB_PANIC, NULL);
   395		if (blob_sizes.lbs_inode)
   396			lsm_inode_cache = kmem_cache_create("lsm_inode_cache",
   397							    blob_sizes.lbs_inode, 0,
   398							    SLAB_PANIC, NULL);
   399	
 > 400		lsm_early_cred((struct cred *) current->cred);
   401		lsm_early_task(current);
   402		for (lsm = ordered_lsms; *lsm; lsm++)
   403			initialize_lsm(*lsm);
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
