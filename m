Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA422332E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 23:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474293; cv=none; b=rfqzFNnwpBuhR62ZGH/bBLBc4NLa2/6UU5IuOazmx3jwCo4vLpAQB4fK91YVJuXwC/rd4muT1EAoq4FUGpWb4W0fla+DF3o/W4N5rnRlM1T1ohtFHiDNX16PnwgnLN81MP6jNAI4lJpGOfEV/v9fQN31pEd74o73BBW2QH1erNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474293; c=relaxed/simple;
	bh=jTXbawS0IX96rFwszkT9kCM9dGjFANXvjb9fYEZEKIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRK0XpUbLMGRzzH4IV+9JTOHBUEts/owI4+sIEDy2Tp1H6xdAyD2gu25G6lDM5RwCaNkISVGHQMZTz08ls4OHBnF9x85Id9v48G1ApB5Xl2zegXSB8GopTQQUk4lz0Al1b2V6+Q4yalF4e29PR9AjWEwCJYz+qCA4tzJEMXdCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqbZyM4M; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqbZyM4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748474290; x=1780010290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jTXbawS0IX96rFwszkT9kCM9dGjFANXvjb9fYEZEKIQ=;
  b=TqbZyM4MVWF44LH0vmcv7ihiAKLtCLlIz99//nXFAbReSaUC4CMsxiUL
   zW7rQzXkFzLYrdEeAwCo9gi///bmsiltAqFO+RaCkFGaOoHiWVuJQXve5
   wGX3AynpT7kADMxNNvlGomtDEPv14XlDPgbAO60tV1TZrx2t3xwVW7dmZ
   NA7+fK2GB3JurUMZAtqmEYtWSZBxM2CSxGtrMgXNlerQ+oYiVwWPseB2F
   bieWLKQG/2DsnxqwNP00ZNkpmzrPGiJYPAjwRvcM+mVOAFMOjeG36VFhi
   MsQQF1P9A6k0UvPkStodPIJqofpHVOJhQbqjoI37I94Dlsxd5Z6iN+s8U
   Q==;
X-CSE-ConnectionGUID: ifVzMwa7RheSlcePEBksqg==
X-CSE-MsgGUID: xsZ18zqvRq2kW0F3HfnriA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="53145982"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="53145982"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 16:18:09 -0700
X-CSE-ConnectionGUID: iwficSJmT/qS3pdcAJGGYg==
X-CSE-MsgGUID: N7yDre9XSIaIrg+kwGzUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="148155222"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2025 16:18:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKQ23-000W9E-17;
	Wed, 28 May 2025 23:17:59 +0000
Date: Thu, 29 May 2025 07:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, pbonzini@redhat.com,
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	willy@infradead.org, akpm@linux-foundation.org,
	xiaoyao.li@intel.com, yilun.xu@intel.com,
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com,
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net,
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
	wei.w.wang@intel.com
Subject: Re: [PATCH v10 08/16] KVM: guest_memfd: Allow host to map
 guest_memfd pages
Message-ID: <202505290736.HR4GYiOF-lkp@intel.com>
References: <20250527180245.1413463-9-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527180245.1413463-9-tabba@google.com>

Hi Fuad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/KVM-Rename-CONFIG_KVM_PRIVATE_MEM-to-CONFIG_KVM_GMEM/20250528-020608
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250527180245.1413463-9-tabba%40google.com
patch subject: [PATCH v10 08/16] KVM: guest_memfd: Allow host to map guest_memfd pages
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20250529/202505290736.HR4GYiOF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290736.HR4GYiOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290736.HR4GYiOF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function '__kvm_gmem_create':
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:487:14: error: implicit declaration of function 'get_unused_fd_flags' [-Wimplicit-function-declaration]
     487 |         fd = get_unused_fd_flags(0);
         |              ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:524:9: error: implicit declaration of function 'fd_install'; did you mean 'fs_initcall'? [-Wimplicit-function-declaration]
     524 |         fd_install(fd, file);
         |         ^~~~~~~~~~
         |         fs_initcall
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:530:9: error: implicit declaration of function 'put_unused_fd'; did you mean 'put_user_ns'? [-Wimplicit-function-declaration]
     530 |         put_unused_fd(fd);
         |         ^~~~~~~~~~~~~
         |         put_user_ns
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_create':
>> arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:540:13: error: implicit declaration of function 'kvm_arch_supports_gmem_shared_mem' [-Wimplicit-function-declaration]
     540 |         if (kvm_arch_supports_gmem_shared_mem(kvm))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_bind':
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:564:16: error: implicit declaration of function 'fget'; did you mean 'sget'? [-Wimplicit-function-declaration]
     564 |         file = fget(fd);
         |                ^~~~
         |                sget
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:564:14: error: assignment to 'struct file *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     564 |         file = fget(fd);
         |              ^
   arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c:614:9: error: implicit declaration of function 'fput'; did you mean 'iput'? [-Wimplicit-function-declaration]
     614 |         fput(file);
         |         ^~~~
         |         iput


vim +/kvm_arch_supports_gmem_shared_mem +540 arch/powerpc/kvm/../../../virt/kvm/guest_memfd.c

   533	
   534	int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
   535	{
   536		loff_t size = args->size;
   537		u64 flags = args->flags;
   538		u64 valid_flags = 0;
   539	
 > 540		if (kvm_arch_supports_gmem_shared_mem(kvm))
   541			valid_flags |= GUEST_MEMFD_FLAG_SUPPORT_SHARED;
   542	
   543		if (flags & ~valid_flags)
   544			return -EINVAL;
   545	
   546		if (size <= 0 || !PAGE_ALIGNED(size))
   547			return -EINVAL;
   548	
   549		return __kvm_gmem_create(kvm, size, flags);
   550	}
   551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
