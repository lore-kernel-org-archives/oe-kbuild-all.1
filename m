Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A719E98D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865479; cv=none; b=U6RZEn31nsM274IK69vmjLGfRad421o4dcE6HHzY2hMbvcUDP09wHDREpOXxGcpeOvNw0W56ZOM/8l0Xlv2FLKZKJlJSP34KUOmXL9CE8GtnE/H3EV07F1K9gteKR4sT4VEEJcygSYizPiaPFYASh3mYhr45vX0t7V3nh0sCv3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865479; c=relaxed/simple;
	bh=9vRyEHJHFpcr3sE+aLJw6NFhHWVoNdgXB+W5Pdi5tVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieuSoPQCGv0ENS9jEiMI2wI7oW0IxPmAHME7VdTLOPFHyOK7yUe5Vk94jaP5SP6mpI93XtPg5rwXjrH6opMMa6Nw5dsIujHSnzIILRrG1BrO8g7cQt2TiqhrraCIwWuGoBC51hMoCABzscmvBvbuvtb97uDpLzpPpDn6rxhbl8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYr6R0Oj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYr6R0Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865478; x=1770401478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9vRyEHJHFpcr3sE+aLJw6NFhHWVoNdgXB+W5Pdi5tVE=;
  b=KYr6R0Oj//DW4UR6ceRkaYTIZ2GKbj6ABN2hauWuABw7QWCDJzbeqQs/
   q4Y9eq61tktnmYR1BuOeVrtYH9vC+LSfZDHPp3RYmU73bVcNf4vGo3Scu
   Snd+CNUs/rQJl7+WM3xXIJdhGldoJxcz0l+SZE/f7e7X0wllZa+DBcls4
   X0+dw7FbvsWj+O541o9yQkjcy1DnguHGfBHLpnblijiiwsXExtaf83Xml
   aQpVWB6dweivQ+4fA+NZ7Xg120InYPEThUoF0F7dyVWpl3QM5TKGmNFDo
   MJGQYjgtK+hV4/1uIl4kRnpamqy7mGc7GiuGy63AQ/LroBy0kqebsSQ4b
   Q==;
X-CSE-ConnectionGUID: b/e1+NOpQpaqNQWa3yCk+w==
X-CSE-MsgGUID: s4w8mKKoTy+tzezykdTctw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56904262"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="56904262"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:11:16 -0800
X-CSE-ConnectionGUID: Ju8QnR+iS3iwXTl/7oVP/A==
X-CSE-MsgGUID: izyH6iwjThCvY8M+hQh3Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111118158"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:11:11 -0800
Date: Thu, 6 Feb 2025 20:11:08 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, linus.walleij@linaro.org,
	mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, sre@kernel.org,
	jic23@kernel.org, przemyslaw.kitszel@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v3 01/20] driver core: Split devres APIs to
 device/devres.h
Message-ID: <Z6T7PE2Qpw4VbQyn@black.fi.intel.com>
References: <20250203080902.1864382-2-raag.jadav@intel.com>
 <202502060025.XJwUub6I-lkp@intel.com>
 <Z6RS-A2FFjYuPoyn@black.fi.intel.com>
 <Z6TRcWCKe__oxCUV@smile.fi.intel.com>
 <Z6TRveCRK7LFwSNV@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6TRveCRK7LFwSNV@smile.fi.intel.com>

On Thu, Feb 06, 2025 at 05:14:05PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 06, 2025 at 05:12:49PM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 06, 2025 at 08:13:12AM +0200, Raag Jadav wrote:
> > > On Thu, Feb 06, 2025 at 12:27:03AM +0800, kernel test robot wrote:
> 
> ...
> 
> > > >    102	
> > > >    103	static inline
> > > >    104	void __iomem *devm_ioremap_resource(struct device *dev, const struct resource *res)
> > > >    105	{
> > > >  > 106		return ERR_PTR(-EINVAL);
> > > >    107	}
> > > >    108	
> > > 
> > > Andy, are we expecting this?
> > 
> > Oh, no, it's sparse error, but easy to fix. Need to have
> > 
> > 		return IOMEM_ERR_PTR(-EINVAL);
> 
> But isn't it the original issue? I mean that it was already before this series.

For all this time?

> If so, perhaps you can fix all sparse errors like this in the devres* code.

With a fixes tag?

Raag
