Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E44C0402
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 20:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790799218; cv=none; b=mZyqxGOI+IAXkUJa2Gqi0c/y4RTEGA0zIht7Pgp8r1Q02hlkS90DA471NngGTzj9ppErjz7vfnQiZ5xXUdjWBxnPhkJO70PdtPryddYYozJwLy4qKkntcbXkwm6m/wD/8KqslqpcnUEiHQEvx1QuSkyAnYROn0ZtHDpIzrwyU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790799218; c=relaxed/simple;
	bh=XA0jO2G98PM3/4hVtC0h3k8PDitWOHq8l2CIUrU9q3I=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrDYFY5p302kGI9GF/VaC7t0zVcrXh+iJTpxxMaKQKnMzlmwDSolGn7t5KVngRaahAJTGAkz6zueBNAIF7zfwjrI/qvfJEaiJdVaqGNvk14rf9RDk49152qVqp6DnqDjC+0xxkiROXk33NyuzXMF9Ljq5miXd0FvldudRlyJVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8zGTFYV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8zGTFYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790799216; x=1822335216;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=XA0jO2G98PM3/4hVtC0h3k8PDitWOHq8l2CIUrU9q3I=;
  b=h8zGTFYVRyDJb2uctz6O1Mh7hwU21u5R1PdXZRaGFS1mMw5s+MEvACdV
   NAzYwKt/3Bf7PNE9l0ifMi/XfAMdsApUAq8WgjJG8/twSh/uMG1PcpCYL
   sf/pGEugQZClS7WhKryPTHBCB04uwjAApIZkA6WO4lvaDXdVzCw+jL4QX
   PHnaipBAWZNdKn2tn1JGf/MVWDKWi3JJLwxpnV/VQA7CVmZjXjqZc8K9c
   aglmJLudGGaLMk8T8JXVNCJ4z/FYCK59H872WZClzTAwDpC+uYO7+BX06
   xwZaOAtBo1BDpNvCcQzADJmtT6eK6JlQrPbtDQ7vGN7zXB4BDLdzin1zr
   w==;
X-CSE-ConnectionGUID: Iu4MJf51RcywNwTqi1X/9A==
X-CSE-MsgGUID: ukMcYV35TV6K6/6TLfSXeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90315368"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90315368"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 13:13:36 -0700
X-CSE-ConnectionGUID: /5LStNG8Rcu3E0lxzyPerA==
X-CSE-MsgGUID: 1FmqNbLGR7WQG6tiOst4tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="275328298"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2026 13:13:35 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC0gF-000000001z5-3c2s
	for oe-kbuild-all@lists.linux.dev;
	Wed, 30 Sep 2026 20:13:31 +0000
Date: Wed, 30 Sep 2026 22:13:11 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: kasan: add KUnit tests for __counted_by and __counted_by_ptr
Message-ID: <202609302227.ZAhd0ZIv-lkp@intel.com>
References: <202609302227.ZAhd0ZIv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609302227.ZAhd0ZIv-lkp@intel.com>

Hi Bill,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Bill-Wendling/kasan-add-KUnit-tests-for-__counted_by-and-__counted_by_ptr/20260928-231737
base:   
patch link:    https://lore.kernel.org/r/202609302227.ZAhd0ZIv-lkp%40intel.com
config: x86_64-randconfig-2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609302227.ZAhd0ZIv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302227.ZAhd0ZIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609302227.ZAhd0ZIv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/kasan/kasan_test_c.c:1598:27: sparse: sparse: Variable length array is used.
   mm/kasan/kasan_test_c.c:1613:27: sparse: sparse: Variable length array is used.
   mm/kasan/kasan_test_c.c:2237:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   mm/kasan/kasan_test_c.c:2237:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
>> mm/kasan/kasan_test_c.c:2237:9: sparse: sparse: incompatible types for operation (==):
   mm/kasan/kasan_test_c.c:2237:9: sparse:    unsigned long const __left
   mm/kasan/kasan_test_c.c:2237:9: sparse:    bad type const __right
   mm/kasan/kasan_test_c.c:2284:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   mm/kasan/kasan_test_c.c:2284:9: sparse: sparse: undefined identifier '__builtin_dynamic_object_size'
   mm/kasan/kasan_test_c.c:2284:9: sparse: sparse: incompatible types for operation (==):
   mm/kasan/kasan_test_c.c:2284:9: sparse:    unsigned long const __left
   mm/kasan/kasan_test_c.c:2284:9: sparse:    bad type const __right

vim +2237 mm/kasan/kasan_test_c.c

  2226	
  2227	static void counted_by_flex_oob_access(struct kunit *test)
  2228	{
  2229		size_t size = 128;
  2230		struct counted_by_flex_struct *s;
  2231	
  2232		s = alloc_counted_by_flex_struct(test, size);
  2233	
  2234		OPTIMIZER_HIDE_VAR(s);
  2235	
  2236		/* __builtin_dynamic_object_size() should return the correct length. */
> 2237		KUNIT_EXPECT_EQ(test, size * sizeof(s->array[0]),
  2238				__builtin_dynamic_object_size(s->array, 0));
  2239	
  2240		/* Out-of-bounds assignment. */
  2241		KUNIT_EXPECT_KASAN_FAIL(test, s->array[size + 1] = 42);
  2242	
  2243		/* Out-of-bounds read. */
  2244		KUNIT_EXPECT_KASAN_FAIL_READ(test, s->array[0] = s->array[size + 13]);
  2245	
  2246		kfree(s);
  2247	}
  2248	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
