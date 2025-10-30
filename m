Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E298A1D86DC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 02:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791912; cv=none; b=eBtoY8nvMPNly/yj93Rok11kc/QMSm5GtYw9GmR8KNPw5sW7VrG4KCimYruBFAifD63fz8B0LOAtJBVXrniIrPiO7cQDPiUEX+ZhJHqTgvBfkWDX1G2wbNeW0n3GXS48HsHsldw2oJc/cyTESwD4dU3fZm8m/9L+YjWHu1Qsb4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791912; c=relaxed/simple;
	bh=7bxUZeC8AetFzd6+EWnCLCYmEZS70jqoFI1rhezcexg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIaELK+HTFowIcxwsS+oj5/+uN6WgI4NclsVdjxUvfV8k2zQyyjAYOuySoTSqvZeY7zEReD2Q6j2VWrohDjeY2YloWyHTWUuzq7rstAx56Hk3wvivzJDBfvpmnIIjWpTxVdQzaKr/iw6SyT/UhTWZ/iZeM9p6fIc87ILmQHs5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaFvZefC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaFvZefC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761791911; x=1793327911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7bxUZeC8AetFzd6+EWnCLCYmEZS70jqoFI1rhezcexg=;
  b=AaFvZefC2ka+e+nDBOu4Dtk4Q4Rn4ZphSwFCDWE16qfkIcUZ21IUiTws
   Kc0Lc+3HODrI7LnbBkUiruFMTzmDGP+bCe2UXG9d9mq9tUuZiYZkJWZlk
   7VhjaxauXAhhWr0U+5dN+Tvv7x+zTfCer9Gie6OoKWet0Ik/fHfAxvR6W
   7mjwYFzktPFGVEbD+IUwADBNrD3i7chcS56qsxFsSe5ar6psoV2ztUqnU
   PaNNm1xBPi/KleqeiFYG5m3TcjQGioNfGuAGbusknj4eBhRBj4aWNLjRL
   MZl40UPe+bNnMI/kZLhqzPE7lHEJ0vOBy17mbpcVaqdDSa6tZWmlLh8ui
   A==;
X-CSE-ConnectionGUID: MT8JZrt9Ty6XPxDaXPKj+A==
X-CSE-MsgGUID: r29AMpHgQ0K6yttErL0Vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63835882"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="63835882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 19:38:30 -0700
X-CSE-ConnectionGUID: I4XmyynZQEmfjlozMwNquw==
X-CSE-MsgGUID: 2IrmpQMHTBWANLLpVkomTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="216684550"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2025 19:38:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEIXF-000LNc-0z;
	Thu, 30 Oct 2025 02:37:41 +0000
Date: Thu, 30 Oct 2025 10:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, xin@zytor.com,
	peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org,
	akpm@linux-foundation.org, nathan@kernel.org,
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de,
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com,
	kees@kernel.org, baohua@kernel.org, vbabka@suse.cz,
	justinstitt@google.com, wangkefeng.wang@huawei.com,
	leitao@debian.org, jan.kiszka@siemens.com,
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com,
	ubizjak@gmail.com, ada.coupriediaz@arm.com,
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org,
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com,
	glider@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address
 tag
Message-ID: <202510301029.qdXMX0br-lkp@intel.com>
References: <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on akpm-mm/mm-everything arm64/for-next/core linus/master v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-Unpoison-pcpu-chunks-with-base-address-tag/20251030-041340
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman%40pm.me
patch subject: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address tag
config: powerpc-randconfig-r052-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301029.qdXMX0br-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301029.qdXMX0br-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301029.qdXMX0br-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kasan_unpoison_vmap_areas
   >>> referenced by kasan.h:621 (include/linux/kasan.h:621)
   >>>               mm/vmalloc.o:(pcpu_get_vm_areas) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
