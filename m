Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09EE1FF602
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736508172; cv=none; b=vBo9FbHMDUH979UdwUhJO5uIuO6bKkbVAwykip5nTqNksNmn5IunznG1vcqasoNG5TKNC41U09oA8cRA0N6TTJQSzP/K4UPlAbjVHFv1ORh9V6B9wJp3nczovb3QIXLyUhpqgDCdYdPB2Mnw9mMIjf6WjwKz0Z3qYRiTpvDVVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736508172; c=relaxed/simple;
	bh=Rzxa3mALj0z06FupvKCtHp+1+AgUNMou9yyDqniYDE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQKHaCU5sfQt4GdJcPXQXs1i+n/RA7jQernuxOMXf0JnmPMsUobTeCaPqPbhjxtK+pYY4xFxL5aesOFAduJiWUH0goyOWzdwH/5TgieFPj4xK7WZ75ICVRRYeFyIm7Im/iwM5jhUNtKhVU9vlVzPj/thNdJjCnKlxZqAnendKSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DozxDr2F; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DozxDr2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736508171; x=1768044171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rzxa3mALj0z06FupvKCtHp+1+AgUNMou9yyDqniYDE0=;
  b=DozxDr2Fp/mxxNtSIw+F2YEWysmNlCIhRaguNXjSAx9smXnhHSl/80lq
   A+Mua+Ao4/o+pXLt/WjfiBwJzp8ndf/ddzTzfj1jycCa9WuHTKpGuTJmF
   fHA6lNnwig6kfUz9sgbMeLUgwTYwM6tTbRjtA0lSlKzbQW2edSlnuHSYv
   ztcg55hUczGmxZqNQFd9POakAV9P+4BDUS32wXz3+11p5uqsKBqAdNzh4
   uMt1NdaTOlTzhKDhWSsxt8dOg7iMmF47Gg15nIXxq2XCNdJfkfNofjvjY
   L1Bo+YjbSOIU5gyF5UZmOXaPoADDeShXyq9Bv4f6PLwO5K+0onrIGVkRz
   w==;
X-CSE-ConnectionGUID: QgGymZSPTpi/UND7eKI7WA==
X-CSE-MsgGUID: iGNqHg1USBiVv4lXtTqF0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36908372"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36908372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 03:22:50 -0800
X-CSE-ConnectionGUID: 1UcecExEToeLVrN7UznQjw==
X-CSE-MsgGUID: dU245ekBSuWlaGEdcGEC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103763480"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jan 2025 03:22:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWD6E-000J7V-1G;
	Fri, 10 Jan 2025 11:22:46 +0000
Date: Fri, 10 Jan 2025 19:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2668/2668] fs/cachefiles/xattr.c:37:29: sparse:
 sparse: symbol 'new_vol_xattr' was not declared. Should it be static?
Message-ID: <202501101951.YVQo0Jjv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6aa478cf2617c987fcc37cdc8281a4cd310d86d9
commit: 62cbbf255badab153207e0a54d04da8c345ae307 [2668/2668] cachefiles: use mainline xattr in ondemand mode
config: x86_64-randconfig-121-20250108 (https://download.01.org/0day-ci/archive/20250110/202501101951.YVQo0Jjv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101951.YVQo0Jjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101951.YVQo0Jjv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/cachefiles/xattr.c:37:29: sparse: sparse: symbol 'new_vol_xattr' was not declared. Should it be static?
>> fs/cachefiles/xattr.c:221:5: sparse: sparse: symbol 'cachefiles_check_old_object_xattr' was not declared. Should it be static?

vim +/new_vol_xattr +37 fs/cachefiles/xattr.c

    36	
  > 37	struct cachefiles_vol_xattr new_vol_xattr;
    38	
    39	static int cachefiles_set_new_vol_xattr(struct cachefiles_object *object);
    40	static int cachefiles_check_new_vol_xattr(struct cachefiles_object *object);
    41	static int cachefiles_set_new_obj_xattr(struct cachefiles_object *object);
    42	static int cachefiles_check_new_obj_xattr(struct cachefiles_object *object);
    43	
    44	/*
    45	 * check the type label on an object
    46	 * - done using xattrs
    47	 */
    48	int cachefiles_check_object_type(struct cachefiles_object *object)
    49	{
    50		struct dentry *dentry = object->dentry;
    51		char type[3], xtype[3];
    52		int ret;
    53	
    54		ASSERT(dentry);
    55		ASSERT(d_backing_inode(dentry));
    56	
    57		if (!object->fscache.cookie)
    58			strcpy(type, "C3");
    59		else
    60			snprintf(type, 3, "%02x", object->fscache.cookie->def->type);
    61	
    62		_enter("%p{%s}", object, type);
    63	
    64		/* attempt to install a type label directly */
    65		ret = vfs_setxattr(dentry, cachefiles_xattr_cache, type, 2,
    66				   XATTR_CREATE);
    67		if (ret == 0) {
    68			_debug("SET"); /* we succeeded */
    69			goto error;
    70		}
    71	
    72		if (ret != -EEXIST) {
    73			pr_err("Can't set xattr on %pd [%lu] (err %d)\n",
    74			       dentry, d_backing_inode(dentry)->i_ino,
    75			       -ret);
    76			goto error;
    77		}
    78	
    79		/* read the current type label */
    80		ret = vfs_getxattr(dentry, cachefiles_xattr_cache, xtype, 3);
    81		if (ret < 0) {
    82			if (ret == -ERANGE)
    83				goto bad_type_length;
    84	
    85			pr_err("Can't read xattr on %pd [%lu] (err %d)\n",
    86			       dentry, d_backing_inode(dentry)->i_ino,
    87			       -ret);
    88			goto error;
    89		}
    90	
    91		/* check the type is what we're expecting */
    92		if (ret != 2)
    93			goto bad_type_length;
    94	
    95		if (xtype[0] != type[0] || xtype[1] != type[1])
    96			goto bad_type;
    97	
    98		ret = 0;
    99	
   100	error:
   101		_leave(" = %d", ret);
   102		return ret;
   103	
   104	bad_type_length:
   105		pr_err("Cache object %lu type xattr length incorrect\n",
   106		       d_backing_inode(dentry)->i_ino);
   107		ret = -EIO;
   108		goto error;
   109	
   110	bad_type:
   111		xtype[2] = 0;
   112		pr_err("Cache object %pd [%lu] type %s not %s\n",
   113		       dentry, d_backing_inode(dentry)->i_ino,
   114		       xtype, type);
   115		ret = -EIO;
   116		goto error;
   117	}
   118	
   119	/*
   120	 * set the state xattr on a cache file
   121	 */
   122	int cachefiles_set_object_xattr(struct cachefiles_object *object,
   123					struct cachefiles_xattr *auxdata)
   124	{
   125		struct dentry *dentry = object->dentry;
   126		int ret;
   127	
   128		ASSERT(dentry);
   129	
   130		_enter("%p,#%d", object, auxdata->len);
   131	
   132		/* attempt to install the cache metadata directly */
   133		_debug("SET #%u", auxdata->len);
   134	
   135		clear_bit(FSCACHE_COOKIE_AUX_UPDATED, &object->fscache.cookie->flags);
   136		if (data_new_version(object->fscache.cookie))
   137			ret = cachefiles_set_new_obj_xattr(object);
   138		else if (volume_new_version(object->fscache.cookie))
   139			ret = cachefiles_set_new_vol_xattr(object);
   140		else
   141			ret = vfs_setxattr(dentry, cachefiles_xattr_cache,
   142					   &auxdata->type, auxdata->len,
   143					   XATTR_CREATE);
   144		if (ret < 0 && ret != -ENOMEM)
   145			cachefiles_io_error_obj(
   146				object,
   147				"Failed to set xattr with error %d", ret);
   148	
   149		_leave(" = %d", ret);
   150		return ret;
   151	}
   152	
   153	/*
   154	 * update the state xattr on a cache file
   155	 */
   156	int cachefiles_update_object_xattr(struct cachefiles_object *object,
   157					   struct cachefiles_xattr *auxdata)
   158	{
   159		struct dentry *dentry = object->dentry;
   160		int ret;
   161	
   162		if (!dentry)
   163			return -ESTALE;
   164	
   165		_enter("%p,#%d", object, auxdata->len);
   166	
   167		/* attempt to install the cache metadata directly */
   168		_debug("SET #%u", auxdata->len);
   169	
   170		clear_bit(FSCACHE_COOKIE_AUX_UPDATED, &object->fscache.cookie->flags);
   171		ret = vfs_setxattr(dentry, cachefiles_xattr_cache,
   172				   &auxdata->type, auxdata->len,
   173				   XATTR_REPLACE);
   174		if (ret < 0 && ret != -ENOMEM)
   175			cachefiles_io_error_obj(
   176				object,
   177				"Failed to update xattr with error %d", ret);
   178	
   179		_leave(" = %d", ret);
   180		return ret;
   181	}
   182	
   183	/*
   184	 * check the consistency between the backing cache and the FS-Cache cookie
   185	 */
   186	int cachefiles_check_auxdata(struct cachefiles_object *object)
   187	{
   188		struct cachefiles_xattr *auxbuf;
   189		enum fscache_checkaux validity;
   190		struct dentry *dentry = object->dentry;
   191		ssize_t xlen;
   192		int ret;
   193	
   194		ASSERT(dentry);
   195		ASSERT(d_backing_inode(dentry));
   196		ASSERT(object->fscache.cookie->def->check_aux);
   197	
   198		auxbuf = kmalloc(sizeof(struct cachefiles_xattr) + 512, GFP_KERNEL);
   199		if (!auxbuf)
   200			return -ENOMEM;
   201	
   202		xlen = vfs_getxattr(dentry, cachefiles_xattr_cache,
   203				    &auxbuf->type, 512 + 1);
   204		ret = -ESTALE;
   205		if (xlen < 1 ||
   206		    auxbuf->type != object->fscache.cookie->def->type)
   207			goto error;
   208	
   209		xlen--;
   210		validity = fscache_check_aux(&object->fscache, &auxbuf->data, xlen,
   211					     i_size_read(d_backing_inode(dentry)));
   212		if (validity != FSCACHE_CHECKAUX_OKAY)
   213			goto error;
   214	
   215		ret = 0;
   216	error:
   217		kfree(auxbuf);
   218		return ret;
   219	}
   220	
 > 221	int cachefiles_check_old_object_xattr(struct cachefiles_object *object,
   222					      struct cachefiles_xattr *auxdata)
   223	{
   224		struct cachefiles_xattr *auxbuf;
   225		unsigned int len = sizeof(struct cachefiles_xattr) + 512;
   226		struct dentry *dentry = object->dentry;
   227		int ret;
   228	
   229		auxbuf = kmalloc(len, cachefiles_gfp);
   230		if (!auxbuf)
   231			return -ENOMEM;
   232	
   233		/* read the current type label */
   234		ret = vfs_getxattr(dentry, cachefiles_xattr_cache,
   235				   &auxbuf->type, 512 + 1);
   236		if (ret < 0)
   237			goto error;
   238	
   239		/* check the on-disk object */
   240		if (ret < 1) {
   241			pr_err("Cache object %lu xattr length incorrect\n",
   242			       d_backing_inode(dentry)->i_ino);
   243			goto stale;
   244		}
   245	
   246		if (auxbuf->type != auxdata->type)
   247			goto stale;
   248	
   249		auxbuf->len = ret;
   250	
   251		/* consult the netfs */
   252		if (object->fscache.cookie->def->check_aux) {
   253			enum fscache_checkaux result;
   254			unsigned int dlen;
   255	
   256			dlen = auxbuf->len - 1;
   257	
   258			_debug("checkaux %s #%u",
   259			       object->fscache.cookie->def->name, dlen);
   260	
   261			result = fscache_check_aux(&object->fscache,
   262						   &auxbuf->data, dlen,
   263						   i_size_read(d_backing_inode(dentry)));
   264	
   265			switch (result) {
   266				/* entry okay as is */
   267			case FSCACHE_CHECKAUX_OKAY:
   268				goto okay;
   269	
   270				/* entry requires update */
   271			case FSCACHE_CHECKAUX_NEEDS_UPDATE:
   272				break;
   273	
   274				/* entry requires deletion */
   275			case FSCACHE_CHECKAUX_OBSOLETE:
   276				goto stale;
   277	
   278			default:
   279				BUG();
   280			}
   281	
   282			/* update the current label */
   283			ret = vfs_setxattr(dentry, cachefiles_xattr_cache,
   284					   &auxdata->type, auxdata->len,
   285					   XATTR_REPLACE);
   286			if (ret < 0) {
   287				cachefiles_io_error_obj(object,
   288							"Can't update xattr on %lu"
   289							" (error %d)",
   290							d_backing_inode(dentry)->i_ino, -ret);
   291				goto error;
   292			}
   293		}
   294	
   295	okay:
   296		ret = 0;
   297	
   298	error:
   299		kfree(auxbuf);
   300		return ret;
   301	
   302	stale:
   303		ret = -ESTALE;
   304		goto error;
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
