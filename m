Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A331A23B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760500885; cv=none; b=XNKKZ8imcnUo2JFwdWw+Tq6ifRhKjrCZWEe/ILFQymH54BTkBxUuHp7Nv29ZSLURAnW7B6Ds8c6bbJw3V63QjpQw9URGrkhXtkUpkP5yWi5H3V5SBb0Uo183AxmnPSfGrZHG9S8hjci1IwTOhENV8sKdYSUAru4/HvvNtag4sLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760500885; c=relaxed/simple;
	bh=xEnKUjSeRVxcox93QyeT+KlvKLsc9ekKmD8PhZkdAEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqsSkY+a5SrPfNiJBiByNSmgY0wuXp/WsjnxLnDyeNrU2OVf/+Wl/9HW4TZCqT1PWWeVXqWvhGfsLlreQ/vB8qu8Y2cXMBEm3KXsM4oN2iihAjD8+HdeY+vu8AkZ64x6TAkNhm9G6Oo5Hs0YOieRm2Mf76IGDeMSTrdFN+SK9GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cfn44Pn3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cfn44Pn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760500883; x=1792036883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xEnKUjSeRVxcox93QyeT+KlvKLsc9ekKmD8PhZkdAEc=;
  b=Cfn44Pn3KOTeO4BUEjg+4tZBJx7sqGNyg1lpk9sxcPWdTkWFDSDNBidm
   aGa5D9dqIuZyK3/hX907rKE8sInwCa1qAspJ/Gtlo1vnaDcipBa5OgbOb
   vX5WvsKUZbcOnDAuiESRqO1+kFNWVJKMImKqstHokUejj3fD84GTsaGlS
   Jd7Z4p6XLnlK7M/+iRP9Nz/O2trawLQwvGUmhbTWlWo18ymaJYULu8Hc4
   n9WxE9l7K3/2ToeOq8U5lUsaGrJy4/ws495wk8ewgGrv6xA4gxd9mauXP
   B26rz2ij4BWRh2D1eudkwwKYUAYvL3egpMBFBBJNGe3QiL0F03eZ+K1jF
   w==;
X-CSE-ConnectionGUID: l4+J+8mfTBio2mpi9teflg==
X-CSE-MsgGUID: kVzjpsj6Q02RINnlj5yRBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73344702"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="73344702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 21:01:22 -0700
X-CSE-ConnectionGUID: XzVPSFTCQZaGLcABPvsI8Q==
X-CSE-MsgGUID: gVllb85JQhijGcKuXDiMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; 
   d="scan'208";a="182841358"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2025 21:01:16 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8sfS-0003QD-0r;
	Wed, 15 Oct 2025 04:00:15 +0000
Date: Wed, 15 Oct 2025 11:54:12 +0800
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
Subject: Re: [PATCH v20 24/28] arch/riscv: dual vdso creation logic and
 select vdso based on hw
Message-ID: <202510151153.212gVMMJ-lkp@intel.com>
References: <20251013-v5_user_cfi_series-v20-24-b9de4be9912e@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-v5_user_cfi_series-v20-24-b9de4be9912e@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20251014-055847
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251013-v5_user_cfi_series-v20-24-b9de4be9912e%40rivosinc.com
patch subject: [PATCH v20 24/28] arch/riscv: dual vdso creation logic and select vdso based on hw
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20251015/202510151153.212gVMMJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510151153.212gVMMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510151153.212gVMMJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/alternative.c:16:
>> arch/riscv/include/asm/vdso.h:21:10: fatal error: generated/vdso-cfi-offsets.h: No such file or directory
      21 | #include <generated/vdso-cfi-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +21 arch/riscv/include/asm/vdso.h

    18	
    19	#ifndef __ASSEMBLER__
    20	#include <generated/vdso-offsets.h>
  > 21	#include <generated/vdso-cfi-offsets.h>
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
