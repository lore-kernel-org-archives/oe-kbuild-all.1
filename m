Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C4518AE0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OP8VMcf3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697444976; x=1728980976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBmqptUmU7xhXT44k+UiUSmTuPe9ECY4noJkehOYRus=;
  b=OP8VMcf3yyYqLt2EsnJDi5rKU4Dz3BceMCIwCDI4UoqBGNZxisfMdD3F
   7f1LKQBwvPBco7q8rBL+Bc+ZSc/76OiE/4zLSWRTg1oP/nG+fvHz7dbop
   HG6DyRGXLqEB2VEjlF1ktZV5kW6VeEqwthuOg90jFQ2/jLCDUiILGwbMB
   AM1K2/ApmMgO1qP10pW8i5xig6+rKUr2YVA2EgfYXIE1rWjQxarK/B9gc
   kdK4F5/KGADZ6/f2wt8wIxenvt8OFFLZc0jzOezAKkVXnZuoHjWNgb2YZ
   8k44TrMPRXxg3uJAK/MJ5jFwzt4wwThxlkduilR0Kpyjm7RKUj8EhKe3B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364831777"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="364831777"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 01:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="3467485"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2023 01:28:26 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsIyd-0008EZ-2S;
	Mon, 16 Oct 2023 08:29:27 +0000
Date: Mon, 16 Oct 2023 16:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: zhengding chen <chenzhengding@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 21/9999]
 drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202310161629.odtCL6dH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.10/ffa
head:   9e12ac4f9c69befe08119567c073adc938aafc4d
commit: 35014985c266face161f6d107f8d8338e02a0b2d [21/9999] ANDROID: vendor_hooks: Add hooks for binder proc transaction
config: i386-randconfig-063-20231016 (https://download.01.org/0day-ci/archive/20231016/202310161629.odtCL6dH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310161629.odtCL6dH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161629.odtCL6dH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:2508:41: sparse: sparse: Using plain integer as NULL pointer
   drivers/android/binder.c:4580:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/android/binder.c:4580:24: sparse:     expected restricted __poll_t
   drivers/android/binder.c:4580:24: sparse:     got int

vim +1373 drivers/android/binder.c

  1363	
  1364	/**
  1365	 * binder_free_ref() - free the binder_ref
  1366	 * @ref:	ref to free
  1367	 *
  1368	 * Free the binder_ref. Free the binder_node indicated by ref->node
  1369	 * (if non-NULL) and the binder_ref_death indicated by ref->death.
  1370	 */
  1371	static void binder_free_ref(struct binder_ref *ref)
  1372	{
> 1373		trace_android_vh_binder_del_ref(ref->proc ? ref->proc->tsk : 0, ref->data.desc);
  1374		if (ref->node)
  1375			binder_free_node(ref->node);
  1376		kfree(ref->death);
  1377		kfree(ref);
  1378	}
  1379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
