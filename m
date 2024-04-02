Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2897158DDF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 16:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712075555; cv=none; b=Gw98jOY80KvCe7ihpLiqQxqQlBMVmNKcYLNgoCXRRVGnOFGRSNxtTpK58qbtZZc4Ug9qPAzSYrja1ceWeq6T8RRzyJ6GsVROg4vN57R8dwIRdTAOK5N7VJssGcqenZLdiqDtGDw3yr7xe9zzFi9yFzxTmk7WBnp4ERw7D7sdYZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712075555; c=relaxed/simple;
	bh=L2lWUYvj+tc0wPF6ZGS6F+sa1ywQzs9knSblIofcSek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3lKIoi5EpYQswDcWhlVahGotJhHrgWx4co6wnqSsx3wAFdrykvGjP9Tkfe3S8eKQUU/kHUwnDy46uNtSlZM7+JGZf7oM1+0WTNmDbZjIAX/xEIjgxGLrYWII8VpI3m0sZQ7gum0pN68PEbNWJivRrmkDI0XyFuJz8jU6VM3oUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuipN6wA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuipN6wA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712075552; x=1743611552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2lWUYvj+tc0wPF6ZGS6F+sa1ywQzs9knSblIofcSek=;
  b=BuipN6wAcGAPVCw+DX1J3z3OCrwAAM6ibH63ImBQ1huJs2v7obu0DME0
   GEo4tf0iTNPIZ17IOYgo/L/xv9BGlwfHeOEHf4zizEYHKWTTW6OVHeM+E
   /6w6nhIzZUe1fKgNYO2vQZBiMn0si9YlMF/zCzEpDCgdjrVBYL5qdYjRH
   TS7NXSrEFvNLMcih9O0jej/zX91B2PAHXaw5CWRGYIT2LExzTfGS9xW3R
   x0PKCww35xsh/Bkpl6HyqGmfoQy7ah9Lc6QB8qbb00BG7CFX0z580EFDD
   Z8tdHVdGcIwnGy/crjVgyvfR2LdeCno8H4bsDHI4nIzOX0CqW0KjDQ8m9
   w==;
X-CSE-ConnectionGUID: YOqw7zjIRrux7qXttWXPcg==
X-CSE-MsgGUID: wq0L6QuWSK+cifroCx4fqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7447565"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7447565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 09:32:31 -0700
X-CSE-ConnectionGUID: aWFVy80tQcC/JKqT/SmgmA==
X-CSE-MsgGUID: GgKMihArT+a6jDb1cZkrFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="17947150"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Apr 2024 09:32:30 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrh3k-0001Jn-0f;
	Tue, 02 Apr 2024 16:32:28 +0000
Date: Wed, 3 Apr 2024 00:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Paulo Alcantara <pc@manguebit.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:for-next 5/7] fs/smb/client/connect.c:4045:19: warning:
 assignment makes pointer from integer without a cast
Message-ID: <202404030030.5g9P26ws-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/ksmbd.git for-next
head:   a542a813f1e57a75b886f2bde1e3ebb157839338
commit: 8e09ce8ffd4bdf6f780a54f89301c646526e9d97 [5/7] smb: client: handle DFS tcons in cifs_construct_tcon()
config: x86_64-randconfig-074-20240402 (https://download.01.org/0day-ci/archive/20240403/202404030030.5g9P26ws-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030030.5g9P26ws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030030.5g9P26ws-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87:0,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/smb/client/connect.c:8:
   fs/smb/client/connect.c: In function 'cifs_mount':
   fs/smb/client/connect.c:3647:23: error: invalid type argument of '->' (have 'struct cifs_mount_ctx')
      if (WARN_ON(!mnt_ctx->server))
                          ^
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   fs/smb/client/connect.c:3649:28: error: invalid type argument of '->' (have 'struct cifs_mount_ctx')
      else if (WARN_ON(!mnt_ctx->ses))
                               ^
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   fs/smb/client/connect.c:3651:28: error: invalid type argument of '->' (have 'struct cifs_mount_ctx')
      else if (WARN_ON(!mnt_ctx->tcon))
                               ^
   include/asm-generic/bug.h:123:25: note: in definition of macro 'WARN_ON'
     int __ret_warn_on = !!(condition);    \
                            ^~~~~~~~~
   fs/smb/client/connect.c: In function 'cifs_construct_tcon':
   fs/smb/client/connect.c:4045:21: error: implicit declaration of function 'dfs_get_path'; did you mean 'vfs_get_tree'? [-Werror=implicit-function-declaration]
      origin_fullpath = dfs_get_path(cifs_sb, cifs_sb->ctx->source);
                        ^~~~~~~~~~~~
                        vfs_get_tree
>> fs/smb/client/connect.c:4045:19: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      origin_fullpath = dfs_get_path(cifs_sb, cifs_sb->ctx->source);
                      ^
   fs/smb/client/connect.c:4067:22: error: 'dfscache_wq' undeclared (first use in this function); did you mean 'fscache_write'?
      queue_delayed_work(dfscache_wq, &tcon->dfs_cache_work,
                         ^~~~~~~~~~~
                         fscache_write
   fs/smb/client/connect.c:4067:22: note: each undeclared identifier is reported only once for each function it appears in
   fs/smb/client/connect.c:4067:42: error: 'struct cifs_tcon' has no member named 'dfs_cache_work'; did you mean 'max_cached_dirs'?
      queue_delayed_work(dfscache_wq, &tcon->dfs_cache_work,
                                             ^~~~~~~~~~~~~~
                                             max_cached_dirs
   fs/smb/client/connect.c:4068:8: error: implicit declaration of function 'dfs_cache_get_ttl'; did you mean 'fscache_get_aux'? [-Werror=implicit-function-declaration]
           dfs_cache_get_ttl() * HZ);
           ^~~~~~~~~~~~~~~~~
           fscache_get_aux
   cc1: some warnings being treated as errors


vim +4045 fs/smb/client/connect.c

  3989	
  3990	static struct cifs_tcon *
  3991	cifs_construct_tcon(struct cifs_sb_info *cifs_sb, kuid_t fsuid)
  3992	{
  3993		int rc;
  3994		struct cifs_tcon *master_tcon = cifs_sb_master_tcon(cifs_sb);
  3995		struct cifs_ses *ses;
  3996		struct cifs_tcon *tcon = NULL;
  3997		struct smb3_fs_context *ctx;
  3998		char *origin_fullpath = NULL;
  3999	
  4000		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
  4001		if (ctx == NULL)
  4002			return ERR_PTR(-ENOMEM);
  4003	
  4004		ctx->local_nls = cifs_sb->local_nls;
  4005		ctx->linux_uid = fsuid;
  4006		ctx->cred_uid = fsuid;
  4007		ctx->UNC = master_tcon->tree_name;
  4008		ctx->retry = master_tcon->retry;
  4009		ctx->nocase = master_tcon->nocase;
  4010		ctx->nohandlecache = master_tcon->nohandlecache;
  4011		ctx->local_lease = master_tcon->local_lease;
  4012		ctx->no_lease = master_tcon->no_lease;
  4013		ctx->resilient = master_tcon->use_resilient;
  4014		ctx->persistent = master_tcon->use_persistent;
  4015		ctx->handle_timeout = master_tcon->handle_timeout;
  4016		ctx->no_linux_ext = !master_tcon->unix_ext;
  4017		ctx->linux_ext = master_tcon->posix_extensions;
  4018		ctx->sectype = master_tcon->ses->sectype;
  4019		ctx->sign = master_tcon->ses->sign;
  4020		ctx->seal = master_tcon->seal;
  4021		ctx->witness = master_tcon->use_witness;
  4022		ctx->dfs_root_ses = master_tcon->ses->dfs_root_ses;
  4023	
  4024		rc = cifs_set_vol_auth(ctx, master_tcon->ses);
  4025		if (rc) {
  4026			tcon = ERR_PTR(rc);
  4027			goto out;
  4028		}
  4029	
  4030		/* get a reference for the same TCP session */
  4031		spin_lock(&cifs_tcp_ses_lock);
  4032		++master_tcon->ses->server->srv_count;
  4033		spin_unlock(&cifs_tcp_ses_lock);
  4034	
  4035		ses = cifs_get_smb_ses(master_tcon->ses->server, ctx);
  4036		if (IS_ERR(ses)) {
  4037			tcon = (struct cifs_tcon *)ses;
  4038			cifs_put_tcp_session(master_tcon->ses->server, 0);
  4039			goto out;
  4040		}
  4041	
  4042		spin_lock(&master_tcon->tc_lock);
  4043		if (master_tcon->origin_fullpath) {
  4044			spin_unlock(&master_tcon->tc_lock);
> 4045			origin_fullpath = dfs_get_path(cifs_sb, cifs_sb->ctx->source);
  4046			if (IS_ERR(origin_fullpath)) {
  4047				tcon = ERR_CAST(origin_fullpath);
  4048				origin_fullpath = NULL;
  4049				cifs_put_smb_ses(ses);
  4050				goto out;
  4051			}
  4052		} else {
  4053			spin_unlock(&master_tcon->tc_lock);
  4054		}
  4055	
  4056		tcon = cifs_get_tcon(ses, ctx);
  4057		if (IS_ERR(tcon)) {
  4058			cifs_put_smb_ses(ses);
  4059			goto out;
  4060		}
  4061	
  4062		if (origin_fullpath) {
  4063			spin_lock(&tcon->tc_lock);
  4064			tcon->origin_fullpath = origin_fullpath;
  4065			spin_unlock(&tcon->tc_lock);
  4066			origin_fullpath = NULL;
  4067			queue_delayed_work(dfscache_wq, &tcon->dfs_cache_work,
  4068					   dfs_cache_get_ttl() * HZ);
  4069		}
  4070	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
