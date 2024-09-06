Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F613AD2A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621361; cv=none; b=RHaerMk0CjQrf1vpEvc4+8+volGhhG8keNz/Phgphviuptg5T6CcfYskfoZ2aOGpArbrgUl9hNz3E0nqKirNaiYLI/bY3GnBxzGBFXt38nyKBh4zDe1JPYXCTao+vwX4RYB7GciMbGIZygeQkQip24E0DmiEiTpvaYZTLy/tZjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621361; c=relaxed/simple;
	bh=FxefykgqQEgzAjBOYYDYcdGD/zj81Mh3ubxAU6b1P6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ty5wxRggzcQKiIDHib+RcZWtBV2Y4RA6WgpxTGCDJpRkbovUun3noawhKhx+0DpmA6WXZ/ho6ftBi7cCjvcDo1zHdbblwgmsDZIy/cR5jNdWskJvNTa+vItBda5uhCCZs5ewUX4hWvqn8zuSVdLFhj+fn/s//5oY94FOr6E6MwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJE0RxM9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJE0RxM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725621359; x=1757157359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FxefykgqQEgzAjBOYYDYcdGD/zj81Mh3ubxAU6b1P6o=;
  b=GJE0RxM9MZTFWf0+YVxN267s4CMZsuPv4mlk98i4S8+warVbyBHWyAtS
   3qVP37RI1lTvur7LJvW5KLJJMlu2NKnUHrIjECYPdUkHf7E5jyHwA/GQr
   P7tILHY1/C8AUGWJ0pPIUvZtKd0MDnJYTwaZm19eT/oHHUIuy4J+j4o7v
   TfABup+mWeS4+mN11f/P9Aijg7w8upjXDJpBXHF0AQzSXrKEubEN8S9K/
   StoLBA9gi5dyH2BGrGL7ATxuwyhIHzN5i5Q1AbxRzR6iUo5BKinGHgNa2
   nITMUkCKRWtgxUJ199nexvN1ZKzMONGChmapL7S6ZPjolZzi+D2mKuFU6
   Q==;
X-CSE-ConnectionGUID: 9drjX86HQyGyqTCufnh95Q==
X-CSE-MsgGUID: yPaa8QPoQIqL9dG4Sm4Pfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24486538"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24486538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:15:58 -0700
X-CSE-ConnectionGUID: +0Nhiln5Qo6Xkdl6Vn6RwQ==
X-CSE-MsgGUID: e6kmbT1kR4mYNuNkYROZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="66267422"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2024 04:15:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smWwV-000B5f-1H;
	Fri, 06 Sep 2024 11:15:55 +0000
Date: Fri, 6 Sep 2024 19:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 18/18] fs/afs/write.c:301:13: warning:
 'netfs_dump_sg' defined but not used
Message-ID: <202409061919.AF17NvI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   37dc5e4ef4e9c14fb549da5a6ba83fd304a5b88f
commit: 37dc5e4ef4e9c14fb549da5a6ba83fd304a5b88f [18/18] afs: [DON'T MERGE] Implement trivial content crypto for testing purposes
config: arm-randconfig-002-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061919.AF17NvI1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061919.AF17NvI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061919.AF17NvI1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/write.c:301:13: warning: 'netfs_dump_sg' defined but not used [-Wunused-function]
     301 | static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
         |             ^~~~~~~~~~~~~


vim +/netfs_dump_sg +301 fs/afs/write.c

   300	
 > 301	static void netfs_dump_sg(const char *prefix, struct scatterlist *sg, unsigned int n_sg)
   302	{
   303		unsigned int i;
   304	
   305		for (i = 0; i < n_sg; i++) {
   306			void *p = kmap_local_page(sg_page(sg));
   307			unsigned int l = min_t(size_t, sg->length, 16);
   308	
   309			printk("%s[%x] %016lx %04x %04x %*phN\n",
   310			       prefix, i, sg->page_link, sg->offset, sg->length,
   311			       l, p + sg->offset);
   312			kunmap_local(p);
   313			sg++;
   314		}
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
