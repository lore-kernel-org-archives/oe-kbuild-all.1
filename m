Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165F21C3F36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656983; cv=none; b=Y6i4bdJK0735iJkrwG9AiHpV1qV/krgE6hjLzoojWXo/hzpRWHgJYarr4BEFEK6wCw7RlQh+FbrRiP19LVnu6Rq1khP5nJe/qKqp275A4rXZSsfRT9k14xShkHvDGIDiNehUl4kNdIyYXH2DGPZKsawjaiZG3/cjcjR4d8qHzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656983; c=relaxed/simple;
	bh=9AyLQfe7AcD0UgcglDG2VWOzHl+tNdLZovqGKU8R8Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmQi+ITDAVHgoYWnGUVtSxBJwNVkWpgcZ63/tanMKRMOiyh9MeFhWAUuRaD4q5D4WDU5KdYZF/93fU6XiDeU3ypEvhlgeGeN+IZq7zsRnf6pitvmznMs6s4ORDOzhYMN8yQE/j41nsffEBUC0LIVuK2c7V2aGcZl8bQrr52cv4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVJIDo+m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVJIDo+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765656981; x=1797192981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AyLQfe7AcD0UgcglDG2VWOzHl+tNdLZovqGKU8R8Fg=;
  b=XVJIDo+mm4+s4auy340fA8yuGuJV695iaI2Z/NxLNmhfepBN4xqsNFqf
   2FIXyNjijrR2Rv0nqRSlDgH60bmxi3oEgA9In66z5YOfnXdhzaF6Unm3U
   q6OjJq0kL0TY5UtfzxPU+yhYCwbsp6qjzCjx2qRme2A48Rh4N01+jd9lo
   JKUATiQYyA+RyHZzxhTDwj00XNFy/BsChp4cSw6/82rHYt18ldSBOYJpO
   fdwv2zQjjQuJxs90LaOojfUocvV2ltdcIMJaNa4kZBoNdbd8D6+PCowj2
   gHE90rJAdkrHZjD4Pk/sSUCBiveVlhPcUQW136Z18F25vweRePLT9maC2
   Q==;
X-CSE-ConnectionGUID: AGYcCZu8RfGut8mFY1/Wdg==
X-CSE-MsgGUID: QLKVO92STLGFHH1cuztEfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78325514"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78325514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:16:20 -0800
X-CSE-ConnectionGUID: b6TKk1pMTcS9YL9SBwn5ow==
X-CSE-MsgGUID: XeJfQ1B3QEOmAQ2EuS5Uiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197363926"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 12:16:19 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUW2K-000000008A1-2IJs;
	Sat, 13 Dec 2025 20:16:16 +0000
Date: Sun, 14 Dec 2025 04:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/md/bcache/acache.c:65:5: warning: no previous prototype for function
 'acache_open'
Message-ID: <202512140431.6ZelE1lA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 1c09f1b02db96b8277226cbe64fe5bbd185a7149 [1942/1942] bcache: add a framework to perform prefetch
config: x86_64-randconfig-006-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140431.6ZelE1lA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140431.6ZelE1lA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140431.6ZelE1lA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/md/bcache/acache.c:65:5: warning: no previous prototype for function 'acache_open' [-Wmissing-prototypes]
      65 | int acache_open(struct inode *inode, struct file *filp)
         |     ^
   drivers/md/bcache/acache.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      65 | int acache_open(struct inode *inode, struct file *filp)
         | ^
         | static 
>> drivers/md/bcache/acache.c:83:5: warning: no previous prototype for function 'acache_release' [-Wmissing-prototypes]
      83 | int acache_release(struct inode *inode, struct file *filp)
         |     ^
   drivers/md/bcache/acache.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | int acache_release(struct inode *inode, struct file *filp)
         | ^
         | static 
   drivers/md/bcache/acache.c:89:9: warning: no previous prototype for function 'read_circ_slice' [-Wmissing-prototypes]
      89 | ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
         |         ^
   drivers/md/bcache/acache.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
         | ^
         | static 
>> drivers/md/bcache/acache.c:224:6: warning: no previous prototype for function 'init_acache_circ' [-Wmissing-prototypes]
     224 | void init_acache_circ(struct acache_circ **circ, void *startaddr)
         |      ^
   drivers/md/bcache/acache.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     224 | void init_acache_circ(struct acache_circ **circ, void *startaddr)
         | ^
         | static 
>> drivers/md/bcache/acache.c:253:5: warning: no previous prototype for function 'acache_prefetch_init' [-Wmissing-prototypes]
     253 | int acache_prefetch_init(struct acache_device *adev)
         |     ^
   drivers/md/bcache/acache.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     253 | int acache_prefetch_init(struct acache_device *adev)
         | ^
         | static 
   drivers/md/bcache/acache.c:401:20: warning: no previous prototype for function 'get_cached_device_by_dev' [-Wmissing-prototypes]
     401 | struct cached_dev *get_cached_device_by_dev(dev_t dev)
         |                    ^
   drivers/md/bcache/acache.c:401:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     401 | struct cached_dev *get_cached_device_by_dev(dev_t dev)
         | ^
         | static 
>> drivers/md/bcache/acache.c:414:13: warning: no previous prototype for function 'get_bio_by_item' [-Wmissing-prototypes]
     414 | struct bio *get_bio_by_item(struct cached_dev *dc, struct acache_info *item)
         |             ^
   drivers/md/bcache/acache.c:414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     414 | struct bio *get_bio_by_item(struct cached_dev *dc, struct acache_info *item)
         | ^
         | static 
   8 warnings generated.


vim +/acache_open +65 drivers/md/bcache/acache.c

    63	
    64	
  > 65	int acache_open(struct inode *inode, struct file *filp)
    66	{
    67		struct mem_reg *dev;
    68	
    69		int minor = MINOR(inode->i_rdev);
    70	
    71		if (minor >= ACACHE_NR_DEVS)
    72			return -ENODEV;
    73		if (atomic_xchg(&acache_opened_dev, 1))
    74			return -EPERM;
    75	
    76		dev = &adev.mem_regionp[minor];
    77	
    78		filp->private_data = dev;
    79	
    80		return 0;
    81	}
    82	
  > 83	int acache_release(struct inode *inode, struct file *filp)
    84	{
    85		atomic_dec(&acache_opened_dev);
    86		return 0;
    87	}
    88	
    89	ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
    90				size_t size)
    91	{
    92		unsigned long first, todo, flags;
    93	
    94		spin_lock_irqsave(&circ->lock, flags);
    95	
    96		todo = CIRC_CNT(circ->head, circ->tail, circ->size);
    97		if (todo == 0) {
    98			spin_unlock_irqrestore(&circ->lock, flags);
    99			return 0;
   100		}
   101		if (todo > size / sizeof(struct acache_info))
   102			todo = size / sizeof(struct acache_info);
   103	
   104		first = CIRC_CNT_TO_END(circ->head, circ->tail, circ->size);
   105		if (first > todo)
   106			first = todo;
   107	
   108		memcpy(buf, circ->data + circ->tail, first * sizeof(struct acache_info));
   109		if (first < todo)
   110			memcpy(buf + first, circ->data,
   111			       (todo - first) * sizeof(struct acache_info));
   112		circ->tail = (circ->tail + todo) & (circ->size - 1);
   113	
   114		spin_unlock_irqrestore(&circ->lock, flags);
   115		return todo * sizeof(struct acache_info);
   116	}
   117	
   118	static ssize_t acache_read(struct file *filp, char __user *buf,
   119				   size_t size, loff_t *ppos)
   120	{
   121		long ret, cut;
   122	
   123		if (metadata.conntype != ACACHE_READWRITE_CONN)
   124			return -EINVAL;
   125	
   126		if (size > MAX_TRANSFER_SIZE)
   127			size = MAX_TRANSFER_SIZE;
   128	
   129		ret = read_circ_slice(adev.acache_info_circ, adev.readbuf, size);
   130		if (ret <= 0)
   131			return ret;
   132	
   133		cut = copy_to_user(buf, adev.readbuf, size);
   134		return ret - cut;
   135	}
   136	
   137	int process_one_request(struct acache_info *item);
   138	static void prefetch_worker_func(struct work_struct *work)
   139	{
   140		struct prefetch_worker *sw =
   141		    container_of(work, struct prefetch_worker, work);
   142	
   143		process_one_request(&sw->s);
   144		spin_lock(&adev.prefetch_workers_free_list_lock);
   145		list_add_tail(&sw->list, &adev.prefetch_workers_free);
   146		spin_unlock(&adev.prefetch_workers_free_list_lock);
   147	}
   148	
   149	static int queue_prefetch_item(struct acache_info *s)
   150	{
   151		struct prefetch_worker *sw;
   152	
   153		spin_lock(&adev.prefetch_workers_free_list_lock);
   154		sw = list_first_entry_or_null(&adev.prefetch_workers_free,
   155					      struct prefetch_worker, list);
   156		if (!sw) {
   157			spin_unlock(&adev.prefetch_workers_free_list_lock);
   158			return -1;
   159		}
   160		list_del_init(&sw->list);
   161		spin_unlock(&adev.prefetch_workers_free_list_lock);
   162	
   163		memcpy(&sw->s, s, sizeof(struct acache_info));
   164		INIT_WORK(&sw->work, prefetch_worker_func);
   165		queue_work(adev.wq, &sw->work);
   166		return 0;
   167	}
   168	
   169	static ssize_t acache_write(struct file *filp, const char __user *buf,
   170				    size_t size, loff_t *ppos)
   171	{
   172		long cut;
   173		int i;
   174	
   175		if (metadata.conntype != ACACHE_READWRITE_CONN)
   176			return -EINVAL;
   177	
   178		if (size > MAX_TRANSFER_SIZE)
   179			size = MAX_TRANSFER_SIZE;
   180	
   181		cut = copy_from_user(adev.writebuf, buf, size);
   182		for (i = 0; i < (size - cut) / sizeof(struct acache_info); i++) {
   183			if (queue_prefetch_item(adev.writebuf + i))
   184				break;
   185		}
   186		return i * sizeof(struct acache_info);
   187	}
   188	
   189	static long acache_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
   190	{
   191		switch (cmd) {
   192		case ACACHE_GET_METADATA:
   193			return copy_to_user((struct acache_metadata __user *)arg,
   194					    &metadata, sizeof(struct acache_metadata));
   195		default:
   196			return -EINVAL;
   197		}
   198	}
   199	
   200	static const struct file_operations acache_fops = {
   201		.owner = THIS_MODULE,
   202		.read = acache_read,
   203		.write = acache_write,
   204		.open = acache_open,
   205		.release = acache_release,
   206		.unlocked_ioctl = acache_ioctl,
   207	};
   208	
   209	void save_circ_item(struct acache_info *data)
   210	{
   211		unsigned long flags;
   212		struct acache_circ *circ = adev.acache_info_circ;
   213	
   214		spin_lock_irqsave(&circ->lock, flags);
   215		if (CIRC_SPACE(circ->head, circ->tail, circ->size) >= 1) {
   216			memcpy(&circ->data[circ->head], data, sizeof(struct acache_info));
   217			circ->head = (circ->head + 1) & (circ->size - 1);
   218		} else {
   219			pr_debug("ringbuffer is full; discard new request.");
   220		}
   221		spin_unlock_irqrestore(&circ->lock, flags);
   222	}
   223	
 > 224	void init_acache_circ(struct acache_circ **circ, void *startaddr)
   225	{
   226		*circ = (struct acache_circ *)startaddr;
   227		(*circ)->head = 0;
   228		(*circ)->tail = 0;
   229		(*circ)->size = ACACHE_CIRC_SIZE;
   230		spin_lock_init(&(*circ)->lock);
   231	}
   232	
   233	static void acache_free_mem(void)
   234	{
   235		int i;
   236	
   237		for (i = 0; i < ACACHE_NR_DEVS; i++)
   238			vfree(adev.mem_regionp[i].data);
   239	
   240		if (adev.readbuf) {
   241			vfree(adev.readbuf);
   242			adev.readbuf = NULL;
   243		}
   244		if (adev.writebuf) {
   245			vfree(adev.writebuf);
   246			adev.writebuf = NULL;
   247		}
   248	
   249		kfree(adev.prefetch_workers);
   250		adev.prefetch_workers = NULL;
   251	}
   252	
 > 253	int acache_prefetch_init(struct acache_device *adev)
   254	{
   255		int i;
   256	
   257		if (acache_prefetch_workers <= 0) {
   258			pr_err("acache_dev_size should not be less than zero");
   259			return -1;
   260		}
   261		adev->prefetch_workers = kmalloc_array(acache_prefetch_workers,
   262						       sizeof(struct prefetch_worker),
   263						       GFP_KERNEL);
   264		if (!adev->prefetch_workers)
   265			goto fail_prefetch_workers_alloc;
   266	
   267		INIT_LIST_HEAD(&adev->prefetch_workers_free);
   268		spin_lock_init(&adev->prefetch_workers_free_list_lock);
   269		for (i = 0; i < acache_prefetch_workers; i++) {
   270			spin_lock(&adev->prefetch_workers_free_list_lock);
   271			list_add_tail(&adev->prefetch_workers[i].list,
   272				      &adev->prefetch_workers_free);
   273			spin_unlock(&adev->prefetch_workers_free_list_lock);
   274		}
   275	
   276		adev->wq = alloc_workqueue("acache_prefetch", WQ_MEM_RECLAIM, 0);
   277		if (!adev->wq)
   278			goto fail_workqueue_alloc;
   279	
   280		return 0;
   281	
   282	fail_workqueue_alloc:
   283		kfree(adev->prefetch_workers);
   284		adev->prefetch_workers = NULL;
   285	fail_prefetch_workers_alloc:
   286		if (adev->wq)
   287			destroy_workqueue(adev->wq);
   288		return -1;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
