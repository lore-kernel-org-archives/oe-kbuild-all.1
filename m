Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EA24A0D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 11:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUWaA9f3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702639447; x=1734175447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBVAurxrlkcm9j6ZB/fbNGQaEZcgVA5ZMM0Y3/JHQCg=;
  b=kUWaA9f36kCZDfu9nvZ9Co9i7eeStAYY5YfD493EUuPUuNZ/fvYoEMFi
   xRqreN6KdUtC3Zlvzov99SEAAxT81bmdKPofnN6oqUbd70tpCvDWEZbQ0
   N2xq81rJoO5S7u0HhIXgbj9uCRtPpg23oWz/hLs1EWZrrlgZSANabruQV
   tGLgMp/1yr9eiFgb3z7jBIBx30PykoHCY6BpySRNQS3/tGHkimc7N/BJb
   p3A49XuPObSRP/NcPwAIoieOJM9zNxxRlEsgFHWUN51oSViyWP7jO9kLo
   3ysAzoQn+1ejCU1dopnm6mNhPcLDK8uoEs/9pTn1Aa4LuyU5PK4v7A5FU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461727217"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="461727217"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 03:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724431960"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="724431960"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 03:24:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE6IV-00005c-0d;
	Fri, 15 Dec 2023 11:24:03 +0000
Date: Fri, 15 Dec 2023 19:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 315/342] mm/slub.c:1038:17: error: implicit
 declaration of function '__memset'; did you mean 'memset'?
Message-ID: <202312151925.c1R7UpLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   3271cacfede84a7e27d318fdf12fbeb7cab7b305
commit: 082b07014f97afe25e73493a58f21b45c2742cd7 [315/342] kmsan: support SLAB_POISON
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20231215/202312151925.c1R7UpLE-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151925.c1R7UpLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151925.c1R7UpLE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'init_object':
>> mm/slub.c:1038:17: error: implicit declaration of function '__memset'; did you mean 'memset'? [-Werror=implicit-function-declaration]
    1038 |                 __memset(p - s->red_left_pad, val, s->red_left_pad);
         |                 ^~~~~~~~
         |                 memset
   cc1: some warnings being treated as errors


vim +1038 mm/slub.c

  1026	
  1027	static void init_object(struct kmem_cache *s, void *object, u8 val)
  1028	{
  1029		u8 *p = kasan_reset_tag(object);
  1030		unsigned int poison_size = s->object_size;
  1031	
  1032		if (s->flags & SLAB_RED_ZONE) {
  1033			/*
  1034			 * Use __memset() here and below in order to avoid overwriting
  1035			 * the KMSAN shadow. Keeping the shadow makes it possible to
  1036			 * distinguish uninit-value from use-after-free.
  1037			 */
> 1038			__memset(p - s->red_left_pad, val, s->red_left_pad);
  1039	
  1040			if (slub_debug_orig_size(s) && val == SLUB_RED_ACTIVE) {
  1041				/*
  1042				 * Redzone the extra allocated space by kmalloc than
  1043				 * requested, and the poison size will be limited to
  1044				 * the original request size accordingly.
  1045				 */
  1046				poison_size = get_orig_size(s, object);
  1047			}
  1048		}
  1049	
  1050		if (s->flags & __OBJECT_POISON) {
  1051			__memset(p, POISON_FREE, poison_size - 1);
  1052			__memset(p + poison_size - 1, POISON_END, 1);
  1053		}
  1054	
  1055		if (s->flags & SLAB_RED_ZONE)
  1056			__memset(p + poison_size, val, s->inuse - poison_size);
  1057	}
  1058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
