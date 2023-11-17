Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86564381A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ia8B9YVP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700250686; x=1731786686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Mu5mtHp7/LhWjOSkHbK+0iJqVmWRdXmInEFL6ICv/k=;
  b=Ia8B9YVPSG3Xo6Fe5vxjYyPqWZrD98Xkv0HHEJQLWNMDVYx1QbfiGECV
   Zoo6AsYu9041J5vsXGCWmsOMdwq+ATOI++W7ovcpew2vqbqmVKoWED52V
   SM35R8w76z4ghmV3lHi2l2PE0ZKqr75IFxh0cOE/ssfDDYiizIZFFV1TM
   c8Om+1msnX8UOfp+DNekaCs+lc/SPsOnUju8QLybUwI25YWCV9T53t9Xv
   fXSJdzF7usA44WlBf4hHmGYKSqE782e1d/9xMcBfE5Uy0flblcVEywbeP
   099fpN56m7k2T4vB0kq91hWhpkwoWfOiF66DRoB84aVo0KJoHhrKPgxvM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="422453390"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="422453390"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 11:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="836161350"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="836161350"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2023 11:51:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r44s6-00035h-18;
	Fri, 17 Nov 2023 19:51:22 +0000
Date: Sat, 18 Nov 2023 03:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/uaccess/fixes 1/4] lib/usercopy_kunit.c:327:32: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202311180317.WstlWPaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/uaccess/fixes
head:   ca502394c31390a391379c606c8065500943e989
commit: a62efd87c81075221dd3f839c9eb8dd4b2397f80 [1/4] lib: test raw_copy_{to,from}_user()
config: csky-randconfig-r123-20231117 (https://download.01.org/0day-ci/archive/20231118/202311180317.WstlWPaG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180317.WstlWPaG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180317.WstlWPaG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/usercopy_kunit.c:327:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got void [noderef] __user *uptr @@
   lib/usercopy_kunit.c:327:32: sparse:     expected void *to
   lib/usercopy_kunit.c:327:32: sparse:     got void [noderef] __user *uptr
>> lib/usercopy_kunit.c:341:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got void [noderef] __user *uptr @@
   lib/usercopy_kunit.c:341:40: sparse:     expected void const *from
   lib/usercopy_kunit.c:341:40: sparse:     got void [noderef] __user *uptr
   lib/usercopy_kunit.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +327 lib/usercopy_kunit.c

   318	
   319	static unsigned long do_copy_to_user(const struct usercopy_env *env,
   320					     const struct usercopy_params *params)
   321	{
   322		void __user *uptr = (void __user *)UBUF_ADDR_BASE + params->offset;
   323		void *kptr = env->kbuf;
   324		unsigned long ret;
   325	
   326		kthread_use_mm(env->mm);
 > 327		ret = raw_copy_to_user(uptr, kptr, params->size);
   328		kthread_unuse_mm(env->mm);
   329	
   330		return ret;
   331	}
   332	
   333	static unsigned long do_copy_from_user(const struct usercopy_env *env,
   334					       const struct usercopy_params *params)
   335	{
   336		void __user *uptr = (void __user *)UBUF_ADDR_BASE + params->offset;
   337		void *kptr = env->kbuf;
   338		unsigned long ret;
   339	
   340		kthread_use_mm(env->mm);
 > 341		ret = raw_copy_from_user(kptr, uptr, params->size);
   342		kthread_unuse_mm(env->mm);
   343	
   344		return ret;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
