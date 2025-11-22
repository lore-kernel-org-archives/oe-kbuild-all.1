Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DB279DCC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763836878; cv=none; b=bEm2gCXm1x1GelKF+VrmPRz4djTpBHaBdLinKeeWN8O8lVKkE/QvZXSUtSGAmVupUT78RaqaF8uRpyuUgHnmSTDBzrDF+rnZwBnZxqTrEKlh78ETaZBEYSmVcToRfWn3OqT+zDxV7RkEOkECIuH5V1X1TB8z6zzTQxvbCkofyvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763836878; c=relaxed/simple;
	bh=f8DNBbbod0eRNpfQMSVUUk3PdHHtdqjwo8Ad55WyJGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrkzAApjzl1sgX9CGo0JZjad79Cdb+qpvDwCgRftGDkQNQSOVSlh5vLr99IO9HJet/jaCkucsQN4LY+XP0CHo3teGKqiZhLj6T8Sjwjbm08wHQAarOMuapiTsC0wTlgIHTvEh2UuH/gekELFQDrk9dg7t30lU8+KtTOtiSMjIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvquPWaT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvquPWaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763836876; x=1795372876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8DNBbbod0eRNpfQMSVUUk3PdHHtdqjwo8Ad55WyJGA=;
  b=DvquPWaTxgeGqcx+TNd7GdZOG31ZOxZ13KXfJH6F5LyhDNUGkJuapVxw
   2I/6yfUGgayog5iRvAaNEKw1so0zY48CasYRfo9uJMXHGdgN+IJYUxIec
   6zElfwFfUjRQswrwqlQXXGGvaR/8JFMYTIdGqSGnZljnm/JEN9GGexE2T
   juuhd2kc+2wQI7k3pn2W163mReL3K2Mtr2TlFNKoi6utvMQ6OEZoBbjGq
   QEpZQphciOEoSHIXdtJkJ30qk58d3aplzv1F4i5iBdow96bl8z1btdMlD
   jjVFORp30JkO2LDmyGIUfBfJFvnDcF44ePB9hbQ5/nHxqgWSNbzlyfYWr
   g==;
X-CSE-ConnectionGUID: /ToPSDEhTaW8FWRcUKIXkA==
X-CSE-MsgGUID: EpSq2jpbRRehCbO+/Rhz4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="53469225"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="53469225"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 10:41:14 -0800
X-CSE-ConnectionGUID: fPvPzPFdTFemFvP2hu+PEQ==
X-CSE-MsgGUID: KjOpd71zRVu64dfrdnQ5Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191637139"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2025 10:41:13 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMsXn-0007lA-1W;
	Sat, 22 Nov 2025 18:41:11 +0000
Date: Sun, 23 Nov 2025 02:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 42/51]
 drivers/hv/mshv_root_main.c:1874:6: warning: unused variable 'fd'
Message-ID: <202511230210.v4tm8BBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: a10d59280d7b23ada7da469b3cbf899bc90c8a74 [42/51] hv: convert mshv_ioctl_create_partition() to FD_PREPARE()
config: arm64-randconfig-003-20251122 (https://download.01.org/0day-ci/archive/20251123/202511230210.v4tm8BBW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230210.v4tm8BBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230210.v4tm8BBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hv/mshv_root_main.c: In function 'mshv_ioctl_create_partition':
>> drivers/hv/mshv_root_main.c:1874:6: warning: unused variable 'fd' [-Wunused-variable]
    1874 |  int fd;
         |      ^~
>> drivers/hv/mshv_root_main.c:1873:15: warning: unused variable 'file' [-Wunused-variable]
    1873 |  struct file *file;
         |               ^~~~


vim +/fd +1874 drivers/hv/mshv_root_main.c

621191d709b148 Nuno Das Neves    2025-03-14  1864  
621191d709b148 Nuno Das Neves    2025-03-14  1865  static long
621191d709b148 Nuno Das Neves    2025-03-14  1866  mshv_ioctl_create_partition(void __user *user_arg, struct device *module_dev)
621191d709b148 Nuno Das Neves    2025-03-14  1867  {
621191d709b148 Nuno Das Neves    2025-03-14  1868  	struct mshv_create_partition args;
621191d709b148 Nuno Das Neves    2025-03-14  1869  	u64 creation_flags;
621191d709b148 Nuno Das Neves    2025-03-14  1870  	struct hv_partition_creation_properties creation_properties = {};
621191d709b148 Nuno Das Neves    2025-03-14  1871  	union hv_partition_isolation_properties isolation_properties = {};
621191d709b148 Nuno Das Neves    2025-03-14  1872  	struct mshv_partition *partition;
621191d709b148 Nuno Das Neves    2025-03-14 @1873  	struct file *file;
621191d709b148 Nuno Das Neves    2025-03-14 @1874  	int fd;
621191d709b148 Nuno Das Neves    2025-03-14  1875  	long ret;
621191d709b148 Nuno Das Neves    2025-03-14  1876  
621191d709b148 Nuno Das Neves    2025-03-14  1877  	if (copy_from_user(&args, user_arg, sizeof(args)))
621191d709b148 Nuno Das Neves    2025-03-14  1878  		return -EFAULT;
621191d709b148 Nuno Das Neves    2025-03-14  1879  
621191d709b148 Nuno Das Neves    2025-03-14  1880  	if ((args.pt_flags & ~MSHV_PT_FLAGS_MASK) ||
621191d709b148 Nuno Das Neves    2025-03-14  1881  	    args.pt_isolation >= MSHV_PT_ISOLATION_COUNT)
621191d709b148 Nuno Das Neves    2025-03-14  1882  		return -EINVAL;
621191d709b148 Nuno Das Neves    2025-03-14  1883  
621191d709b148 Nuno Das Neves    2025-03-14  1884  	/* Only support EXO partitions */
621191d709b148 Nuno Das Neves    2025-03-14  1885  	creation_flags = HV_PARTITION_CREATION_FLAG_EXO_PARTITION |
621191d709b148 Nuno Das Neves    2025-03-14  1886  			 HV_PARTITION_CREATION_FLAG_INTERCEPT_MESSAGE_PAGE_ENABLED;
621191d709b148 Nuno Das Neves    2025-03-14  1887  
621191d709b148 Nuno Das Neves    2025-03-14  1888  	if (args.pt_flags & BIT(MSHV_PT_BIT_LAPIC))
621191d709b148 Nuno Das Neves    2025-03-14  1889  		creation_flags |= HV_PARTITION_CREATION_FLAG_LAPIC_ENABLED;
621191d709b148 Nuno Das Neves    2025-03-14  1890  	if (args.pt_flags & BIT(MSHV_PT_BIT_X2APIC))
621191d709b148 Nuno Das Neves    2025-03-14  1891  		creation_flags |= HV_PARTITION_CREATION_FLAG_X2APIC_CAPABLE;
621191d709b148 Nuno Das Neves    2025-03-14  1892  	if (args.pt_flags & BIT(MSHV_PT_BIT_GPA_SUPER_PAGES))
621191d709b148 Nuno Das Neves    2025-03-14  1893  		creation_flags |= HV_PARTITION_CREATION_FLAG_GPA_SUPER_PAGES_ENABLED;
621191d709b148 Nuno Das Neves    2025-03-14  1894  
621191d709b148 Nuno Das Neves    2025-03-14  1895  	switch (args.pt_isolation) {
621191d709b148 Nuno Das Neves    2025-03-14  1896  	case MSHV_PT_ISOLATION_NONE:
621191d709b148 Nuno Das Neves    2025-03-14  1897  		isolation_properties.isolation_type =
621191d709b148 Nuno Das Neves    2025-03-14  1898  			HV_PARTITION_ISOLATION_TYPE_NONE;
621191d709b148 Nuno Das Neves    2025-03-14  1899  		break;
621191d709b148 Nuno Das Neves    2025-03-14  1900  	}
621191d709b148 Nuno Das Neves    2025-03-14  1901  
621191d709b148 Nuno Das Neves    2025-03-14  1902  	partition = kzalloc(sizeof(*partition), GFP_KERNEL);
621191d709b148 Nuno Das Neves    2025-03-14  1903  	if (!partition)
621191d709b148 Nuno Das Neves    2025-03-14  1904  		return -ENOMEM;
621191d709b148 Nuno Das Neves    2025-03-14  1905  
621191d709b148 Nuno Das Neves    2025-03-14  1906  	partition->pt_module_dev = module_dev;
621191d709b148 Nuno Das Neves    2025-03-14  1907  	partition->isolation_type = isolation_properties.isolation_type;
621191d709b148 Nuno Das Neves    2025-03-14  1908  
621191d709b148 Nuno Das Neves    2025-03-14  1909  	refcount_set(&partition->pt_ref_count, 1);
621191d709b148 Nuno Das Neves    2025-03-14  1910  
621191d709b148 Nuno Das Neves    2025-03-14  1911  	mutex_init(&partition->pt_mutex);
621191d709b148 Nuno Das Neves    2025-03-14  1912  
621191d709b148 Nuno Das Neves    2025-03-14  1913  	mutex_init(&partition->pt_irq_lock);
621191d709b148 Nuno Das Neves    2025-03-14  1914  
621191d709b148 Nuno Das Neves    2025-03-14  1915  	init_completion(&partition->async_hypercall);
621191d709b148 Nuno Das Neves    2025-03-14  1916  
621191d709b148 Nuno Das Neves    2025-03-14  1917  	INIT_HLIST_HEAD(&partition->irq_ack_notifier_list);
621191d709b148 Nuno Das Neves    2025-03-14  1918  
621191d709b148 Nuno Das Neves    2025-03-14  1919  	INIT_HLIST_HEAD(&partition->pt_devices);
621191d709b148 Nuno Das Neves    2025-03-14  1920  
621191d709b148 Nuno Das Neves    2025-03-14  1921  	INIT_HLIST_HEAD(&partition->pt_mem_regions);
621191d709b148 Nuno Das Neves    2025-03-14  1922  
621191d709b148 Nuno Das Neves    2025-03-14  1923  	mshv_eventfd_init(partition);
621191d709b148 Nuno Das Neves    2025-03-14  1924  
621191d709b148 Nuno Das Neves    2025-03-14  1925  	ret = init_srcu_struct(&partition->pt_irq_srcu);
621191d709b148 Nuno Das Neves    2025-03-14  1926  	if (ret)
621191d709b148 Nuno Das Neves    2025-03-14  1927  		goto free_partition;
621191d709b148 Nuno Das Neves    2025-03-14  1928  
621191d709b148 Nuno Das Neves    2025-03-14  1929  	ret = hv_call_create_partition(creation_flags,
621191d709b148 Nuno Das Neves    2025-03-14  1930  				       creation_properties,
621191d709b148 Nuno Das Neves    2025-03-14  1931  				       isolation_properties,
621191d709b148 Nuno Das Neves    2025-03-14  1932  				       &partition->pt_id);
621191d709b148 Nuno Das Neves    2025-03-14  1933  	if (ret)
621191d709b148 Nuno Das Neves    2025-03-14  1934  		goto cleanup_irq_srcu;
621191d709b148 Nuno Das Neves    2025-03-14  1935  
621191d709b148 Nuno Das Neves    2025-03-14  1936  	ret = add_partition(partition);
621191d709b148 Nuno Das Neves    2025-03-14  1937  	if (ret)
621191d709b148 Nuno Das Neves    2025-03-14  1938  		goto delete_partition;
621191d709b148 Nuno Das Neves    2025-03-14  1939  
621191d709b148 Nuno Das Neves    2025-03-14  1940  	ret = mshv_init_async_handler(partition);
a10d59280d7b23 Christian Brauner 2025-11-20  1941  	if (!ret) {
a10d59280d7b23 Christian Brauner 2025-11-20  1942  		FD_PREPARE(fdf, O_CLOEXEC,
a10d59280d7b23 Christian Brauner 2025-11-20  1943  			   anon_inode_getfile("mshv_partition",
a10d59280d7b23 Christian Brauner 2025-11-20  1944  					      &mshv_partition_fops, partition, O_RDWR));
a10d59280d7b23 Christian Brauner 2025-11-20  1945  		ret = ACQUIRE_ERR(fd_prepare, &fdf);
a10d59280d7b23 Christian Brauner 2025-11-20  1946  		if (!ret)
a10d59280d7b23 Christian Brauner 2025-11-20  1947  			return fd_publish(fdf);
621191d709b148 Nuno Das Neves    2025-03-14  1948  	}
621191d709b148 Nuno Das Neves    2025-03-14  1949  	remove_partition(partition);
a10d59280d7b23 Christian Brauner 2025-11-20  1950  
621191d709b148 Nuno Das Neves    2025-03-14  1951  delete_partition:
621191d709b148 Nuno Das Neves    2025-03-14  1952  	hv_call_delete_partition(partition->pt_id);
621191d709b148 Nuno Das Neves    2025-03-14  1953  cleanup_irq_srcu:
621191d709b148 Nuno Das Neves    2025-03-14  1954  	cleanup_srcu_struct(&partition->pt_irq_srcu);
621191d709b148 Nuno Das Neves    2025-03-14  1955  free_partition:
621191d709b148 Nuno Das Neves    2025-03-14  1956  	kfree(partition);
621191d709b148 Nuno Das Neves    2025-03-14  1957  
621191d709b148 Nuno Das Neves    2025-03-14  1958  	return ret;
621191d709b148 Nuno Das Neves    2025-03-14  1959  }
621191d709b148 Nuno Das Neves    2025-03-14  1960  

:::::: The code at line 1874 was first introduced by commit
:::::: 621191d709b14882270dfd8ea5d7d6cdfebe2c35 Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs

:::::: TO: Nuno Das Neves <nunodasneves@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
