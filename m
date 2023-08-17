Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87877125B9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692266146; x=1723802146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEgKWuUIDW+33geAvq557YwB+uPMZ6s35JZ4SFcploQ=;
  b=eKBv2CB7Lxgs1og7aqfHA3kIEfMAvmqVVoVM2Z+FxRez03u9fD34Bc90
   kE8bKWXT9bmxS3X0u1kUyf5Na4n/CH7Rx2oqiO6ootGrGGVz1uP4l7WlO
   Swn6G9SO8PSVIm549elONBI2mogVEud9aQ9oEtlh3YLObwtNog9MpQ46U
   xGeDrFdboifI6mB357ZNO4MV3Noqj7hivsPgkXI7pU9T/HJFJZNalUB1t
   k6kYRQLYEZAx9WQco2LUKnDkMuyFCM3rhHkQqsTWNiOZCtWdR/+SGPfYN
   CgMwzWOpc+NFWbULk27ijqoXZjvnIWvL+wW5DM+FegwSU0mS2r2m92Lue
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376503524"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="376503524"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799981391"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="799981391"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 02:55:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qWZjB-0066W9-11;
	Thu, 17 Aug 2023 12:55:41 +0300
Date: Thu, 17 Aug 2023 12:55:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: drivers/gpio/gpio-pca9570.c:42: warning: Function parameter or
 member 'chip_data' not described in 'pca9570'
Message-ID: <ZN3undSeTOPCM/za@smile.fi.intel.com>
References: <202308171538.nKKUOtbg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308171538.nKKUOtbg-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 17, 2023 at 03:11:09PM +0800, kernel test robot wrote:
> Hi Bartosz,

...

> >> drivers/gpio/gpio-pca9570.c:42: warning: Function parameter or member 'chip_data' not described in 'pca9570'

Blame Bart for this :-)

> b8a34582c7f7f2 Shubhrajyoti Datta  2022-10-26  29  
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  30  /**
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  31   * struct pca9570 - GPIO driver data
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  32   * @chip: GPIO controller chip
> b8a34582c7f7f2 Shubhrajyoti Datta  2022-10-26  33   * @p_data: GPIO controller platform data


So, should be @chip_data...

> 16d44b6085c1d9 Sungbo Eo           2020-07-09  34   * @lock: Protects write sequences
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  35   * @out: Buffer for device register
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  36   */
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  37  struct pca9570 {
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  38  	struct gpio_chip chip;
> a3f7c1d6ddcbd4 Bartosz Golaszewski 2022-12-30  39  	const struct pca9570_chip_data *chip_data;
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  40  	struct mutex lock;
> 16d44b6085c1d9 Sungbo Eo           2020-07-09  41  	u8 out;
> 16d44b6085c1d9 Sungbo Eo           2020-07-09 @42  };

-- 
With Best Regards,
Andy Shevchenko


