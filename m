Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C451CD37
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720886022; cv=none; b=aXY6Kwk4/3cQ0IQ4uC3JsBtRW58nDMHtXG+k98Lby30fO7Tgib3VkHNd5Ar0VKpbhpfQEdj9U4bR9/vyo8q5GnFkQfQwQildDM9Ire+d3j/2VYLx1t/9qM7r7GEm4H1qp5DPdC66yZgkYyQt7dYBKnK7tb7RDtcuBi6Sd+vG3UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720886022; c=relaxed/simple;
	bh=Nj2hqMiS4saL4i2/NaFCwSFWnWAPF9accgdW6Y+ZSMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTzF/Rf8XxxXd+SDXXdrkxtPF4cXxxZzJg4sAkMiYeuJVau9g9u1ukrigxhhkJxIrQYwGtgt6VPgh+EHGopn7JlxLiuRDlSRDGUhWRLpXdnDT5syyXnC514osHPtEBHOpr3/ozv32CKeFVfNlAdWSYRbp6cK6pViWR19BcK+GgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+1ZJrJK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+1ZJrJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720886021; x=1752422021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nj2hqMiS4saL4i2/NaFCwSFWnWAPF9accgdW6Y+ZSMo=;
  b=h+1ZJrJKBUJ8zhaRV/h0vPrwHhnM+M5m/PdVk6UUk/kFvJWM3I6afRoY
   3xC1wFrZUefSOgR0UAOoqeJ3fulqpkfIvJFWs+5vHgC7VJaeBCHbAS1EM
   259v48nM9BsBkacUxZdfA2DjOzvk1tiVMFy42+PTwaOYIedf3r9UNwDKf
   6bNnHIwJ3roRgELxfT4cwTBUiSNwuHRfz8IkmS3xrprDbNw9Ort8aX5gQ
   F0bvLiie/VSn41KCQZXQhOjqB108CK1sHt7DTtjw+7NFA3CLDQrO/mBDG
   3BmWUY2J0jMB8y0QgUZGzHEnYIGBRg8Onvwo5G+wwgxGop7qHzj6D1HtP
   g==;
X-CSE-ConnectionGUID: cqA+LPVcQuGq9k6Vohrvfg==
X-CSE-MsgGUID: OVAS2ELmT5Ko9NZcZiu0Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="18268496"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="18268496"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 08:53:40 -0700
X-CSE-ConnectionGUID: iEB8mWg8R9+3txmwsU+gyQ==
X-CSE-MsgGUID: Bl39Mo8GTuy7eU3k9/t86w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="54028035"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jul 2024 08:53:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSf3y-000cS6-2M;
	Sat, 13 Jul 2024 15:53:30 +0000
Date: Sat, 13 Jul 2024 23:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Chartre <alexandre.chartre@oracle.com>,
	Liran Alon <liran.alon@oracle.com>,
	Jan Setje-Eilers <jan.setjeeilers@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>, Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@kernel.org>,
	Khalid Aziz <khalid.aziz@oracle.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Paul Turner <pjt@google.com>, Reiji Watanabe <reijiw@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 18/26] mm: asi: Map vmalloc/vmap data as nonsesnitive
Message-ID: <202407132325.YotidwGR-lkp@intel.com>
References: <20240712-asi-rfc-24-v1-18-144b319a40d8@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712-asi-rfc-24-v1-18-144b319a40d8@google.com>

Hi Brendan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Jackman/mm-asi-Make-some-utility-functions-noinstr-compatible/20240713-012107
base:   a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
patch link:    https://lore.kernel.org/r/20240712-asi-rfc-24-v1-18-144b319a40d8%40google.com
patch subject: [PATCH 18/26] mm: asi: Map vmalloc/vmap data as nonsesnitive
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240713/202407132325.YotidwGR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407132325.YotidwGR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407132325.YotidwGR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmalloc.c: In function 'remove_vm_area':
>> mm/vmalloc.c:3192:23: warning: variable 'vm_addr' set but not used [-Wunused-but-set-variable]
    3192 |         unsigned long vm_addr;
         |                       ^~~~~~~


vim +/vm_addr +3192 mm/vmalloc.c

  3177	
  3178	/**
  3179	 * remove_vm_area - find and remove a continuous kernel virtual area
  3180	 * @addr:	    base address
  3181	 *
  3182	 * Search for the kernel VM area starting at @addr, and remove it.
  3183	 * This function returns the found VM area, but using it is NOT safe
  3184	 * on SMP machines, except for its size or flags.
  3185	 *
  3186	 * Return: the area descriptor on success or %NULL on failure.
  3187	 */
  3188	struct vm_struct *remove_vm_area(const void *addr)
  3189	{
  3190		struct vmap_area *va;
  3191		struct vm_struct *vm;
> 3192		unsigned long vm_addr;
  3193	
  3194		might_sleep();
  3195	
  3196		if (WARN(!PAGE_ALIGNED(addr), "Trying to vfree() bad address (%p)\n",
  3197				addr))
  3198			return NULL;
  3199	
  3200		va = find_unlink_vmap_area((unsigned long)addr);
  3201		if (!va || !va->vm)
  3202			return NULL;
  3203		vm = va->vm;
  3204		vm_addr = (unsigned long) READ_ONCE(vm->addr);
  3205	
  3206		debug_check_no_locks_freed(vm->addr, get_vm_area_size(vm));
  3207		debug_check_no_obj_freed(vm->addr, get_vm_area_size(vm));
  3208		kasan_free_module_shadow(vm);
  3209		kasan_poison_vmalloc(vm->addr, get_vm_area_size(vm));
  3210	
  3211		free_unmap_vmap_area(va);
  3212		return vm;
  3213	}
  3214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
