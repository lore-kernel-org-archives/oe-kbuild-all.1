Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D28627C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 03:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713929278; cv=none; b=M0f4UlCqvfv9i1zWwir0BzL4BpC8VOD52GTXI7yRJSmqQftfQ/mmt2K6wE7tCKwEBRnzW7FDKQ5Km6DdRGGsjnvCdSmtgj00dG8DrHQPoE/+s8efoxxFFBUw4UMEIA/O9cQNWlKcozCp2vF75DtiOaCeowMXf0Z//Y2QsyFgLHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713929278; c=relaxed/simple;
	bh=aZLds+HGc/zLbgDBvHbOM/Aei9a69wcIOXHXb0r+ufU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ld4LhlMCDqehCD6nhE+MdkU209MjMdmgd6GplVIapypNfpbOp+PWL3oZIBGV8UcLYWdwt8v+y1WdbdD9NL7D5ut6MzuYjBwOYo1/vlpQzyZtES7xFSlImgB6sK21pouSF86rxqKP6FOyCdAfMBNeBRU+Dk0k24NfazolfFBQ8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Trjccg+W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Trjccg+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713929277; x=1745465277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZLds+HGc/zLbgDBvHbOM/Aei9a69wcIOXHXb0r+ufU=;
  b=Trjccg+W0Wu1TseHkQ6ElZYBUjfAsO18jJzmCpxRugsz5Ad1CCZZmpjF
   JiG2uQJqP4wnr4FHvJLHkrea7KZMuSAvQ/LjyIOoGSUcEpUdNT19WGLEQ
   oji19z519BmTyLeichO++ewjL4vOBhYcHjNJGP7DWlKr5D/GDh33jueHZ
   9/waZP2lzWXLgEZtfJPfk0L/bVA+sHaYohWT7y8u9tsOf3JElHX5iRKLe
   qCQd8GC5LVZciAAJCpXMZwMh57avKlP0NYENH4wNKsCsogvc25oPMp/or
   6rf5XLGeS4JzGDSrfpQC8LbJsp9OvDIPA8DzR7iPfn/Q4P7thxe4HxgAC
   g==;
X-CSE-ConnectionGUID: qUVGAHSkR2iWfHgle8d8dw==
X-CSE-MsgGUID: DMN0PHIDReiLpUSN2ejJXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13374948"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="13374948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 20:27:57 -0700
X-CSE-ConnectionGUID: JMIwpTA2Rb2LO+7muZc7Xg==
X-CSE-MsgGUID: KfT4W7V9QkG4r9Y/khNiAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="47833332"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Apr 2024 20:27:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzTIW-0000oK-35;
	Wed, 24 Apr 2024 03:27:52 +0000
Date: Wed, 24 Apr 2024 11:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20368/22178]
 drivers/android/binder_alloc_selftest.c:109:19: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202404241104.lionv8rg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b3e8831fccd1999bb3d13b324fce51dcf3d41841
commit: d549e609b8685eb101a4653249ef7e3fe8bb3e99 [20368/22178] binder: use userspace pointer as base of buffer space
config: x86_64-randconfig-123-20240424 (https://download.01.org/0day-ci/archive/20240424/202404241104.lionv8rg-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241104.lionv8rg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404241104.lionv8rg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder_alloc_selftest.c:109:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *page_addr @@     got void [noderef] <asn:1> *user_data @@
   drivers/android/binder_alloc_selftest.c:109:19: sparse:     expected void *page_addr
   drivers/android/binder_alloc_selftest.c:109:19: sparse:     got void [noderef] <asn:1> *user_data
   drivers/android/binder_alloc_selftest.c:111:41: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/android/binder_alloc_selftest.c:85: warning: Enum value 'LOOP_END' not described in enum 'buf_end_align_type'

vim +109 drivers/android/binder_alloc_selftest.c

   100	
   101	static bool check_buffer_pages_allocated(struct binder_alloc *alloc,
   102						 struct binder_buffer *buffer,
   103						 size_t size)
   104	{
   105		void *page_addr, *end;
   106		int page_index;
   107	
   108		end = (void *)PAGE_ALIGN((uintptr_t)buffer->user_data + size);
 > 109		page_addr = buffer->user_data;
   110		for (; page_addr < end; page_addr += PAGE_SIZE) {
   111			page_index = (page_addr - alloc->buffer) / PAGE_SIZE;
   112			if (!alloc->pages[page_index].page_ptr ||
   113			    !list_empty(&alloc->pages[page_index].lru)) {
   114				pr_err("expect alloc but is %s at page index %d\n",
   115				       alloc->pages[page_index].page_ptr ?
   116				       "lru" : "free", page_index);
   117				return false;
   118			}
   119		}
   120		return true;
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
