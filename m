Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8C1A2C25
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Nov 2025 05:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762751964; cv=none; b=Fz4Es1dalobmEfkA0J0Mqe8++AjjxETXIlwAxqQWjuyUk/cSwTMbqYuTF9BvyseHWKkps88fJU38EPY36TIbdcwWiXXWUGnWCXELjyXdXIrWRruiicdg8K1pkRZcwa8evPnulsfY3LrFHFf1bPvOuQ3+H63POtypmLU5JWBllTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762751964; c=relaxed/simple;
	bh=tG/LlJtg+YH4Kuz2BBWvsJOConLZpjRTS+j8lSXN0HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJwxcq3cqy2tufdgeRs7oEt/Brm9yPcszgJigud3zlYe+obRU1MquvoBlWcqNi4rHZfN+T+kcmg7MDsCUXywOQIeKxITBCviiOiJHFRKzdqlTwhIhcsshCGYKVuSth/Fcbt8Lxs2oflrUQI2y9w66zaCrJGIl9TZBDj1Slq+/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C64UeF2L; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C64UeF2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762751963; x=1794287963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tG/LlJtg+YH4Kuz2BBWvsJOConLZpjRTS+j8lSXN0HI=;
  b=C64UeF2LKATWhWrUlj8jrJfoY1fh+UnIh5DOmDip8CMu7LN767rGi1Sr
   lm52VA1hJc9HN50ytzbjTWB2mM3x8PrCeboJos7qGg27Ya3INdCkyX1GM
   efYLexLfK3Wof8VBE5fPl9l1hnu6tVMbbXRafkrZOQDVw6olACxPcctlm
   z3ehyPWOjxH5jG7jpQgGMDoEW2gB4zfDyAlbcAE4hsX1BISU7kHNRxfTk
   4ZxTwkvJtQuvCZyLLsoU1VcuUww7Hi7yuFLdI0GgqfvtEN2qoTpMmkBY7
   VyxuGKTTFBlp7K0V8OaX6QrZ7h/JwhqJC1dhVbaqoNvknf7cGONcdJ/6X
   Q==;
X-CSE-ConnectionGUID: hd5veZFCQlKA7tOzt5+y0A==
X-CSE-MsgGUID: YZP50tfZQReW/srzlNbTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64709495"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64709495"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:19:22 -0800
X-CSE-ConnectionGUID: 1eg6AQi0SIiVYOkRtQTxAQ==
X-CSE-MsgGUID: MrQFw1BbSIGnGxMmFjHkTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188533178"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.185])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:19:22 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vIKJC-00000007Lgu-2p6f;
	Mon, 10 Nov 2025 07:19:18 +0200
Date: Mon, 10 Nov 2025 07:19:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/4] dmaengine: Use dma_request_channel() instead of
 __dma_request_channel()
Message-ID: <aRF11uLJ6Pk06Nwr@smile.fi.intel.com>
References: <20251109222944.3222436-2-andriy.shevchenko@linux.intel.com>
 <202511100917.IbXHDyqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511100917.IbXHDyqF-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 10, 2025 at 09:57:56AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on vkoul-dmaengine/next]
> [also build test ERROR on linus/master v6.18-rc5 next-20251107]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/dmaengine-Use-dma_request_channel-instead-of-__dma_request_channel/20251110-063117
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
> patch link:    https://lore.kernel.org/r/20251109222944.3222436-2-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v1 1/4] dmaengine: Use dma_request_channel() instead of __dma_request_channel()
> config: s390-randconfig-001-20251110 (https://download.01.org/0day-ci/archive/20251110/202511100917.IbXHDyqF-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251110/202511100917.IbXHDyqF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511100917.IbXHDyqF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):


Wow, what did I have compile? Seems something different. I will fix this in v2.

-- 
With Best Regards,
Andy Shevchenko


