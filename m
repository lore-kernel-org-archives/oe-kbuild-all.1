Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8952154BE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 21:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735593409; cv=none; b=PlZnJmRmRo9nD6Q5Cu3ZPXjoicBedKICnJI2dm4BsyDsKJhcPViSb3ggHV373OVgwJponNm3nk2RiNi9tishTlh1ID+Uru5B16cJ1e2NZ+36sfGVoIffhN7ZVl6jOHmVHw0PU8xQDdCWU2sy+DSi3HgJpc6knXLURkH4VZQo6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735593409; c=relaxed/simple;
	bh=MI9RmAAwEZLfce8Qh8dsCZnEdN0kYlau8XtzN8SDjHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/0KivtiSLcGruBQb8ps8lHhR2uB5smhopXuWDfYjqOwVyfx+v0GAKCukB1dqnaFnSIUKaWNN9BsTCSJlAr1vs+oij3sbQZSvF0UNd63a0kWciw8Tzu8ErJ1kOJ8+u4XKLD2kQxZ9xKoP+sMBBCM7jjGHZ2prePYTOciZO/9DtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIqWqlOE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIqWqlOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735593407; x=1767129407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MI9RmAAwEZLfce8Qh8dsCZnEdN0kYlau8XtzN8SDjHs=;
  b=YIqWqlOEx4iXiFItwi7gFtePezSZJ8bOtv1+nQnveYcUvlBb5p4xm17k
   5JBdvSQB3XKKNauaPCAZp+HDP8kAdDj1eb88D8O06svazqasU7/8PhJO1
   IftZSSy/AzKs8AeHUu2UNS3cGJT5H9qIxN4LdXtTXpn6uZIyTgv2Ge6EM
   KIlWEUegRXmOHk4AzjbeoUbJBVLO3X4jyxkVTUdIb0DLlInOdx4t3CIxk
   ASOcyPzawA/T3sXobK0P82KqaTk5rVRSd/qji2NH/ybbf06C/JYS/VLr+
   jB+6+Cq82Snon4mjG8oofuVb3y+jR/Ljb0Se2xLkXNgCa4o0ai39O60in
   A==;
X-CSE-ConnectionGUID: 1NZVhKsVQ9u5TXpjDwA6Gg==
X-CSE-MsgGUID: hr86KhdSQqSa7/iZeY7WGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="53427571"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="53427571"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 13:16:46 -0800
X-CSE-ConnectionGUID: Y+ESGKAwT6GUIb6hL9R1ag==
X-CSE-MsgGUID: Axau30bmRQeZImg3O9nKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="101056693"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 13:16:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSN7y-0006PJ-28;
	Mon, 30 Dec 2024 21:16:42 +0000
Date: Tue, 31 Dec 2024 05:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2610/2610] fs/cachefiles/xattr.c:221:5: warning:
 no previous prototype for function 'cachefiles_check_old_object_xattr'
Message-ID: <202412310541.8ZI8Il3W-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310541.8ZI8Il3W-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310541.8ZI8Il3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310541.8ZI8Il3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/cachefiles/xattr.c:12:
   In file included from include/linux/fsnotify.h:16:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/cachefiles/xattr.c:221:5: warning: no previous prototype for function 'cachefiles_check_old_object_xattr' [-Wmissing-prototypes]
     221 | int cachefiles_check_old_object_xattr(struct cachefiles_object *object,
         |     ^
   fs/cachefiles/xattr.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     221 | int cachefiles_check_old_object_xattr(struct cachefiles_object *object,
         | ^
         | static 
   2 warnings generated.


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
