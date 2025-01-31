Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D40F322E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738291318; cv=none; b=c/yEi5l02VOIRT/u+qIs7/h98BjurgtZ+txfmY1lbhMw4zZiKIhyXjofOzpVu2PdoQFLgpwavtnTclS3VetNdrG7scHQf7/CNeKckTa4gbb6Qvj17AO2TPAxytIsvSYzNV2Hemf1uJd5HPe/1FFQJEeEyEpGckP4BRPELuL7eXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738291318; c=relaxed/simple;
	bh=oQFpzqcadAf3zdwGSvEwV4IkG2KJf7CldIWP80RaDpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBVT97WakX/Xofn+iuff6/mmdzS2Pqb6L9eHH3H9F+1woP3e9sL/+yNwwyumAAtufNS+zKrBKfJtVHnyadq3rv1XMNc0DTIB+OPVbZn1iGLAk1qAYM5f+EOdkQyWF4yYdC94w8O1vNm1AbZrA4NAdypf1fxrqVRMxVnHMXBfpzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmhrqGrS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmhrqGrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738291316; x=1769827316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQFpzqcadAf3zdwGSvEwV4IkG2KJf7CldIWP80RaDpY=;
  b=bmhrqGrSEb8jOyW1SW7jDOnCPDXqvKCgGzXgF6i6XXDXgEt0WOZKDQAo
   Kp2EYndOuM87pqnbIKurccVN0ULVfSvE7qtnplXpokz4tZZSEa7S8HHl6
   gb6PqG5UjXzESYF4WvFL2LG0Xk+59GpriTGJE/0RPNKbVIlAGjcQqJcXx
   Nfhez6iaNccLlI6LHemiwVy0tlBdULkQ7LDIb0vHhz24IKjsIZUJEnzXa
   8CZz8R0Qjl7Vg5AjJ5gsU9qDe1SPYEsle07U5gruBU2tOnC2R+XsjdmVQ
   A6qLrfRAgXQhKn/QbdPvw7XL3fS/pteB+Cx73bAi1E7EwGVaxe+OXYTNm
   A==;
X-CSE-ConnectionGUID: THFLWQkpTZORNJZZPN0CJg==
X-CSE-MsgGUID: eZaIet9QSraW6ss5AaqWnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42782344"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="42782344"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 18:41:56 -0800
X-CSE-ConnectionGUID: NTCZo0qkRjmThrNpASd8Eg==
X-CSE-MsgGUID: y9SogC32T0qj8jfitk9kmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="114510369"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2025 18:41:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdgye-000ljP-1j;
	Fri, 31 Jan 2025 02:41:52 +0000
Date: Fri, 31 Jan 2025 10:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 16/16]
 drivers/firmware/efi/libstub/zboot-x86.c:26:14: error: conflicting types for
 'efi_decompress_kernel'; have 'efi_status_t(long unsigned int *)' {aka 'long
 unsigned int(long unsigned int *)'}
Message-ID: <202501311018.bHt8VSnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   9d45748a5e00217becbc742d98c413913ad8344a
commit: 9d45748a5e00217becbc742d98c413913ad8344a [16/16] efi zboot for x86
config: x86_64-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311018.bHt8VSnM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311018.bHt8VSnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311018.bHt8VSnM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/zboot-x86.c:26:14: error: conflicting types for 'efi_decompress_kernel'; have 'efi_status_t(long unsigned int *)' {aka 'long unsigned int(long unsigned int *)'}
      26 | efi_status_t efi_decompress_kernel(unsigned long *kernel_entry)
         |              ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/firmware/efi/libstub/zboot-x86.c:7:
   drivers/firmware/efi/libstub/x86-stub.h:15:14: note: previous declaration of 'efi_decompress_kernel' with type 'efi_status_t(long unsigned int *, struct boot_params *)' {aka 'long unsigned int(long unsigned int *, struct boot_params *)'}
      15 | efi_status_t efi_decompress_kernel(unsigned long *kernel_entry,
         |              ^~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/zboot-x86.c: In function 'efi_decompress_kernel':
>> drivers/firmware/efi/libstub/zboot-x86.c:32:18: error: too few arguments to function 'efi_allocate_kernel'
      32 |                  efi_allocate_kernel(alloc_size, &virt_addr, &addr) ?:
         |                  ^~~~~~~~~~~~~~~~~~~
   drivers/firmware/efi/libstub/x86-stub.h:17:14: note: declared here
      17 | efi_status_t efi_allocate_kernel(unsigned long alloc_size,
         |              ^~~~~~~~~~~~~~~~~~~


vim +26 drivers/firmware/efi/libstub/zboot-x86.c

    25	
  > 26	efi_status_t efi_decompress_kernel(unsigned long *kernel_entry)
    27	{
    28		unsigned long virt_addr, addr, alloc_size, entry;
    29		efi_status_t status;
    30	
    31		status = efi_zboot_decompress_init(&alloc_size, &entry) ?:
  > 32			 efi_allocate_kernel(alloc_size, &virt_addr, &addr) ?:
    33			 efi_zboot_decompress((void *)addr, alloc_size);
    34		if (status != EFI_SUCCESS)
    35			return status;
    36	
    37	
    38		// TODO apply relocations
    39		efi_warn("TODO relocate to 0x%lx\n", virt_addr);
    40	
    41		*kernel_entry = addr + entry;
    42		return EFI_SUCCESS;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
