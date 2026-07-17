Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF483803C3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307333; cv=none; b=YgUf+wSXVxBFPFyDLVRMWpZSqnw0VQDRb+93Y8sfPS9AZbjlTyhZVptDpKNe0Cf4YpdLWrvJntg5n80+LAY10s3aPvCTGtSsoSVa8U4c0wCqCD4HyRf4vHlZ3D3MRUnili7C6yj6C4eHJ01GAPvczRMvlplkPSxr8cTzJ5Zm06w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307333; c=relaxed/simple;
	bh=xIR05FEujurajmZtc7m8zHZm8JGMkvI4OxKAkMe9JRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqimZRnGmThltw4sk3By28t4dPbNxE9wEpHejPUrVIvGSemEwkJXpKC7g+egQyQpI1qmJQ4p36upGUTCGvTXE1NpPxfj6D+KqmSHO7LB0rfiBijcZB8Hb+HBKMZhJK0KWkmGSOvYkAtdFweveWKxBgXYNzK4u9ENOL8WBKqFIRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSweg1vh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSweg1vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784307332; x=1815843332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xIR05FEujurajmZtc7m8zHZm8JGMkvI4OxKAkMe9JRU=;
  b=HSweg1vhcWT55PiW0IZRL3VUc/mm8wCPdmSkSiUQzmdbcfxYf8ARhOEz
   EGgfqJxC7VP08rH1GckgTa6z9LSVd9FHGXiAP3w5KfI3CaAXlqSofSkfC
   SMkOsy7JvdEdWiX0dbXIWgzf8hLficLUc0HjrAJGGpkRoTBeBAIdeERXG
   p4pOAzMesqvWTQ4CeMU9W1YkaSuAIBgk5OkIjrqvhCuehVAU5Zfx5HpyI
   qjfd/GxddpCCbkxKD3kq46E0dtpq40RSrWZeBi3nH4rNajPbw8aBg1mdR
   s1i5IQfSLy7TS7VyKceelamhYN/lyt/M3SQfoWM0O5owfss3m9Btgz8oW
   g==;
X-CSE-ConnectionGUID: ryRWpMSQQwaZw/5qsoxddg==
X-CSE-MsgGUID: B16q29LkRJ2rFBYorFQ9fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88882459"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="88882459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 09:55:32 -0700
X-CSE-ConnectionGUID: +biP5s5fRqOS3GJxtLLlaw==
X-CSE-MsgGUID: 4ve4jUcjQrG8Gg5McsJCDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="260416096"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 09:55:29 -0700
Date: Fri, 17 Jul 2026 19:55:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Roman Vivchar <rva333@protonmail.com>, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srini@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [srini-nvmem:for-next 28/34] drivers/nvmem/mt6323-efuse.c:6:10:
 fatal error: linux/device-id/of.h: No such file or directory
Message-ID: <alpefxfyFTeTEXde@ashevche-desk.local>
References: <202607171922.uQxiA3uv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202607171922.uQxiA3uv-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 17, 2026 at 07:59:19PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
> head:   2a3ed29b053137a91af7963038d437657065e57e
> commit: b3c090960d86901bd4e41447744fd532d6e1d7f9 [28/34] nvmem: add mt6323 PMIC EFUSE driver
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260717/202607171922.uQxiA3uv-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171922.uQxiA3uv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607171922.uQxiA3uv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

...

> >> drivers/nvmem/mt6323-efuse.c:6:10: fatal error: linux/device-id/of.h: No such file or directory
>        6 | #include <linux/device-id/of.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.

This header shouldn't be included explicitly. Now platform_device.h is
responsible for that. TL;DR: This inclusion should be simply dropped to
fix this.

> vim +6 drivers/nvmem/mt6323-efuse.c
> 
>    > 6	#include <linux/device-id/of.h>
>      7	#include <linux/err.h>
>      8	#include <linux/module.h>
>      9	#include <linux/nvmem-provider.h>
>     10	#include <linux/platform_device.h>
>     11	#include <linux/regmap.h>
>     12	#include <linux/types.h>

-- 
With Best Regards,
Andy Shevchenko


