Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18312E40
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 05:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707801203; cv=none; b=l5HbzQHO4r9nXhcJGd/F33iYXExi6/RntATsl4xxb6eCFdHyegzgPreUta9Kztitv6vVJZLReHciMLyM7h+cQyORRN/wSuURa9ZfEXkYSnRvvDfknXM0CCX4Ij//cwoTGCCOq/A2I5whYgSiJ2WuzqrXIvUh/fUFhhx7YbLMyr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707801203; c=relaxed/simple;
	bh=ma5rHKmACxERt8jqn/pClkIdvnQrNDvvk8rPx0YQD1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brS8x65FDwyvFfcoARLCfKwbvNcJ0RYiCzT8b8MX1wrfQW7ZrR8/gqcyM6PHD8KNExm6ZQolltwPqGgI4UFYyewkMZVVdlAHk9SNge5AHldtXvqKgcbSNRJBErWymZgsOm++9MKUsoviX0q9MOMGeMdhk2oahMEiF3b8MiUdtso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMrAoLPc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMrAoLPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707801201; x=1739337201;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ma5rHKmACxERt8jqn/pClkIdvnQrNDvvk8rPx0YQD1k=;
  b=jMrAoLPc1eNuckegjcdOtXTWaaemW8AySoI4zfd1zFt1NcrztgXoAFd0
   bVuiX815R+yqA+yaMMF8CxPrI8/r0KkFWzfW+O4xrZPnIzCizbvA/+G/F
   6W3oXlliDGAB7fg9jk5s/AZ24d4B4foHylBSrDUjGfa3H0rhxKEI3T2jK
   SuFo4ExYdOHFCaXPGmqKgDg/OsS+cyBCywQgko65IjDcMZQJiCZU563ix
   PGbR3dObirdD9CyajEoqrTHM0HsXhW+oc2Bs39rcsq08nbAYgnBmg8xF6
   1SZUD7bACq3v805rDqJoo4u0x8wwR3U9vT5i3rl7Ga3XPZvN+27gOAxez
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1652387"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1652387"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 21:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2732881"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2024 21:13:18 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZl6a-0007X4-1n;
	Tue, 13 Feb 2024 05:13:16 +0000
Date: Tue, 13 Feb 2024 13:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5601/6082] drivers/md/dm.c:2131:undefined
 reference to `set_dax_nocache'
Message-ID: <202402131351.a0FZOgEG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae00c445390b349e070a64dc62f08aa878db7248
commit: 9af4599a77df42dba7f32c76a97a19f5703f44b7 [5601/6082] dm: cleanup alloc_dax() error handling
config: openrisc-randconfig-r011-20221209 (https://download.01.org/0day-ci/archive/20240213/202402131351.a0FZOgEG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131351.a0FZOgEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131351.a0FZOgEG-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/md/dm.o: in function `alloc_dev':
>> drivers/md/dm.c:2131:(.text+0x9f34): undefined reference to `set_dax_nocache'
>> drivers/md/dm.c:2131:(.text+0x9f34): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `set_dax_nocache'
>> or1k-linux-ld: drivers/md/dm.c:2132:(.text+0x9f3c): undefined reference to `set_dax_nomc'
>> drivers/md/dm.c:2132:(.text+0x9f3c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `set_dax_nomc'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +2131 drivers/md/dm.c

0f20972f7bf692 Mike Snitzer       2015-04-28  2050  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2051  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  2052   * Allocate and initialise a blank device with a given minor.
^1da177e4c3f41 Linus Torvalds     2005-04-16  2053   */
2b06cfff12f0f8 Alasdair G Kergon  2006-06-26  2054  static struct mapped_device *alloc_dev(int minor)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2055  {
115485e83f497f Mike Snitzer       2016-02-22  2056  	int r, numa_node_id = dm_get_numa_node();
c56346d999fb42 Mathieu Desnoyers  2024-02-08  2057  	struct dax_device *dax_dev;
115485e83f497f Mike Snitzer       2016-02-22  2058  	struct mapped_device *md;
ba61fdd17d73dd Jeff Mahoney       2006-06-26  2059  	void *old_md;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2060  
856eb0916d181d Mikulas Patocka    2017-10-31  2061  	md = kvzalloc_node(sizeof(*md), GFP_KERNEL, numa_node_id);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2062  	if (!md) {
43e6c111824c75 Mikulas Patocka    2022-08-24  2063  		DMERR("unable to allocate device, out of memory.");
^1da177e4c3f41 Linus Torvalds     2005-04-16  2064  		return NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2065  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2066  
10da4f795f965f Jeff Mahoney       2006-06-26  2067  	if (!try_module_get(THIS_MODULE))
6ed7ade89657e7 Milan Broz         2008-02-08  2068  		goto bad_module_get;
10da4f795f965f Jeff Mahoney       2006-06-26  2069  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2070  	/* get a minor number for the dev */
2b06cfff12f0f8 Alasdair G Kergon  2006-06-26  2071  	if (minor == DM_ANY_MINOR)
cf13ab8e02d452 Frederik Deweerdt  2008-04-24  2072  		r = next_free_minor(&minor);
2b06cfff12f0f8 Alasdair G Kergon  2006-06-26  2073  	else
cf13ab8e02d452 Frederik Deweerdt  2008-04-24  2074  		r = specific_minor(minor);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2075  	if (r < 0)
6ed7ade89657e7 Milan Broz         2008-02-08  2076  		goto bad_minor;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2077  
83d5e5b0af907d Mikulas Patocka    2013-07-10  2078  	r = init_srcu_struct(&md->io_barrier);
83d5e5b0af907d Mikulas Patocka    2013-07-10  2079  	if (r < 0)
83d5e5b0af907d Mikulas Patocka    2013-07-10  2080  		goto bad_io_barrier;
83d5e5b0af907d Mikulas Patocka    2013-07-10  2081  
115485e83f497f Mike Snitzer       2016-02-22  2082  	md->numa_node_id = numa_node_id;
591ddcfc4bfad2 Mike Snitzer       2016-01-31  2083  	md->init_tio_pdu = false;
a5664dad7e1a27 Mike Snitzer       2010-08-12  2084  	md->type = DM_TYPE_NONE;
e61290a4a23c3f Daniel Walker      2008-02-08  2085  	mutex_init(&md->suspend_lock);
a5664dad7e1a27 Mike Snitzer       2010-08-12  2086  	mutex_init(&md->type_lock);
86f1152b117a40 Benjamin Marzinski 2014-08-13  2087  	mutex_init(&md->table_devices_lock);
022c261100e156 Mikulas Patocka    2009-04-02  2088  	spin_lock_init(&md->deferred_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2089  	atomic_set(&md->holders, 1);
5c6bd75d06db51 Alasdair G Kergon  2006-06-26  2090  	atomic_set(&md->open_count, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2091  	atomic_set(&md->event_nr, 0);
7a8c3d3b928837 Mike Anderson      2007-10-19  2092  	atomic_set(&md->uevent_seq, 0);
7a8c3d3b928837 Mike Anderson      2007-10-19  2093  	INIT_LIST_HEAD(&md->uevent_list);
86f1152b117a40 Benjamin Marzinski 2014-08-13  2094  	INIT_LIST_HEAD(&md->table_devices);
7a8c3d3b928837 Mike Anderson      2007-10-19  2095  	spin_lock_init(&md->uevent_lock);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2096  
47ace7e012b9f7 Mike Snitzer       2020-01-27  2097  	/*
c62b37d96b6eb3 Christoph Hellwig  2020-07-01  2098  	 * default to bio-based until DM table is loaded and md->type
c62b37d96b6eb3 Christoph Hellwig  2020-07-01  2099  	 * established. If request-based table is loaded: blk-mq will
c62b37d96b6eb3 Christoph Hellwig  2020-07-01  2100  	 * override accordingly.
47ace7e012b9f7 Mike Snitzer       2020-01-27  2101  	 */
74fe6ba9239497 Christoph Hellwig  2021-05-21  2102  	md->disk = blk_alloc_disk(md->numa_node_id);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2103  	if (!md->disk)
0f20972f7bf692 Mike Snitzer       2015-04-28  2104  		goto bad;
74fe6ba9239497 Christoph Hellwig  2021-05-21  2105  	md->queue = md->disk->queue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2106  
f0b04115368ff3 Jeff Mahoney       2006-06-26  2107  	init_waitqueue_head(&md->wait);
53d5914f288b67 Mikulas Patocka    2009-04-02  2108  	INIT_WORK(&md->work, dm_wq_work);
8b211aaccb915b Ming Lei           2022-06-24  2109  	INIT_WORK(&md->requeue_work, dm_wq_requeue_work);
f0b04115368ff3 Jeff Mahoney       2006-06-26  2110  	init_waitqueue_head(&md->eventq);
2995fa78e423d7 Mikulas Patocka    2014-01-13  2111  	init_completion(&md->kobj_holder.completion);
f0b04115368ff3 Jeff Mahoney       2006-06-26  2112  
8b211aaccb915b Ming Lei           2022-06-24  2113  	md->requeue_list = NULL;
a666e5c05e7c4a Mikulas Patocka    2021-02-10  2114  	md->swap_bios = get_swap_bios();
a666e5c05e7c4a Mikulas Patocka    2021-02-10  2115  	sema_init(&md->swap_bios_semaphore, md->swap_bios);
a666e5c05e7c4a Mikulas Patocka    2021-02-10  2116  	mutex_init(&md->swap_bios_lock);
a666e5c05e7c4a Mikulas Patocka    2021-02-10  2117  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2118  	md->disk->major = _major;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2119  	md->disk->first_minor = minor;
74fe6ba9239497 Christoph Hellwig  2021-05-21  2120  	md->disk->minors = 1;
1ebe2e5f9d68e9 Christoph Hellwig  2021-11-22  2121  	md->disk->flags |= GENHD_FL_NO_PART;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2122  	md->disk->fops = &dm_blk_dops;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2123  	md->disk->private_data = md;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2124  	sprintf(md->disk->disk_name, "dm-%d", minor);
f26c5719b2d7b0 Dan Williams       2017-04-12  2125  
c56346d999fb42 Mathieu Desnoyers  2024-02-08  2126  	dax_dev = alloc_dax(md, &dm_dax_ops);
9af4599a77df42 Mathieu Desnoyers  2024-02-08  2127  	if (IS_ERR(dax_dev)) {
9af4599a77df42 Mathieu Desnoyers  2024-02-08  2128  		if (PTR_ERR(dax_dev) != -EOPNOTSUPP)
f26c5719b2d7b0 Dan Williams       2017-04-12  2129  			goto bad;
c56346d999fb42 Mathieu Desnoyers  2024-02-08  2130  	} else {
c56346d999fb42 Mathieu Desnoyers  2024-02-08 @2131  		set_dax_nocache(dax_dev);
c56346d999fb42 Mathieu Desnoyers  2024-02-08 @2132  		set_dax_nomc(dax_dev);
c56346d999fb42 Mathieu Desnoyers  2024-02-08  2133  		md->dax_dev = dax_dev;
c56346d999fb42 Mathieu Desnoyers  2024-02-08  2134  		if (dax_add_host(dax_dev, md->disk))
f26c5719b2d7b0 Dan Williams       2017-04-12  2135  			goto bad;
976431b02c2ef9 Dan Williams       2018-03-29  2136  	}
f26c5719b2d7b0 Dan Williams       2017-04-12  2137  
7e51f257e87297 Mike Anderson      2006-03-27  2138  	format_dev_t(md->name, MKDEV(_major, minor));
^1da177e4c3f41 Linus Torvalds     2005-04-16  2139  
c7c879eedc02a9 Michał Mirosław    2021-10-21  2140  	md->wq = alloc_workqueue("kdmflush/%s", WQ_MEM_RECLAIM, 0, md->name);
304f3f6a583013 Milan Broz         2008-02-08  2141  	if (!md->wq)
0f20972f7bf692 Mike Snitzer       2015-04-28  2142  		goto bad;
304f3f6a583013 Milan Broz         2008-02-08  2143  
9f6dc633761006 Mike Snitzer       2022-02-17  2144  	md->pending_io = alloc_percpu(unsigned long);
9f6dc633761006 Mike Snitzer       2022-02-17  2145  	if (!md->pending_io)
9f6dc633761006 Mike Snitzer       2022-02-17  2146  		goto bad;
9f6dc633761006 Mike Snitzer       2022-02-17  2147  
d3aa3e060c4a80 Jiasheng Jiang     2023-03-16  2148  	r = dm_stats_init(&md->stats);
d3aa3e060c4a80 Jiasheng Jiang     2023-03-16  2149  	if (r < 0)
d3aa3e060c4a80 Jiasheng Jiang     2023-03-16  2150  		goto bad;
fd2ed4d252701d Mikulas Patocka    2013-08-16  2151  
ba61fdd17d73dd Jeff Mahoney       2006-06-26  2152  	/* Populate the mapping, nobody knows we exist yet */
f32c10b09940cf Jeff Mahoney       2006-06-26  2153  	spin_lock(&_minor_lock);
ba61fdd17d73dd Jeff Mahoney       2006-06-26  2154  	old_md = idr_replace(&_minor_idr, md, minor);
f32c10b09940cf Jeff Mahoney       2006-06-26  2155  	spin_unlock(&_minor_lock);
ba61fdd17d73dd Jeff Mahoney       2006-06-26  2156  
ba61fdd17d73dd Jeff Mahoney       2006-06-26  2157  	BUG_ON(old_md != MINOR_ALLOCED);
ba61fdd17d73dd Jeff Mahoney       2006-06-26  2158  
^1da177e4c3f41 Linus Torvalds     2005-04-16  2159  	return md;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2160  
0f20972f7bf692 Mike Snitzer       2015-04-28  2161  bad:
0f20972f7bf692 Mike Snitzer       2015-04-28  2162  	cleanup_mapped_device(md);
83d5e5b0af907d Mikulas Patocka    2013-07-10  2163  bad_io_barrier:
^1da177e4c3f41 Linus Torvalds     2005-04-16  2164  	free_minor(minor);
6ed7ade89657e7 Milan Broz         2008-02-08  2165  bad_minor:
10da4f795f965f Jeff Mahoney       2006-06-26  2166  	module_put(THIS_MODULE);
6ed7ade89657e7 Milan Broz         2008-02-08  2167  bad_module_get:
856eb0916d181d Mikulas Patocka    2017-10-31  2168  	kvfree(md);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2169  	return NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2170  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  2171  

:::::: The code at line 2131 was first introduced by commit
:::::: c56346d999fb4289301da112f5dbd409dc405f53 dm: treat alloc_dax() -EOPNOTSUPP failure as non-fatal

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
