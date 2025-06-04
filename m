Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E7241698
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019971; cv=none; b=VQqKa2OmDv51sxYz+YZVBgW+uhjBoN+AV2vW3R5waEJMn0hZeFfHuIfW/XBxM7rYlzT3evyatiY3QqJ1v+Rxf72EiiFerldxmid/T5LDGYuXOLpsV36DJ1Fw1fJg+HrLWpQWNrs/E1FEKuYFpIr++fIKlA6hxBWISU8NG5KI29M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019971; c=relaxed/simple;
	bh=skdopFuh5NZBwhwDoxFJ83q4AN2uND63KKdM2jjuYDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vv+B0VV0BnfGtMpzEWc1g/VwQ7xb7PilFAko0+qhgaKaC/ORi2GpFTHtgcIDuLsCF8S/NDBtUHgrlp9+TfVI4MpvUq0ANZJC+mX+Qac88gJKEALZca3Hj/BYvl9qaopeff9CFuMiFkP2cLOJbV9rxRaDewbXZX4Rd2bA/UZiJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lo79oLFy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo79oLFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749019970; x=1780555970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skdopFuh5NZBwhwDoxFJ83q4AN2uND63KKdM2jjuYDA=;
  b=Lo79oLFyBUpXBiNPDfvKw3VgbVBvVfeDCOhZS2dK0omDjRJsO8ml/MMx
   uueeeRDsY0IAVcobC7CvtQ9/hPvZb4v+Imr2ClACjkD3BPG357qF4COtQ
   aBxidiJoUQO08OLDWHrcDN5fsFwuAa5ZD0PMJBLl2Nk2sGdrITiOzhAUL
   MqT+AMCgUA1WFJY4zv6qNuLj7GPdaTJYcJl444znGUvEQIrwUB/E6y7LH
   4romJHyHgXMfGW4fqBXheJlYSkDRS3aGbGHWo9w7NSWULZ1CzhWjSbHsv
   AAUSCPWonQVJYZI1B1520AMGV633JRFyv1ZKKACVk6OfuYY9vZk9kefeg
   Q==;
X-CSE-ConnectionGUID: +CWWbXcWSiuW35ttB6yHuQ==
X-CSE-MsgGUID: 5CQAhwWAQpC+9l7vMtMQ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68520671"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="68520671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 23:52:49 -0700
X-CSE-ConnectionGUID: gpXRBLAUS/+v/FMhadt+hA==
X-CSE-MsgGUID: 45cgkq9IRDO1FBDrYqwVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="145109675"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jun 2025 23:52:48 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMhzN-0001eI-08;
	Wed, 04 Jun 2025 06:52:41 +0000
Date: Wed, 4 Jun 2025 14:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] fs/cachefiles/xattr.c:221:5: warning:
 no previous prototype for 'cachefiles_check_old_object_xattr'
Message-ID: <202506041414.VCeF5Rgv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 62cbbf255badab153207e0a54d04da8c345ae307 [2882/2882] cachefiles: use mainline xattr in ondemand mode
config: x86_64-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250604/202506041414.VCeF5Rgv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041414.VCeF5Rgv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041414.VCeF5Rgv-lkp@intel.com/

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
