Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518DD23814C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746129033; cv=none; b=RvfVcoU8an9hM4OuGHkA9gXwJPgsCNh2F1OMRlIHvgMyd38aG6zh1laKhJpyK1lmeBinvVrxerpw5FAZYhBNEeaz0GVjdHFieCuh+O7rF5GwDkKqMCFADPEbkntWGGTMt5q9LmndtIg4oss+dscHjsh0tt1JtWwIYeU3gfil54M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746129033; c=relaxed/simple;
	bh=j3XVFqJOmEgc3Kxeztq12WifRxzExRA9O0IO+pohifo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYO7YP3cAJ+d0mMiVO7jjFM9ExdH0ef1M8of4gxm/DtmeYZ0/jQzESY2b+Cc0OGhDnYesFgIy9mZ94qa/XkFB3kwMvXsS4F4u+WU4FNZIk89FD7pNMRbogF92waXSaYyZCvIcQdBpiKPmX/xXSY6mdgD/iKq4epHQYCyA49+WDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCYBuBA4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCYBuBA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746129032; x=1777665032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=j3XVFqJOmEgc3Kxeztq12WifRxzExRA9O0IO+pohifo=;
  b=OCYBuBA4IRh1CvACPHk76N+VjfiCGkYiezCYRSb0XG3Iw7wrm/uDgwV7
   CFhlCMhm0VbbuSu8c3hrC0IbnDF44IAuAGtJaiCSRj9gfFNcGRP87kX/b
   ny9MuRaYXCMopTYBrzyNaeK8RAo7dbqZFOgu6Is831JoHwNejV66gtf74
   jVFKjptc3kp9kbH0QuPqxabfnB5Re1y2sTNQ9YL7BX33PI37HwOCIPL+b
   VPWX/JqCaFL6DW4B6vA3F2uMzrkpPfowvx0SVW8RUoi0l4NbE42gxVTVL
   LndONMXS//dqU3vXyDOUtBPyc19QAh38XwUDvI7VDIriwYQB136NhkvzD
   Q==;
X-CSE-ConnectionGUID: pm99fL0LTqmO8SQ+evmOcQ==
X-CSE-MsgGUID: 1DtU1G5LRPS7D3+xzu2XFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47901156"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47901156"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 12:50:31 -0700
X-CSE-ConnectionGUID: leHSOd7WTA6rm1JNi1h3DQ==
X-CSE-MsgGUID: BvvBGMibQ6STdxxCekon9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="139276612"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 May 2025 12:50:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAZvK-0004M5-25;
	Thu, 01 May 2025 19:50:22 +0000
Date: Fri, 2 May 2025 03:50:16 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v14 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Message-ID: <202505020328.CJ8EA6Od-lkp@intel.com>
References: <20250429-v5_user_cfi_series-v14-22-5239410d012a@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429-v5_user_cfi_series-v14-22-5239410d012a@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4181f8ad7a1061efed0219951d608d4988302af7]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20250430-082727
base:   4181f8ad7a1061efed0219951d608d4988302af7
patch link:    https://lore.kernel.org/r/20250429-v5_user_cfi_series-v14-22-5239410d012a%40rivosinc.com
patch subject: [PATCH v14 22/27] riscv: enable kernel access to shadow stack memory via FWFT sbi call
config: riscv-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020328.CJ8EA6Od-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020328.CJ8EA6Od-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020328.CJ8EA6Od-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/head.o: in function `section_table':
>> arch/riscv/kernel/head.S:34:(.head.text+0x1126): undefined reference to `riscv_nousercfi'


vim +34 arch/riscv/kernel/head.S

76d2a0493a17d4 Palmer Dabbelt 2017-07-10  20  
e011995e826f85 Atish Patra    2020-03-17  21  __HEAD
76329c693924d8 Clément Léger  2023-10-24  22  SYM_CODE_START(_start)
0f327f2aaad6a8 Atish Patra    2019-06-06  23  	/*
0f327f2aaad6a8 Atish Patra    2019-06-06  24  	 * Image header expected by Linux boot-loaders. The image header data
0f327f2aaad6a8 Atish Patra    2019-06-06  25  	 * structure is described in asm/image.h.
0f327f2aaad6a8 Atish Patra    2019-06-06  26  	 * Do not modify it without modifying the structure and all bootloaders
0f327f2aaad6a8 Atish Patra    2019-06-06  27  	 * that expects this header format!!
0f327f2aaad6a8 Atish Patra    2019-06-06  28  	 */
cb7d2dd5612a77 Atish Patra    2020-09-17  29  #ifdef CONFIG_EFI
cb7d2dd5612a77 Atish Patra    2020-09-17  30  	/*
cb7d2dd5612a77 Atish Patra    2020-09-17  31  	 * This instruction decodes to "MZ" ASCII required by UEFI.
cb7d2dd5612a77 Atish Patra    2020-09-17  32  	 */
cb7d2dd5612a77 Atish Patra    2020-09-17  33  	c.li s4,-13
cb7d2dd5612a77 Atish Patra    2020-09-17 @34  	j _start_kernel
cb7d2dd5612a77 Atish Patra    2020-09-17  35  #else
0f327f2aaad6a8 Atish Patra    2019-06-06  36  	/* jump to start kernel */
0f327f2aaad6a8 Atish Patra    2019-06-06  37  	j _start_kernel
0f327f2aaad6a8 Atish Patra    2019-06-06  38  	/* reserved */
0f327f2aaad6a8 Atish Patra    2019-06-06  39  	.word 0
cb7d2dd5612a77 Atish Patra    2020-09-17  40  #endif
0f327f2aaad6a8 Atish Patra    2019-06-06  41  	.balign 8
79605f13942619 Sean Anderson  2020-10-22  42  #ifdef CONFIG_RISCV_M_MODE
79605f13942619 Sean Anderson  2020-10-22  43  	/* Image load offset (0MB) from start of RAM for M-mode */
79605f13942619 Sean Anderson  2020-10-22  44  	.dword 0
79605f13942619 Sean Anderson  2020-10-22  45  #else
0f327f2aaad6a8 Atish Patra    2019-06-06  46  #if __riscv_xlen == 64
0f327f2aaad6a8 Atish Patra    2019-06-06  47  	/* Image load offset(2MB) from start of RAM */
0f327f2aaad6a8 Atish Patra    2019-06-06  48  	.dword 0x200000
0f327f2aaad6a8 Atish Patra    2019-06-06  49  #else
0f327f2aaad6a8 Atish Patra    2019-06-06  50  	/* Image load offset(4MB) from start of RAM */
0f327f2aaad6a8 Atish Patra    2019-06-06  51  	.dword 0x400000
79605f13942619 Sean Anderson  2020-10-22  52  #endif
0f327f2aaad6a8 Atish Patra    2019-06-06  53  #endif
0f327f2aaad6a8 Atish Patra    2019-06-06  54  	/* Effective size of kernel image */
0f327f2aaad6a8 Atish Patra    2019-06-06  55  	.dword _end - _start
0f327f2aaad6a8 Atish Patra    2019-06-06  56  	.dword __HEAD_FLAGS
0f327f2aaad6a8 Atish Patra    2019-06-06  57  	.word RISCV_HEADER_VERSION
0f327f2aaad6a8 Atish Patra    2019-06-06  58  	.word 0
0f327f2aaad6a8 Atish Patra    2019-06-06  59  	.dword 0
474efecb65dceb Paul Walmsley  2019-09-13  60  	.ascii RISCV_IMAGE_MAGIC
0f327f2aaad6a8 Atish Patra    2019-06-06  61  	.balign 4
474efecb65dceb Paul Walmsley  2019-09-13  62  	.ascii RISCV_IMAGE_MAGIC2
cb7d2dd5612a77 Atish Patra    2020-09-17  63  #ifdef CONFIG_EFI
cb7d2dd5612a77 Atish Patra    2020-09-17  64  	.word pe_head_start - _start
cb7d2dd5612a77 Atish Patra    2020-09-17  65  pe_head_start:
cb7d2dd5612a77 Atish Patra    2020-09-17  66  
cb7d2dd5612a77 Atish Patra    2020-09-17  67  	__EFI_PE_HEADER
cb7d2dd5612a77 Atish Patra    2020-09-17  68  #else
0f327f2aaad6a8 Atish Patra    2019-06-06  69  	.word 0
cb7d2dd5612a77 Atish Patra    2020-09-17  70  #endif
0f327f2aaad6a8 Atish Patra    2019-06-06  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
