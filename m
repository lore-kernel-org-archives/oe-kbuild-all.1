Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0D241664
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 11:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753530282; cv=none; b=jppfJwhG6d8P6W4SRYSWY4uI1Y9FAS7Hj99smaYfsxuOagpebyBruJS1u50v16gSaTPcHTZ8Id5gP0jNyVl7JswcQ860Q5foc5pXPxOhg1d/VGUw+1UDtR+xr/0AIu+TODkz69yatlbfUiHkKbAAQ8bYFsSt2rWK2SVaOHQOANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753530282; c=relaxed/simple;
	bh=jx7DIdkh/2LS4n5mnMhLz3jG4TDaQ6mLIVFLEESL0Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N0Hja0YmI5r+GiLOi5co/4I76SuE2W6CiZQTfNJWTzAi8sVZFiGgQxBI75DDbjLePrfK1ttv/88kqr/SyvM3CViO9CggPxzHVZzWjuD8TWapLxzCtBxbXEk6UayzARw0H5MulKzrNh/yslyLV5Aai+alRzR6ZCK56CFiPBg4VOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7jDgCzt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7jDgCzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753530280; x=1785066280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jx7DIdkh/2LS4n5mnMhLz3jG4TDaQ6mLIVFLEESL0Ks=;
  b=J7jDgCzt3YafelaO/2ZN5hSnH+/Pwjctd9kgHHYOnIVpDF7lOTdhpJGJ
   0FcxfzgmRCXZC+EpKbE3+AZ85o/M5bZYParFC4S91EI6NK1zHFDrBYJeK
   mDdEDZOi/ZEvrC1CKizlhypJNRsemmejLbnewc8ahPzHvGeu4hHIGOG3B
   FJxZLeNAWCSslj6BJbJWQ+0RnPwYpwGzqPjUhx+sIR1njiB2ZmF6mP0y/
   0afUiNI/DRNDEn9VKBHy3wNDwTCgH2BIzW3OwytL3zba5GCpRhgxGHJYb
   X3VQ77kh7wUQrdi+RBXTmSLnkjeQ3/9LU969i4yQS2fuX+IpJ3xfQYEaF
   w==;
X-CSE-ConnectionGUID: gkXEou/gTTCEgMxmTHk1Bw==
X-CSE-MsgGUID: 80myeD49SCmgrls3x22Lxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="78399354"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="78399354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:44:37 -0700
X-CSE-ConnectionGUID: ahtCFSMPRfWxCGtGcAxTuQ==
X-CSE-MsgGUID: nqwMWsjNQ0aDJDCakEq3RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161854317"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 04:44:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufdKK-000LwT-21;
	Sat, 26 Jul 2025 11:44:32 +0000
Date: Sat, 26 Jul 2025 19:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sandeen:convert-9p 4/4] fs/9p/v9fs.c:195:13: warning: variable
 'ret' set but not used
Message-ID: <202507261939.qYL6KXOC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git convert-9p
head:   4a72a2292eafad1371bc73defec4fdea64ea6de7
commit: 4a72a2292eafad1371bc73defec4fdea64ea6de7 [4/4] 9p: convert to the new mount API
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250726/202507261939.qYL6KXOC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261939.qYL6KXOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261939.qYL6KXOC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/9p/v9fs.c: In function 'v9fs_parse_param':
>> fs/9p/v9fs.c:195:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     195 |         int ret = 0;
         |             ^~~
--
>> Warning: fs/9p/vfs_super.c:41 function parameter 'fc' not described in 'v9fs_set_super'
   Warning: fs/9p/vfs_super.c:41 Excess function parameter 'data' description in 'v9fs_set_super'
--
>> Warning: fs/9p/v9fs.c:392 function parameter 'fc' not described in 'v9fs_session_init'
   Warning: fs/9p/v9fs.c:392 Excess function parameter 'dev_name' description in 'v9fs_session_init'
   Warning: fs/9p/v9fs.c:392 Excess function parameter 'data' description in 'v9fs_session_init'


vim +/ret +195 fs/9p/v9fs.c

c4fac9100456995 David Howells                2017-07-05  180  
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  181  /**
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  182   * v9fs_parse_options - parse mount options into session structure
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  183   * @v9ses: existing v9fs session information
bc868036569e1d1 David Howells                2021-10-04  184   * @opts: The mount option string
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  185   *
ab31267dfeddf80 Jim Meyering                 2008-03-06  186   * Return 0 upon success, -ERRNO upon failure.
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  187   */
4a72a2292eafad1 Eric Sandeen                 2025-07-24  188  int v9fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  189  {
4a72a2292eafad1 Eric Sandeen                 2025-07-24  190  	struct v9fs_context *ctx = fc->fs_private;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  191  	struct fs_parse_result result;
10c69a0d08bb2ad Dominique Martinet           2021-11-02  192  	char *s;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  193  	int r;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  194  	int opt;
ab31267dfeddf80 Jim Meyering                 2008-03-06 @195  	int ret = 0;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  196  	struct p9_client        *clnt = &ctx->client_opts;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  197  	struct p9_fd_opts       *fd_opts = &ctx->fd_opts;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  198  	struct p9_rdma_opts     *rdma_opts = &ctx->rdma_opts;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  199  	struct v9fs_session_info *v9ses_opts = &ctx->v9ses;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  200  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  201  	opt = fs_parse(fc, v9fs_param_spec, param, &result);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  202  	if (opt < 0)
4a72a2292eafad1 Eric Sandeen                 2025-07-24  203  		return opt;
6e195b0f7c8e509 Dominique Martinet           2021-11-02  204  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  205  	switch (opt) {
4d5077f1b2aa502 Aneesh Kumar K.V             2011-08-30  206  	case Opt_debug:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  207  		v9ses_opts->debug = result.uint_32;
10fa16e75c70c8e Eric Van Hensbergen          2007-07-16  208  #ifdef CONFIG_NET_9P_DEBUG
4a72a2292eafad1 Eric Sandeen                 2025-07-24  209  		p9_debug_level = result.uint_32;
10fa16e75c70c8e Eric Van Hensbergen          2007-07-16  210  #endif
9e2f6688c0b5288 Eric Van Hensbergen          2007-07-13  211  		break;
8a0dc95fd976a05 Eric Van Hensbergen          2008-02-06  212  
bd32b82df9876af Latchesar Ionkov             2007-10-17  213  	case Opt_dfltuid:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  214  		v9ses_opts->dfltuid = result.uid;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  215  		break;
bd32b82df9876af Latchesar Ionkov             2007-10-17  216  	case Opt_dfltgid:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  217  		v9ses_opts->dfltgid = result.gid;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  218  		break;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  219  	case Opt_afid:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  220  		v9ses_opts->afid = result.uint_32;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  221  		break;
67543e508d74ad1 Eric Van Hensbergen          2006-03-25  222  	case Opt_uname:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  223  		kfree(v9ses_opts->uname);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  224  		v9ses_opts->uname = param->string;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  225  		param->string = NULL;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  226  		break;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  227  	case Opt_remotename:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  228  		kfree(v9ses_opts->aname);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  229  		v9ses_opts->aname = param->string;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  230  		param->string = NULL;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  231  		break;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  232  	case Opt_nodevmap:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  233  		v9ses_opts->nodev = 1;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  234  		break;
8142db4f2792717 Eric Van Hensbergen          2022-12-17  235  	case Opt_noxattr:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  236  		v9ses_opts->flags |= V9FS_NO_XATTR;
8142db4f2792717 Eric Van Hensbergen          2022-12-17  237  		break;
6deffc8924b59df Eric Van Hensbergen          2022-12-18  238  	case Opt_directio:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  239  		v9ses_opts->flags |= V9FS_DIRECT_IO;
6deffc8924b59df Eric Van Hensbergen          2022-12-18  240  		break;
6deffc8924b59df Eric Van Hensbergen          2022-12-18  241  	case Opt_ignoreqv:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  242  		v9ses_opts->flags |= V9FS_IGNORE_QV;
6deffc8924b59df Eric Van Hensbergen          2022-12-18  243  		break;
60e78d2c993e58d Abhishek Kulkarni            2009-09-23  244  	case Opt_cachetag:
60e78d2c993e58d Abhishek Kulkarni            2009-09-23  245  #ifdef CONFIG_9P_FSCACHE
4a72a2292eafad1 Eric Sandeen                 2025-07-24  246  		kfree(v9ses_opts->cachetag);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  247  		v9ses_opts->cachetag = param->string;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  248  		param->string = NULL;
60e78d2c993e58d Abhishek Kulkarni            2009-09-23  249  #endif
60e78d2c993e58d Abhishek Kulkarni            2009-09-23  250  		break;
60e78d2c993e58d Abhishek Kulkarni            2009-09-23  251  	case Opt_cache:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  252  		v9ses_opts->cache = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  253  		p9_debug(P9_DEBUG_9P, "Cache mode: %s\n", param->string);
60e78d2c993e58d Abhishek Kulkarni            2009-09-23  254  		break;
ba17674fe02909f Latchesar Ionkov             2007-10-17  255  	case Opt_access:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  256  		s = param->string;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  257  		v9ses_opts->flags &= ~V9FS_ACCESS_MASK;
ba17674fe02909f Latchesar Ionkov             2007-10-17  258  		if (strcmp(s, "user") == 0)
4a72a2292eafad1 Eric Sandeen                 2025-07-24  259  			v9ses_opts->flags |= V9FS_ACCESS_USER;
ba17674fe02909f Latchesar Ionkov             2007-10-17  260  		else if (strcmp(s, "any") == 0)
4a72a2292eafad1 Eric Sandeen                 2025-07-24  261  			v9ses_opts->flags |= V9FS_ACCESS_ANY;
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  262  		else if (strcmp(s, "client") == 0) {
4a72a2292eafad1 Eric Sandeen                 2025-07-24  263  			v9ses_opts->flags |= V9FS_ACCESS_CLIENT;
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  264  		} else {
76ed23a5d703d94 Eric W. Biederman            2013-01-30  265  			uid_t uid;
10c69a0d08bb2ad Dominique Martinet           2021-11-02  266  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  267  			v9ses_opts->flags |= V9FS_ACCESS_SINGLE;
10c69a0d08bb2ad Dominique Martinet           2021-11-02  268  			r = kstrtouint(s, 10, &uid);
10c69a0d08bb2ad Dominique Martinet           2021-11-02  269  			if (r) {
10c69a0d08bb2ad Dominique Martinet           2021-11-02  270  				pr_info("Unknown access argument %s: %d\n",
4a72a2292eafad1 Eric Sandeen                 2025-07-24  271  					param->string, r);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  272  				return r;
a2dd43bb0d7b9ce Prem Karat                   2011-05-06  273  			}
4a72a2292eafad1 Eric Sandeen                 2025-07-24  274  			v9ses_opts->uid = make_kuid(current_user_ns(), uid);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  275  			if (!uid_valid(v9ses_opts->uid)) {
76ed23a5d703d94 Eric W. Biederman            2013-01-30  276  				ret = -EINVAL;
6baaac096179e7f Colin Ian King               2018-07-17  277  				pr_info("Unknown uid %s\n", s);
76ed23a5d703d94 Eric W. Biederman            2013-01-30  278  			}
ba17674fe02909f Latchesar Ionkov             2007-10-17  279  		}
ba17674fe02909f Latchesar Ionkov             2007-10-17  280  		break;
ba17674fe02909f Latchesar Ionkov             2007-10-17  281  
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  282) 	case Opt_posixacl:
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  283) #ifdef CONFIG_9P_FS_POSIX_ACL
4a72a2292eafad1 Eric Sandeen                 2025-07-24  284  		v9ses_opts->flags |= V9FS_POSIX_ACL;
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  285) #else
5d3851530d6d685 Joe Perches                  2011-11-28  286  		p9_debug(P9_DEBUG_ERROR,
5d3851530d6d685 Joe Perches                  2011-11-28  287  			 "Not defined CONFIG_9P_FS_POSIX_ACL. Ignoring posixacl option\n");
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  288) #endif
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  289) 		break;
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  290) 
5e172f75e51e3de Dinu-Razvan Chis-Serban      2018-09-05  291  	case Opt_locktimeout:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  292  		if (result.uint_32 < 1) {
5e172f75e51e3de Dinu-Razvan Chis-Serban      2018-09-05  293  			p9_debug(P9_DEBUG_ERROR,
5e172f75e51e3de Dinu-Razvan Chis-Serban      2018-09-05  294  				 "locktimeout must be a greater than zero integer.\n");
4a72a2292eafad1 Eric Sandeen                 2025-07-24  295  			return -EINVAL;
5e172f75e51e3de Dinu-Razvan Chis-Serban      2018-09-05  296  		}
4a72a2292eafad1 Eric Sandeen                 2025-07-24  297  		v9ses_opts->session_lock_timeout = (long)result.uint_32 * HZ;
5e172f75e51e3de Dinu-Razvan Chis-Serban      2018-09-05  298  		break;
5e172f75e51e3de Dinu-Razvan Chis-Serban      2018-09-05  299  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  300  	/* Options for client */
4a72a2292eafad1 Eric Sandeen                 2025-07-24  301  	case Opt_msize:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  302  		if (result.uint_32 < 4096) {
4a72a2292eafad1 Eric Sandeen                 2025-07-24  303  			p9_debug(P9_DEBUG_ERROR, "msize should be at least 4k\n");
4a72a2292eafad1 Eric Sandeen                 2025-07-24  304  			return -EINVAL;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  305  		}
4a72a2292eafad1 Eric Sandeen                 2025-07-24  306  		clnt->msize = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  307  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  308  	case Opt_trans:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  309  		v9fs_put_trans(clnt->trans_mod);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  310  		clnt->trans_mod = v9fs_get_trans_by_name(param->string);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  311  		if (!clnt->trans_mod) {
4a72a2292eafad1 Eric Sandeen                 2025-07-24  312  			pr_info("Could not find request transport: %s\n",
4a72a2292eafad1 Eric Sandeen                 2025-07-24  313  				param->string);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  314  			return -EINVAL;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  315  		}
4a72a2292eafad1 Eric Sandeen                 2025-07-24  316  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  317  	case Opt_legacy:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  318  		clnt->proto_version = p9_proto_legacy;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  319  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  320  	case Opt_version:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  321  		clnt->proto_version = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  322  		p9_debug(P9_DEBUG_9P, "Protocol version: %s\n", param->string);
4a72a2292eafad1 Eric Sandeen                 2025-07-24  323  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  324  	/* Options for fd transport */
4a72a2292eafad1 Eric Sandeen                 2025-07-24  325  	case Opt_rfdno:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  326  		fd_opts->rfd = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  327  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  328  	case Opt_wfdno:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  329  		fd_opts->wfd = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  330  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  331  	/* Options for rdma transport */
4a72a2292eafad1 Eric Sandeen                 2025-07-24  332  	case Opt_sq_depth:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  333  		rdma_opts->sq_depth = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  334  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  335  	case Opt_rq_depth:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  336  		rdma_opts->rq_depth = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  337  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  338  	case Opt_timeout:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  339  		rdma_opts->timeout = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  340  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  341  	/* Options for both fd and rdma transports */
4a72a2292eafad1 Eric Sandeen                 2025-07-24  342  	case Opt_port:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  343  		fd_opts->port = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  344  		rdma_opts->port = result.uint_32;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  345  		break;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  346  	case Opt_privport:
4a72a2292eafad1 Eric Sandeen                 2025-07-24  347  		fd_opts->privport = true;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  348  		rdma_opts->port = true;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  349  		break;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  350  	}
4a72a2292eafad1 Eric Sandeen                 2025-07-24  351  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  352  	return 0;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  353  }
d8c8a9e36560e9f Eric Van Hensbergen          2010-02-08  354  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  355  static void v9fs_apply_options(struct v9fs_session_info *v9ses,
4a72a2292eafad1 Eric Sandeen                 2025-07-24  356  		  struct fs_context *fc)
4a72a2292eafad1 Eric Sandeen                 2025-07-24  357  {
4a72a2292eafad1 Eric Sandeen                 2025-07-24  358  	struct v9fs_context	*ctx = fc->fs_private;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  359  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  360  	v9ses->debug = ctx->v9ses.debug;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  361  	v9ses->dfltuid = ctx->v9ses.dfltuid;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  362  	v9ses->dfltgid = ctx->v9ses.dfltgid;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  363  	v9ses->afid = ctx->v9ses.afid;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  364  	v9ses->uname = ctx->v9ses.uname;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  365  	ctx->v9ses.uname = NULL;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  366  	v9ses->aname = ctx->v9ses.aname;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  367  	ctx->v9ses.aname = NULL;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  368  	v9ses->nodev = ctx->v9ses.nodev;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  369  	/*
4a72a2292eafad1 Eric Sandeen                 2025-07-24  370  	 * Note that we must |= flags here as session_init already
4a72a2292eafad1 Eric Sandeen                 2025-07-24  371  	 * set basic flags. This adds in flags from parsed options.
4a72a2292eafad1 Eric Sandeen                 2025-07-24  372  	 */
4a72a2292eafad1 Eric Sandeen                 2025-07-24  373  	v9ses->flags |= ctx->v9ses.flags;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  374  #ifdef CONFIG_9P_FSCACHE
4a72a2292eafad1 Eric Sandeen                 2025-07-24  375  	v9ses->cachetag = ctx->v9ses.cachetag;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  376  	ctx->v9ses.cachetag = NULL;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  377  #endif
4a72a2292eafad1 Eric Sandeen                 2025-07-24  378  	v9ses->cache = ctx->v9ses.cache;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  379  	v9ses->uid = ctx->v9ses.uid;
4a72a2292eafad1 Eric Sandeen                 2025-07-24  380  	v9ses->session_lock_timeout = ctx->v9ses.session_lock_timeout;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  381  }
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  382  
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  383  /**
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  384   * v9fs_session_init - initialize session
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  385   * @v9ses: session information structure
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  386   * @dev_name: device being mounted
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  387   * @data: options
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  388   *
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  389   */
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  390  
bd238fb431f3198 Latchesar Ionkov             2007-07-10  391  struct p9_fid *v9fs_session_init(struct v9fs_session_info *v9ses,
4a72a2292eafad1 Eric Sandeen                 2025-07-24 @392  		  struct fs_context *fc)
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  393  {
bd238fb431f3198 Latchesar Ionkov             2007-07-10  394  	struct p9_fid *fid;
412a19b64ad17f7 Tejun Heo                    2015-06-08  395  	int rc = -ENOMEM;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  396  
a534c8d15b1f1d0 Aneesh Kumar K.V             2010-06-30  397  	init_rwsem(&v9ses->rename_sem);
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  398  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  399  	v9ses->clnt = p9_client_create(fc);
bd238fb431f3198 Latchesar Ionkov             2007-07-10  400  	if (IS_ERR(v9ses->clnt)) {
412a19b64ad17f7 Tejun Heo                    2015-06-08  401  		rc = PTR_ERR(v9ses->clnt);
5d3851530d6d685 Joe Perches                  2011-11-28  402  		p9_debug(P9_DEBUG_ERROR, "problem initializing 9p client\n");
71304feba33f4b0 Jan Kara                     2017-04-12  403  		goto err_names;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  404  	}
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  405  
4a72a2292eafad1 Eric Sandeen                 2025-07-24  406  	/*
4a72a2292eafad1 Eric Sandeen                 2025-07-24  407  	 * Initialize flags on the real v9ses. v9fs_apply_options below
4a72a2292eafad1 Eric Sandeen                 2025-07-24  408  	 * will |= the additional flags from parsed options.
4a72a2292eafad1 Eric Sandeen                 2025-07-24  409  	 */
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  410) 	v9ses->flags = V9FS_ACCESS_USER;
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  411) 
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  412) 	if (p9_is_proto_dotl(v9ses->clnt)) {
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  413) 		v9ses->flags = V9FS_ACCESS_CLIENT;
476ada043635167 Sripathi Kodi                2010-03-17  414  		v9ses->flags |= V9FS_PROTO_2000L;
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  415) 	} else if (p9_is_proto_dotu(v9ses->clnt)) {
476ada043635167 Sripathi Kodi                2010-03-17  416  		v9ses->flags |= V9FS_PROTO_2000U;
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  417) 	}
6752a1ebd13f69b Venkateswararao Jujjuri (JV  2011-01-26  418) 
4a72a2292eafad1 Eric Sandeen                 2025-07-24  419  	v9fs_apply_options(v9ses, fc);
ba17674fe02909f Latchesar Ionkov             2007-10-17  420  
fbedadc16e5c888 Eric Van Hensbergen          2008-10-13  421  	v9ses->maxdata = v9ses->clnt->msize - P9_IOHDRSZ;
8a0dc95fd976a05 Eric Van Hensbergen          2008-02-06  422  
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  423  	if (!v9fs_proto_dotl(v9ses) &&
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  424  	    ((v9ses->flags & V9FS_ACCESS_MASK) == V9FS_ACCESS_CLIENT)) {
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  425  		/*
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  426  		 * We support ACCESS_CLIENT only for dotl.
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  427  		 * Fall back to ACCESS_USER
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  428  		 */
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  429  		v9ses->flags &= ~V9FS_ACCESS_MASK;
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  430  		v9ses->flags |= V9FS_ACCESS_USER;
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  431  	}
76381a42e4a5606 Aneesh Kumar K.V             2010-09-28  432  	/*FIXME !! */
ba17674fe02909f Latchesar Ionkov             2007-10-17  433  	/* for legacy mode, fall back to V9FS_ACCESS_ANY */
9ffaf63e34821ea Aneesh Kumar K.V             2010-06-01  434  	if (!(v9fs_proto_dotu(v9ses) || v9fs_proto_dotl(v9ses)) &&
ba17674fe02909f Latchesar Ionkov             2007-10-17  435  		((v9ses->flags&V9FS_ACCESS_MASK) == V9FS_ACCESS_USER)) {
ba17674fe02909f Latchesar Ionkov             2007-10-17  436  
ba17674fe02909f Latchesar Ionkov             2007-10-17  437  		v9ses->flags &= ~V9FS_ACCESS_MASK;
ba17674fe02909f Latchesar Ionkov             2007-10-17  438  		v9ses->flags |= V9FS_ACCESS_ANY;
76ed23a5d703d94 Eric W. Biederman            2013-01-30  439  		v9ses->uid = INVALID_UID;
ba17674fe02909f Latchesar Ionkov             2007-10-17  440  	}
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  441) 	if (!v9fs_proto_dotl(v9ses) ||
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  442) 		!((v9ses->flags & V9FS_ACCESS_MASK) == V9FS_ACCESS_CLIENT)) {
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  443) 		/*
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  444) 		 * We support ACL checks on clinet only if the protocol is
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  445) 		 * 9P2000.L and access is V9FS_ACCESS_CLIENT.
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  446) 		 */
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  447) 		v9ses->flags &= ~V9FS_ACL_MASK;
e782ef71097e832 Venkateswararao Jujjuri (JV  2011-01-25  448) 	}
ba17674fe02909f Latchesar Ionkov             2007-10-17  449  
f791f7c5e354870 Eric W. Biederman            2013-01-29  450  	fid = p9_client_attach(v9ses->clnt, NULL, v9ses->uname, INVALID_UID,
ba17674fe02909f Latchesar Ionkov             2007-10-17  451  							v9ses->aname);
bd238fb431f3198 Latchesar Ionkov             2007-07-10  452  	if (IS_ERR(fid)) {
412a19b64ad17f7 Tejun Heo                    2015-06-08  453  		rc = PTR_ERR(fid);
5d3851530d6d685 Joe Perches                  2011-11-28  454  		p9_debug(P9_DEBUG_ERROR, "cannot attach\n");
412a19b64ad17f7 Tejun Heo                    2015-06-08  455  		goto err_clnt;
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  456  	}
9e82cf6a802a72f Eric Van Hensbergen          2005-09-09  457  
ba17674fe02909f Latchesar Ionkov             2007-10-17  458  	if ((v9ses->flags & V9FS_ACCESS_MASK) == V9FS_ACCESS_SINGLE)
ba17674fe02909f Latchesar Ionkov             2007-10-17  459  		fid->uid = v9ses->uid;
ba17674fe02909f Latchesar Ionkov             2007-10-17  460  	else
b464255699077c6 Eric W. Biederman            2013-01-30  461  		fid->uid = INVALID_UID;
ba17674fe02909f Latchesar Ionkov             2007-10-17  462  

:::::: The code at line 195 was first introduced by commit
:::::: ab31267dfeddf80b2e483f077c8b03905993722b fs/9p/v9fs.c (v9fs_parse_options): Handle kstrdup and match_strdup failure. Now that this function can fail, return an int, diagnose other option-parsing failures, and adjust the sole caller: (v9fs_session_init): Handle kstrdup failure. Propagate any new v9fs_parse_options failure "up".

:::::: TO: Jim Meyering <jim@meyering.net>
:::::: CC: Eric Van Hensbergen <ericvh@opteron.9grid.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
