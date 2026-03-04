Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6EC3A6EE3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633579; cv=none; b=WKJF7zoIfpHT6xRbzcFWe47mFEB1bHY5s0RgNSOyrUrqqX6Ay7Ck37Jk7x7zNW2ik0OI2GfNn+Q6YwFX73rh42I5U7wF7twSVXFfeDMWkyoP+tORHrHwkE7RXSG6cZure1ckOUBYWM/8M81u+vmzKxPZHRURQKFsWak64R4sa+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633579; c=relaxed/simple;
	bh=sM7fQqG2KPN15dzc8Tbct9/JwiGDaACbwfLB9ADXbrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfp7ZX49oXfuh0qkMkS/J9Z7VQE191J4ZgpVdjYyvxT8+FSwE2OTLupDBP4ezNJB55VyySEPpbCb/P8TfKOO0SWjOWEMsfgHUR+nSoSvc1Cky/rBQm4a2Tc2MbDR7tUaapE1lObEdMUfMbBKwL78hGDJ/K/PTA4r5wMfu1hvQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asYxep03; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asYxep03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772633578; x=1804169578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sM7fQqG2KPN15dzc8Tbct9/JwiGDaACbwfLB9ADXbrc=;
  b=asYxep03LdgpxJqf9muV0QltAX9n70XupKWKBXsClZSyPJ4eCzETGNVf
   ioxG05Qn5ppLwUPZPQ0au1Xf+3uNJnDxE6FrqgXKscJIiLaZ7Md7mt8zV
   sPpFWewdT/Wbyx36uG6SPOSC32STOrHje11Rf7567d/kBe5aV07MeJuTQ
   Nfk9EP/A4TULa07I5cLrJxLBajAtInlH7Lfzg7WEQyLv6LILvHlI22Zqi
   m6F1QIdPxjlbaO1Yl6tSDhQ/xUjImJXKkF3CTR++mzPeaAHgMD28pJUeM
   7pk2lJFABjJ0ZtmCEJ8ttg05XiEFRogeth6cL9MUk/3xLv5xE+YaqIpLq
   g==;
X-CSE-ConnectionGUID: DyBeoy/tSyK5+XaE2Aqhgg==
X-CSE-MsgGUID: hh4HgNh8Sm2OTsMIdj8IaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77298112"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="77298112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:12:57 -0800
X-CSE-ConnectionGUID: Hf6RaoTRSHiCAc5Zftt/fQ==
X-CSE-MsgGUID: scQ7NbMmRMykH/N4AHiTpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="222516334"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.127])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:12:55 -0800
Date: Wed, 4 Mar 2026 16:12:53 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 49/110] __efistub_cmdline.c:undefined
 reference to `__efistub___lshrdi3'
Message-ID: <aag95SSwClx4IzJU@ashevche-desk.local>
References: <202603041925.KLKqpK6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603041925.KLKqpK6N-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 04, 2026 at 07:29:09PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   09c4ad73ba08ac959a6afb5e019826743837e0aa
> commit: 7c5bff091374a7980431237af80e6da21dce74fe [49/110] lib: fix memparse() to handle overflow
> config: riscv-randconfig-001-20260304 (https://download.01.org/0day-ci/archive/20260304/202603041925.KLKqpK6N-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041925.KLKqpK6N-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    riscv32-linux-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L38':
> >> __efistub_cmdline.c:(.init.text+0x1d4): undefined reference to `__efistub___lshrdi3'

Wow! It seems compiler tries to use some intrinsics here?
Cc'ed to more people who may be stakeholders of the efistub and overflow.

-- 
With Best Regards,
Andy Shevchenko


