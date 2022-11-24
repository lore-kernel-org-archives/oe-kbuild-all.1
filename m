Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE233F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Nov 2022 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669318575; x=1700854575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C8l6VkDUAjQEQdg9zyM7mPOQgK66sCV8qL/BSSTOXpQ=;
  b=Vi3r8iNnNbeTNvsOYvG2UBn9PgLSJFqOUbWtaCxIR2iG2TrBOdqVfeNS
   NVVUNeeF8J5Hwengy/sP91U4zzjrBhnb9wcO2Mo4izu6fXvFej4h8b90C
   bVV9V+zwpBzcz646XRpfEbRoATQahKMEd8/3GlMvH3/6+lIICW4oTc4i0
   ubnnA6h4KSDXFNn4Ty0wwuhZDJmwIwJHgBdO4qmEl/ZNYawjtBk6H2UKX
   n0qiqdDM28DgPJVc7gXnBeIW+kV3ejOPGrRQb9fmqkkIpQLd9WQuLmBau
   T+scE3Yz2HUz+ZfL4WGIA7kQf2sHXaKcnI9sWJgk8ZmzBW/OPljBYceh1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="314393040"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="314393040"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 11:36:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="673330855"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="673330855"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 24 Nov 2022 11:36:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oyI13-00GvS6-2B;
	Thu, 24 Nov 2022 21:36:09 +0200
Date: Thu, 24 Nov 2022 21:36:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: kirill@shutemov.name, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, jejb@linux.ibm.com,
	linux-kernel@vger.kernel.org, lkp@intel.com,
	martin.petersen@oracle.com, oe-kbuild-all@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH 2/2] x86/mm: Fix sparse warnings in untagged_ptr()
Message-ID: <Y3/HqcdjLI2QQMTC@smile.fi.intel.com>
References: <20221115155802.p3vjnk7eqqcyskt3@box.shutemov.name>
 <20221116004353.15052-1-kirill.shutemov@linux.intel.com>
 <20221116004353.15052-3-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116004353.15052-3-kirill.shutemov@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 16, 2022 at 03:43:53AM +0300, Kirill A. Shutemov wrote:
> Linear Address Masking patchset triggered a lot of sparse warnings.
> 
> The root cause is that casting pointer to '__typeof__(*(ptr)) *' will
> strip all sparse tags. The type has to be defined based on the pointer
> type, not based on what the pointer points to.
> 
> Fix cast in untagged_ptr() and avoid __typeof__() usage in
> get/put_user().

Without this patch we have

drivers/auxdisplay/charlcd.c:482:21: warning: incorrect type in assignment (different address spaces)
drivers/auxdisplay/charlcd.c:482:21:    expected char const [noderef] __user *__ptr_clean
drivers/auxdisplay/charlcd.c:482:21:    got char const *

So,

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Can we have this series applied, please?

-- 
With Best Regards,
Andy Shevchenko


