Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834BAE57F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693497600; x=1725033600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sRhjDnBen15eh+UJessOst0K98jb6IxQ9nVbdoCJhb4=;
  b=eg684rNjq1PAZ3nO/DpiOwzQusKMHKUIqlcY5fzQ1NGMeHiH5CG6glS1
   nK5yeBOCNaGrVKrwwcUhPmhQzfD5+F6l6dekuULl6i6mYcCnsggLXRpHi
   uRfB9gtjKohq2LZFDqb2F6mOFcZnZD6PB01gmjVEYNmL4zWpjxKnrX9V+
   epLd3W1+xKlmqhfm5m0kmdyFpXoPnU6YM5ZdtDNzKYY3FnblfuxdNYDO6
   tq7JRWA7SqZPeu27e0Ol3LErdt0ZvvC1H0yXCa7kMQzzlH3gAw5rW0FVl
   GuXi4sOBBMPIS84Rw0OGafc4PlWWaFn1Ux8nIf1VXxJBe68Bdu9mt32jm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462351473"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="462351473"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 08:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913335763"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="913335763"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 08:59:56 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbk5J-0000Jp-1b;
	Thu, 31 Aug 2023 15:59:53 +0000
Date: Thu, 31 Aug 2023 23:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13198/13643] drivers/parisc/sba_iommu.c:1900:32:
 warning: variable 'root' set but not used
Message-ID: <202308312353.3NbranVx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a47fc304d2b678db1a5d760a7d644dac9b067752
commit: 15d495931a8c66a1fd31853151009735975e585e [13198/13643] parisc: sba_iommu: Fix build warning if procfs if disabled
config: parisc-randconfig-r012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312353.3NbranVx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312353.3NbranVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312353.3NbranVx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/parisc/sba_iommu.c: In function 'sba_driver_callback':
>> drivers/parisc/sba_iommu.c:1900:32: warning: variable 'root' set but not used [-Wunused-but-set-variable]
    1900 |         struct proc_dir_entry *root;
         |                                ^~~~


vim +/root +1900 drivers/parisc/sba_iommu.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  1887  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1888  /*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1889  ** Determine if sba should claim this chip (return 0) or not (return 1).
^1da177e4c3f41 Linus Torvalds    2005-04-16  1890  ** If so, initialize the chip and tell other partners in crime they
^1da177e4c3f41 Linus Torvalds    2005-04-16  1891  ** have work to do.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1892  */
cfe4fbfb23b328 Helge Deller      2017-08-21  1893  static int __init sba_driver_callback(struct parisc_device *dev)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1894  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1895  	struct sba_device *sba_dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1896  	u32 func_class;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1897  	int i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1898  	char *version;
4bdc0d676a6431 Christoph Hellwig 2020-01-06  1899  	void __iomem *sba_addr = ioremap(dev->hpa.start, SBA_FUNC_SIZE);
0fd689468231cb Denis V. Lunev    2008-04-29 @1900  	struct proc_dir_entry *root;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1901  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1902  	sba_dump_ranges(sba_addr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1903  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1904  	/* Read HW Rev First */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1905  	func_class = READ_REG(sba_addr + SBA_FCLASS);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1906  
1b240f415f4220 Kyle McMartin     2006-08-24  1907  	if (IS_ASTRO(dev)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1908  		unsigned long fclass;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1909  		static char astro_rev[]="Astro ?.?";
^1da177e4c3f41 Linus Torvalds    2005-04-16  1910  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1911  		/* Astro is broken...Read HW Rev First */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1912  		fclass = READ_REG(sba_addr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1913  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1914  		astro_rev[6] = '1' + (char) (fclass & 0x7);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1915  		astro_rev[8] = '0' + (char) ((fclass & 0x18) >> 3);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1916  		version = astro_rev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1917  
1b240f415f4220 Kyle McMartin     2006-08-24  1918  	} else if (IS_IKE(dev)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1919  		static char ike_rev[] = "Ike rev ?";
^1da177e4c3f41 Linus Torvalds    2005-04-16  1920  		ike_rev[8] = '0' + (char) (func_class & 0xff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1921  		version = ike_rev;
1b240f415f4220 Kyle McMartin     2006-08-24  1922  	} else if (IS_PLUTO(dev)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1923  		static char pluto_rev[]="Pluto ?.?";
^1da177e4c3f41 Linus Torvalds    2005-04-16  1924  		pluto_rev[6] = '0' + (char) ((func_class & 0xf0) >> 4); 
^1da177e4c3f41 Linus Torvalds    2005-04-16  1925  		pluto_rev[8] = '0' + (char) (func_class & 0x0f); 
^1da177e4c3f41 Linus Torvalds    2005-04-16  1926  		version = pluto_rev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1927  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1928  		static char reo_rev[] = "REO rev ?";
^1da177e4c3f41 Linus Torvalds    2005-04-16  1929  		reo_rev[8] = '0' + (char) (func_class & 0xff);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1930  		version = reo_rev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1931  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1932  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1933  	if (!global_ioc_cnt) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1934  		global_ioc_cnt = count_parisc_driver(&sba_driver);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1935  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1936  		/* Astro and Pluto have one IOC per SBA */
1b240f415f4220 Kyle McMartin     2006-08-24  1937  		if ((!IS_ASTRO(dev)) || (!IS_PLUTO(dev)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1938  			global_ioc_cnt *= 2;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1939  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1940  
e9a03990d90ac5 Kyle McMartin     2007-10-18  1941  	printk(KERN_INFO "%s found %s at 0x%llx\n",
e9a03990d90ac5 Kyle McMartin     2007-10-18  1942  		MODULE_NAME, version, (unsigned long long)dev->hpa.start);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1943  
cb6fc18e9ca615 Helge Deller      2006-01-17  1944  	sba_dev = kzalloc(sizeof(struct sba_device), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1945  	if (!sba_dev) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1946  		printk(KERN_ERR MODULE_NAME " - couldn't alloc sba_device\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  1947  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1948  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1949  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1950  	parisc_set_drvdata(dev, sba_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1951  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1952  	for(i=0; i<MAX_IOC; i++)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1953  		spin_lock_init(&(sba_dev->ioc[i].res_lock));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1954  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1955  	sba_dev->dev = dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1956  	sba_dev->hw_rev = func_class;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1957  	sba_dev->name = dev->name;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1958  	sba_dev->sba_hpa = sba_addr;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1959  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1960  	sba_get_pat_resources(sba_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1961  	sba_hw_init(sba_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1962  	sba_common_init(sba_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1963  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1964  	hppa_dma_ops = &sba_ops;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1965  
7ec14e49b72da2 Kyle McMartin     2006-02-06  1966  	switch (dev->id.hversion) {
7ec14e49b72da2 Kyle McMartin     2006-02-06  1967  	case PLUTO_MCKINLEY_PORT:
547259580dfa9a Helge Deller      2023-08-10  1968  		if (!proc_mckinley_root)
547259580dfa9a Helge Deller      2023-08-10  1969  			proc_mckinley_root = proc_mkdir("bus/mckinley", NULL);
7ec14e49b72da2 Kyle McMartin     2006-02-06  1970  		root = proc_mckinley_root;
7ec14e49b72da2 Kyle McMartin     2006-02-06  1971  		break;
7ec14e49b72da2 Kyle McMartin     2006-02-06  1972  	case ASTRO_RUNWAY_PORT:
7ec14e49b72da2 Kyle McMartin     2006-02-06  1973  	case IKE_MERCED_PORT:
7ec14e49b72da2 Kyle McMartin     2006-02-06  1974  	default:
547259580dfa9a Helge Deller      2023-08-10  1975  		if (!proc_runway_root)
547259580dfa9a Helge Deller      2023-08-10  1976  			proc_runway_root = proc_mkdir("bus/runway", NULL);
7ec14e49b72da2 Kyle McMartin     2006-02-06  1977  		root = proc_runway_root;
7ec14e49b72da2 Kyle McMartin     2006-02-06  1978  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1979  	}
7ec14e49b72da2 Kyle McMartin     2006-02-06  1980  
3f3942aca6da35 Christoph Hellwig 2018-05-15  1981  	proc_create_single("sba_iommu", 0, root, sba_proc_info);
3f3942aca6da35 Christoph Hellwig 2018-05-15  1982  	proc_create_single("sba_iommu-bitmap", 0, root, sba_proc_bitmap_info);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1983  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1984  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1985  

:::::: The code at line 1900 was first introduced by commit
:::::: 0fd689468231cb5eee9cc5d6331081b77c7a7a76 parisc: use non-racy method for proc entries creation

:::::: TO: Denis V. Lunev <den@openvz.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
