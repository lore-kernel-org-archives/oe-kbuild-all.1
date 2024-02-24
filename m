Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C0C22339
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708786751; cv=none; b=ijdk8oK8bVbh5KGZzly5f9lqepjCOOW3VP50XXreocD6OsOezSynfThGydyV7vgOQwSbaO6FiM0Bc1v9K88IyJyXLu8MeGgBywSnkrG2bADtMPfYl+oyprNmNbXFLqwGsnUAe7b+upRg1wtFtEkXUaTCDDNJifzm4BNLGU3ui7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708786751; c=relaxed/simple;
	bh=dTHLq7O6pgaWj1pDyDw7NuxTQQAz6w0eVHzMhKIvG/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U/t4n4yiA45LXODP5HzjVn4lcDwLQVQqB5Y2dxnWYsxBajqXZXLu2jLNRH2RJ1EHScOdpkpo/mWb10tQW5q67EsecMtu40FNItnEgsHa5fb+C3vgzfSgWSz6hnfLaSM8QjSMb/mupsIVNdaRzrmF1sez7N8q70NWW76xa54xfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+Np0jfq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+Np0jfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708786749; x=1740322749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dTHLq7O6pgaWj1pDyDw7NuxTQQAz6w0eVHzMhKIvG/s=;
  b=X+Np0jfqjfAeJ4MffZYISi4lITIANYEfwg07GQaWsDDeJox16WuIlzfl
   ZxPIrllFGIoS3+xmF6oYjtVHymZB3wu9fyDHz9AgqR87jqJjPYLH4ASCu
   afJxszgkBJJIaETfyT/2yJg3Mi3QjDENRq3Y291NEw9+e86GRakGHtStv
   i+yOy5yq63ISL+lnxTxFdyMLNUvYWWBDy4zvby9n1Cj6B6Mv5zp/sx07b
   ZR1oauW+Qc3xm8Y+yZcVZwxRyTPQTSjS4S2p/g+Ego5gKxq8oYmOrZC+S
   nkmiZHkwpoPcl0jnU8JtMusKo7d8uoSI9qUnZMb0a6kmAI4iEaqI4jEIc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="6896356"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6896356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 06:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6125594"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Feb 2024 06:59:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdtUX-0008cc-0B;
	Sat, 24 Feb 2024 14:59:05 +0000
Date: Sat, 24 Feb 2024 22:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sforshee:fscaps-vfsid 12/26] include/linux/lsm_hook_defs.h:156:72:
 error: expected expression before ';' token
Message-ID: <202402242221.7EkmoasG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/linux.git fscaps-vfsid
head:   5ce094a334396397b1fc55565f035ffd4c68e612
commit: 763b1048683d9063f889fd5c3783e420052abe6e [12/26] security: add hooks for set/get/remove of fscaps
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242221.7EkmoasG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242221.7EkmoasG-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   kernel/panic.c: In function '__warn':
   kernel/panic.c:670:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     670 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
   arch/x86/entry/common.c:211: warning: Function parameter or struct member 'int80_emulation' not described in 'DEFINE_IDTENTRY_RAW'
   arch/x86/entry/common.c:211: warning: expecting prototype for int80_emulation(). Prototype was for DEFINE_IDTENTRY_RAW() instead
   kernel/cpu.c:85: warning: Excess struct member 'cpu' description in 'cpuhp_cpu_state'
   security/yama/yama_lsm.c:117: warning: Function parameter or struct member 'work' not described in 'yama_relation_cleanup'
   ipc/sem.c:647: warning: expecting prototype for perform_atomic_semop[_slow](). Prototype was for perform_atomic_semop_slow() instead
   In file included from security/bpf/hooks.c:13:
>> include/linux/lsm_hook_defs.h:156:72: error: expected expression before ';' token
     156 |          struct dentry *dentry, const struct vfs_caps *caps, int flags);
         |                                                                        ^
   make[5]: *** [scripts/Makefile.build:243: security/bpf/hooks.o] Error 1
   make[5]: Target 'security/bpf/' not remade because of errors.
   make[4]: *** [scripts/Makefile.build:481: security/bpf] Error 2
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1515, <IN_FILE> line 203.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 203.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 203.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1571, <IN_FILE> line 203.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1599, <IN_FILE> line 203.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1609, <IN_FILE> line 203.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1609, <IN_FILE> line 203.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1610, <IN_FILE> line 203.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1612, <IN_FILE> line 203.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1613, <IN_FILE> line 203.
   security/landlock/ruleset.c:203: warning: Function parameter or struct member '' not described in 'insert_rule'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1628, <IN_FILE> line 203.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1787, <IN_FILE> line 203.
   security/landlock/ruleset.c:203: warning: Excess function parameter 'layers' description in 'insert_rule'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1515, <IN_FILE> line 693.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 693.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 693.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1571, <IN_FILE> line 693.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1599, <IN_FILE> line 693.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1609, <IN_FILE> line 693.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1609, <IN_FILE> line 693.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1610, <IN_FILE> line 693.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1612, <IN_FILE> line 693.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1613, <IN_FILE> line 693.
   security/landlock/ruleset.c:693: warning: Function parameter or struct member '' not described in 'landlock_init_layer_masks'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1628, <IN_FILE> line 693.
   Use of uninitialized value $parameterlist[2] in join or string at scripts/kernel-doc line 1787, <IN_FILE> line 693.
   security/landlock/ruleset.c:693: warning: Excess function parameter 'layer_masks' description in 'landlock_init_layer_masks'
   arch/x86/lib/insn-eval.c:1152: warning: Function parameter or struct member 'base_offset' not described in 'get_eff_addr_sib'
   arch/x86/lib/insn-eval.c:1152: warning: Excess function parameter 'regoff' description in 'get_eff_addr_sib'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1515, <IN_FILE> line 405.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 405.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 405.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1571, <IN_FILE> line 405.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1599, <IN_FILE> line 405.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1609, <IN_FILE> line 405.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1609, <IN_FILE> line 405.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1610, <IN_FILE> line 405.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1612, <IN_FILE> line 405.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1613, <IN_FILE> line 405.
   security/landlock/fs.c:405: warning: Function parameter or struct member '' not described in 'is_access_to_paths_allowed'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1628, <IN_FILE> line 405.
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1515, <IN_FILE> line 405.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 405.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 405.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1571, <IN_FILE> line 405.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1599, <IN_FILE> line 405.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1609, <IN_FILE> line 405.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1628, <IN_FILE> line 405.
   Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1787, <IN_FILE> line 405.
   Use of uninitialized value $parameterlist[6] in join or string at scripts/kernel-doc line 1787, <IN_FILE> line 405.
   security/landlock/fs.c:405: warning: Excess function parameter 'layer_masks_parent1' description in 'is_access_to_paths_allowed'
   security/landlock/fs.c:405: warning: Excess function parameter 'layer_masks_parent2' description in 'is_access_to_paths_allowed'
   Use of uninitialized value $param in regexp compilation at scripts/kernel-doc line 1515, <IN_FILE> line 637.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 637.
   Use of uninitialized value $actual in substitution (s///) at scripts/kernel-doc line 1467, <IN_FILE> line 637.
   Use of uninitialized value $param in substitution (s///) at scripts/kernel-doc line 1571, <IN_FILE> line 637.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1599, <IN_FILE> line 637.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1609, <IN_FILE> line 637.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1609, <IN_FILE> line 637.
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1610, <IN_FILE> line 637.
   Use of uninitialized value $param in pattern match (m//) at scripts/kernel-doc line 1612, <IN_FILE> line 637.
   Use of uninitialized value $param in concatenation (.) or string at scripts/kernel-doc line 1613, <IN_FILE> line 637.
   security/landlock/fs.c:637: warning: Function parameter or struct member '' not described in 'collect_domain_accesses'
   Use of uninitialized value $param in hash element at scripts/kernel-doc line 1628, <IN_FILE> line 637.
   Use of uninitialized value $parameterlist[3] in join or string at scripts/kernel-doc line 1787, <IN_FILE> line 637.
   security/landlock/fs.c:637: warning: Excess function parameter 'layer_masks_dom' description in 'collect_domain_accesses'
   arch/x86/mm/pgtable.c:650: warning: Function parameter or struct member 'reserve' not described in 'reserve_top_address'
   arch/x86/mm/pgtable.c:699: warning: Function parameter or struct member 'p4d' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:699: warning: Function parameter or struct member 'addr' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:699: warning: Function parameter or struct member 'prot' not described in 'p4d_set_huge'
   arch/x86/mm/pgtable.c:709: warning: Function parameter or struct member 'p4d' not described in 'p4d_clear_huge'
   arch/x86/mm/pgtable.c:726: warning: Function parameter or struct member 'pud' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:726: warning: Function parameter or struct member 'addr' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:726: warning: Function parameter or struct member 'prot' not described in 'pud_set_huge'
   arch/x86/mm/pgtable.c:752: warning: Function parameter or struct member 'pmd' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:752: warning: Function parameter or struct member 'addr' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:752: warning: Function parameter or struct member 'prot' not described in 'pmd_set_huge'
   arch/x86/mm/pgtable.c:779: warning: Function parameter or struct member 'pud' not described in 'pud_clear_huge'
   arch/x86/mm/pgtable.c:794: warning: Function parameter or struct member 'pmd' not described in 'pmd_clear_huge'
   arch/x86/mm/pat/memtype.c:710: warning: Function parameter or struct member 'pfn' not described in 'pat_pfn_immune_to_uc_mtrr'
   arch/x86/lib/usercopy_64.c:29: warning: Function parameter or struct member 'addr' not described in 'clean_cache_range'
   arch/x86/lib/usercopy_64.c:29: warning: Excess function parameter 'vaddr' description in 'clean_cache_range'
   kernel/reboot.c:234: warning: Function parameter or struct member 'cmd' not described in 'do_kernel_restart'
   kernel/reboot.c:965: warning: Function parameter or struct member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'
   arch/x86/power/hibernate.c:47: warning: Function parameter or struct member 'pfn' not described in 'pfn_is_nosave'
   arch/x86/power/hibernate.c:92: warning: Function parameter or struct member 'max_size' not described in 'arch_hibernation_header_save'
   make[4]: Target 'security/' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:481: security] Error 2
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~
   drivers/acpi/sleep.c:519: warning: Function parameter or struct member 'acpi_state' not described in 'acpi_pm_start'
   drivers/acpi/sleep.c:559: warning: Function parameter or struct member 'pm_state' not described in 'acpi_suspend_begin'


vim +156 include/linux/lsm_hook_defs.h

   109	
   110	/* Needed for inode based security check */
   111	LSM_HOOK(int, 0, path_notify, const struct path *path, u64 mask,
   112		 unsigned int obj_type)
   113	LSM_HOOK(int, 0, inode_alloc_security, struct inode *inode)
   114	LSM_HOOK(void, LSM_RET_VOID, inode_free_security, struct inode *inode)
   115	LSM_HOOK(int, -EOPNOTSUPP, inode_init_security, struct inode *inode,
   116		 struct inode *dir, const struct qstr *qstr, struct xattr *xattrs,
   117		 int *xattr_count)
   118	LSM_HOOK(int, 0, inode_init_security_anon, struct inode *inode,
   119		 const struct qstr *name, const struct inode *context_inode)
   120	LSM_HOOK(int, 0, inode_create, struct inode *dir, struct dentry *dentry,
   121		 umode_t mode)
   122	LSM_HOOK(int, 0, inode_link, struct dentry *old_dentry, struct inode *dir,
   123		 struct dentry *new_dentry)
   124	LSM_HOOK(int, 0, inode_unlink, struct inode *dir, struct dentry *dentry)
   125	LSM_HOOK(int, 0, inode_symlink, struct inode *dir, struct dentry *dentry,
   126		 const char *old_name)
   127	LSM_HOOK(int, 0, inode_mkdir, struct inode *dir, struct dentry *dentry,
   128		 umode_t mode)
   129	LSM_HOOK(int, 0, inode_rmdir, struct inode *dir, struct dentry *dentry)
   130	LSM_HOOK(int, 0, inode_mknod, struct inode *dir, struct dentry *dentry,
   131		 umode_t mode, dev_t dev)
   132	LSM_HOOK(int, 0, inode_rename, struct inode *old_dir, struct dentry *old_dentry,
   133		 struct inode *new_dir, struct dentry *new_dentry)
   134	LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
   135	LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
   136		 bool rcu)
   137	LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
   138	LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
   139	LSM_HOOK(int, 0, inode_getattr, const struct path *path)
   140	LSM_HOOK(int, 0, inode_setxattr, struct mnt_idmap *idmap,
   141		 struct dentry *dentry, const char *name, const void *value,
   142		 size_t size, int flags)
   143	LSM_HOOK(void, LSM_RET_VOID, inode_post_setxattr, struct dentry *dentry,
   144		 const char *name, const void *value, size_t size, int flags)
   145	LSM_HOOK(int, 0, inode_getxattr, struct dentry *dentry, const char *name)
   146	LSM_HOOK(int, 0, inode_listxattr, struct dentry *dentry)
   147	LSM_HOOK(int, 0, inode_removexattr, struct mnt_idmap *idmap,
   148		 struct dentry *dentry, const char *name)
   149	LSM_HOOK(int, 0, inode_set_acl, struct mnt_idmap *idmap,
   150		 struct dentry *dentry, const char *acl_name, struct posix_acl *kacl)
   151	LSM_HOOK(int, 0, inode_get_acl, struct mnt_idmap *idmap,
   152		 struct dentry *dentry, const char *acl_name)
   153	LSM_HOOK(int, 0, inode_remove_acl, struct mnt_idmap *idmap,
   154		 struct dentry *dentry, const char *acl_name)
   155	LSM_HOOK(int, 0, inode_set_fscaps, struct mnt_idmap *idmap,
 > 156		 struct dentry *dentry, const struct vfs_caps *caps, int flags);
   157	LSM_HOOK(void, LSM_RET_VOID, inode_post_set_fscaps, struct mnt_idmap *idmap,
   158		 struct dentry *dentry, const struct vfs_caps *caps, int flags);
   159	LSM_HOOK(int, 0, inode_get_fscaps, struct mnt_idmap *idmap, struct dentry *dentry);
   160	LSM_HOOK(int, 0, inode_remove_fscaps, struct mnt_idmap *idmap,
   161		 struct dentry *dentry);
   162	LSM_HOOK(int, 0, inode_need_killpriv, struct dentry *dentry)
   163	LSM_HOOK(int, 0, inode_killpriv, struct mnt_idmap *idmap,
   164		 struct dentry *dentry)
   165	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecurity, struct mnt_idmap *idmap,
   166		 struct inode *inode, const char *name, void **buffer, bool alloc)
   167	LSM_HOOK(int, -EOPNOTSUPP, inode_setsecurity, struct inode *inode,
   168		 const char *name, const void *value, size_t size, int flags)
   169	LSM_HOOK(int, 0, inode_listsecurity, struct inode *inode, char *buffer,
   170		 size_t buffer_size)
   171	LSM_HOOK(void, LSM_RET_VOID, inode_getsecid, struct inode *inode, u32 *secid)
   172	LSM_HOOK(int, 0, inode_copy_up, struct dentry *src, struct cred **new)
   173	LSM_HOOK(int, -EOPNOTSUPP, inode_copy_up_xattr, const char *name)
   174	LSM_HOOK(int, 0, kernfs_init_security, struct kernfs_node *kn_dir,
   175		 struct kernfs_node *kn)
   176	LSM_HOOK(int, 0, file_permission, struct file *file, int mask)
   177	LSM_HOOK(int, 0, file_alloc_security, struct file *file)
   178	LSM_HOOK(void, LSM_RET_VOID, file_free_security, struct file *file)
   179	LSM_HOOK(int, 0, file_ioctl, struct file *file, unsigned int cmd,
   180		 unsigned long arg)
   181	LSM_HOOK(int, 0, file_ioctl_compat, struct file *file, unsigned int cmd,
   182		 unsigned long arg)
   183	LSM_HOOK(int, 0, mmap_addr, unsigned long addr)
   184	LSM_HOOK(int, 0, mmap_file, struct file *file, unsigned long reqprot,
   185		 unsigned long prot, unsigned long flags)
   186	LSM_HOOK(int, 0, file_mprotect, struct vm_area_struct *vma,
   187		 unsigned long reqprot, unsigned long prot)
   188	LSM_HOOK(int, 0, file_lock, struct file *file, unsigned int cmd)
   189	LSM_HOOK(int, 0, file_fcntl, struct file *file, unsigned int cmd,
   190		 unsigned long arg)
   191	LSM_HOOK(void, LSM_RET_VOID, file_set_fowner, struct file *file)
   192	LSM_HOOK(int, 0, file_send_sigiotask, struct task_struct *tsk,
   193		 struct fown_struct *fown, int sig)
   194	LSM_HOOK(int, 0, file_receive, struct file *file)
   195	LSM_HOOK(int, 0, file_open, struct file *file)
   196	LSM_HOOK(int, 0, file_truncate, struct file *file)
   197	LSM_HOOK(int, 0, task_alloc, struct task_struct *task,
   198		 unsigned long clone_flags)
   199	LSM_HOOK(void, LSM_RET_VOID, task_free, struct task_struct *task)
   200	LSM_HOOK(int, 0, cred_alloc_blank, struct cred *cred, gfp_t gfp)
   201	LSM_HOOK(void, LSM_RET_VOID, cred_free, struct cred *cred)
   202	LSM_HOOK(int, 0, cred_prepare, struct cred *new, const struct cred *old,
   203		 gfp_t gfp)
   204	LSM_HOOK(void, LSM_RET_VOID, cred_transfer, struct cred *new,
   205		 const struct cred *old)
   206	LSM_HOOK(void, LSM_RET_VOID, cred_getsecid, const struct cred *c, u32 *secid)
   207	LSM_HOOK(int, 0, kernel_act_as, struct cred *new, u32 secid)
   208	LSM_HOOK(int, 0, kernel_create_files_as, struct cred *new, struct inode *inode)
   209	LSM_HOOK(int, 0, kernel_module_request, char *kmod_name)
   210	LSM_HOOK(int, 0, kernel_load_data, enum kernel_load_data_id id, bool contents)
   211	LSM_HOOK(int, 0, kernel_post_load_data, char *buf, loff_t size,
   212		 enum kernel_load_data_id id, char *description)
   213	LSM_HOOK(int, 0, kernel_read_file, struct file *file,
   214		 enum kernel_read_file_id id, bool contents)
   215	LSM_HOOK(int, 0, kernel_post_read_file, struct file *file, char *buf,
   216		 loff_t size, enum kernel_read_file_id id)
   217	LSM_HOOK(int, 0, task_fix_setuid, struct cred *new, const struct cred *old,
   218		 int flags)
   219	LSM_HOOK(int, 0, task_fix_setgid, struct cred *new, const struct cred * old,
   220		 int flags)
   221	LSM_HOOK(int, 0, task_fix_setgroups, struct cred *new, const struct cred * old)
   222	LSM_HOOK(int, 0, task_setpgid, struct task_struct *p, pid_t pgid)
   223	LSM_HOOK(int, 0, task_getpgid, struct task_struct *p)
   224	LSM_HOOK(int, 0, task_getsid, struct task_struct *p)
   225	LSM_HOOK(void, LSM_RET_VOID, current_getsecid_subj, u32 *secid)
   226	LSM_HOOK(void, LSM_RET_VOID, task_getsecid_obj,
   227		 struct task_struct *p, u32 *secid)
   228	LSM_HOOK(int, 0, task_setnice, struct task_struct *p, int nice)
   229	LSM_HOOK(int, 0, task_setioprio, struct task_struct *p, int ioprio)
   230	LSM_HOOK(int, 0, task_getioprio, struct task_struct *p)
   231	LSM_HOOK(int, 0, task_prlimit, const struct cred *cred,
   232		 const struct cred *tcred, unsigned int flags)
   233	LSM_HOOK(int, 0, task_setrlimit, struct task_struct *p, unsigned int resource,
   234		 struct rlimit *new_rlim)
   235	LSM_HOOK(int, 0, task_setscheduler, struct task_struct *p)
   236	LSM_HOOK(int, 0, task_getscheduler, struct task_struct *p)
   237	LSM_HOOK(int, 0, task_movememory, struct task_struct *p)
   238	LSM_HOOK(int, 0, task_kill, struct task_struct *p, struct kernel_siginfo *info,
   239		 int sig, const struct cred *cred)
   240	LSM_HOOK(int, -ENOSYS, task_prctl, int option, unsigned long arg2,
   241		 unsigned long arg3, unsigned long arg4, unsigned long arg5)
   242	LSM_HOOK(void, LSM_RET_VOID, task_to_inode, struct task_struct *p,
   243		 struct inode *inode)
   244	LSM_HOOK(int, 0, userns_create, const struct cred *cred)
   245	LSM_HOOK(int, 0, ipc_permission, struct kern_ipc_perm *ipcp, short flag)
   246	LSM_HOOK(void, LSM_RET_VOID, ipc_getsecid, struct kern_ipc_perm *ipcp,
   247		 u32 *secid)
   248	LSM_HOOK(int, 0, msg_msg_alloc_security, struct msg_msg *msg)
   249	LSM_HOOK(void, LSM_RET_VOID, msg_msg_free_security, struct msg_msg *msg)
   250	LSM_HOOK(int, 0, msg_queue_alloc_security, struct kern_ipc_perm *perm)
   251	LSM_HOOK(void, LSM_RET_VOID, msg_queue_free_security,
   252		 struct kern_ipc_perm *perm)
   253	LSM_HOOK(int, 0, msg_queue_associate, struct kern_ipc_perm *perm, int msqflg)
   254	LSM_HOOK(int, 0, msg_queue_msgctl, struct kern_ipc_perm *perm, int cmd)
   255	LSM_HOOK(int, 0, msg_queue_msgsnd, struct kern_ipc_perm *perm,
   256		 struct msg_msg *msg, int msqflg)
   257	LSM_HOOK(int, 0, msg_queue_msgrcv, struct kern_ipc_perm *perm,
   258		 struct msg_msg *msg, struct task_struct *target, long type, int mode)
   259	LSM_HOOK(int, 0, shm_alloc_security, struct kern_ipc_perm *perm)
   260	LSM_HOOK(void, LSM_RET_VOID, shm_free_security, struct kern_ipc_perm *perm)
   261	LSM_HOOK(int, 0, shm_associate, struct kern_ipc_perm *perm, int shmflg)
   262	LSM_HOOK(int, 0, shm_shmctl, struct kern_ipc_perm *perm, int cmd)
   263	LSM_HOOK(int, 0, shm_shmat, struct kern_ipc_perm *perm, char __user *shmaddr,
   264		 int shmflg)
   265	LSM_HOOK(int, 0, sem_alloc_security, struct kern_ipc_perm *perm)
   266	LSM_HOOK(void, LSM_RET_VOID, sem_free_security, struct kern_ipc_perm *perm)
   267	LSM_HOOK(int, 0, sem_associate, struct kern_ipc_perm *perm, int semflg)
   268	LSM_HOOK(int, 0, sem_semctl, struct kern_ipc_perm *perm, int cmd)
   269	LSM_HOOK(int, 0, sem_semop, struct kern_ipc_perm *perm, struct sembuf *sops,
   270		 unsigned nsops, int alter)
   271	LSM_HOOK(int, 0, netlink_send, struct sock *sk, struct sk_buff *skb)
   272	LSM_HOOK(void, LSM_RET_VOID, d_instantiate, struct dentry *dentry,
   273		 struct inode *inode)
   274	LSM_HOOK(int, -EOPNOTSUPP, getselfattr, unsigned int attr,
   275		 struct lsm_ctx __user *ctx, size_t *size, u32 flags)
   276	LSM_HOOK(int, -EOPNOTSUPP, setselfattr, unsigned int attr,
   277		 struct lsm_ctx *ctx, size_t size, u32 flags)
   278	LSM_HOOK(int, -EINVAL, getprocattr, struct task_struct *p, const char *name,
   279		 char **value)
   280	LSM_HOOK(int, -EINVAL, setprocattr, const char *name, void *value, size_t size)
   281	LSM_HOOK(int, 0, ismaclabel, const char *name)
   282	LSM_HOOK(int, -EOPNOTSUPP, secid_to_secctx, u32 secid, char **secdata,
   283		 u32 *seclen)
   284	LSM_HOOK(int, 0, secctx_to_secid, const char *secdata, u32 seclen, u32 *secid)
   285	LSM_HOOK(void, LSM_RET_VOID, release_secctx, char *secdata, u32 seclen)
   286	LSM_HOOK(void, LSM_RET_VOID, inode_invalidate_secctx, struct inode *inode)
   287	LSM_HOOK(int, 0, inode_notifysecctx, struct inode *inode, void *ctx, u32 ctxlen)
   288	LSM_HOOK(int, 0, inode_setsecctx, struct dentry *dentry, void *ctx, u32 ctxlen)
   289	LSM_HOOK(int, -EOPNOTSUPP, inode_getsecctx, struct inode *inode, void **ctx,
   290		 u32 *ctxlen)
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
