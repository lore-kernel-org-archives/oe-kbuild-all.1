Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034CB27D791
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297152; cv=none; b=RPr5kKN5S/3c88Raw0T8kzJ8dOtbG9OYuwP58F/nS/0+15d85XnqLrU/2Pvwf6nYrVm6xSrx2bN1yTZ0U0IcuTrJEtSDIwcft56QsRIjuE2ZrlWzh05fJaIJc8ClxfKwZaHu7e5AYqFsxv8qAf6pCtcqjVQ9hxboy3bRoLdLBmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297152; c=relaxed/simple;
	bh=keIRNev++xqkcRee2shKl1+sHR6qbWuPoq4S58vLJ1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJyQOy6NxXEgwOIjm6qOoedG6b7DVm5v+3FeSfg+zyp3ZAR9zx6/E3fw6eFmPk0rFe8iRgh4mgEYpJPLGBOwHTi64PAHhauyhsXkzan4fBLxDsKjb5ne6rkqDemf7N9K6USLtOUm/L680P+t5qMAS5+LtNrWMN3Ltcuk78j3aaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5qqj5C7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5qqj5C7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747297150; x=1778833150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=keIRNev++xqkcRee2shKl1+sHR6qbWuPoq4S58vLJ1U=;
  b=M5qqj5C71chgQyNLybIfgF/8DjdnhzENA+W8ZjRqJPIybd3xxS80lRHT
   Ka+sapHFyut+lgAMtv2XUAUo2N6JicVFZso1/ffGYZN7zk9sfBQVPwbz+
   b/1xjzGs1wvXpBf2qrkvevsxU48pwYnNAQwuH+5qvS59TCeZHxwkb/bWy
   foLFVG4Sr1iWNepuldMh4ZQQjM+2ALEEjP4yUMY1ZHGl7m9B2kvBqXuYV
   W1DttHFVHorUh3Mm6vcpEDVIZmwk1dGTRkPAVif5aJy5Q/y4q0Eb8tQeU
   sO/wN7AztYv6iZcbw2iq/xjXPxdrC46Gu/+bfVZ9oz8Em3YtQ66UeLELl
   Q==;
X-CSE-ConnectionGUID: trri4oL6RGCeaaJc91pkcQ==
X-CSE-MsgGUID: vBpJEqexRCOhTiEf8hWXeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71730832"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="71730832"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:19:09 -0700
X-CSE-ConnectionGUID: lq6AU/mgQHqAIZUTFI2mTQ==
X-CSE-MsgGUID: KtFxg2coQ36o83jd2Zo30Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="143183971"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 01:19:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uFTo1-00000001myX-1pay;
	Thu, 15 May 2025 11:19:05 +0300
Date: Thu, 15 May 2025 11:19:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:irq/core 55/56] kernel/irq/debugfs.c:233:26: warning:
 'sprintf' may write a terminating nul past the end of the destination
Message-ID: <aCWjedL7lXMeH4Xy@smile.fi.intel.com>
References: <202505151057.xbyXAbEn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505151057.xbyXAbEn-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 15, 2025 at 10:37:19AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
> head:   58eb5721a445ea0af310d1410d7117a1910627bc
> commit: 47af06c9d31fe558493de4e04f9a07847dc4992f [55/56] genirq: Consistently use '%u' format specifier for unsigned int variables
> config: x86_64-randconfig-123-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151057.xbyXAbEn-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151057.xbyXAbEn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505151057.xbyXAbEn-lkp@intel.com/

Definitely not my change was a culprit, but this one is easy to fix, I'll send
a patch later this week.

-- 
With Best Regards,
Andy Shevchenko


