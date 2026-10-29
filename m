Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240950;
	b=smAKvOjfFK7O4gemGvC5XaEkvSrXJbQ6ntC/vs220PwgNP+8qS4dPw+fL6a3GQGvkzrW
	 J36WHryw5sSjt5thsoKaCblXc0wIp3ljU4ZnEmL/+kHTtQrzIz05MQvic17hvw69KPaSH
	 l62L38AOuYdrkHOiqs9a0yZgiRj0rg0qtOIFis5Ni6/kupwp3PlbCem9USjAOxOiyoSjt
	 jaia6a8xE8OiSIDWBIHBRkjyqo4egVhtj0FFtMO2zZn4jVSGYYKa7VGgjb5TQG4saPVHW
	 wyYmIEIecTpEwxvr99R3FNOs1aix+OgcyuUkyB4zfykXAI1MLIRAuo4C/y+cDZotxmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=M72bklrIu09iEbCbSB40g8WJ8vZOUqKg09TgIo6oM7s=;
	b=g7RCY5KzGgyyrzY+dBMfClGYgN3T1xFj+CIMrfNqCjWIUt/iMU0vYlZPoLlyd5SvtMVY
	 zWKPe3FbR4eNPtLZspCeGrcN/u1corASM/8SaiZKp/p8e3WSISd8zKt1LHIrYh/5I6TDS
	 QGAC6KKTucy7ohRP8EhzhLIxgRvdDeS7PfThmqn+2m4FqPYdb+rtdQfN6n9BL5rVT+1Lx
	 qLXM0jT0/IXaLpoJEOs3k9Q2m6rvcjt76gk9qnzo2eX2yqNuQJgPEPf5WMK4wLUqAaHdR
	 pHBgUy5Ex7sXEm0rqYI5EVkV86J4TG8mKeA+VWo5gx72AJ1CDjYn2CosqefD2Uc624g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SPKOMHwK;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BF5606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 02:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7BF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SPKOMHwK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793240949; x=1824776949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T9gdfsQMp6W/ayVj5uDJFH5wzK4XwY/ukHerPwjIVRU=;
  b=SPKOMHwK75TotAHOWWYERPKQJZWJ40Br4xa2HjKiwF5SMESHCL/Jvh0v
   k0uQgd0XsilAvwyIRVD46y/QFp0ZK6T7liZ+n+kXb78IlhTuCq4aJwX5M
   WYZlv3yfJjqaKSHHXMG9jcTfRMPO1itTj3JhEf+rZxeiS/HZIkFvPiZ+0
   9cLk/FarX0J2q5rBvCxz9+luA5kVfJIRInf+eKvsD8neGV+14r20zp3+9
   tUMom+Kh1jHUKQ7EHSH15fsU5jn8Nu5wl98omjWq2mwhVpZ9wSfRpfkba
   0l+Mk0xZ8fJjTWDqmuxNayC6hfF1Opxu9O34buOFu85App+1LYXE+g+Eg
   A==;
X-CSE-ConnectionGUID: 2Kv/Uz+7QoWZdqJQ05pYOg==
X-CSE-MsgGUID: z24ilxH3RKOnwJRxTkziaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1965862"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1965862"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:29:08 -0700
X-CSE-ConnectionGUID: rzefarvVSo+KCk5pir41Dw==
X-CSE-MsgGUID: M9dYC7nJRtiKJkrfwxub3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5393002"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2026 19:29:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMFsz-00000000ZVs-0VAF;
	Thu, 29 Oct 2026 02:29:01 +0000
Date: Thu, 29 Oct 2026 10:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jackie Liu <liu.yun@linux.dev>, glider@google.com
Cc: oe-kbuild-all@lists.linux.dev, dvyukov@google.com, elver@google.com,
	pjw@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, muchun.song@linux.dev,
	liu.yun@linux.dev
Subject: Re: [PATCH 3/3] riscv: keep booting if KFENCE pool reservation fails
Message-ID: <202610290904.wbrEL97y-lkp@intel.com>
References: <58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01@kylinos.cn>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01@kylinos.cn>

Hi Jackie,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614]

url:    https://github.com/intel-lab-lkp/linux/commits/Jackie-Liu/kfence-fix-pool-cleanup-on-metadata-allocation-failure/20261026-202302
base:   7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
patch link:    https://lore.kernel.org/r/58e3baebbf4e454725e6bde8b7a267fb71cfdaae.1793017074.git.liuyun01%40kylinos.cn
patch subject: [PATCH 3/3] riscv: keep booting if KFENCE pool reservation fails
config: riscv-randconfig-1001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290904.wbrEL97y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290904.wbrEL97y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290904.wbrEL97y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/mm/init.c:30:
   arch/riscv/include/asm/kfence.h: In function 'kfence_protect_page':
>> arch/riscv/include/asm/kfence.h:21:22: error: implicit declaration of function 'virt_to_kpte'; did you mean 'virt_to_page'? [-Wimplicit-function-declaration]
      21 |         pte_t *pte = virt_to_kpte(addr);
         |                      ^~~~~~~~~~~~
         |                      virt_to_page
>> arch/riscv/include/asm/kfence.h:21:22: error: initialization of 'pte_t *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>> arch/riscv/include/asm/kfence.h:24:17: error: implicit declaration of function 'set_pte'; did you mean 'set_pgd'? [-Wimplicit-function-declaration]
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                 ^~~~~~~
         |                 set_pgd
   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:62,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/riscv/mm/init.c:10:
>> arch/riscv/include/asm/kfence.h:24:44: error: implicit declaration of function 'ptep_get' [-Wimplicit-function-declaration]
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                                            ^~~~~~~~
   arch/riscv/include/asm/page.h:75:37: note: in definition of macro '__pte'
      75 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   arch/riscv/include/asm/kfence.h:24:36: note: in expansion of macro 'pte_val'
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                                    ^~~~~~~
>> arch/riscv/include/asm/page.h:71:29: error: request for member 'pte' in something not a structure or union
      71 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/riscv/include/asm/page.h:75:37: note: in definition of macro '__pte'
      75 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   arch/riscv/include/asm/kfence.h:24:36: note: in expansion of macro 'pte_val'
      24 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
         |                                    ^~~~~~~
>> arch/riscv/include/asm/page.h:71:29: error: request for member 'pte' in something not a structure or union
      71 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/riscv/include/asm/page.h:75:37: note: in definition of macro '__pte'
      75 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   arch/riscv/include/asm/kfence.h:26:36: note: in expansion of macro 'pte_val'
      26 |                 set_pte(pte, __pte(pte_val(ptep_get(pte)) | _PAGE_PRESENT));
         |                                    ^~~~~~~
>> arch/riscv/include/asm/kfence.h:27:17: error: implicit declaration of function 'mark_new_valid_map' [-Wimplicit-function-declaration]
      27 |                 mark_new_valid_map();
         |                 ^~~~~~~~~~~~~~~~~~
>> arch/riscv/include/asm/kfence.h:31:9: error: implicit declaration of function 'local_flush_tlb_kernel_range'; did you mean 'local_flush_icache_range'? [-Wimplicit-function-declaration]
      31 |         local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         local_flush_icache_range


vim +21 arch/riscv/include/asm/kfence.h

47513f243b452a Liu Shixin      2021-06-15  18  
47513f243b452a Liu Shixin      2021-06-15  19  static inline bool kfence_protect_page(unsigned long addr, bool protect)
47513f243b452a Liu Shixin      2021-06-15  20  {
47513f243b452a Liu Shixin      2021-06-15 @21  	pte_t *pte = virt_to_kpte(addr);
47513f243b452a Liu Shixin      2021-06-15  22  
8d6c8c40e733b3 Vivian Wang     2026-03-03  23  	if (protect) {
edf95564726942 Alexandre Ghiti 2023-12-13 @24  		set_pte(pte, __pte(pte_val(ptep_get(pte)) & ~_PAGE_PRESENT));
8d6c8c40e733b3 Vivian Wang     2026-03-03  25  	} else {
edf95564726942 Alexandre Ghiti 2023-12-13  26  		set_pte(pte, __pte(pte_val(ptep_get(pte)) | _PAGE_PRESENT));
8d6c8c40e733b3 Vivian Wang     2026-03-03 @27  		mark_new_valid_map();
8d6c8c40e733b3 Vivian Wang     2026-03-03  28  	}
47513f243b452a Liu Shixin      2021-06-15  29  
b3431a8bb336ce Alexandre Ghiti 2024-12-09  30  	preempt_disable();
b3431a8bb336ce Alexandre Ghiti 2024-12-09 @31  	local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
b3431a8bb336ce Alexandre Ghiti 2024-12-09  32  	preempt_enable();
47513f243b452a Liu Shixin      2021-06-15  33  
47513f243b452a Liu Shixin      2021-06-15  34  	return true;
47513f243b452a Liu Shixin      2021-06-15  35  }
47513f243b452a Liu Shixin      2021-06-15  36  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
