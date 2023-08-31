Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30314017
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693499325; x=1725035325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kSDnQ0uXAsCAjcMWBmNasBfHzK4NZGm8+gMpGlObIks=;
  b=dXEe8CdccIFVPk9oKacMD48hyn1Xq3Tu8h/z9ZtAx8iKxRmL6EErksaH
   VkAakGyt8BHEyA/Hq1e1CXqj3qz/dI6qbHAPmvrqlFMdaXRLINVxgHXD1
   AWtwT8Q0JlWDjJKp+xubOKauSAE3jbIwlfXvwy0IoBohBS+X8Y80uKK+9
   KpN0nBBDxuxqL5Nl/3LuTwqy1Ni0QDgwvnw7KMKPOLksbZN5UHMubRFkw
   85gH+1kH9QVBTP3r80WTD5nzwbolmvPji3LyWN+AcUw2k78pBAvznu75i
   JMzMTsYuTEE4kk6nJfg4OuvmEIdtGh2/jfBhibNiWjFM7paruX7hV31iF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356309102"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="356309102"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 09:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986291478"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="986291478"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 09:28:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qbkXA-005R0W-2e;
	Thu, 31 Aug 2023 19:28:40 +0300
Date: Thu, 31 Aug 2023 19:28:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 8811/11214] arch/x86/pci/amd_bus.c:59:16:
 sparse: sparse: cast truncates bits from constant value (fcffffffff becomes
 ffffffff)
Message-ID: <ZPC/uPEXEwQimtWw@smile.fi.intel.com>
References: <202308301929.UtNM1sWc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308301929.UtNM1sWc-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 30, 2023 at 08:02:01PM +0800, kernel test robot wrote:

...

> commit: 7fe99c836ebd8e02d5cde4dae7d7559fa1ff2f01
  range.h: Move resource API and constant to respective files

No, this is false positive. The warning was before that

include/linux/range.h:40:16: warning: cast truncates bits from constant value (fcffffffff becomes ffffffff)


-- 
With Best Regards,
Andy Shevchenko


