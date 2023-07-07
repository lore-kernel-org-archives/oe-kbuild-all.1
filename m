Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FE21FAB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 05:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688706358; x=1720242358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qs5Xdas9kcfGayuYEoHRL8fvEgZndJ3AXtF4R1W1OP4=;
  b=dBq9/t71RsWrMgbvXgYGlvjHykSICCbYXX3YQohnCLvGMRn3M+KTCN75
   nHBeo5BbV9guBiadwFhB0g5wzb/bkJVqnms0/DNPfrzidVQJNvH5zRetc
   9L+6AT06P/tM+M0AtkMcsoL0ZpveCtFEs0f8ij8mlKCjYvoSdeJi6Qj/6
   S7MRNlMZ1/E+c/wqdY3AeO+PkaD10aP2TnNavjylnCWhhuht95+0rv1UC
   NT5pjo56TXieRIoE5GHgz9vGmuKjKMWg7sD5eIlU7VPNE9xAdAmMHurBl
   9ptHcddUttP6KPBETNloZxVjKg3dgW3GIuFlPyyvPsSPj0ArzN05K3URU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344135970"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="344135970"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 22:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="966490958"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966490958"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2023 22:05:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdfD-0001mg-0g;
	Fri, 07 Jul 2023 05:05:51 +0000
Date: Fri, 7 Jul 2023 13:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.3 444/447] fs/cifs/dfs.c:179:33: warning:
 variable 'server' set but not used
Message-ID: <202307071254.vtx0BpCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.3
head:   51bfdb3b0197233d991e42cdd52b7816db375594
commit: 94c435f9ab6d7bf728644b293b9189b609b87da5 [444/447] smb: client: fix shared DFS root mounts with different prefixes
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071254.vtx0BpCt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071254.vtx0BpCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071254.vtx0BpCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/cifs/dfs.c: In function '__dfs_mount_share':
>> fs/cifs/dfs.c:179:33: warning: variable 'server' set but not used [-Wunused-but-set-variable]
     179 |         struct TCP_Server_Info *server;
         |                                 ^~~~~~


vim +/server +179 fs/cifs/dfs.c

a1c0d00572fca4 Paulo Alcantara 2022-11-17  172  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  173  static int __dfs_mount_share(struct cifs_mount_ctx *mnt_ctx)
a1c0d00572fca4 Paulo Alcantara 2022-11-17  174  {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  175  	struct cifs_sb_info *cifs_sb = mnt_ctx->cifs_sb;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  176  	struct smb3_fs_context *ctx = mnt_ctx->fs_ctx;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  177  	char *ref_path = NULL, *full_path = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  178  	struct dfs_cache_tgt_iterator *tit;
a1c0d00572fca4 Paulo Alcantara 2022-11-17 @179  	struct TCP_Server_Info *server;
396935de145589 Paulo Alcantara 2023-03-14  180  	struct cifs_tcon *tcon;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  181  	char *origin_fullpath = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  182  	int num_links = 0;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  183  	int rc;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  184  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  185  	ref_path = dfs_get_path(cifs_sb, ctx->UNC);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  186  	if (IS_ERR(ref_path))
a1c0d00572fca4 Paulo Alcantara 2022-11-17  187  		return PTR_ERR(ref_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  188  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  189  	full_path = build_unc_path_to_root(ctx, cifs_sb, true);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  190  	if (IS_ERR(full_path)) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  191  		rc = PTR_ERR(full_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  192  		full_path = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  193  		goto out;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  194  	}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  195  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  196  	origin_fullpath = kstrdup(full_path, GFP_KERNEL);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  197  	if (!origin_fullpath) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  198  		rc = -ENOMEM;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  199  		goto out;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  200  	}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  201  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  202  	do {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  203  		struct dfs_cache_tgt_list tl = DFS_CACHE_TGT_LIST_INIT(tl);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  204  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  205  		rc = dfs_get_referral(mnt_ctx, ref_path + 1, NULL, &tl);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  206  		if (rc)
a1c0d00572fca4 Paulo Alcantara 2022-11-17  207  			break;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  208  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  209  		tit = dfs_cache_get_tgt_iterator(&tl);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  210  		if (!tit) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  211  			cifs_dbg(VFS, "%s: dfs referral (%s) with no targets\n", __func__,
a1c0d00572fca4 Paulo Alcantara 2022-11-17  212  				 ref_path + 1);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  213  			rc = -ENOENT;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  214  			dfs_cache_free_tgts(&tl);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  215  			break;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  216  		}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  217  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  218  		do {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  219  			rc = get_dfs_conn(mnt_ctx, ref_path, full_path, tit);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  220  			if (!rc)
a1c0d00572fca4 Paulo Alcantara 2022-11-17  221  				break;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  222  			if (rc == -EREMOTE) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  223  				if (++num_links > MAX_NESTED_LINKS) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  224  					rc = -ELOOP;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  225  					break;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  226  				}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  227  				kfree(ref_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  228  				kfree(full_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  229  				ref_path = full_path = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  230  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  231  				full_path = build_unc_path_to_root(ctx, cifs_sb, true);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  232  				if (IS_ERR(full_path)) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  233  					rc = PTR_ERR(full_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  234  					full_path = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  235  				} else {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  236  					ref_path = dfs_get_path(cifs_sb, full_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  237  					if (IS_ERR(ref_path)) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  238  						rc = PTR_ERR(ref_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  239  						ref_path = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  240  					}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  241  				}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  242  				break;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  243  			}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  244  		} while ((tit = dfs_cache_get_next_tgt(&tl, tit)));
a1c0d00572fca4 Paulo Alcantara 2022-11-17  245  		dfs_cache_free_tgts(&tl);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  246  	} while (rc == -EREMOTE);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  247  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  248  	if (!rc) {
a1c0d00572fca4 Paulo Alcantara 2022-11-17  249  		server = mnt_ctx->server;
396935de145589 Paulo Alcantara 2023-03-14  250  		tcon = mnt_ctx->tcon;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  251  
94c435f9ab6d7b Paulo Alcantara 2023-06-26  252  		spin_lock(&tcon->tc_lock);
94c435f9ab6d7b Paulo Alcantara 2023-06-26  253  		if (!tcon->origin_fullpath) {
94c435f9ab6d7b Paulo Alcantara 2023-06-26  254  			tcon->origin_fullpath = origin_fullpath;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  255  			origin_fullpath = NULL;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  256  		}
94c435f9ab6d7b Paulo Alcantara 2023-06-26  257  		spin_unlock(&tcon->tc_lock);
396935de145589 Paulo Alcantara 2023-03-14  258  
396935de145589 Paulo Alcantara 2023-03-14  259  		if (list_empty(&tcon->dfs_ses_list)) {
396935de145589 Paulo Alcantara 2023-03-14  260  			list_replace_init(&mnt_ctx->dfs_ses_list,
396935de145589 Paulo Alcantara 2023-03-14  261  					  &tcon->dfs_ses_list);
3139ea00ef1b9f Paulo Alcantara 2023-04-27  262  			queue_delayed_work(dfscache_wq, &tcon->dfs_cache_work,
3139ea00ef1b9f Paulo Alcantara 2023-04-27  263  					   dfs_cache_get_ttl() * HZ);
396935de145589 Paulo Alcantara 2023-03-14  264  		} else {
396935de145589 Paulo Alcantara 2023-03-14  265  			dfs_put_root_smb_sessions(&mnt_ctx->dfs_ses_list);
396935de145589 Paulo Alcantara 2023-03-14  266  		}
396935de145589 Paulo Alcantara 2023-03-14  267  	}
a1c0d00572fca4 Paulo Alcantara 2022-11-17  268  
a1c0d00572fca4 Paulo Alcantara 2022-11-17  269  out:
a1c0d00572fca4 Paulo Alcantara 2022-11-17  270  	kfree(origin_fullpath);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  271  	kfree(ref_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  272  	kfree(full_path);
a1c0d00572fca4 Paulo Alcantara 2022-11-17  273  	return rc;
a1c0d00572fca4 Paulo Alcantara 2022-11-17  274  }
a1c0d00572fca4 Paulo Alcantara 2022-11-17  275  

:::::: The code at line 179 was first introduced by commit
:::::: a1c0d00572fca4adcb40e1fbd3acd481fc75e20b cifs: share dfs connections and supers

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
