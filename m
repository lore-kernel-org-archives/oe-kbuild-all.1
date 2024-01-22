Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72713DBB7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705951573; cv=none; b=NDxIGqzNjYC9kFz0kWK2zTN1rNG8yk0GICYFyyiDQunvqzpvmCXXeeL4+7J4055OZjC8wrn8VUFepjnXuppkLvMBiSwykeioMBqlF1gBBa97iRPfNO+gkqAeVMJoETA3wpbIBTiIgSy5o+ftGFoWybeRKlGKHeFwQqW7Np8MSk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705951573; c=relaxed/simple;
	bh=XXV31XDy3HMagGO+pOYS7AFQc+8HB9J3XUobctrB0Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mS+Dkfno9mhybDU0Ere4e9vJfD+jLNZkYTv0FAI4Xpkdrp/huJ2ruXsJeQTgrqFllADMWu2rh764Ka5wa6HaQHkUzrbuZAB3M0kF1q5RMfiCE+SyVSD1e0TVDK07DPPVWVybT/zpHiQdGfnihoo9V8FsA4YcwpPi/HDseaJtKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+RAsrJC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+RAsrJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705951571; x=1737487571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXV31XDy3HMagGO+pOYS7AFQc+8HB9J3XUobctrB0Iw=;
  b=V+RAsrJCltHkWNTwMq5HVxHuJh0Q2JSWDza84df85tvPVxQFfPmYsJkz
   a6uelYSCbiPttyI2AhvLtWtqkw626tgFRjtiNnaX4/I3JyIAtDcjqxYwg
   EXAD+nCBIYbX52ccqlSrN20FBPcu2CMIV8sjSpyCt/4sWDBsBCVALMbXQ
   F9sf+F60MhVqb4SEFbK9/3tpMEzobYCQfHC4OJypWqC84scIKo7+lgUmf
   mA2YSywySkzVFs7r8IHLT1JrU1xZaMOu4a9Ptw9GuAiNxl2QGcYyfF2mD
   xWf09bxmWp9s8bWsCqAi+GzHLkQ+nOy440YNNSrC+m/rKVWSBbfGV/wrp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="14813303"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="14813303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 11:26:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="20082929"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jan 2024 11:26:07 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRzvo-0006p2-2i;
	Mon, 22 Jan 2024 19:26:04 +0000
Date: Tue, 23 Jan 2024 03:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 12/12] fs/cachefiles/namei.c:476:12: error:
 'struct cachefiles_object' has no member named 'ondemand'
Message-ID: <202401230324.Mlnj1ZfR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   15853a1a999d0d0417dedf8f26bbd1c39f803d0e
commit: b969b49ec1d1d04097e578e94ef4cfa31aa47593 [12/12] cachefiles, erofs: Fix NULL deref in when cachefiles is not doing ondemand-mode
config: i386-randconfig-013-20240122 (https://download.01.org/0day-ci/archive/20240123/202401230324.Mlnj1ZfR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401230324.Mlnj1ZfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401230324.Mlnj1ZfR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/cachefiles/namei.c: In function 'cachefiles_create_tmpfile':
>> fs/cachefiles/namei.c:476:12: error: 'struct cachefiles_object' has no member named 'ondemand'
     if (object->ondemand) {
               ^~
   fs/cachefiles/namei.c: In function 'cachefiles_open_file':
   fs/cachefiles/namei.c:584:12: error: 'struct cachefiles_object' has no member named 'ondemand'
     if (object->ondemand) {
               ^~


vim +476 fs/cachefiles/namei.c

   435	
   436	/*
   437	 * Create a temporary file and leave it unattached and un-xattr'd until the
   438	 * time comes to discard the object from memory.
   439	 */
   440	struct file *cachefiles_create_tmpfile(struct cachefiles_object *object)
   441	{
   442		struct cachefiles_volume *volume = object->volume;
   443		struct cachefiles_cache *cache = volume->cache;
   444		const struct cred *saved_cred;
   445		struct dentry *fan = volume->fanout[(u8)object->cookie->key_hash];
   446		struct file *file;
   447		const struct path parentpath = { .mnt = cache->mnt, .dentry = fan };
   448		uint64_t ni_size;
   449		long ret;
   450	
   451	
   452		cachefiles_begin_secure(cache, &saved_cred);
   453	
   454		ret = cachefiles_inject_write_error();
   455		if (ret == 0) {
   456			file = kernel_tmpfile_open(&nop_mnt_idmap, &parentpath,
   457						   S_IFREG | 0600,
   458						   O_RDWR | O_LARGEFILE | O_DIRECT,
   459						   cache->cache_cred);
   460			ret = PTR_ERR_OR_ZERO(file);
   461		}
   462		if (ret) {
   463			trace_cachefiles_vfs_error(object, d_inode(fan), ret,
   464						   cachefiles_trace_tmpfile_error);
   465			if (ret == -EIO)
   466				cachefiles_io_error_obj(object, "Failed to create tmpfile");
   467			goto err;
   468		}
   469	
   470		trace_cachefiles_tmpfile(object, file_inode(file));
   471	
   472		/* This is a newly created file with no other possible user */
   473		if (!cachefiles_mark_inode_in_use(object, file_inode(file)))
   474			WARN_ON(1);
   475	
 > 476		if (object->ondemand) {
   477			ret = cachefiles_ondemand_init_object(object);
   478			if (ret < 0)
   479				goto err_unuse;
   480		}
   481	
   482		ni_size = object->cookie->object_size;
   483		ni_size = round_up(ni_size, CACHEFILES_DIO_BLOCK_SIZE);
   484	
   485		if (ni_size > 0) {
   486			trace_cachefiles_trunc(object, file_inode(file), 0, ni_size,
   487					       cachefiles_trunc_expand_tmpfile);
   488			ret = cachefiles_inject_write_error();
   489			if (ret == 0)
   490				ret = vfs_truncate(&file->f_path, ni_size);
   491			if (ret < 0) {
   492				trace_cachefiles_vfs_error(
   493					object, file_inode(file), ret,
   494					cachefiles_trace_trunc_error);
   495				goto err_unuse;
   496			}
   497		}
   498	
   499		ret = -EINVAL;
   500		if (unlikely(!file->f_op->read_iter) ||
   501		    unlikely(!file->f_op->write_iter)) {
   502			fput(file);
   503			pr_notice("Cache does not support read_iter and write_iter\n");
   504			goto err_unuse;
   505		}
   506	out:
   507		cachefiles_end_secure(cache, saved_cred);
   508		return file;
   509	
   510	err_unuse:
   511		cachefiles_do_unmark_inode_in_use(object, file_inode(file));
   512		fput(file);
   513	err:
   514		file = ERR_PTR(ret);
   515		goto out;
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
