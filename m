Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938351F1539
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 10:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268716; cv=none; b=IeFU5tLuZ3t5qEXw5+SohlMSy/O0bRbDFxrJMyThsYBYxhRS0NNHrUSNwww8+cdBuK41HQaTEs27fq/fR9MvTonvY+utISGgxGZ7ECqKSNptN5W9W2r7zVOyBsfD4SxPk/rOxTucWoP89/RAYomm/XKa4ScCN+yMohKqhGCqXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268716; c=relaxed/simple;
	bh=9UxzOfozxDl6zQSlPurGbPQQW3VYnw+4If1eY2vVTG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0EINzM2uymbdBCmx0W1CLx1f5PUenRWqy9GAClkz0ng0poria/EamCRqIhQUBeLY1SWPS2+3TBTy/FiLbPNs3VPrPjbVXIFgAsh/34HK+FmF44MF7W03YEShbkHjaRJsfkylbP7sWYKEbaw2yh2Roz3HhRTerE/wCqgiUopj5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GZhgB60e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZhgB60e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739268715; x=1770804715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9UxzOfozxDl6zQSlPurGbPQQW3VYnw+4If1eY2vVTG8=;
  b=GZhgB60e9SDoL+RpsJepULTOZAqcC4azMFGVmFHlGbGKw1ZWC8wtataq
   3yKp7arQwCOZyU48KmnG0RT9sYuEqlB+iaqpVhr6H+8HLSaZGAxyDWkLc
   Yj7WLouLhmkJ93unuwPGK9/0KkVmAAglQSSDEteP2gSb5AGE5S8T4Ym5D
   AUszBaLndzxkL3ecVkhiky3PJ/fOU6N1cytK/TxdD71KnzFvJECsMUOSp
   B9RkNluFhhkiA5fxflg7r8Plo7W9FeowGPSWkOOOtcBkXKgwrastZ6egR
   47z8EH8G9Anl++cA+sI+1Oyu0NGHd3N3PEZAUNrCXOa5r6pMP+/3YJoCR
   A==;
X-CSE-ConnectionGUID: 2N27B1nYT96QghaFJReNdw==
X-CSE-MsgGUID: TBQmJVyVRT6osDTvUHXLhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62350288"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="62350288"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:11:54 -0800
X-CSE-ConnectionGUID: Tj+PRwGYTTyFZfHlBwt0dw==
X-CSE-MsgGUID: f0AhNuSQQFuE55W/EyJkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117552655"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:11:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thnF4-0000000ASzb-3hWk;
	Tue, 11 Feb 2025 12:11:46 +0200
Date: Tue, 11 Feb 2025 12:11:46 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <lkp@intel.com>, Raag Jadav <raag.jadav@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, lgirdwood@gmail.com,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 01/20] driver core: Split devres APIs to
 device/devres.h
Message-ID: <Z6siYlWfvfUvNLpX@smile.fi.intel.com>
References: <20250210064906.2181867-2-raag.jadav@intel.com>
 <202502102201.zLWaJC6V-lkp@intel.com>
 <Z6oZ9dnYrlp5djiQ@smile.fi.intel.com>
 <7c42e438-22f9-40d9-bb8e-24feb7d58e64@app.fastmail.com>
 <Z6sYAxRIeCzw12nY@smile.fi.intel.com>
 <c1184a91-e216-423d-b956-d4b22116a171@app.fastmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1184a91-e216-423d-b956-d4b22116a171@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 10:39:16AM +0100, Arnd Bergmann wrote:
> On Tue, Feb 11, 2025, at 10:27, Andy Shevchenko wrote:
> > On Tue, Feb 11, 2025 at 08:36:47AM +0100, Arnd Bergmann wrote:
> >> On Mon, Feb 10, 2025, at 16:23, Andy Shevchenko wrote:
> >> >
> >> > TBH I have no quick idea how to address this. It seems that io.h 
> >> > includes device.h
> >> > for no reason (but I haven't checked that carefully). OTOH, we need only
> >> > IOMEM_IS_ERR() definition which can simply be moved from io.h to err.h 
> >> > as the
> >> > former includes the latter and the definition depends only on 
> >> > compiler_types.h.
> >> >
> >> > Arnd?
> >> 
> >> Removing linux/device.h from asm/io.h is probably the right step,
> >> it really has no business in there and no other architecture
> >> includes it. I don't see an IOMEM_IS_ERR() definition, do you 
> >> mean EEH_POSSIBLE_ERROR?
> >
> > The definition is in the generic header and patch here relies on
> > that definition to fix the sparse warning. The simplest solution
> > is to add another patch that simply moves the macro from
> > linux/io.h to linux/err.h.
> 
> Ah, IOMEM_ERR_PTR(), not IOMEM_IS_ERR().

Oh, yes, sorry for the confusion.

> I don't mind moving that if it helps you, but don't see what
> the problem is here. Is this missing because of a circular
> #include list with linux/device.h including asm/io.h and vice
> versa? If that is the root cause, then I assume there will be
> additional problems either way until the loop can be broken.

I don't see how. io.h already includes err.h, so whoever includes io.h should
have that as previously.

> >> Most of asm/eeh.h probably shouldn't be included by asm/io.h
> >> either, my guess is that we can get away with the
> >> eeh_{s,}{b,w,l,q}{_be} helpers, eeh_memcpy_fromio() and
> >> eeh_check_failure(), which have no dependency on 'struct
> >> device' in the header.
> >> 
> >> Removing a giant header inclusion from another one likely causes
> >> build regressions in drivers that should have included the
> >> header (linux/device.h or something included by that) themselves,
> >> so ideally there should be some separate build testing of
> >> powerpc kernels.
> >
> > I believe this might be far out of scope for this series due to potential
> > fallouts here and there. But would be good to have it separately.
> 
> It certainly gets towards yak-shaving, but it does look like
> the best solution. It really depends on how much breaks -- if there
> are only a couple of missing #include statements, I can see those
> get merged early as a bugfix or as part of another series. If there
> are a lot of them, it is probably not worth it.

-- 
With Best Regards,
Andy Shevchenko


