Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92B208AD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762320402; cv=none; b=fOltIQmlNDj2/aX8/kiemSTCd8gGUXG2rwUw+3jYuCJ6sXUsFVoNUYyT/7FF+H2aqga/un1blh3OR3zbRTUyKHT4grJJ3oxi6lbIrictp54TbqKnE1XXSO3mNIj/GCqLAsKORfW0ZLbKQ/CZq0pKkfW+dX8ktlt7Bz4F4Jws30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762320402; c=relaxed/simple;
	bh=VFDrT7v9nzeQc0ET3dcKyt9fXBWzIXludixrYjczo8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXVwzO6z7JUhTQxmAS0D6D5xcVAC7FGOgK+hEr1ja9RXxiRtYJUUuX0GAB7VItpQO1X+BoLtklahKCGOgxquOTYmf2/bwch4ClWigv9MU74S4XFWTqgKwPcbVa6MPNojNNcYzhKF5+xRhVYOeqVQaaHBfcFC5k+fa6TQkK/WrTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9RC3ILs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9RC3ILs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762320401; x=1793856401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VFDrT7v9nzeQc0ET3dcKyt9fXBWzIXludixrYjczo8Y=;
  b=B9RC3ILs3DxtqetpIAZpaIrHJCYAzkfpyDGuvgGLT/CKmOduNjrVlqWc
   pe3zbbCKDktfPE+DqSDS0S3ScwSi86XK5UPywLgKT8/fSTQDNpbP41TFC
   Nsv2OZd+eIQrgDd6nOBnIYfzBsG553ALcJKwflidbsymbaFtr5yKHd2VF
   2+NVhGcZwPK8sCaeq5cd6+0wPEUsAzFHKjVDTnvKUN4NJwnaPCFyGfb2A
   ZVsvHpSxUyOlDzFVn5fWh79KEAKU1BBALYEtLa0L4cnA6wFmZQZm5goeX
   afpY6HpP0/UYyLlQpBLaNgt/2ut3JZkzAMqqxnp6B56eHQjbB6b51MUX5
   w==;
X-CSE-ConnectionGUID: znXLaJbzSouUcFpeXA1+dg==
X-CSE-MsgGUID: rSmTyMN4RrmmCDeZIyRKgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81830770"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="81830770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 21:26:41 -0800
X-CSE-ConnectionGUID: OXlpr7hMSQOGDq2+tKgeiw==
X-CSE-MsgGUID: /Dik2WviQ4q6fl6ZlucOYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187656381"
Received: from ldmartin-desk2.corp.intel.com (HELO ashevche-desk.local) ([10.124.221.135])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 21:26:38 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vGW2T-00000005g1S-2rVY;
	Wed, 05 Nov 2025 07:26:33 +0200
Date: Wed, 5 Nov 2025 07:26:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH v1 1/1] kernel-doc: Issue warnings that were silently
 discarded
Message-ID: <aQrgCBm1QQxIJZyK@smile.fi.intel.com>
References: <20251104215502.1049817-1-andriy.shevchenko@linux.intel.com>
 <202511050720.nJ9ccENC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511050720.nJ9ccENC-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 05, 2025 at 07:14:57AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build warnings:

Right, the change restores the check, so these should be fixed separately.

-- 
With Best Regards,
Andy Shevchenko


