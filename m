Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7478C3271E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398175; cv=none; b=qLRrcyVqTC2KjgLoGbNq4YT/MyQ20WYKOnxlbXHxSPcUwGwsOcyHzeWo2aP8IzFMQIk1zuW//yxDR3DH7INJBEZJlBrMy9E/ZGSGoj8W/BvKyBgrDaTIioSJKebJEiNH0Ex+jMy/x2l9NRyr/IA3ATDp/hYdjS1e0vVlVwfEuA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398175; c=relaxed/simple;
	bh=Zim/TFHIRshEutZNs15JT51IYMJpq2Fp0ak7A5I69Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFWIMNC03KRiv0oCxyFULCCKj5h0N+jJVnu/who2MkqVbsdnzsaVpyy9HBl5dLmkpf2XMXTMFkpSaW+nS6J8Md8DWNBZIZyDtCZa+RHCJlHMq6Fvc3h27VVJB7S3oxc4yuyRzzqJ5dllS22Za3BU5K+jK1cfb1Abdz2XzdJ/cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qcd7vxCQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qcd7vxCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765398174; x=1796934174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zim/TFHIRshEutZNs15JT51IYMJpq2Fp0ak7A5I69Bo=;
  b=Qcd7vxCQq6eqLBm3OEI8y5/CPv9iwT47KpgDv8aJYIU5rvOP4uH6KoVY
   wu/cVQBk+/ZPGZp7ZdA0a81aTww8Foyp7UH9MeK8E69xswLsgs7u/Wewt
   0Db5f15190nDZ8ELK+iWecRTRWtHlJ8G0PdaVPahYiLK4h0hRHATtPQEq
   isvr0ySwSJdwLO8WuaLKhjkI0d1TzK9QcakGSGQaKNZ61jWOZpQOZ1Dlg
   PGxarYQnXxx56i2+7qDErw+xThkEkHlbRlAszogBmBWS78ArT58YJOWYC
   p6tm8yEMQRbvbnbMBG3zztrcwk9AMoRpM9kcszSlxZ7jTg0i6RXfa1S4w
   g==;
X-CSE-ConnectionGUID: 3SZGSLgmSkGs8zetg142AA==
X-CSE-MsgGUID: wjkmlMxjRKivFqfIARkd+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90024542"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="90024542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 12:22:54 -0800
X-CSE-ConnectionGUID: 0KTnszqbQPiwyhW7nwjbag==
X-CSE-MsgGUID: HQk1w6svRcCEZ5F7r2DzPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196606509"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 12:22:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQi1-000000003jC-43XB;
	Wed, 10 Dec 2025 20:22:49 +0000
Date: Thu, 11 Dec 2025 04:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-03 0/1]
 fs/cifs/connect.c:4155:5: warning: no previous prototype for
 '__tree_connect_dfs_target'
Message-ID: <202512110401.mZC0ebNU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paulo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-03
head:   47909498d6058ee12b13bdfee22c80b73a979254
commit: 81d583baa5f1abd73c755ce1992929debd20b687 [0/1] cifs: support nested dfs links over reconnect
config: i386-randconfig-062-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110401.mZC0ebNU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110401.mZC0ebNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110401.mZC0ebNU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cifs/connect.c:4155:5: warning: no previous prototype for '__tree_connect_dfs_target' [-Wmissing-prototypes]
    4155 | int __tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/cifs/connect.c:4254:5: warning: no previous prototype for 'tree_connect_dfs_target' [-Wmissing-prototypes]
    4254 | int tree_connect_dfs_target(const unsigned int xid, struct cifs_tcon *tcon,
         |     ^~~~~~~~~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> fs/cifs/connect.c:4155:5: sparse: sparse: symbol '__tree_connect_dfs_target' was not declared. Should it be static?
   fs/cifs/connect.c:4254:5: sparse: sparse: symbol 'tree_connect_dfs_target' was not declared. Should it be static?

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
