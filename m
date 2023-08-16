Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2010949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 16:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692205067; x=1723741067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRNjW/crUT4Y+v8/b27nQbsDK6E+n62iwNYFaxvG12o=;
  b=Bxd00wEtSa02Drb3CzXT2l+EFd3w2VS9iOWABLmS99KoKjUMsjvolo7N
   evRZpE3JO+0xRT7YYMJfiMLrd96BMUH/9eIyjBMnxMx8PPKmAjCKRgbm+
   LXsBYuIHhDBUlY2ql2E+exu2Fq6ZThlJzrCS/acaqTrwJ/cwBiIH/xalN
   ahXdvjz6WvQyrCX4tUxQ6BUJV92XPUqhVrPQJZquEDkhxuGWf1TAHTT1F
   P0ZKQ2wnCcCeNeLFJJHx0pv2i2w8qdacMu0UA0vcTSaVBKeyNBuj4NB0c
   sXZZsTgc8DUrXdiUnSeQBhDI1kJVraYg6S/ryefhEtYqLswPvozFkDcr0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375350219"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="375350219"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 09:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877889054"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2023 09:57:26 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWJph-0000S7-1e;
	Wed, 16 Aug 2023 16:57:21 +0000
Date: Thu, 17 Aug 2023 00:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] fs: create kiocb_{start,end}_write() helpers
Message-ID: <202308170036.0qkMFoDK-lkp@intel.com>
References: <20230816085439.894112-1-amir73il@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816085439.894112-1-amir73il@gmail.com>

Hi Amir,

kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on mszeredi-vfs/overlayfs-next jack-fs/for_next linus/master v6.5-rc6]
[cannot apply to vfs-idmapping/for-next mszeredi-vfs/next next-20230816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amir-Goldstein/fs-create-kiocb_-start-end-_write-helpers/20230816-165807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20230816085439.894112-1-amir73il%40gmail.com
patch subject: [PATCH v2] fs: create kiocb_{start,end}_write() helpers
config: arm-randconfig-r046-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170036.0qkMFoDK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170036.0qkMFoDK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170036.0qkMFoDK-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/cachefiles/io.c: In function '__cachefiles_write':
>> fs/cachefiles/io.c:322:27: error: passing argument 1 of 'kiocb_start_write' from incompatible pointer type [-Werror=incompatible-pointer-types]
     322 |         kiocb_start_write(ki);
         |                           ^~
         |                           |
         |                           struct cachefiles_kiocb *
   In file included from include/linux/fscache.h:17,
                    from include/trace/events/fscache.h:13,
                    from fs/cachefiles/io.c:14:
   include/linux/fs.h:2673:52: note: expected 'struct kiocb *' but argument is of type 'struct cachefiles_kiocb *'
    2673 | static inline void kiocb_start_write(struct kiocb *iocb)
         |                                      ~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +/kiocb_start_write +322 fs/cachefiles/io.c

   274	
   275	/*
   276	 * Initiate a write to the cache.
   277	 */
   278	int __cachefiles_write(struct cachefiles_object *object,
   279			       struct file *file,
   280			       loff_t start_pos,
   281			       struct iov_iter *iter,
   282			       netfs_io_terminated_t term_func,
   283			       void *term_func_priv)
   284	{
   285		struct cachefiles_cache *cache;
   286		struct cachefiles_kiocb *ki;
   287		unsigned int old_nofs;
   288		ssize_t ret;
   289		size_t len = iov_iter_count(iter);
   290	
   291		fscache_count_write();
   292		cache = object->volume->cache;
   293	
   294		_enter("%pD,%li,%llx,%zx/%llx",
   295		       file, file_inode(file)->i_ino, start_pos, len,
   296		       i_size_read(file_inode(file)));
   297	
   298		ki = kzalloc(sizeof(struct cachefiles_kiocb), GFP_KERNEL);
   299		if (!ki) {
   300			if (term_func)
   301				term_func(term_func_priv, -ENOMEM, false);
   302			return -ENOMEM;
   303		}
   304	
   305		refcount_set(&ki->ki_refcnt, 2);
   306		ki->iocb.ki_filp	= file;
   307		ki->iocb.ki_pos		= start_pos;
   308		ki->iocb.ki_flags	= IOCB_DIRECT | IOCB_WRITE;
   309		ki->iocb.ki_ioprio	= get_current_ioprio();
   310		ki->object		= object;
   311		ki->start		= start_pos;
   312		ki->len			= len;
   313		ki->term_func		= term_func;
   314		ki->term_func_priv	= term_func_priv;
   315		ki->was_async		= true;
   316		ki->b_writing		= (len + (1 << cache->bshift) - 1) >> cache->bshift;
   317	
   318		if (ki->term_func)
   319			ki->iocb.ki_complete = cachefiles_write_complete;
   320		atomic_long_add(ki->b_writing, &cache->b_writing);
   321	
 > 322		kiocb_start_write(ki);
   323	
   324		get_file(ki->iocb.ki_filp);
   325		cachefiles_grab_object(object, cachefiles_obj_get_ioreq);
   326	
   327		trace_cachefiles_write(object, file_inode(file), ki->iocb.ki_pos, len);
   328		old_nofs = memalloc_nofs_save();
   329		ret = cachefiles_inject_write_error();
   330		if (ret == 0)
   331			ret = vfs_iocb_iter_write(file, &ki->iocb, iter);
   332		memalloc_nofs_restore(old_nofs);
   333		switch (ret) {
   334		case -EIOCBQUEUED:
   335			goto in_progress;
   336	
   337		case -ERESTARTSYS:
   338		case -ERESTARTNOINTR:
   339		case -ERESTARTNOHAND:
   340		case -ERESTART_RESTARTBLOCK:
   341			/* There's no easy way to restart the syscall since other AIO's
   342			 * may be already running. Just fail this IO with EINTR.
   343			 */
   344			ret = -EINTR;
   345			fallthrough;
   346		default:
   347			ki->was_async = false;
   348			cachefiles_write_complete(&ki->iocb, ret);
   349			if (ret > 0)
   350				ret = 0;
   351			break;
   352		}
   353	
   354	in_progress:
   355		cachefiles_put_kiocb(ki);
   356		_leave(" = %zd", ret);
   357		return ret;
   358	}
   359	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
