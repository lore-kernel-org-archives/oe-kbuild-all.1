Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7A11448E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712827798; cv=none; b=BHy0KHgkFvseQKFadtpdNNAwAts1rOYwllHqN/esqVG/R5iNsyOpK94LeYO4QGmVuLYHymEdP0VSEMVGTKG0rszxobdHmfjH5MGCW8JqEobxt2IjmnxaEDeCPCTuzray6/OI/bch04foKIOGdnmt0aBNEukoBJsovuIWqAX+4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712827798; c=relaxed/simple;
	bh=iBPsU4YOB+B6O16g/mJyI29sgwRInVpxYK8g0YLKgU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaZbiVWGQle+pGUTYA9D3KDoqTyKPlwsznKrXoYGXzsJVJEsAIpjOxhJsLp88fDfhsoHS/QA8YM2UBt4Rmlw75Xo1aQYB96FwfoN4S7HCWTLdk3dDvYmV9p9iMQ8Wq/hrhZP4OsbmcCQubmJ9XUxJ1nG84q+tFWMmViwtID5wxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BB4/EyvI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BB4/EyvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712827798; x=1744363798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iBPsU4YOB+B6O16g/mJyI29sgwRInVpxYK8g0YLKgU4=;
  b=BB4/EyvI5QUfgbGE+CDs+F8DyxFWXWwpMmTPBHUgQ5FBTtgX1wVTlNpy
   vS/WPOje+IpguHuQxquFh6VCMd76WVd8HfvdlIPcWh5Rfvpt+s7o9zHL3
   9SXg9knBGUjH0l5Adw5ARtLmunUiB1Qt/TXHLE2YvY+jsOHkh7O4f6DYt
   8Q84a33VIU3Gf3DY4jLnjER5jFrwBN8Y7zSXu6++rWT1bBSwwAANcwtpH
   wtslB3MaCteokVuvDfWrLFeDDNhFOnnEZuZwqieWIg2kfjxnyNtLMTqSU
   ZhzGmIMQ1vkFOfa+/PjVL9cBsP7jPc8CoxCXmMmZfZLHqbYHdOYwpaNCF
   Q==;
X-CSE-ConnectionGUID: 4sYJKFdeTDy9jSDjjZfhbg==
X-CSE-MsgGUID: 4HpmYoDfTAmQkfXGTalSDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="30709513"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="30709513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915458338"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="915458338"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:29:54 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruqki-00000003JKS-1XJU;
	Thu, 11 Apr 2024 12:29:52 +0300
Date: Thu, 11 Apr 2024 12:29:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: kernel test robot <lkp@intel.com>,
	Alexander Potapenko <glider@google.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [linux-next:master 2203/5042] WARNING: modpost: vmlinux: section
 mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
Message-ID: <ZhetkFMCHcXi5wu5@smile.fi.intel.com>
References: <202404102353.Cv1gUjk3-lkp@intel.com>
 <Zhav9krPj3qBjpuP@smile.fi.intel.com>
 <3b30ed42-858e-4f5e-b3a5-2e3e9c92f7e5@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b30ed42-858e-4f5e-b3a5-2e3e9c92f7e5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 11, 2024 at 11:08:40AM +0200, Alexander Lobakin wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date: Wed, 10 Apr 2024 18:27:50 +0300
> 
> > On Wed, Apr 10, 2024 at 11:22:16PM +0800, kernel test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >> head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
> >> commit: 991e5583647d33ee3a9c89248974ef98b9f539a8 [2203/5042] lib/test_bitmap: add tests for bitmap_{read,write}()
> >> config: xtensa-randconfig-r012-20230725 (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/config)
> >> compiler: xtensa-linux-gcc (GCC) 13.2.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102353.Cv1gUjk3-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202404102353.Cv1gUjk3-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >>
> >> WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> >>>> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_read+0x128 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)
> >> WARNING: modpost: vmlinux: section mismatch in reference: bitmap_allocate_region+0xb4 (section: .text.unlikely) -> __setup_str_initcall_blacklist (section: .init.rodata)
> > 
> > As pointed out earlier, this is unconfirmed bug in GCC (GCC developers
> > point a finger at kernel code and vice versa). Can you reproduce this
> > with clang?
> 
> I'm unable to reproduce it on clang-trunk (19).

For xtensa? Because it's particular to very that architecture (GCC backend).

-- 
With Best Regards,
Andy Shevchenko


