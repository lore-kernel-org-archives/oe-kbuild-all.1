Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8228D622
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 04:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686976517; x=1718512517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5/Mtmz7SXvub7XN7sqv3XcuaKlz4txnCHw5cuN4orDg=;
  b=i/aexNjO5THSGNbUoZxPQ28xDvtRFc9ZfaxtQYSHQ6shfN93cRqyvXWm
   B/ZHqXmK3iSc4sDbddrnWGY0XG28Wax+iUWbvjICJCTR1Jbg9iQ+0ztiw
   PS/Q2dQxr9tNhdMng+gmNd8LsWFPSalGpvjE2+sfZzLUfbo0pb0wxMs+V
   7vzS868u4CSZKkYTs4W9xdFu+DjBwf7mCL3CHQVlfTGlSDq6QSdvV5hXg
   /XNJru1tn05jz+grdxSSgR4STvD5LTHUyMOTcoAU4PYlQCSSd5F3F2r4X
   tamXWdfeJsr57bARPjVvZ+LQB7UKd+DnXjGL2E72PBBvKNfvaXyvCsbf8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="344098659"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="344098659"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 21:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="803050431"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="803050431"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2023 21:35:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qANec-0002HM-1z;
	Sat, 17 Jun 2023 04:35:14 +0000
Date: Sat, 17 Jun 2023 12:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fs-overlayfs-mount_api 2/5] fs/overlayfs/super.c:672:26:
 warning: logical not is only applied to the left hand side of this
 comparison
Message-ID: <202306171211.TddTueyj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fs-overlayfs-mount_api
head:   92f07f2d2d25bd003434448a51d74c23b00ed8e0
commit: e86bd7d8e34e8ac3801e012acf3b794e0a58c405 [2/5] ovl: store enum redirect_mode in config instead of a string
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230617/202306171211.TddTueyj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171211.TddTueyj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306171211.TddTueyj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/super.c:672:26: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
           if (config->metacopy && !config->redirect_mode != OVL_REDIRECT_ON) {
                                   ^                      ~~
   fs/overlayfs/super.c:672:26: note: add parentheses after the '!' to evaluate the comparison first
           if (config->metacopy && !config->redirect_mode != OVL_REDIRECT_ON) {
                                   ^
                                    (                                       )
   fs/overlayfs/super.c:672:26: note: add parentheses around left hand side expression to silence this warning
           if (config->metacopy && !config->redirect_mode != OVL_REDIRECT_ON) {
                                   ^
                                   (                     )
   1 warning generated.


vim +672 fs/overlayfs/super.c

   516	
   517	static int ovl_parse_opt(char *opt, struct ovl_config *config)
   518	{
   519		char *p;
   520		bool metacopy_opt = false, redirect_opt = false;
   521		bool nfs_export_opt = false, index_opt = false;
   522	
   523		while ((p = ovl_next_opt(&opt)) != NULL) {
   524			int token;
   525			substring_t args[MAX_OPT_ARGS];
   526	
   527			if (!*p)
   528				continue;
   529	
   530			token = match_token(p, ovl_tokens, args);
   531			switch (token) {
   532			case OPT_UPPERDIR:
   533				kfree(config->upperdir);
   534				config->upperdir = match_strdup(&args[0]);
   535				if (!config->upperdir)
   536					return -ENOMEM;
   537				break;
   538	
   539			case OPT_LOWERDIR:
   540				kfree(config->lowerdir);
   541				config->lowerdir = match_strdup(&args[0]);
   542				if (!config->lowerdir)
   543					return -ENOMEM;
   544				break;
   545	
   546			case OPT_WORKDIR:
   547				kfree(config->workdir);
   548				config->workdir = match_strdup(&args[0]);
   549				if (!config->workdir)
   550					return -ENOMEM;
   551				break;
   552	
   553			case OPT_DEFAULT_PERMISSIONS:
   554				config->default_permissions = true;
   555				break;
   556	
   557			case OPT_REDIRECT_DIR_ON:
   558				config->redirect_mode = OVL_REDIRECT_ON;
   559				redirect_opt = true;
   560				break;
   561	
   562			case OPT_REDIRECT_DIR_OFF:
   563				config->redirect_mode = ovl_redirect_always_follow ?
   564							OVL_REDIRECT_FOLLOW :
   565							OVL_REDIRECT_NOFOLLOW;
   566				redirect_opt = true;
   567				break;
   568	
   569			case OPT_REDIRECT_DIR_FOLLOW:
   570				config->redirect_mode = OVL_REDIRECT_FOLLOW;
   571				redirect_opt = true;
   572				break;
   573	
   574			case OPT_REDIRECT_DIR_NOFOLLOW:
   575				config->redirect_mode = OVL_REDIRECT_NOFOLLOW;
   576				redirect_opt = true;
   577				break;
   578	
   579			case OPT_INDEX_ON:
   580				config->index = true;
   581				index_opt = true;
   582				break;
   583	
   584			case OPT_INDEX_OFF:
   585				config->index = false;
   586				index_opt = true;
   587				break;
   588	
   589			case OPT_UUID_ON:
   590				config->uuid = true;
   591				break;
   592	
   593			case OPT_UUID_OFF:
   594				config->uuid = false;
   595				break;
   596	
   597			case OPT_NFS_EXPORT_ON:
   598				config->nfs_export = true;
   599				nfs_export_opt = true;
   600				break;
   601	
   602			case OPT_NFS_EXPORT_OFF:
   603				config->nfs_export = false;
   604				nfs_export_opt = true;
   605				break;
   606	
   607			case OPT_XINO_ON:
   608				config->xino = OVL_XINO_ON;
   609				break;
   610	
   611			case OPT_XINO_OFF:
   612				config->xino = OVL_XINO_OFF;
   613				break;
   614	
   615			case OPT_XINO_AUTO:
   616				config->xino = OVL_XINO_AUTO;
   617				break;
   618	
   619			case OPT_METACOPY_ON:
   620				config->metacopy = true;
   621				metacopy_opt = true;
   622				break;
   623	
   624			case OPT_METACOPY_OFF:
   625				config->metacopy = false;
   626				metacopy_opt = true;
   627				break;
   628	
   629			case OPT_VOLATILE:
   630				config->ovl_volatile = true;
   631				break;
   632	
   633			case OPT_USERXATTR:
   634				config->userxattr = true;
   635				break;
   636	
   637			default:
   638				pr_err("unrecognized mount option \"%s\" or missing value\n",
   639						p);
   640				return -EINVAL;
   641			}
   642		}
   643	
   644		/* Workdir/index are useless in non-upper mount */
   645		if (!config->upperdir) {
   646			if (config->workdir) {
   647				pr_info("option \"workdir=%s\" is useless in a non-upper mount, ignore\n",
   648					config->workdir);
   649				kfree(config->workdir);
   650				config->workdir = NULL;
   651			}
   652			if (config->index && index_opt) {
   653				pr_info("option \"index=on\" is useless in a non-upper mount, ignore\n");
   654				index_opt = false;
   655			}
   656			config->index = false;
   657		}
   658	
   659		if (!config->upperdir && config->ovl_volatile) {
   660			pr_info("option \"volatile\" is meaningless in a non-upper mount, ignoring it.\n");
   661			config->ovl_volatile = false;
   662		}
   663	
   664		/*
   665		 * This is to make the logic below simpler.  It doesn't make any other
   666		 * difference, since redirect_dir=on is only used for upper.
   667		 */
   668		if (!config->upperdir && config->redirect_mode == OVL_REDIRECT_FOLLOW)
   669			config->redirect_mode = OVL_REDIRECT_ON;
   670	
   671		/* Resolve metacopy -> redirect_dir dependency */
 > 672		if (config->metacopy && !config->redirect_mode != OVL_REDIRECT_ON) {
   673			if (metacopy_opt && redirect_opt) {
   674				pr_err("conflicting options: metacopy=on,redirect_dir=%s\n",
   675				       ovl_redirect_mode(config));
   676				return -EINVAL;
   677			}
   678			if (redirect_opt) {
   679				/*
   680				 * There was an explicit redirect_dir=... that resulted
   681				 * in this conflict.
   682				 */
   683				pr_info("disabling metacopy due to redirect_dir=%s\n",
   684					ovl_redirect_mode(config));
   685				config->metacopy = false;
   686			} else {
   687				/* Automatically enable redirect otherwise. */
   688				config->redirect_mode = OVL_REDIRECT_ON;
   689			}
   690		}
   691	
   692		/* Resolve nfs_export -> index dependency */
   693		if (config->nfs_export && !config->index) {
   694			if (!config->upperdir &&
   695			    config->redirect_mode != OVL_REDIRECT_NOFOLLOW) {
   696				pr_info("NFS export requires \"redirect_dir=nofollow\" on non-upper mount, falling back to nfs_export=off.\n");
   697				config->nfs_export = false;
   698			} else if (nfs_export_opt && index_opt) {
   699				pr_err("conflicting options: nfs_export=on,index=off\n");
   700				return -EINVAL;
   701			} else if (index_opt) {
   702				/*
   703				 * There was an explicit index=off that resulted
   704				 * in this conflict.
   705				 */
   706				pr_info("disabling nfs_export due to index=off\n");
   707				config->nfs_export = false;
   708			} else {
   709				/* Automatically enable index otherwise. */
   710				config->index = true;
   711			}
   712		}
   713	
   714		/* Resolve nfs_export -> !metacopy dependency */
   715		if (config->nfs_export && config->metacopy) {
   716			if (nfs_export_opt && metacopy_opt) {
   717				pr_err("conflicting options: nfs_export=on,metacopy=on\n");
   718				return -EINVAL;
   719			}
   720			if (metacopy_opt) {
   721				/*
   722				 * There was an explicit metacopy=on that resulted
   723				 * in this conflict.
   724				 */
   725				pr_info("disabling nfs_export due to metacopy=on\n");
   726				config->nfs_export = false;
   727			} else {
   728				/*
   729				 * There was an explicit nfs_export=on that resulted
   730				 * in this conflict.
   731				 */
   732				pr_info("disabling metacopy due to nfs_export=on\n");
   733				config->metacopy = false;
   734			}
   735		}
   736	
   737	
   738		/* Resolve userxattr -> !redirect && !metacopy dependency */
   739		if (config->userxattr) {
   740			if (redirect_opt &&
   741			    config->redirect_mode != OVL_REDIRECT_NOFOLLOW) {
   742				pr_err("conflicting options: userxattr,redirect_dir=%s\n",
   743				       ovl_redirect_mode(config));
   744				return -EINVAL;
   745			}
   746			if (config->metacopy && metacopy_opt) {
   747				pr_err("conflicting options: userxattr,metacopy=on\n");
   748				return -EINVAL;
   749			}
   750			/*
   751			 * Silently disable default setting of redirect and metacopy.
   752			 * This shall be the default in the future as well: these
   753			 * options must be explicitly enabled if used together with
   754			 * userxattr.
   755			 */
   756			config->redirect_mode = OVL_REDIRECT_NOFOLLOW;
   757			config->metacopy = false;
   758		}
   759	
   760		return 0;
   761	}
   762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
