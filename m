Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3143A2040BF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 05:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754370912; cv=none; b=V5D1uga0ezDsLWwjEK0ttHeomEX90iTjHuYMFpp1FCwSEfe907c/zDgCVu70cxMS2ljkRZ4NWD2DC6upylmd6HA3LN02JHJw5P46ziyhm9jXnSPY3GY/y61BmmubzqROG+eTeZ8zJAOOrhYMrj2323TWaAPt91nI9YwXc1II+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754370912; c=relaxed/simple;
	bh=pcMBhr3yxUtWXTmGlJdGSyqdDId2bM8y6c0oxwYaVlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yd4v+AYW7NG4AnITk3VFSFuHsahPVzM5pF5gQ7HhNl8if8CxPk89CL/Z4iCC5japVasrmn5Kkkej38elzYj+ZzU7yuB1qZbiJMSkMBg20lL2RJAeLAYyFGGSTDsIGBKj1HiQEbDJzTw4Wq64Tzkw1O3o+z/x2SgtVgNle0BjUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOpyJNAK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOpyJNAK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754370909; x=1785906909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pcMBhr3yxUtWXTmGlJdGSyqdDId2bM8y6c0oxwYaVlk=;
  b=jOpyJNAK79QcQheAyAx4s6eXxb0AP0hRyK8QSE5Zd9MiHW0+hLson9QM
   amE+mYgFC3uUlX4OZ8d8t1N0MW2N0bQW+LMRTYxBmiCUw3J00YaAoc6B5
   GArFd2e4o1vvIytED6w9aXoZPTy3dao0JLxwZPq2lr+b7k73ZR68wehvO
   o7uBvz0wYDv4KaqNuBzQxT0D+4XG4tfy5fXvbQUzGlZU0LTJAgRLE0yra
   wzzoA4TFYjbPTqci+dSSL7cXVS4mVIULfa+7sezIrlv1HA25Y4WPlu8mm
   +6y9ejI72zbSBzlM8hEd1FYcvFd4VWR89Xq8mTBHdx805FBEtVgNYxSFJ
   g==;
X-CSE-ConnectionGUID: 0buFxaCYQZS7JnxJxNMxwA==
X-CSE-MsgGUID: RKVZsaRbTpyASW37VJ0x2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55860432"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="55860432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 22:15:08 -0700
X-CSE-ConnectionGUID: fkY8VoK4RYaeBZBZQUhoag==
X-CSE-MsgGUID: ZxNbsOssRr2VAMDNWJyBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="164797782"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2025 22:15:07 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujA0u-0001wZ-2E;
	Tue, 05 Aug 2025 05:15:04 +0000
Date: Tue, 5 Aug 2025 07:14:52 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 drivers/md/bcache/acache.c:65:5: warning: no previous prototype for
 'acache_open'
Message-ID: <202508050735.PtzXJY7a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   cea2d27f02854c9aba193ad093f873bbda55f449
commit: 1c09f1b02db96b8277226cbe64fe5bbd185a7149 [1743/1743] bcache: add a framework to perform prefetch
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508050735.PtzXJY7a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050735.PtzXJY7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050735.PtzXJY7a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/bcache/acache.c:65:5: warning: no previous prototype for 'acache_open' [-Wmissing-prototypes]
      65 | int acache_open(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~
>> drivers/md/bcache/acache.c:83:5: warning: no previous prototype for 'acache_release' [-Wmissing-prototypes]
      83 | int acache_release(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~~~~
>> drivers/md/bcache/acache.c:89:9: warning: no previous prototype for 'read_circ_slice' [-Wmissing-prototypes]
      89 | ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
         |         ^~~~~~~~~~~~~~~
>> drivers/md/bcache/acache.c:224:6: warning: no previous prototype for 'init_acache_circ' [-Wmissing-prototypes]
     224 | void init_acache_circ(struct acache_circ **circ, void *startaddr)
         |      ^~~~~~~~~~~~~~~~
>> drivers/md/bcache/acache.c:253:5: warning: no previous prototype for 'acache_prefetch_init' [-Wmissing-prototypes]
     253 | int acache_prefetch_init(struct acache_device *adev)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/acache.c:401:20: warning: no previous prototype for 'get_cached_device_by_dev' [-Wmissing-prototypes]
     401 | struct cached_dev *get_cached_device_by_dev(dev_t dev)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/md/bcache/acache.c:414:13: warning: no previous prototype for 'get_bio_by_item' [-Wmissing-prototypes]
     414 | struct bio *get_bio_by_item(struct cached_dev *dc, struct acache_info *item)
         |             ^~~~~~~~~~~~~~~


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
  > 89	ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
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
