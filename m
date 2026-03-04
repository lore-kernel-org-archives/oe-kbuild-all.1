Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0A175A8E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634247; cv=none; b=ZFU24ropO5sCdxgkFX5ejPl5pi921BTysolsS7uJUgTISN4ozFmuALbHEhFmf6mM7dj7ce5gBEaKaiavA2F5BWPpcG9WFn4DBjgCuIf8JLloWZr+kfBDpM6ijj1Hu1537N81QYLEjfsI68Kc7MApwLoHDtN4L3LxE+MKh9U08V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634247; c=relaxed/simple;
	bh=tu9M8dAwlOQjnoY40nXiz6IClVdkQ07FefvPXNdEylE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHK3Oz0Rj8BDwDW7vxZa6gzcxIENiI7p4fZsALjRc5fHJiqBd4l+goYyJNGR+12rtLJJBLEMVnr6BUoepxbgROnl6JzoLcNMmG+rzZKiJZjj2D7TJRhAqQT4wX6jg17KhgXetEMRtFwIuRetNzhk2drwBAxlnmQRDsOlpM1qZeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPeyqGl+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPeyqGl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772634247; x=1804170247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tu9M8dAwlOQjnoY40nXiz6IClVdkQ07FefvPXNdEylE=;
  b=bPeyqGl+iHVm7Mf3ZCQ2WYdrIjH4CzNuEMsFDaN9S9SvtNuIDkKJOTCS
   kA7BvqAaJQDLOv26FfVM6MFneo0q9BEn2VIa1XKQw5Hf8x3AQEycLD+zt
   KZCEyNzCprJ8ieupqmR88N4lwdhSDbzVnph7NifQ0U0YkihYt2nGAwMOj
   FkihR9/ULNL1nxaS+vbQ6TzR7V3gal1AT65RplCYS+/mYTgIWEN0XpWfV
   HTtIB3YWpMBE2w+8IsRsD7M6IkZZvTTi6NEz2L0tOM7oHiEcHg9cToLEo
   Axu4Uw5bML/Ds/szVFCMTQJ883SHPvQFD9uOBS8jMDVpHj0T396UKDtR7
   w==;
X-CSE-ConnectionGUID: gUdf5ra2TDaZ7lr/LCIWAQ==
X-CSE-MsgGUID: mxfSfEgQQj69CONBtGf2SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73660057"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73660057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:24:07 -0800
X-CSE-ConnectionGUID: uzbeTbSRRRakzTp6nigDog==
X-CSE-MsgGUID: 15Rp0FUNTGS/1QZm+UiaJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="223020477"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.127])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 06:24:03 -0800
Date: Wed, 4 Mar 2026 16:24:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>, Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 49/110] __efistub_cmdline.c:undefined
 reference to `__efistub___lshrdi3'
Message-ID: <aahAgJ0G1uYSCFnF@ashevche-desk.local>
References: <202603041925.KLKqpK6N-lkp@intel.com>
 <aag95SSwClx4IzJU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aag95SSwClx4IzJU@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

And since it's riscv, adding people from there.

It might be that they simply need to include the corresponding library to their
architecture builds (we have lib/lshrdi3.c)

On Wed, Mar 04, 2026 at 04:12:57PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 04, 2026 at 07:29:09PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > head:   09c4ad73ba08ac959a6afb5e019826743837e0aa
> > commit: 7c5bff091374a7980431237af80e6da21dce74fe [49/110] lib: fix memparse() to handle overflow
> > config: riscv-randconfig-001-20260304 (https://download.01.org/0day-ci/archive/20260304/202603041925.KLKqpK6N-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041925.KLKqpK6N-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    riscv32-linux-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L38':
> > >> __efistub_cmdline.c:(.init.text+0x1d4): undefined reference to `__efistub___lshrdi3'
> 
> Wow! It seems compiler tries to use some intrinsics here?
> Cc'ed to more people who may be stakeholders of the efistub and overflow.

-- 
With Best Regards,
Andy Shevchenko


