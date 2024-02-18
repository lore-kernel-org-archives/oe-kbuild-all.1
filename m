Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705672F50
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 05:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708235851; cv=none; b=ClDcNFkvdFsItQs6WeOed8tSFyIdWE0/7djYUrmjZB32gUXfXduO2jDuqvuar3TKtHt1AYmV7cupeVtIUMrBV4wTWqtUzcSLznxZe48KNjjh8vlnizj+85U+SvcXHYPzlcCt23xbQlsweeGsmatg1C2R5FZ/RMjD1ov2jeIca+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708235851; c=relaxed/simple;
	bh=bfGIWzNuRom3oCARREDh50beVFWRicVXiwocW00W1R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vnzy/vLgE6qBV1oAH+081MsrEdx/a6lQIvq7OBhjgMPufyPoJkaDzAAdgCwhz4H7+Ca7qGUq0aKySjdBbzqNMQwwwsGDvdGYQFytll6GthS6Roy7D3SPp+qbMJnTsy6T62az7Q+ee6uNreKkuJpUMu4eY836eeEb5ig7IV0k5to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyTDG66J; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyTDG66J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708235850; x=1739771850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bfGIWzNuRom3oCARREDh50beVFWRicVXiwocW00W1R8=;
  b=hyTDG66JielMFrDv2h1FW2PQQZGuQwy8OHG7jhvoUI3LxQmKCKzgx/UY
   HaA0IcAGTufML9e0FndTVDexd66TfhlI4P0qmuId+Hv5EhNN6ewQvJ1ia
   m0HcQ7n1ZocFqh6l6eF+RhV3d4i2B1UDVGUWrkHcCaQ/x8CIFIRUVQfZY
   FlZda3uKL0dxJQhPcKmyCkZt5y+b7OBpkkREGK7+9qI0KVyjt76OuADjc
   bqCRQs1IUQ55yUEUqiwY1xGlUYbQoFAK0cHImpDNWXMM4F4HJ0+RC1+Do
   eXaxixFbSj0kddjak2WBNlI+P7ai3LZNe1FP6fRW9ImMuHzGOoy7o/ZBV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="19754410"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="19754410"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 21:57:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="8801235"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2024 21:57:27 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbaB2-0002pa-2Y;
	Sun, 18 Feb 2024 05:57:24 +0000
Date: Sun, 18 Feb 2024 13:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 6950/7658]
 drivers/md/dm.c:2131:(.text.alloc_dev+0x6e4): undefined reference to
 `set_dax_nocache'
Message-ID: <202402181312.qjWYpOJA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: d888f6b0a7666bcbcf3ba7e0b4e9c695a07e9209 [6950/7658] dm: treat alloc_dax() -EOPNOTSUPP failure as non-fatal
config: powerpc-randconfig-r012-20220101 (https://download.01.org/0day-ci/archive/20240218/202402181312.qjWYpOJA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181312.qjWYpOJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181312.qjWYpOJA-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/md/dm.o: in function `alloc_dev':
>> drivers/md/dm.c:2131:(.text.alloc_dev+0x6e4): undefined reference to `set_dax_nocache'
>> powerpc-linux-ld: drivers/md/dm.c:2132:(.text.alloc_dev+0x6ec): undefined reference to `set_dax_nomc'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized


vim +2131 drivers/md/dm.c

  2050	
  2051	/*
  2052	 * Allocate and initialise a blank device with a given minor.
  2053	 */
  2054	static struct mapped_device *alloc_dev(int minor)
  2055	{
  2056		int r, numa_node_id = dm_get_numa_node();
  2057		struct dax_device *dax_dev;
  2058		struct mapped_device *md;
  2059		void *old_md;
  2060	
  2061		md = kvzalloc_node(sizeof(*md), GFP_KERNEL, numa_node_id);
  2062		if (!md) {
  2063			DMERR("unable to allocate device, out of memory.");
  2064			return NULL;
  2065		}
  2066	
  2067		if (!try_module_get(THIS_MODULE))
  2068			goto bad_module_get;
  2069	
  2070		/* get a minor number for the dev */
  2071		if (minor == DM_ANY_MINOR)
  2072			r = next_free_minor(&minor);
  2073		else
  2074			r = specific_minor(minor);
  2075		if (r < 0)
  2076			goto bad_minor;
  2077	
  2078		r = init_srcu_struct(&md->io_barrier);
  2079		if (r < 0)
  2080			goto bad_io_barrier;
  2081	
  2082		md->numa_node_id = numa_node_id;
  2083		md->init_tio_pdu = false;
  2084		md->type = DM_TYPE_NONE;
  2085		mutex_init(&md->suspend_lock);
  2086		mutex_init(&md->type_lock);
  2087		mutex_init(&md->table_devices_lock);
  2088		spin_lock_init(&md->deferred_lock);
  2089		atomic_set(&md->holders, 1);
  2090		atomic_set(&md->open_count, 0);
  2091		atomic_set(&md->event_nr, 0);
  2092		atomic_set(&md->uevent_seq, 0);
  2093		INIT_LIST_HEAD(&md->uevent_list);
  2094		INIT_LIST_HEAD(&md->table_devices);
  2095		spin_lock_init(&md->uevent_lock);
  2096	
  2097		/*
  2098		 * default to bio-based until DM table is loaded and md->type
  2099		 * established. If request-based table is loaded: blk-mq will
  2100		 * override accordingly.
  2101		 */
  2102		md->disk = blk_alloc_disk(md->numa_node_id);
  2103		if (!md->disk)
  2104			goto bad;
  2105		md->queue = md->disk->queue;
  2106	
  2107		init_waitqueue_head(&md->wait);
  2108		INIT_WORK(&md->work, dm_wq_work);
  2109		INIT_WORK(&md->requeue_work, dm_wq_requeue_work);
  2110		init_waitqueue_head(&md->eventq);
  2111		init_completion(&md->kobj_holder.completion);
  2112	
  2113		md->requeue_list = NULL;
  2114		md->swap_bios = get_swap_bios();
  2115		sema_init(&md->swap_bios_semaphore, md->swap_bios);
  2116		mutex_init(&md->swap_bios_lock);
  2117	
  2118		md->disk->major = _major;
  2119		md->disk->first_minor = minor;
  2120		md->disk->minors = 1;
  2121		md->disk->flags |= GENHD_FL_NO_PART;
  2122		md->disk->fops = &dm_blk_dops;
  2123		md->disk->private_data = md;
  2124		sprintf(md->disk->disk_name, "dm-%d", minor);
  2125	
  2126		dax_dev = alloc_dax(md, &dm_dax_ops);
  2127		if (IS_ERR(dax_dev)) {
  2128			if (PTR_ERR(dax_dev) != -EOPNOTSUPP)
  2129				goto bad;
  2130		} else {
> 2131			set_dax_nocache(dax_dev);
> 2132			set_dax_nomc(dax_dev);
  2133			md->dax_dev = dax_dev;
  2134			if (dax_add_host(dax_dev, md->disk))
  2135				goto bad;
  2136		}
  2137	
  2138		format_dev_t(md->name, MKDEV(_major, minor));
  2139	
  2140		md->wq = alloc_workqueue("kdmflush/%s", WQ_MEM_RECLAIM, 0, md->name);
  2141		if (!md->wq)
  2142			goto bad;
  2143	
  2144		md->pending_io = alloc_percpu(unsigned long);
  2145		if (!md->pending_io)
  2146			goto bad;
  2147	
  2148		r = dm_stats_init(&md->stats);
  2149		if (r < 0)
  2150			goto bad;
  2151	
  2152		/* Populate the mapping, nobody knows we exist yet */
  2153		spin_lock(&_minor_lock);
  2154		old_md = idr_replace(&_minor_idr, md, minor);
  2155		spin_unlock(&_minor_lock);
  2156	
  2157		BUG_ON(old_md != MINOR_ALLOCED);
  2158	
  2159		return md;
  2160	
  2161	bad:
  2162		cleanup_mapped_device(md);
  2163	bad_io_barrier:
  2164		free_minor(minor);
  2165	bad_minor:
  2166		module_put(THIS_MODULE);
  2167	bad_module_get:
  2168		kvfree(md);
  2169		return NULL;
  2170	}
  2171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
