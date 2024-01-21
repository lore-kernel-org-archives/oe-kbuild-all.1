Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF5374C1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 13:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705845299; cv=none; b=khcxMhoCa06SMuaCGjsPkDK7VJpYm24XhOIDgLsH2gB1NCOTnRO+3llRUJ0yMNW1BsWbV2Xdn5wMmIPsIRaLguJDlpOQKEkZ/DPbDAAzbRkBtcVP/ELdnkvY8MURYVyrS2oYBZ7c1bGS5soKxGrzcXXb2NywOuyubA6FpAxiqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705845299; c=relaxed/simple;
	bh=nh3I9musX7WUTKaa3run7zJeyskx1zcoqp+/dLL3FzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPKRo0uZKEXw4b61DembsyW1wRqLh29pPaOVVzjKWGtMiiU/Ovvdu9EFz9FRUkDk/apco/3+gPy2D7sEMeRPumy/9TQ0NqeE1gFHkGx2v5mgHJDH2eQLP2ZmDwWHOtgQsZk07JLdHYN1B9nXJF+beSDCu2NxZD3ls7umZDNgGxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFMFQsHU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFMFQsHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705845299; x=1737381299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nh3I9musX7WUTKaa3run7zJeyskx1zcoqp+/dLL3FzQ=;
  b=SFMFQsHUbZFh8m34z+q8jU6kLWGVK8cDrZf5Zi+0D5J+sKpXT20BQ1xf
   QJLGjO44Setn2tqZpX5Dkx0Mg3rYij/+9rX8TeXlHyYu3IMpL1L4PsEz0
   sCHRJtjuEohqhCb+UwIPD0HKl58mel9zBFofW4EBmd7ZvMfJ2mBPxTzEQ
   FYumu8aT47m+bn0KnXpXqYghGyaGqXbLF7p3xy7Ji9fZtSDyPlUthoOFQ
   IDjXzgROtW7TPbm6QI/NbDzg+U1FJPM8hFD/qAwWzMcoe9Lo3YbpoAUFj
   LZSbJKbvDRqGuL6eLosKwlPoSf2sFg+5cKL2Ub8xXhavvZvwvMJVDnvBR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7708825"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="7708825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 05:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="785447793"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="785447793"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 05:54:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rRYHl-0000000Fuqj-22wt;
	Sun, 21 Jan 2024 15:54:53 +0200
Date: Sun, 21 Jan 2024 15:54:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Petr Mladek <pmladek@suse.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: lib/vsprintf.c:1528:9: warning: function 'va_format' might be a
 candidate for 'gnu_printf' format attribute
Message-ID: <Za0iLa7akcaML096@smile.fi.intel.com>
References: <202401111051.dDNWAfKw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401111051.dDNWAfKw-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 11, 2024 at 10:33:09AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   acc657692aed438e9931438f8c923b2b107aebf9
> commit: 45c3e93d751ea50861c796da3cbfc848fa6ddf55 vsprintf: Factor out %pV handler as va_format()
> date:   4 years, 9 months ago

Blast from the past?!

...

> All warnings (new ones prefixed by >>):
> 
>    lib/vsprintf.c:625:7: warning: no previous prototype for 'pointer_string' [-Wmissing-prototypes]
>      625 | char *pointer_string(char *buf, char *end, const void *ptr,
>          |       ^~~~~~~~~~~~~~

ce9d3eceb7ff ("lib/vsprintf: Make function pointer_string static")

...

>    lib/vsprintf.c: In function 'va_format':
> >> lib/vsprintf.c:1528:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     1528 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
>          |         ^~~

This might be still valid, but I have no idea how to properly fix it.

-- 
With Best Regards,
Andy Shevchenko


