Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579EE1A5BBC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 15:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208417; cv=none; b=Lc2QUAx1+O0bIRHUTsxQGMle9M6B7W2XTqy5SS7IcbOCDxYGNVTPb5Xl/5FQLBDkk+48e/aREZyY00oSzU+6wdUo6tIrLtWgMCNxBp/D53sIXY80+ox/iYlYxYLpQEJDrxaPiz0nedfiXMh+VW/EWe0oQSifjt3iqr1bUQHEKeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208417; c=relaxed/simple;
	bh=FdIrdJPjqUT2eReI6FcXEfhSnzdPSI7jUH78WxEPXWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIv5bSYipnNIU3b44OiXDYmgL+Q50Nl1uGd/YaxH1so0w8YbhsQtbUjD6hRlg8kL7jhkX/AacwW/v89Recka5jrX/n7/0oPnSFObTHUOnjJKUl1bsCge4oHcUZYFiBVbMb/i+9DF8W/fHFYob6sqVz15guZGMuXHtShySxDOuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F65waWRo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F65waWRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758208415; x=1789744415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdIrdJPjqUT2eReI6FcXEfhSnzdPSI7jUH78WxEPXWc=;
  b=F65waWRoNEl3SCOyHV0ud5ajC1+eBQcpBRkuOBrXf/VJVVNwkhh5IcBx
   rFnQfX8Hz6UFYiFqbNYvZsFWwDHycdxn4xPykqKq8vlj7N4xMU9DBf5cL
   RIjY13+pKiMdrVLZbi6iLDOVDYxLtkgmFldl3M2JFeHc2Pxtid4jY6vIj
   usaPgLt2VMyOAMWsoeTSxDTO6xMAAMXCTrVDD9bcWHHI7JJwbgKr6L0To
   heH1b8sdv2/qQVavxFwBwNXfYguiq1kpt6GadLHuY6oR8afcP29Ze3Wsn
   ZHmFV4mCRJlevREfuRnN4DkJsUnnv5ozIfeaVyhzaxyar4gpsVZGzS19N
   g==;
X-CSE-ConnectionGUID: elC3rPi8Tk2Pi7wYxNHueA==
X-CSE-MsgGUID: 3h9LSvXeSda2cUdq367oag==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="77982579"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="77982579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 08:13:26 -0700
X-CSE-ConnectionGUID: ow1JYpHxRQGxvg2VsFIDsA==
X-CSE-MsgGUID: jtNjKgnRRVuEM2wiEdvmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="176379742"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2025 08:13:19 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzGJw-0003O9-2d;
	Thu, 18 Sep 2025 15:13:16 +0000
Date: Thu, 18 Sep 2025 23:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johhansen@canonical.com>
Subject: [pcmoore-lsm:working-lsm_init_rework 13/41]
 security/lsm_init.c:357:29: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202509182353.qE4PR9MC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git working-lsm_init_rework
head:   3f8f1c412c0737d4e8d7a8033bb1a28f5424b88e
commit: 43924f2f76b8bdef22a20256d969dca66a9bf3ef [13/41] lsm: integrate lsm_early_cred() and lsm_early_task() into caller
config: x86_64-randconfig-121-20250918 (https://download.01.org/0day-ci/archive/20250918/202509182353.qE4PR9MC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509182353.qE4PR9MC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509182353.qE4PR9MC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/lsm_init.c:357:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred *cred @@     got struct cred [noderef] __rcu * @@
   security/lsm_init.c:357:29: sparse:     expected struct cred *cred
   security/lsm_init.c:357:29: sparse:     got struct cred [noderef] __rcu *

vim +357 security/lsm_init.c

   293	
   294	static void __init ordered_lsm_init(void)
   295	{
   296		unsigned int first = 0;
   297		struct lsm_info **lsm;
   298		struct lsm_info *early;
   299	
   300		if (chosen_lsm_order) {
   301			if (chosen_major_lsm) {
   302				pr_warn("security=%s is ignored because it is superseded by lsm=%s\n",
   303					chosen_major_lsm, chosen_lsm_order);
   304				chosen_major_lsm = NULL;
   305			}
   306			ordered_lsm_parse(chosen_lsm_order, "cmdline");
   307		} else
   308			ordered_lsm_parse(builtin_lsm_order, "builtin");
   309	
   310		lsm_order_for_each(lsm) {
   311			lsm_prepare(*lsm);
   312		}
   313	
   314		pr_info("initializing lsm=");
   315		lsm_early_for_each_raw(early) {
   316			if (is_enabled(early))
   317				pr_cont("%s%s", first++ == 0 ? "" : ",", early->name);
   318		}
   319		lsm_order_for_each(lsm) {
   320			if (is_enabled(*lsm))
   321				pr_cont("%s%s", first++ == 0 ? "" : ",", (*lsm)->name);
   322		}
   323		pr_cont("\n");
   324	
   325		init_debug("cred blob size       = %d\n", blob_sizes.lbs_cred);
   326		init_debug("file blob size       = %d\n", blob_sizes.lbs_file);
   327		init_debug("ib blob size         = %d\n", blob_sizes.lbs_ib);
   328		init_debug("inode blob size      = %d\n", blob_sizes.lbs_inode);
   329		init_debug("ipc blob size        = %d\n", blob_sizes.lbs_ipc);
   330	#ifdef CONFIG_KEYS
   331		init_debug("key blob size        = %d\n", blob_sizes.lbs_key);
   332	#endif /* CONFIG_KEYS */
   333		init_debug("msg_msg blob size    = %d\n", blob_sizes.lbs_msg_msg);
   334		init_debug("sock blob size       = %d\n", blob_sizes.lbs_sock);
   335		init_debug("superblock blob size = %d\n", blob_sizes.lbs_superblock);
   336		init_debug("perf event blob size = %d\n", blob_sizes.lbs_perf_event);
   337		init_debug("task blob size       = %d\n", blob_sizes.lbs_task);
   338		init_debug("tun device blob size = %d\n", blob_sizes.lbs_tun_dev);
   339		init_debug("xattr slots          = %d\n", blob_sizes.lbs_xattr_count);
   340		init_debug("bdev blob size       = %d\n", blob_sizes.lbs_bdev);
   341		init_debug("bpf map blob size    = %d\n", blob_sizes.lbs_bpf_map);
   342		init_debug("bpf prog blob size   = %d\n", blob_sizes.lbs_bpf_prog);
   343		init_debug("bpf token blob size  = %d\n", blob_sizes.lbs_bpf_token);
   344	
   345		/*
   346		 * Create any kmem_caches needed for blobs
   347		 */
   348		if (blob_sizes.lbs_file)
   349			lsm_file_cache = kmem_cache_create("lsm_file_cache",
   350							   blob_sizes.lbs_file, 0,
   351							   SLAB_PANIC, NULL);
   352		if (blob_sizes.lbs_inode)
   353			lsm_inode_cache = kmem_cache_create("lsm_inode_cache",
   354							    blob_sizes.lbs_inode, 0,
   355							    SLAB_PANIC, NULL);
   356	
 > 357		if (lsm_cred_alloc((struct cred __rcu *)current->cred, GFP_KERNEL))
   358			panic("%s: early cred alloc failed.\n", __func__);
   359		if (lsm_task_alloc(current))
   360			panic("%s: early task alloc failed.\n", __func__);
   361	
   362		lsm_order_for_each(lsm) {
   363			initialize_lsm(*lsm);
   364		}
   365	}
   366	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
