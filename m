Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754963B3C08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398375; cv=none; b=kh88SFB/y7+lKWKhpPPKThmN41cDjSbkiSbc92c39lfyaPaSGqDjnJN+fxwsTEX3YcVAf+z4ia55pabENdsf8JQiWkZbo4M4CqCbBRjflcvN1xa9UiR42yK09C0ycyJXbMb5RqxHhoc6mGWFA0PUl/hue3aOHGQzjUoQ9VXRuCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398375; c=relaxed/simple;
	bh=lBvmY/YfvS6RM/TTTiy6PusXtvM97RXzOUEz2gL2hBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1CdK5FLo880QoYWcubvjh5ALzJS8glKHBy3/QaNWmITDusV2fEfy01KW+4zWXYW3XJ3cOb8GjpDvvWn79gUgwrX3YByllguhekcq7deCl6gSrPWRqMoUlqC9fWKxm6gueqZHnMxR/d/tDZECp/MJkSbOcJbVoxLoVxJjJmUnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uz4F9FIc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uz4F9FIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786398359; x=1817934359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lBvmY/YfvS6RM/TTTiy6PusXtvM97RXzOUEz2gL2hBk=;
  b=Uz4F9FIcOvgyiUhJUQGZJZ0LBYUnIt2u8G08KagC1iNcKBm+ZB1/Zs3I
   v/5kQEHmMpQeJe8zsDKo347Ew2YVFydKVbxZDTkXfYZkPFOTle0kCuxjH
   NSa/ADNHxywcY2676S3aTc2f78EnaSvEGWadoLj3tyDjBA1dmpO35MdnA
   n2QYhLgFOmI/jk5D3qVHMJYXYOXeWLccPk+VsNkEDV3FpvyphyUZbrWdt
   hLpWS6s2hZcygSS1s5aA9KPqa05LOHYfNnrw086CW2P5wFvRi6nI61H7Q
   aD5YjaFkcSdhEZvkn22X8hJGdyo6xpoUT0NpNZUHqyP02CMEoUOBcsAbm
   Q==;
X-CSE-ConnectionGUID: RFfPTyJvRUi3MXVpV5hYaQ==
X-CSE-MsgGUID: HtU6RQFDQmK4Vizxd5zFPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="97274102"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="97274102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 14:45:56 -0700
X-CSE-ConnectionGUID: AN0B19Z5RfmuXuD+qCcXvQ==
X-CSE-MsgGUID: 7SOiExxkQq251HmX/5/d6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="258879180"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 14:45:53 -0700
Date: Tue, 11 Aug 2026 00:45:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Subject: Re: [linux-next:master 10548/10862]
 drivers/gpio/gpio-regmap.c:423:28: error: no member named 'irq_reqres' in
 'struct regmap_irq_chip'
Message-ID: <anpGj6iHyE8zXQve@ashevche-desk.local>
References: <202607311448.LoJ2N9mS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607311448.LoJ2N9mS-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 31, 2026 at 02:44:58PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   95d6a9ccef99117115e41e9adb271243bd5e985b
> commit: 2da8b903cf7039338e6cc1b1d0e9f9e1cf9159c3 [10548/10862] gpio: regmap: Apply default resource callbacks for regmap IRQ chip
> config: powerpc64-randconfig-r072-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311448.LoJ2N9mS-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> smatch: v0.5.0-9187-g5189e3fb
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311448.LoJ2N9mS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607311448.LoJ2N9mS-lkp@intel.com/

> Note: the linux-next/master HEAD 95d6a9ccef99117115e41e9adb271243bd5e985b builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/gpio/gpio-regmap.c:423:28: error: no member named 'irq_reqres' in 'struct regmap_irq_chip'
>      423 |                 config->regmap_irq_chip->irq_reqres = gpio_regmap_irq_reqres;
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~  ^
> >> drivers/gpio/gpio-regmap.c:424:28: error: no member named 'irq_relres' in 'struct regmap_irq_chip'
>      424 |                 config->regmap_irq_chip->irq_relres = gpio_regmap_irq_relres;
>          |                 ~~~~~~~~~~~~~~~~~~~~~~~  ^
>    2 errors generated.

Have you pulled IB from Mark?

-- 
With Best Regards,
Andy Shevchenko


