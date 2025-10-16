Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC42E716A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760597152; cv=none; b=DT/bCn5WKTGd9mw28L/eheVLtC3gN0KRr7Q1+VYrchBqOkS3t+oR0/TdurrT8W/Nnw2mKb7PLqjCbrTup9HRLbx6pYAxHZQlmWwZ4g5FfcGq2KhQ/N2ZfOz5AVquUru6fvZwzI4hXTFP5M8gdBQJbxHc6zx0F7lEkV7M04m1/as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760597152; c=relaxed/simple;
	bh=aNy7KpAeYVvbjGEhJdIEPScpEEu0oaDfMEWkMvN+tDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sVi8f9w7SaG+V90XkBNSwmR28OrYvkFozujSUycZI9txbp3Gk8eh+3nDmZjxejvQ6//Rn63hdl0SCsHtPRP3ZgtRMrdicZruHiDJ8f7GXTQO97QqqlzoqsORnAYgRIH3k7E4qFXZauXaFM+bJztcu/XGU6kCQrS32yMLP0SmNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbgV6kJ6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbgV6kJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760597150; x=1792133150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aNy7KpAeYVvbjGEhJdIEPScpEEu0oaDfMEWkMvN+tDI=;
  b=jbgV6kJ6Pu2XWEitiYOr/tNqLW+OnXf7aZKsxdh0yL/466r+Gu2QclIr
   b/JMcpf/y8G3UaYKrph5uDlq4TRhrGCpOd0WIbYBVzgEhpSn86KXUrKC+
   Fcd8+EdNT+FTU22mR/m3ZAzBUh3YhEi32HrLfpu7WcRkNvVq/NjyM1N2K
   moyXoHRFYSs/vJ6Ztx/rXIKK20er2JIeuGsytuXn6BB9AKUyoxrqE5PEu
   upVkbhx+B5FoZRCwpVjxiwipOK3WDGXLJ3dXRHcSgGitpNc5PJHcFYtEe
   yqGJifHDUitit+4tXGLorRAOTyWaUa+dFUqkz3hV18zAhKUDmIWLMDEu6
   g==;
X-CSE-ConnectionGUID: 9QwNY8rMTTSyeEeeziUzlQ==
X-CSE-MsgGUID: C23Un8TdQNybXggvwHUA7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62822507"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62822507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 23:45:49 -0700
X-CSE-ConnectionGUID: qvR79XUaSKmzjA8Ut9qarA==
X-CSE-MsgGUID: /cQJueChQyeN5bu29QZcGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182166200"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2025 23:45:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Hk9-0004XZ-29;
	Thu, 16 Oct 2025 06:45:45 +0000
Date: Thu, 16 Oct 2025 14:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:asi/next 42/49] mm/page_alloc.c:6445:9: error: implicit
 declaration of function 'set_direct_map_sensitive'
Message-ID: <202510161427.B004haPH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   0c9d948029f991e9bf7db4697780d96945231c3c
commit: 74e49455c79ba9e1df24ddd6f9989f87e5842b32 [42/49] ASI-map all memblock regions (INSECURE)
config: s390-randconfig-002-20251016 (https://download.01.org/0day-ci/archive/20251016/202510161427.B004haPH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161427.B004haPH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161427.B004haPH-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'free_reserved_area':
>> mm/page_alloc.c:6445:9: error: implicit declaration of function 'set_direct_map_sensitive' [-Werror=implicit-function-declaration]
    6445 |         set_direct_map_sensitive(virt_to_page(start),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/set_direct_map_sensitive +6445 mm/page_alloc.c

  6433	
  6434	unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
  6435	{
  6436		void *pos;
  6437		unsigned long pages = 0;
  6438	
  6439		/*
  6440		 * Reserved areas were made nonsensitive earlier on, but the page
  6441		 * allocator expects all its incoming memory to be sensitive.
  6442		 * Simple solution is just to make the region sensntive again
  6443		 * before freeing it.
  6444		 */
> 6445		set_direct_map_sensitive(virt_to_page(start),
  6446					 (end - start) >> PAGE_SHIFT, true);
  6447	
  6448		start = (void *)PAGE_ALIGN((unsigned long)start);
  6449		end = (void *)((unsigned long)end & PAGE_MASK);
  6450		for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
  6451			struct page *page = virt_to_page(pos);
  6452			void *direct_map_addr;
  6453	
  6454			/*
  6455			 * 'direct_map_addr' might be different from 'pos'
  6456			 * because some architectures' virt_to_page()
  6457			 * work with aliases.  Getting the direct map
  6458			 * address ensures that we get a _writeable_
  6459			 * alias for the memset().
  6460			 */
  6461			direct_map_addr = page_address(page);
  6462			/*
  6463			 * Perform a kasan-unchecked memset() since this memory
  6464			 * has not been initialized.
  6465			 */
  6466			direct_map_addr = kasan_reset_tag(direct_map_addr);
  6467			if ((unsigned int)poison <= 0xFF)
  6468				memset(direct_map_addr, poison, PAGE_SIZE);
  6469	
  6470			free_reserved_page(page);
  6471		}
  6472	
  6473		if (pages && s)
  6474			pr_info("Freeing %s memory: %ldK\n", s, K(pages));
  6475	
  6476		return pages;
  6477	}
  6478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
