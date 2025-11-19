Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4B43321B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542947; cv=none; b=nnCyk5vxlUZlyZ8Ljz0x7tz6V7D8ZphJlQyh4gA/jQpR+yWeuKkc4IYd2svzdXzPwz80KrxvDkDts1vV1Gmf4GEENlcPJM3762SQB7DgdMXM7jSCkI+d+aMBfuigFmYw43vMFv/Qh3OTkDOFf58uLgRDAaGwUrdFC+Hmgvmw/L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542947; c=relaxed/simple;
	bh=aODz2ITMIyjKOIw3pgo9jP+4SqiaRbFpHR0FQMoatmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXOHRSRk40YYmgBdhT2k2ZSR/IVKGEL9AdB+M3voVHzZaYa2ZsATOIomSJ46WEh17gcAA9CciL7VbC89RnfMJVYN7CfhmzdegxqFSf8eGHViC4E5QecJM2np5oUcKxZqVGgiiTGVe89SHN2PBXIkzPO3r+kY2Pr7M6h8+k2vUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6qpMVZH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6qpMVZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763542946; x=1795078946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aODz2ITMIyjKOIw3pgo9jP+4SqiaRbFpHR0FQMoatmc=;
  b=j6qpMVZHtetYtT1w3fOVAS4FScKjzVA8lMr25MvjNkXd32WemWE1jkLr
   fk/+zO2SmnxgdZSTDQ0WHo/J3D18ERaPZq4Lyw7iNLcwUW93anH1AayE1
   +DHcSFS7YFrLEZYA1TcHYFB4FzxKh2JV1RyX7Ld3qnPDiuoZIfUOPGXQp
   9vlw1UmI05g4yo7bDFBYRFgfIYWL1zQ8Q6IxtrBHRtc6H3DVjcUHXy2yT
   ozI0s3lPqtqyqiny+dNfL14nRNVatDU1gmuzNgwn3EvffmelKKgw/uQGu
   DvqdzXSvFPkPkRMpCnTkaTTjNIoaPTdgJXA34/5eWXO+0Q6x/wfSaJq0z
   g==;
X-CSE-ConnectionGUID: 0KdsWrSRTc6ZyMnhvmTTRg==
X-CSE-MsgGUID: c02aEwT0Sc6+D1ADwquURg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65618880"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65618880"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:02:23 -0800
X-CSE-ConnectionGUID: cN25cKrPRdWhlp9Mjltueg==
X-CSE-MsgGUID: 5+qKEZruSkK2zydrjUM3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191254990"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 01:02:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLe4y-0002eB-0e;
	Wed, 19 Nov 2025 09:02:20 +0000
Date: Wed, 19 Nov 2025 17:02:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/8] PCI/IDE: Add Address Association Register setup
 for downstream MMIO
Message-ID: <202511191627.hVNQfusW-lkp@intel.com>
References: <20251113021446.436830-5-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113021446.436830-5-dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on a4438f06b1db15ce3d831ce82b8767665638aa2a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/drivers-virt-Drop-VIRT_DRIVERS-build-dependency/20251114-130410
base:   a4438f06b1db15ce3d831ce82b8767665638aa2a
patch link:    https://lore.kernel.org/r/20251113021446.436830-5-dan.j.williams%40intel.com
patch subject: [PATCH v2 4/8] PCI/IDE: Add Address Association Register setup for downstream MMIO
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20251119/202511191627.hVNQfusW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191627.hVNQfusW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191627.hVNQfusW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'mem_assoc_to_regs',
       inlined from 'pci_ide_stream_to_regs' at drivers/pci/ide.c:453:3,
       inlined from 'pci_ide_stream_setup' at drivers/pci/ide.c:485:2:
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_416' declared with attribute error: FIELD_GET: type of reg too small for mask
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pci/ide.c:425:34: note: in expansion of macro 'FIELD_GET'
     425 |         regs->addr[idx].assoc2 = FIELD_GET(SEL_ADDR_UPPER, region->end);
         |                                  ^~~~~~~~~
   In function 'mem_assoc_to_regs',
       inlined from 'pci_ide_stream_to_regs' at drivers/pci/ide.c:459:3,
       inlined from 'pci_ide_stream_setup' at drivers/pci/ide.c:485:2:
>> include/linux/compiler_types.h:597:45: error: call to '__compiletime_assert_416' declared with attribute error: FIELD_GET: type of reg too small for mask
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:578:25: note: in definition of macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:597:9: note: in expansion of macro '_compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:155:17: note: in expansion of macro '__BF_FIELD_CHECK'
     155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/pci/ide.c:425:34: note: in expansion of macro 'FIELD_GET'
     425 |         regs->addr[idx].assoc2 = FIELD_GET(SEL_ADDR_UPPER, region->end);
         |                                  ^~~~~~~~~


vim +/__compiletime_assert_416 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
