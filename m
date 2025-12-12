Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B237285CA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 08:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765526561; cv=none; b=hvlbTafAzEHAUiUKi8gTxoUBE0bM54czyW/RYkDc7qBvCmjjvMMxwG+N8ggGrGInkVZtWjvrolIOu/Cm4RF5FVX8WCn3Jcz5oJUFv3KVBs2ZwLHQ9H28ClxEqDE3d5ti/3uVqYkrKsBNV+V8488d0P8ZLQBX9RQfA/9dBPD8C3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765526561; c=relaxed/simple;
	bh=NTPqYxyg3N9/IAlBIv1J5XYrQGibTAt4X/Qjv1fjczs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=csiCQCzdU3mo2Gkp6e8tC3wcioMYaXZgsXzXo+NF2xmpu4bonfXVV45gQvdJUFU8c0Nkdpz8y61Vhnm3G1jDysvmQ78Y4+iKi5tqHJ0Zi+i/cR21bg0tvbgpo5AuizBEiV9Hz9nRl9ahVHDcBndNi7jmDYKkeVzfDNkkUzBuNnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6Gd4CF3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6Gd4CF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765526559; x=1797062559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NTPqYxyg3N9/IAlBIv1J5XYrQGibTAt4X/Qjv1fjczs=;
  b=B6Gd4CF3hJqOI1ASAD84oILwxuSFqutKCLBoFNLQqSLz1MmsgSCqZVUc
   3djF1qs0NFKLM7JdR6usP58qT8WSDpFV3G3GXH/HT9+t4t18gkXLz7+He
   HKVDOBHxbMCy3GhL2V0TLHqjZ2OUqwyub1a4ktBgeeiRmrkbPRFU8ERTA
   Nf32/e7B8PrdgcJlvYgzvzmJ0+wNpOloArkl5/3w/u4G0+R6qi4VBx0LP
   gbuUBIlKCBw4jJTgr+bY63DNJGNcsAjzKRwDrRodAPuLrbNZgSqIXoa7S
   QlQ0oJLU6cCZ9r8k+ssaUTYTi3lFLcqfCBS92pVCEIinKFr4H3frtLNZL
   w==;
X-CSE-ConnectionGUID: vW3oI2tORa2gShFu8B0R7w==
X-CSE-MsgGUID: cD2O42xORqSNG0T4R5bzlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78624514"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78624514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 00:02:38 -0800
X-CSE-ConnectionGUID: hpdebZwHRDiKTtBza2UoAQ==
X-CSE-MsgGUID: BS+Sp879Qne1BNbkGo38jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201929738"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 00:02:37 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTy6l-000000005lK-0fzo;
	Fri, 12 Dec 2025 08:02:35 +0000
Date: Fri, 12 Dec 2025 16:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] fs/cachefiles/xattr.c:221:5: warning:
 no previous prototype for function 'cachefiles_check_old_object_xattr'
Message-ID: <202512121508.P9ozIbTH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baokun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   58f07869576fac9de85244333864fb34fb7df411
commit: 62cbbf255badab153207e0a54d04da8c345ae307 [3406/3406] cachefiles: use mainline xattr in ondemand mode
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251212/202512121508.P9ozIbTH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121508.P9ozIbTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121508.P9ozIbTH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/cachefiles/xattr.c:221:5: warning: no previous prototype for function 'cachefiles_check_old_object_xattr' [-Wmissing-prototypes]
     221 | int cachefiles_check_old_object_xattr(struct cachefiles_object *object,
         |     ^
   fs/cachefiles/xattr.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | int cachefiles_check_old_object_xattr(struct cachefiles_object *object,
         | ^
         | static 
   1 warning generated.


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
