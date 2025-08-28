Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975C26B76C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Aug 2025 02:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349984; cv=none; b=d75/qYM9ISDccqbiOjf2sGpDzyXWIGvgJe2n3KSh2/vVDT5TJp2PwEA73m/qT+XZHC+hwi/vMT/3F/C1oKzwZ11CaJVuU1MwOVoi0qdfGpQp2PhAKAz4H7OZiV6xi4TaGL2Od/GSVIpLLLFpyLfFTjeHjiX2chF1TmWcIGyO2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349984; c=relaxed/simple;
	bh=tEpxc6b3Y4EdvX9ca1+3sCungsdNBZqQCVb8ACHb4rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EdRn/dT+v9nJxIDNyaYuolTWIe95LWD2JhzIGODwcYyXXJPzA6uOdBZmZ2WRc4UJwAC/oZlQgPqfsR2O+8DdCjHPynvAF4RSJvmylfBvAPEj0I8lA150B+DFhI5/4AcwmV99pqThCEJWiEMFJStWTzoSJj/Bk7lAfoR6Jpp2+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YowqS4nT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YowqS4nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756349979; x=1787885979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEpxc6b3Y4EdvX9ca1+3sCungsdNBZqQCVb8ACHb4rk=;
  b=YowqS4nTPTdUzQ+tJNIsJ3soZo5Roy7LP/WCdvuLh+BuW8eEoB+7/ekT
   uIinJloxKCT6EadFkZYKeH6kUlxlNgNI2XMGqCnarpvAEYPnw31fxD2WX
   zU72j7PSslw8c1fGrW2mCRc6jcLhMsFpmpft+BCz4K60dd2QrN9ug1kk8
   NHx8RGPwr3DnwfMJ/Yr7RxqHtWCyDtzM3t5hgUuSisMfT1MTdEedmDXXg
   3Det82XKhKBvxq/alBbieEPO61QldzBjauLZMgu6MWWsatJQg61RRsVVj
   G4lF4NjlxSMNZS3lC8phLpz7SFS4VTRg38A+RF3JOM9gj5MLypQLechlT
   w==;
X-CSE-ConnectionGUID: PxmxSSByT+252s9BK86/lg==
X-CSE-MsgGUID: nyEb+IvTTNKOH4lkCo092Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61245436"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="61245436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 19:59:36 -0700
X-CSE-ConnectionGUID: 7aJPazGxQcSehzvhPe2jkQ==
X-CSE-MsgGUID: bo7YDUwFT/GlBoG25cSyfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170806757"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 27 Aug 2025 19:59:35 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urSrN-0002k3-0Z;
	Thu, 28 Aug 2025 02:59:33 +0000
Date: Thu, 28 Aug 2025 04:59:17 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2] fs/cifs/connect.c:4155:5:
 warning: no previous prototype for function '__tree_connect_dfs_target'
Message-ID: <202508280400.5pMLfw25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f113b370a4da95f5c75a9d13d60f5774aeaec516
commit: 81d583baa5f1abd73c755ce1992929debd20b687 [2/2] cifs: support nested dfs links over reconnect
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250828/202508280400.5pMLfw25-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280400.5pMLfw25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280400.5pMLfw25-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/cifs/connect.c:46:
   In file included from fs/cifs/smbdirect.h:14:
   In file included from include/rdma/ib_verbs.h:26:
   include/net/ip.h:448:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     448 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> fs/cifs/connect.c:4155:5: warning: no previous prototype for function '__tree_connect_dfs_target' [-Wmissing-prototypes]
    4155 | int __tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
         |     ^
   fs/cifs/connect.c:4155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4155 | int __tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
         | ^
         | static 
>> fs/cifs/connect.c:4254:5: warning: no previous prototype for function 'tree_connect_dfs_target' [-Wmissing-prototypes]
    4254 | int tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
         |     ^
   fs/cifs/connect.c:4254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4254 | int tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
         | ^
         | static 
   3 warnings generated.


vim +/__tree_connect_dfs_target +4155 fs/cifs/connect.c

  4154	
> 4155	int __tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
  4156				      struct cifs_sb_info *cifs_sb, char *tree,
  4157				      struct dfs_cache_tgt_list *tl, struct dfs_info3_param *ref)
  4158	{
  4159		int rc;
  4160		struct TCP_Server_Info *server = tcon->ses->server;
  4161		const struct smb_version_operations *ops = server->ops;
  4162		struct cifs_tcon *ipc = tcon->ses->tcon_ipc;
  4163		bool islink;
  4164		char *share = NULL, *prefix = NULL;
  4165		const char *tcp_host;
  4166		size_t tcp_host_len;
  4167		struct dfs_cache_tgt_iterator *tit;
  4168		bool target_match;
  4169	
  4170		extract_unc_hostname(server->hostname, &tcp_host, &tcp_host_len);
  4171	
  4172		islink = ref->server_type == DFS_TYPE_LINK;
  4173		free_dfs_info_param(ref);
  4174	
  4175		tit = dfs_cache_get_tgt_iterator(tl);
  4176		if (!tit) {
  4177			rc = -ENOENT;
  4178			goto out;
  4179		}
  4180	
  4181		/* Try to tree connect to all dfs targets */
  4182		for (; tit; tit = dfs_cache_get_next_tgt(tl, tit)) {
  4183			const char *target = dfs_cache_get_tgt_name(tit);
  4184			struct dfs_cache_tgt_list ntl = DFS_CACHE_TGT_LIST_INIT(ntl);
  4185	
  4186			kfree(share);
  4187			kfree(prefix);
  4188	
  4189			/* Check if share matches with tcp ses */
  4190			rc = dfs_cache_get_tgt_share(server->current_fullpath + 1, tit, &share, &prefix);
  4191			if (rc) {
  4192				cifs_dbg(VFS, "%s: failed to parse target share: %d\n", __func__, rc);
  4193				break;
  4194			}
  4195	
  4196			rc = target_share_matches_server(server, tcp_host, tcp_host_len, share,
  4197							 &target_match);
  4198			if (rc)
  4199				break;
  4200			if (!target_match) {
  4201				rc = -EHOSTUNREACH;
  4202				continue;
  4203			}
  4204	
  4205			if (ipc->need_reconnect) {
  4206				scnprintf(tree, MAX_TREE_SIZE, "\\\\%s\\IPC$", server->hostname);
  4207				rc = ops->tree_connect(xid, ipc->ses, tree, ipc, cifs_sb->local_nls);
  4208				if (rc)
  4209					break;
  4210			}
  4211	
  4212			scnprintf(tree, MAX_TREE_SIZE, "\\%s", share);
  4213			if (!islink) {
  4214				rc = ops->tree_connect(xid, tcon->ses, tree, tcon, cifs_sb->local_nls);
  4215				break;
  4216			}
  4217			/*
  4218			 * If no dfs referrals were returned from link target, then just do a TREE_CONNECT
  4219			 * to it.  Otherwise, cache the dfs referral and then mark current tcp ses for
  4220			 * reconnect so either the demultiplex thread or the echo worker will reconnect to
  4221			 * newly resolved target.
  4222			 */
  4223			if (dfs_cache_find(xid, tcon->ses, cifs_sb->local_nls, cifs_remap(cifs_sb), target,
  4224					   ref, &ntl)) {
  4225				rc = ops->tree_connect(xid, tcon->ses, tree, tcon, cifs_sb->local_nls);
  4226				if (rc)
  4227					continue;
  4228				rc = dfs_cache_noreq_update_tgthint(server->current_fullpath + 1, tit);
  4229				if (!rc)
  4230					rc = cifs_update_super_prepath(cifs_sb, prefix);
  4231				break;
  4232			}
  4233			/* Target is another dfs share */
  4234			rc = update_server_fullpath(server, cifs_sb, target);
  4235			dfs_cache_free_tgts(tl);
  4236	
  4237			if (!rc) {
  4238				rc = -EREMOTE;
  4239				list_replace_init(&ntl.tl_list, &tl->tl_list);
  4240			} else {
  4241				dfs_cache_free_tgts(&ntl);
  4242				free_dfs_info_param(ref);
  4243			}
  4244			break;
  4245		}
  4246	
  4247	out:
  4248		kfree(share);
  4249		kfree(prefix);
  4250	
  4251		return rc;
  4252	}
  4253	
> 4254	int tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
  4255				    struct cifs_sb_info *cifs_sb, char *tree,
  4256				    struct dfs_cache_tgt_list *tl, struct dfs_info3_param *ref)
  4257	{
  4258		int rc;
  4259		int num_links = 0;
  4260		struct TCP_Server_Info *server = tcon->ses->server;
  4261	
  4262		do {
  4263			rc = __tree_connect_dfs_target(xid, tcon, cifs_sb, tree, tl, ref);
  4264			if (!rc || rc != -EREMOTE)
  4265				break;
  4266		} while (rc = -ELOOP, ++num_links < MAX_NESTED_LINKS);
  4267		/*
  4268		 * If we couldn't tree connect to any targets from last referral path, then retry from
  4269		 * original referral path.
  4270		 */
  4271		if (rc && server->current_fullpath != server->origin_fullpath) {
  4272			server->current_fullpath = server->origin_fullpath;
  4273			mark_tcon_tcp_ses_for_reconnect(tcon);
  4274		}
  4275	
  4276		dfs_cache_free_tgts(tl);
  4277		return rc;
  4278	}
  4279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
