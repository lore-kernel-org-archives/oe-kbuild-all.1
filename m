Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57EE21364
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 15:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700567; cv=none; b=dR8EjNIrXyR/VLSNq/iKzPRtNevMpmwJMKKsDO0bA4kDwW+qQA1Vk164bc8i76uWXCmTUjHR5r/lOgAGdHDSnx3ar6agZ/QOmNHsvcYa5Wo/S+dDKYltyki0Zh4rw4qWrvy7n54j40ld0DFs1Cof5zuQJhaJqq3Y4gzjVaaFGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700567; c=relaxed/simple;
	bh=FLcUOtGk9O9iSiLBqxraYsFBaH+S3qMsBm4QVDsOq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/jYQGZCWb5PHhpD4qCGcXYewXgF4z4NPWsn+rS+eC0tZ7gcoTP6IfgtpgvaXrJVfNd2wsGHd9YGnOqHvWFmKYiJwumBse4hJG4lRMgb/ISDzQKp3K7gQn8M/fQG6hPlib423et8Sws1yuQeIeIi+f+mDrT+NdQKT4UBJCVo+Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3NVVfaB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3NVVfaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708700566; x=1740236566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FLcUOtGk9O9iSiLBqxraYsFBaH+S3qMsBm4QVDsOq3E=;
  b=P3NVVfaBPtGWKIaFBmYmbjOEuCQ177uwPdW5/4QW48igALA6C4iyuk24
   1VoK43fgj0VW8BIFHZe3nQFoBlbmPWUY2myDqy/ACvya9xHgK2eqEwZS6
   ixyIFvSSqrIPJS6nZMh8iG5Fb3kFfjZowfO0kFofz8Ud0UBz0xVH/m35l
   D6a/lldZpJmm/5pFGxYMKm1pqJZxD77ugOPmvgqJxkLkpLJBjzJl7zXxc
   c1lXJlK/YpVnUMQ6kVxnL2mkwJPN/QLrUFNyjDAzlFVUwNX829DQ44oc3
   0fx4upZDdm14rPEtZcGxEOSGZRBkl6F+5oyeyCbvAh2H87F+AsabGZVRG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6833562"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6833562"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:01:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="913748372"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="913748372"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:01:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdX3Y-00000006vfp-0F1g;
	Fri, 23 Feb 2024 17:01:44 +0200
Date: Fri, 23 Feb 2024 17:01:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v1 06/14] serial: 8250_bcm7271: Switch to use
 uart_read_port_properties()
Message-ID: <ZdizV7sbAtCZ4AyO@smile.fi.intel.com>
References: <20240221183442.4124354-7-andriy.shevchenko@linux.intel.com>
 <202402231238.AWqLyIoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402231238.AWqLyIoM-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 23, 2024 at 12:14:38PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build warnings:

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402231238.AWqLyIoM-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 

>    In file included from arch/hexagon/include/asm/io.h:328:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^

Okay, the above is well known issue with hexagon arch, not related to the series.

> >> drivers/tty/serial/8250/8250_bcm7271.c:938:22: warning: unused variable 'np' [-Wunused-variable]
>      938 |         struct device_node *np = pdev->dev.of_node;
>          |                             ^~

This one is a good catch! Will be fixed in a new version.

-- 
With Best Regards,
Andy Shevchenko


