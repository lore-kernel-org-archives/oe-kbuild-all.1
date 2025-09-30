Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6792228CBC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 19:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759260215; cv=none; b=COUgZltbj3+PebtII22AXqdxTvTZ2DSxmqIqY2QuATxEQhuL75mRCKFSgGrxORlB7BnJ8Np8bqC/9MB29O/P2A7GdKIUZPzzt4Xx4ZGst58aylQQFY+761pZxHGBQ/rd4MDFHC0j6nGfmVB4Q5Z107gJlXpx99tbPlzB7JbbhF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759260215; c=relaxed/simple;
	bh=yayotyp0uQyHq9FUexhopuExozinW32w416jGvaXtSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OfnAN/aTlF1kSBygLzn9JDyDXzNohnJehLBKNQ/nmVpG6bMGMUfyTwMW54FAX4Y2NwwO2YPxXppBVVb1xNcAfLwMU0aS9yYntkVB4Buts+rzFNXCR2iTzupw8zzI2ISxCaUMq9frFUiw37x/ypzyC4iU14bcQ390D6F5NDzIaa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0ov58+J; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0ov58+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759260213; x=1790796213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yayotyp0uQyHq9FUexhopuExozinW32w416jGvaXtSs=;
  b=f0ov58+JXJMaom1bYxr9PJulMyYaUiUE2EHuYlnR2ImmrTqzxHEAAXH+
   QKSth7bM5fzPks5UKbFDcoADH6e3CURppZcM6+rT4mL64Cp2ZzAp9v7b/
   8zguZtp8jmuHGXydN7PRPyFvJ+BwjMTLsOnAwjz8a36wxvaRj1sr1V8C9
   ej1WLPSzjykwR++5iPSK/f62MnT8z1j8FxLF2Box3/KNevtoUyNZ83K/L
   +RgeQwl3wDkLs8o9ra2bvvYpJxs0RxRKFlpTsoczKf9F0195nDLQlreDU
   KaumJQJ43rHLyIVzjFFG7biSlJWCV/2Gt00BVZqzixde0Qii4mYSoWw2b
   A==;
X-CSE-ConnectionGUID: 1rYuqYrEQVyu951pE5wmnA==
X-CSE-MsgGUID: uWxNBM6tSlq4jm+hMyjAgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72953581"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="72953581"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2025 12:23:33 -0700
X-CSE-ConnectionGUID: Stmq/xnDTOuyCm4rJtrpJQ==
X-CSE-MsgGUID: 75kePQ4xSJ6Rk6s7f+Ys4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; 
   d="scan'208";a="178190186"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2025 12:23:32 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3fwf-0002Ql-2b;
	Tue, 30 Sep 2025 19:23:29 +0000
Date: Wed, 1 Oct 2025 03:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/77 7/16] fs/smb/client/cifsfs.c:1949:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202510010347.l2eSzzIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git pr/77
head:   b10a51be25c2df37579ac5d39a4e9be47773b42c
commit: a50843f864205ea4576638cb32321313d9c06e54 [7/16] smb: client: cap smb directory cache memory via module parameter
config: arm-randconfig-001-20251001 (https://download.01.org/0day-ci/archive/20251001/202510010347.l2eSzzIm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510010347.l2eSzzIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510010347.l2eSzzIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/smb/client/cifsfs.o: in function `init_cifs':
>> fs/smb/client/cifsfs.c:1949:(.init.text+0x90): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: (__aeabi_uldivmod): Unknown destination type (ARM/Thumb) in fs/smb/client/cifsfs.o
>> fs/smb/client/cifsfs.c:1949:(.init.text+0x90): dangerous relocation: unsupported relocation


vim +1949 fs/smb/client/cifsfs.c

  1919	
  1920		atomic_set(&mid_count, 0);
  1921		GlobalCurrentXid = 0;
  1922		GlobalTotalActiveXid = 0;
  1923		GlobalMaxActiveXid = 0;
  1924	
  1925		cifs_lock_secret = get_random_u32();
  1926	
  1927		if (cifs_max_pending < 2) {
  1928			cifs_max_pending = 2;
  1929			cifs_dbg(FYI, "cifs_max_pending set to min of 2\n");
  1930		} else if (cifs_max_pending > CIFS_MAX_REQ) {
  1931			cifs_max_pending = CIFS_MAX_REQ;
  1932			cifs_dbg(FYI, "cifs_max_pending set to max of %u\n",
  1933				 CIFS_MAX_REQ);
  1934		}
  1935	
  1936		/* Limit max to about 18 hours, and setting to zero disables directory entry caching */
  1937		if (dir_cache_timeout > 65000) {
  1938			dir_cache_timeout = 65000;
  1939			cifs_dbg(VFS, "dir_cache_timeout set to max of 65000 seconds\n");
  1940		}
  1941	
  1942		/* Set a default cap of ~10% of RAM if not specified (and caching isn't disabled) */
  1943		if (dir_cache_timeout != 0 && dir_cache_max_memory_kb == 0) {
  1944			u64 total_bytes;
  1945			unsigned long default_kb;
  1946	
  1947			total_bytes = (u64)totalram_pages() << PAGE_SHIFT;
  1948			/* ~10% of RAM in KB */
> 1949			default_kb = (unsigned long)((total_bytes / 10) >> 10);
  1950			dir_cache_max_memory_kb = default_kb;
  1951		}
  1952	
  1953		cifsiod_wq = alloc_workqueue("cifsiod",
  1954					     WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
  1955					     0);
  1956		if (!cifsiod_wq) {
  1957			rc = -ENOMEM;
  1958			goto out_clean_proc;
  1959		}
  1960	
  1961		/*
  1962		 * Consider in future setting limit!=0 maybe to min(num_of_cores - 1, 3)
  1963		 * so that we don't launch too many worker threads but
  1964		 * Documentation/core-api/workqueue.rst recommends setting it to 0
  1965		 */
  1966	
  1967		/* WQ_UNBOUND allows decrypt tasks to run on any CPU */
  1968		decrypt_wq = alloc_workqueue("smb3decryptd",
  1969					     WQ_UNBOUND|WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
  1970		if (!decrypt_wq) {
  1971			rc = -ENOMEM;
  1972			goto out_destroy_cifsiod_wq;
  1973		}
  1974	
  1975		fileinfo_put_wq = alloc_workqueue("cifsfileinfoput",
  1976					     WQ_UNBOUND|WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
  1977		if (!fileinfo_put_wq) {
  1978			rc = -ENOMEM;
  1979			goto out_destroy_decrypt_wq;
  1980		}
  1981	
  1982		cifsoplockd_wq = alloc_workqueue("cifsoplockd",
  1983						 WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
  1984						 0);
  1985		if (!cifsoplockd_wq) {
  1986			rc = -ENOMEM;
  1987			goto out_destroy_fileinfo_put_wq;
  1988		}
  1989	
  1990		deferredclose_wq = alloc_workqueue("deferredclose",
  1991						   WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
  1992						   0);
  1993		if (!deferredclose_wq) {
  1994			rc = -ENOMEM;
  1995			goto out_destroy_cifsoplockd_wq;
  1996		}
  1997	
  1998		serverclose_wq = alloc_workqueue("serverclose",
  1999						   WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
  2000						   0);
  2001		if (!serverclose_wq) {
  2002			rc = -ENOMEM;
  2003			goto out_destroy_deferredclose_wq;
  2004		}
  2005	
  2006		cfid_put_wq = alloc_workqueue("cfid_put_wq",
  2007					      WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
  2008					      0);
  2009		if (!cfid_put_wq) {
  2010			rc = -ENOMEM;
  2011			goto out_destroy_serverclose_wq;
  2012		}
  2013	
  2014		rc = cifs_init_inodecache();
  2015		if (rc)
  2016			goto out_destroy_cfid_put_wq;
  2017	
  2018		rc = cifs_init_netfs();
  2019		if (rc)
  2020			goto out_destroy_inodecache;
  2021	
  2022		rc = init_mids();
  2023		if (rc)
  2024			goto out_destroy_netfs;
  2025	
  2026		rc = cifs_init_request_bufs();
  2027		if (rc)
  2028			goto out_destroy_mids;
  2029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
