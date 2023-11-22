Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B235C06F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UehxtEg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700678028; x=1732214028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZtOI3P+73D+xoSiDpddoMtHCbPxN/JLlZwoFdrAlN6g=;
  b=UehxtEg5U78tQvg8ACLZf4cdpCiQkDeXDRmJtsbTsrq04M1X09Q9W87t
   bTrabODbcGH5tGXrjSzkLQhu20TVVCA8mdFfy2s9Zd9PxM9DDNulrNp/j
   nlX4fsdH67EqDJTRFXlKO7NAcmsBo2bYnBrCmzsCqGbqjXMc3slScdJ8a
   It4FKvNwRQuHvFiw5Emgf7B6h+gqq4F6+ayRfPx0bwX0u7ybfbgC70qFs
   NTB9dlk5hhF/pEsya+yviMwr/Bk9+JtedIuuI6SKWgS3mGvtvfsiWF1xQ
   h3DM9NViRaJOVuBoeG4b1lYmc2qhXCLo4YBmLgTUXXfAa2p2mfKsMpujr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13671783"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13671783"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP; 22 Nov 2023 10:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="743340984"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="743340984"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 02:29:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5kLW-0000000G3pL-01Mp;
	Wed, 22 Nov 2023 12:20:38 +0200
Date: Wed, 22 Nov 2023 12:20:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: drivers/extcon/extcon-intel-cht-wc.c:153:3: warning: this
 statement may fall through
Message-ID: <ZV3V9VTRxmFqIj0E@smile.fi.intel.com>
References: <202311220741.oIvJcjV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311220741.oIvJcjV4-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 07:27:14AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
> commit: de85d79f4aab67fe0537dd6e2c5d545b88239cc4 mfd: Add Cherry Trail Whiskey Cove PMIC driver
> date:   6 years ago
> config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archive/20231122/202311220741.oIvJcjV4-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220741.oIvJcjV4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311220741.oIvJcjV4-lkp@intel.com/

...

> db0f3baaa38bb5 Hans de Goede 2017-03-23  151  	switch (usbsrc) {
> db0f3baaa38bb5 Hans de Goede 2017-03-23  152  	default:
> db0f3baaa38bb5 Hans de Goede 2017-03-23 @153  		dev_warn(ext->dev,
> db0f3baaa38bb5 Hans de Goede 2017-03-23  154  			"Unhandled charger type %d, defaulting to SDP\n",
> db0f3baaa38bb5 Hans de Goede 2017-03-23  155  			 ret);

> db0f3baaa38bb5 Hans de Goede 2017-03-23  156  		/* Fall through, treat as SDP */

Replacing this comment by a fallthrough annotation should fix this (and comment
itself is redundant as long as properly annotated).

> db0f3baaa38bb5 Hans de Goede 2017-03-23  157  	case CHT_WC_USBSRC_TYPE_SDP:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  158  	case CHT_WC_USBSRC_TYPE_FLOAT_DP_DN:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  159  	case CHT_WC_USBSRC_TYPE_OTHER:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  160  		return EXTCON_CHG_USB_SDP;
> db0f3baaa38bb5 Hans de Goede 2017-03-23  161  	case CHT_WC_USBSRC_TYPE_CDP:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  162  		return EXTCON_CHG_USB_CDP;
> db0f3baaa38bb5 Hans de Goede 2017-03-23  163  	case CHT_WC_USBSRC_TYPE_DCP:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  164  	case CHT_WC_USBSRC_TYPE_DCP_EXTPHY:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  165  	case CHT_WC_USBSRC_TYPE_MHL: /* MHL2+ delivers upto 2A, treat as DCP */
> db0f3baaa38bb5 Hans de Goede 2017-03-23  166  		return EXTCON_CHG_USB_DCP;
> db0f3baaa38bb5 Hans de Goede 2017-03-23  167  	case CHT_WC_USBSRC_TYPE_ACA:
> db0f3baaa38bb5 Hans de Goede 2017-03-23  168  		return EXTCON_CHG_USB_ACA;
> db0f3baaa38bb5 Hans de Goede 2017-03-23  169  	}

-- 
With Best Regards,
Andy Shevchenko


