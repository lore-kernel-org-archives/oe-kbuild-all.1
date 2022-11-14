Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4875C6FC1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Nov 2022 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668441787; x=1699977787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5AaiXYz+1RmM1Bf9NQ6qqraB4/QAJtAVIge5ln1rEd0=;
  b=NlQjah70pN4t3ujSHKYJgeXjfwwm5FZqt33Qei+T2GmqGD7RBeM/HaJj
   wy+70E5I7RKgCRGOpMWfSMRErweb5GESBVRfm9pRf1lNP/qHRbq50vvOr
   bUs5n0Nn/l1NiKaFWBO0Bf1WBXA6/bXtLupCzPq+PTo6gIoWVONWaUHGO
   Pk5Ki2+ULaj24xRgkBnkWkesVjITmahDQ1HroB6bBf9qbk4TNYrtI5NAj
   0Z6WqnVeOBHUgRUJqGtjevRHbAQtgEj/KGmUmjhBqsZ9H1dv/jbZUj5Re
   26AwqpURV3UAfe9EzY8Cilt6VJViOZJ5XLKAjNRQNJCs68p8XmrG2EMi7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398296842"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="398296842"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 08:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="763532024"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; 
   d="scan'208";a="763532024"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 14 Nov 2022 08:03:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oubvI-00CEus-2T;
	Mon, 14 Nov 2022 18:03:00 +0200
Date: Mon, 14 Nov 2022 18:03:00 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Jakob Koschel <jakobkoschel@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Kevin Cernekee <cernekee@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 1/4] list: Introduce list_count() to count existing
 nodes
Message-ID: <Y3JmtNExJulq2CEE@smile.fi.intel.com>
References: <20221114112842.38565-1-andriy.shevchenko@linux.intel.com>
 <202211142350.i0ngTfIl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211142350.i0ngTfIl-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 14, 2022 at 11:38:04PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.1-rc5 next-20221114]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/list-Introduce-list_count-to-count-existing-nodes/20221114-193023
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> patch link:    https://lore.kernel.org/r/20221114112842.38565-1-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v1 1/4] list: Introduce list_count() to count existing nodes
> config: x86_64-rhel-8.3-func
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/124813c325e31e99580c2aaef85bb3943e55c36e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Andy-Shevchenko/list-Introduce-list_count-to-count-existing-nodes/20221114-193023
>         git checkout 124813c325e31e99580c2aaef85bb3943e55c36e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):

Oh, nice! I will fix this for v2.

-- 
With Best Regards,
Andy Shevchenko


