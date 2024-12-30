Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069B199949
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 22:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597797; cv=none; b=nxCjs8zuliLympuohhuAKNzqbVD+NJlHp4C9YDOOm1AIxeMLIElTez2o4GlbgskL+1t1BmxdwH59Um0dGFdXhnX3wlJCpSUETH+wlUGCpsgujQhj2Q+c7JCQZz/kEErYkXMEjupm0ZBgMEBws3XE+VLiGNmH5WCpWbUv28Gn3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597797; c=relaxed/simple;
	bh=BHmYGKz7LKG1jZuVoncvcV1g+87Y90HkVynsuJzF9tI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lm4i7qUotC7OLZDksebAfKL93wDwihVd6SrO0mT5mK9oZWwFABn/sOpSSjb3IiXg5XWF0qHoajHO4I7QDZYeLzdVM3ItCTAi0tHnUFy4SXYNfMWkLofgoLvB2HiyiSv6tmdDOSfz72UWDWvKV314Qta7DLsCYd5CHRZWRKQIaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJXn5mGI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJXn5mGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735597795; x=1767133795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BHmYGKz7LKG1jZuVoncvcV1g+87Y90HkVynsuJzF9tI=;
  b=RJXn5mGI3s/odkTy9dUfBqXIT0Z3SPgnuXOAvAdXW4mDO3Lw74i4aW4I
   XcTpLb+I+0cAxFvQ4hOzvo6qav7fyA0q/88V5L4Mg22/uDwlKNSjKX41H
   lFBCxsCHay40TWwRMuN8pAEAShVnC+Mj3yHjCzWnGpr2uDgvcL/qYbr7z
   XJpvZ7BW2++PuaW/IIi1rRf2V+kE7hPoteGPymr9gKD/0D2UJF98PiPXJ
   BUMLz7cuxwQDF9aY1dMjmpj75g9X4I86eZRMafLLDVQTmUmOzK/leUTh4
   ExNFX4RvLPKdai2BOvP6yuCql6oQxJZ4BBp+yUvzJB2VU7J7qyKQ/5hWG
   w==;
X-CSE-ConnectionGUID: usBNERtHQju7R32dWLkmrA==
X-CSE-MsgGUID: Q4axX4VjQUS9gn7mt2mUqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="47247935"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="47247935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 14:29:55 -0800
X-CSE-ConnectionGUID: LLJahgaGQm+ReYgQP9twKg==
X-CSE-MsgGUID: HzpqCV4CQX6ZhfaHZo9ZgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105963749"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Dec 2024 14:29:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSOGl-0006RT-0d;
	Mon, 30 Dec 2024 22:29:51 +0000
Date: Tue, 31 Dec 2024 06:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] fs/cachefiles/xattr.c:221:5: warning:
 no previous prototype for 'cachefiles_check_old_object_xattr'
Message-ID: <202412310612.ETObn9wZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8bba4b17284e774544bd01d9ea5190546e93a849
commit: 62cbbf255badab153207e0a54d04da8c345ae307 [2610/2610] cachefiles: use mainline xattr in ondemand mode
config: arm64-randconfig-004-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310612.ETObn9wZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310612.ETObn9wZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310612.ETObn9wZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cachefiles/xattr.c:221:5: warning: no previous prototype for 'cachefiles_check_old_object_xattr' [-Wmissing-prototypes]
     221 | int cachefiles_check_old_object_xattr(struct cachefiles_object *object,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cachefiles_check_old_object_xattr +221 fs/cachefiles/xattr.c

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
