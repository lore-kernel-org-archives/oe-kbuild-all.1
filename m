Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1E16E878
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762877; cv=none; b=YLNIbGf31AgGvz960rXsxu9JEGCUDxi2m1u7G10l8G44LJOxA3UnZx3bvtGADVRXErP0dbjrYJjYY0JuvlnAg7czSwrwAXP7bzyj5Q0JOSu0RHa88robNSeStKqSvPJ9TniNfWqswZmAa5d+j7L/cnx/NbN60fboM8xtoYvZlc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762877; c=relaxed/simple;
	bh=sOQeTkbX+9zZSAIKxiUYt1Rjca8TTq22gJWACtPxF6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QC7BJYgKAOvxEkNsnbPCJ98CKCt/w0LRuHYlY95QQG9Y0ntpkawZMGELZk6Nfye7/8AX7TTEeE5kuks/J87crh6GJ/J//MaNMu0iR/anafW6l7FYfcAKJFQFt2qOieBSb+HgZJM7jECBCgualC4fAKZ3t3Uq6SqHxKg4EIY+x9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niRZVtEg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niRZVtEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712762876; x=1744298876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sOQeTkbX+9zZSAIKxiUYt1Rjca8TTq22gJWACtPxF6k=;
  b=niRZVtEgW64qUBX3RUDCrd7lkPHJZIKbzHDEqKxmYYJq2vSYQQLbTxmZ
   EqXJE+6O7lon6IypB8hRIPrrK/eH8heMVSCf020tnCNmPNWOZUweWGpRN
   8CtmT0ppsh2QxZlzZ8I2RSdRmIWVWSThAarl+WxvYkaD1b5ut2DSXqY0I
   bF0WaGNBT+MWavQ/PetT4j+xGowPu6FD3Ytcahvdz1ljP2/PCKsAgXbsV
   N+WNP23Jve0zQIek0LuOM5H2V3UhpNgcEJBKfr3QU28mIsZ326Mbsg1y2
   nZ4XA785jxn92KUBsjsPOTkUg4iKC6MabWyxUvGD6MzgBV4wcv6chhnlN
   A==;
X-CSE-ConnectionGUID: FNPdRXToS12ClUWNvvI+Qg==
X-CSE-MsgGUID: aM8wmAh6THuDaEszUNEG3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8259521"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8259521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915436339"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="915436339"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:27:53 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruZra-000000036LG-3g2d;
	Wed, 10 Apr 2024 18:27:50 +0300
Date: Wed, 10 Apr 2024 18:27:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Potapenko <glider@google.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yury Norov <yury.norov@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [linux-next:master 2203/5042] WARNING: modpost: vmlinux: section
 mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Message-ID: <Zhav9krPj3qBjpuP@smile.fi.intel.com>
References: <202404102353.Cv1gUjk3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404102353.Cv1gUjk3-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 10, 2024 at 11:22:16PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
> commit: 991e5583647d33ee3a9c89248974ef98b9f539a8 [2203/5042] lib/test_bitmap: add tests for bitmap_{read,write}()
> config: xtensa-randconfig-r012-20230725 (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404102353.Cv1gUjk3-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)
> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_allocate_region+0xb4 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)

As pointed out earlier, this is unconfirmed bug in GCC (GCC developers
point a finger at kernel code and vice versa). Can you reproduce this
with clang?

-- 
With Best Regards,
Andy Shevchenko


