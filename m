Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1714373F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475170; cv=none; b=USQLr2sN9+MucONK0U0wQFyvHpuqrPTrRZXQTh15W2cEM6nO3oHedfOgB4t8SAL4x5MHssElB0hDuW2hxdntue5W6BG0ky7CvYyUHu5IMYWNOnKcTdCml6FIuQ8vPsBYsigPb5YEBS0MQxVvHRzyagj26x6LyjjnxUlYQmHCys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475170; c=relaxed/simple;
	bh=t6Ad8Ti8wo03YAmFVqMGXXfJ39s3n0CmGMPmIzl6TN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tBGR+AapLTI6J45OfJ6WPEvoKTOjdOM9jIxba+q/pTnAF3EXz8XjhtWoNKHJQ1tTfu8S+KnTL6DC2GxzO+8ptsBnLhb5vLKIq6mT7VmxRfxSDk+J4pKZyANRol8cZHsoBpac97wJwSefBd/LaV2v9KOWceDl29/2iR8oCtp73Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfcYcKzu; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfcYcKzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726475167; x=1758011167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t6Ad8Ti8wo03YAmFVqMGXXfJ39s3n0CmGMPmIzl6TN4=;
  b=gfcYcKzuFzSN2nef8AbETAzBkhnsYbnRzpsKO4LMR+SROhXqMy+jCVut
   dJBwe42yYLF44A9R4OwXBwijrMQ0UmZWBszNjVNEgwyZ/83Yvid8FAoIV
   Y8Me8igW14PTz1bs8tiIOT9iK3fq86+XsecwVFVbk6MHV1Vwc7yBfiIGl
   zwVuH5uhypY1hgOS2GKhmWZQ/32SY3YQM4DOyN6UQ571njRB/mC7OLgI2
   qhU1sW3qe+/EKh1CMW9oOze9zstuuN3uknvDysCh74Cf07WR5oYlYd7Ny
   x/uYM748qRzVo37Otw1jHwVcPIgRBczL8ol2Rb/NS0uQLHGNTsEpSlK2I
   A==;
X-CSE-ConnectionGUID: nD7wAWr7S9e0Ze1aUzck3A==
X-CSE-MsgGUID: Mw50kHCxSXa8RFQQ/XXvNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="29041091"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="29041091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 01:26:07 -0700
X-CSE-ConnectionGUID: UISSX7C0ReSDGC8gFc33hQ==
X-CSE-MsgGUID: rC+hp45FR62oDGjqKpp5Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73797178"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Sep 2024 01:26:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq73a-0009Ym-3C;
	Mon, 16 Sep 2024 08:26:02 +0000
Date: Mon, 16 Sep 2024 16:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16489/23714]
 drivers/md/bcache/acache.c:29:5: sparse: sparse: symbol
 'acache_prefetch_workers' was not declared. Should it be static?
Message-ID: <202409161647.o9SQbpWe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 1c09f1b02db96b8277226cbe64fe5bbd185a7149 [16489/23714] bcache: add a framework to perform prefetch
config: x86_64-randconfig-123-20240915 (https://download.01.org/0day-ci/archive/20240916/202409161647.o9SQbpWe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161647.o9SQbpWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161647.o9SQbpWe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/bcache/acache.c:29:5: sparse: sparse: symbol 'acache_prefetch_workers' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:65:5: sparse: sparse: symbol 'acache_open' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:83:5: sparse: sparse: symbol 'acache_release' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:89:9: sparse: sparse: symbol 'read_circ_slice' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:224:6: sparse: sparse: symbol 'init_acache_circ' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:253:5: sparse: sparse: symbol 'acache_prefetch_init' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:401:19: sparse: sparse: symbol 'get_cached_device_by_dev' was not declared. Should it be static?
>> drivers/md/bcache/acache.c:414:12: sparse: sparse: symbol 'get_bio_by_item' was not declared. Should it be static?
   drivers/md/bcache/acache.c:65:5: warning: no previous prototype for 'acache_open' [-Wmissing-prototypes]
      65 | int acache_open(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~
   drivers/md/bcache/acache.c:83:5: warning: no previous prototype for 'acache_release' [-Wmissing-prototypes]
      83 | int acache_release(struct inode *inode, struct file *filp)
         |     ^~~~~~~~~~~~~~
   drivers/md/bcache/acache.c:89:9: warning: no previous prototype for 'read_circ_slice' [-Wmissing-prototypes]
      89 | ssize_t read_circ_slice(struct acache_circ *circ, struct acache_info *buf,
         |         ^~~~~~~~~~~~~~~
   drivers/md/bcache/acache.c:224:6: warning: no previous prototype for 'init_acache_circ' [-Wmissing-prototypes]
     224 | void init_acache_circ(struct acache_circ **circ, void *startaddr)
         |      ^~~~~~~~~~~~~~~~
   drivers/md/bcache/acache.c:253:5: warning: no previous prototype for 'acache_prefetch_init' [-Wmissing-prototypes]
     253 | int acache_prefetch_init(struct acache_device *adev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/acache.c:401:20: warning: no previous prototype for 'get_cached_device_by_dev' [-Wmissing-prototypes]
     401 | struct cached_dev *get_cached_device_by_dev(dev_t dev)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/acache.c:414:13: warning: no previous prototype for 'get_bio_by_item' [-Wmissing-prototypes]
     414 | struct bio *get_bio_by_item(struct cached_dev *dc, struct acache_info *item)
         |             ^~~~~~~~~~~~~~~

vim +/acache_prefetch_workers +29 drivers/md/bcache/acache.c

    28	
  > 29	int acache_prefetch_workers = 1000;
    30	
    31	module_param_named(prefetch_workers, acache_prefetch_workers, int, 0444);
    32	MODULE_PARM_DESC(prefetch_workers, "num of workers for processing prefetch requests");
    33	
    34	struct prefetch_worker {
    35		struct acache_info s;
    36		struct work_struct work;
    37		struct list_head list;
    38	};
    39	
    40	struct acache_device {
    41		bool initialized;
    42	
    43		dev_t devno;
    44		struct cdev cdev;
    45		struct class *class;
    46		struct mem_reg *mem_regionp;
    47	
    48		struct acache_info *readbuf;
    49		struct acache_info *writebuf;
    50	
    51		struct acache_circ *acache_info_circ;
    52	
    53		struct workqueue_struct *wq;
    54		struct prefetch_worker *prefetch_workers;
    55		struct list_head prefetch_workers_free;
    56		spinlock_t prefetch_workers_free_list_lock;
    57	} adev;
    58	
    59	#define MAX_TRANSFER_SIZE (1024 * 1024)
    60	
    61	static atomic_t acache_opened_dev = ATOMIC_INIT(0);
    62	static struct acache_metadata metadata;
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
