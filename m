Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78B6FD5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733043548; cv=none; b=L52XJE3NQUqXeq3+eb+5Q6FtGte1HvMJWhQGCXFyAulIYq9rSBN9A5MPqLac98y31Xm/Z0QP49IIc6ekdQMEoWl27b9NNEEAA2sCp1OHYbejw45wDnQSfoPqJQStVo+Durmm9lomCpHBJi+VNjHzH7K8zbDYBpKRrdfh8jeiw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733043548; c=relaxed/simple;
	bh=ecF3wuO4Ce9BBJb/28qcgvXvAm7FlvwNfKJg4EUwF54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PHxOofv0D8g8gOYfHAjm/dprxx/TVLrZtXcgl0OJIzRX0S8qnmMMV6aiG7rxBbJgKu0KYUxceRliQer+BsPd5PWII+geDnkG1BH3ogZ8TmGxsX7S3jKYUP+t9rGH4r47FfVbd3/H+TM8upTNNyG+OzH/RfuiJsoLMWIMS4frck4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHj3OPMJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHj3OPMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733043547; x=1764579547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ecF3wuO4Ce9BBJb/28qcgvXvAm7FlvwNfKJg4EUwF54=;
  b=JHj3OPMJbDw0aXaDR46/BncqfgzYkbgtUqVATaE0JXDKJrteMgp1lBU8
   RgM3yrqErOeMtNfWC3afG7wbN7vW/TrtOqDa31ZyPyuWjp2up5Ss42bpI
   vYZeodZ72TRbLjZ9wAd7wN4P0D93i4lJ0bUblFaQffubuOoubbsxOFqrf
   ieO/ODD0q2cyjiChEInQOKyzdGmLUgtHpraiwP6N/s+bVE3Muw74xKqbC
   pwpvbc3xkJkAa5qIswH/6J31E1o7HOqyQDVjr6JyFetlRh9eGrgExMjss
   TpcYrwpK1neqelcBXkY7eAegpzClZBWetFlb3ANmCFy6sLdTHiipRDMbS
   A==;
X-CSE-ConnectionGUID: ul/mCc7XTqyuU3vKDC5wIA==
X-CSE-MsgGUID: A3pPrMdlTCiubt1cSEMhBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="32964087"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="32964087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 00:59:06 -0800
X-CSE-ConnectionGUID: CM5IfyTWRCadI2MvaMzYbA==
X-CSE-MsgGUID: J4h5d6MYTbKxiFmZvw8wJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92927034"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Dec 2024 00:59:05 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHfn2-0001Or-0K;
	Sun, 01 Dec 2024 08:58:55 +0000
Date: Sun, 1 Dec 2024 16:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2441/2441] mm/kasan/common.c:471:16: error: void
 value not ignored as it ought to be
Message-ID: <202412011647.JJxaTRfd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a2b4d661a5ca59dd7cf972c1cce8b98422102ab7
commit: d5ddd7080c7442f22d6b92d6fed0dacc606013d1 [2441/2441] kasan: sanitize objects when metadata doesn't fit
config: arm64-randconfig-003-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011647.JJxaTRfd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011647.JJxaTRfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011647.JJxaTRfd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/common.c:40:
   mm/kasan/kasan.h: In function 'quarantine_put':
   mm/kasan/kasan.h:198:84: warning: 'return' with a value, in function returning void [-Wreturn-mismatch]
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                                                                                    ^~~~~
   mm/kasan/kasan.h:198:20: note: declared here
     198 | static inline void quarantine_put(struct kmem_cache *cache, void *object) { return false; }
         |                    ^~~~~~~~~~~~~~
   mm/kasan/common.c: In function '__kasan_slab_free':
>> mm/kasan/common.c:471:16: error: void value not ignored as it ought to be
     471 |         return quarantine_put(cache, object);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kasan/common.c:472:1: warning: control reaches end of non-void function [-Wreturn-type]
     472 | }
         | ^


vim +471 mm/kasan/common.c

   431	
   432	static bool __kasan_slab_free(struct kmem_cache *cache, void *object,
   433				      unsigned long ip, bool quarantine)
   434	{
   435		s8 shadow_byte;
   436		u8 tag;
   437		void *tagged_object;
   438		unsigned long rounded_up_size;
   439	
   440		tag = get_tag(object);
   441		tagged_object = object;
   442		object = reset_tag(object);
   443	
   444		if (is_kfence_address(object))
   445			return false;
   446	
   447		if (unlikely(nearest_obj(cache, virt_to_head_page(object), object) !=
   448		    object)) {
   449			kasan_report_invalid_free(tagged_object, ip);
   450			return true;
   451		}
   452	
   453		/* RCU slabs could be legally used after free within the RCU period */
   454		if (unlikely(cache->flags & SLAB_TYPESAFE_BY_RCU))
   455			return false;
   456	
   457		shadow_byte = READ_ONCE(*(s8 *)kasan_mem_to_shadow(object));
   458		if (shadow_invalid(tag, shadow_byte)) {
   459			kasan_report_invalid_free(tagged_object, ip);
   460			return true;
   461		}
   462	
   463		rounded_up_size = round_up(cache->object_size, KASAN_SHADOW_SCALE_SIZE);
   464		kasan_poison_shadow(object, rounded_up_size, KASAN_KMALLOC_FREE);
   465	
   466		if ((IS_ENABLED(CONFIG_KASAN_GENERIC) && !quarantine))
   467			return false;
   468	
   469		kasan_set_free_info(cache, object, tag);
   470	
 > 471		return quarantine_put(cache, object);
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
