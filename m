Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF13317170
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552721; cv=none; b=i9Mcb6ye8VnO94owre+6JY17y2Vj+khy6MCHAslOLG8/CvYkSFh6eJjVE8E1vwOxNEiSRAPSrAtoCpNu6FRtBPKerT0l756SrWRCTqMgbzTp8M/z0QiAIvYtoYZZjzLAcMGNBKbnqOqeTWDnJcqzGa/CenYJ2UQfXxn6Q8x9/IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552721; c=relaxed/simple;
	bh=tZZBmfY0aBVHuM5Z0tII9UEkGVIgahNCT+QMV6QMWcc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jmdu5/4IhWreQdDB92PJ/ZMS99cg4MCuduCJfONMfuuhQLokj6GeWtS/h0PKc/HeHUzTrltUKq7SMc2fqgtYbgLveVunsIR0mMDxngCOyfmXMx0p4TYQpV6NKidKlgj2/KLy5KNk7pi5RyPJMNFZ+IFUHQ/oIN4MBR7hk73ocRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBPNRsPC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBPNRsPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775552720; x=1807088720;
  h=date:from:to:cc:subject:message-id;
  bh=tZZBmfY0aBVHuM5Z0tII9UEkGVIgahNCT+QMV6QMWcc=;
  b=fBPNRsPC3sN0zEV/mUuq2Fm1cbj16xuwDeBYUou8DsJk36m1WDPBgD8v
   iwvPziQXIDnlPZZvhWRo/n9YzME5zvk2uXSvub5DY6/dCqYlI5qo1yam9
   h5FlnMiMYibjl3RgYo0hcz3LT6tPXaPXpWfCbx5PZbm8N6oezvBZnF6os
   FZalKTn8B6s3TX1Ieq1Bw/2I3h706NT+yeKsxHV6AJxtdgh6kgQFF5drh
   nl2cfU0p4IGdoRvsBO5Jk4AT0CSSkDxdU7064HNs0LgjkoJeS403FypBJ
   ijM9POD0+RQgzL4cwiAqd7R+vvxTl6UjKSGZxQ79WhEeHCS8tTfx0BwDP
   w==;
X-CSE-ConnectionGUID: pUfVROPFR7WAvisoh9CYCg==
X-CSE-MsgGUID: KV5v8f0fSwS+GS9AoxKX2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="101965129"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="101965129"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 02:05:19 -0700
X-CSE-ConnectionGUID: dRiWGLDHQyi9/WStwS1m/A==
X-CSE-MsgGUID: xbpEyfe7QmCMihOpCjRImA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="232149807"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 02:05:18 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wA2N1-000000000PR-1lX7;
	Tue, 07 Apr 2026 09:05:15 +0000
Date: Tue, 07 Apr 2026 17:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Marshall <hubcap@omnibond.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hubcap:for-next 1/6] fs/orangefs/orangefs-debugfs.c:244
 orangefs_kernel_debug_init() warn: always true condition '(len >= 0) =>
 (0-u64max >= 0)'
Message-ID: <202604071606.asPgJ8Fk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux.git for-next
head:   fb0898b77656046fd25c5f08cf89cd6e3899e6db
commit: 30b7c30781f0440e70a5e0c8943be423b57bbd9b [1/6] debugfs: take better advantage of strscpy.
config: loongarch-randconfig-r073-20260407 (https://download.01.org/0day-ci/archive/20260407/202604071606.asPgJ8Fk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604071606.asPgJ8Fk-lkp@intel.com/

smatch warnings:
fs/orangefs/orangefs-debugfs.c:244 orangefs_kernel_debug_init() warn: always true condition '(len >= 0) => (0-u64max >= 0)'
fs/orangefs/orangefs-debugfs.c:343 orangefs_client_debug_init() warn: always true condition '(len >= 0) => (0-u64max >= 0)'

vim +244 fs/orangefs/orangefs-debugfs.c

   234	
   235	/*
   236	 * initialize the kernel-debug file.
   237	 */
   238	static void orangefs_kernel_debug_init(void)
   239	{
   240		static char k_buffer[ORANGEFS_MAX_DEBUG_STRING_LEN] = { };
   241		size_t len =
   242			strscpy(k_buffer, kernel_debug_string, sizeof(k_buffer) - 1);
   243	
 > 244		if (len >= 0) {
   245			k_buffer[len] = '\n';
   246			k_buffer[len + 1] = '\0';
   247		} else {
   248			strscpy(k_buffer, "none\n");
   249			pr_info("%s: overflow 1!\n", __func__);
   250		}
   251	
   252		debugfs_create_file_aux_num(ORANGEFS_KMOD_DEBUG_FILE, 0444, debug_dir, k_buffer,
   253				    0, &kernel_debug_fops);
   254	}
   255	
   256	
   257	void orangefs_debugfs_cleanup(void)
   258	{
   259		debugfs_remove_recursive(debug_dir);
   260		kfree(debug_help_string);
   261		debug_help_string = NULL;
   262	}
   263	
   264	/* open ORANGEFS_KMOD_DEBUG_HELP_FILE */
   265	static int orangefs_debug_help_open(struct inode *inode, struct file *file)
   266	{
   267		int rc = -ENODEV;
   268		int ret;
   269	
   270		gossip_debug(GOSSIP_DEBUGFS_DEBUG,
   271			     "orangefs_debug_help_open: start\n");
   272	
   273		if (orangefs_debug_disabled)
   274			goto out;
   275	
   276		ret = seq_open(file, &help_debug_ops);
   277		if (ret)
   278			goto out;
   279	
   280		((struct seq_file *)(file->private_data))->private = inode->i_private;
   281	
   282		rc = 0;
   283	
   284	out:
   285		gossip_debug(GOSSIP_DEBUGFS_DEBUG,
   286			     "orangefs_debug_help_open: rc:%d:\n",
   287			     rc);
   288		return rc;
   289	}
   290	
   291	/*
   292	 * I think start always gets called again after stop. Start
   293	 * needs to return NULL when it is done. The whole "payload"
   294	 * in this case is a single (long) string, so by the second
   295	 * time we get to start (pos = 1), we're done.
   296	 */
   297	static void *help_start(struct seq_file *m, loff_t *pos)
   298	{
   299		void *payload = NULL;
   300	
   301		gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_start: start\n");
   302	
   303		mutex_lock(&orangefs_help_file_lock);
   304	
   305		if (*pos == 0)
   306			payload = m->private;
   307	
   308		return payload;
   309	}
   310	
   311	static void *help_next(struct seq_file *m, void *v, loff_t *pos)
   312	{
   313		(*pos)++;
   314		gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_next: start\n");
   315	
   316		return NULL;
   317	}
   318	
   319	static void help_stop(struct seq_file *m, void *p)
   320	{
   321		gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_stop: start\n");
   322		mutex_unlock(&orangefs_help_file_lock);
   323	}
   324	
   325	static int help_show(struct seq_file *m, void *v)
   326	{
   327		gossip_debug(GOSSIP_DEBUGFS_DEBUG, "help_show: start\n");
   328	
   329		seq_puts(m, v);
   330	
   331		return 0;
   332	}
   333	
   334	/*
   335	 * initialize the client-debug file.
   336	 */
   337	static void orangefs_client_debug_init(void)
   338	{
   339		static char c_buffer[ORANGEFS_MAX_DEBUG_STRING_LEN] = { };
   340		size_t len =
   341			strscpy(c_buffer, client_debug_string, sizeof(c_buffer) - 1);
   342	
 > 343		if (len >= 0) {
   344			c_buffer[len] = '\n';
   345			c_buffer[len + 1] = '\0';
   346		} else {
   347			strscpy(c_buffer, "none\n");
   348			pr_info("%s: overflow! 2\n", __func__);
   349		}
   350	
   351		client_debug_dentry = debugfs_create_file_aux_num(
   352						  ORANGEFS_CLIENT_DEBUG_FILE,
   353						  0444, debug_dir, c_buffer, 1,
   354						  &kernel_debug_fops);
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
