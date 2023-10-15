Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53B125A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mnvze1NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697412269; x=1728948269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGjMgofszTIPUhgGrgihHEkcmqc+eQfASLb0cx7tbwc=;
  b=Mnvze1NMWhgH0SfKj7TkRfQiCiHyciT+2NweLGCC2oPMFHuQIeuIL75i
   dTguvirL2XVg1uL9t+qUx8xYEWCt8qRBBodpvNBShXwFcmFYhaAjPENi6
   ipwnHDKBs+blFyYy6h72EL5dx2fGxlIIRGhC+m4k0mp6bMMPomQKRzErO
   helWI8yLUu+jI/C2zqxUKV0f3YVVRraSDAj9g3BCbB7IR5/uya42i7O9x
   PQdto1RM8fJkalPuTwd1cjHLMLfyh80otYBnOm/GkDw0XYyCHlRHq0Nme
   AIX2ZRVU8p6rSfDTWllt4EvfQI0j4vPTUwcplAEy8u341zG/eip4FMC8E
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389280455"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389280455"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929154626"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="929154626"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2023 16:24:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsATB-0007uR-0O;
	Sun, 15 Oct 2023 23:24:25 +0000
Date: Mon, 16 Oct 2023 07:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: zhengding chen <chenzhengding@oppo.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>
Subject: [sudeep-holla:android13-5.10/ffa 21/9999]
 drivers/android/binder.c:1373:70: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202310160720.gQ4of5Cu-lkp@intel.com>
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
config: i386-randconfig-063-20231016 (https://download.01.org/0day-ci/archive/20231016/202310160720.gQ4of5Cu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160720.gQ4of5Cu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160720.gQ4of5Cu-lkp@intel.com/

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
