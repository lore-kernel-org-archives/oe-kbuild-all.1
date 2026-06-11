Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320F03C5848
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174971; cv=none; b=tSaANGwqTpxmOgJbbV+lhGKuDjBdQALd72lABEQYdpA8Kz53caK1y0Y1/wT+Hwk5riSFOldodC982xoHjNz1dUZDvp9BAwPJVqmNZpJNKFCzpQSHw/8x49kXcBSVbgkaUmZWvKAvcYaVmk7aUlxFdQxTJ3dUr60A6du/fEL+5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174971; c=relaxed/simple;
	bh=wYP3QlBJ9Idp8K01fNOv/4KCiIx5o0Q9ZEEmZ8jbkcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1BnC2wldfGpVZt9d2zPPy7USmI15qrtXxjHOlZ0LirE09EHGU6jWLvK8SjIp5JRP/LaaKmsBuev4x7S+F4844vOMUnKMeRlB63fy3j8fRMIgp9Y02Cp8MaatKhgvjSpQeQOHsAVZA/CSFo7MwXaLphc2KI5x42XGycOEPmMCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyeS3mOH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyeS3mOH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEC61F00893;
	Thu, 11 Jun 2026 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174970;
	bh=nahLUyZ1yONi9UQ07T9/uAzcxZjylhf8P6ECd5cQ9EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QyeS3mOHKV10Sw4r1+M1B+6UEa5vjumhBnLpyth7WC4VA92fr1BYzC1eIb/R/RuCe
	 w3+B93lGHpYhypfDP4TfIQ+h37LNLc5adOHkMkJPxceeD/e8SzIBIjOeCLPXd5UbwM
	 cl8qEgMK/uAHmB4kaE4INPS6g0LOHGfFRF50bfviksY2k+vviU82l5eES9XbZPWTnP
	 YNX7+uziJHZJchH8XTTm5MXKz22WqlHRvtFShkb4ZUDg+ptLIDgw9U52kCnRaCuJ2I
	 okon7juZkqlcCXR/uPKBpfCAYlXdTOBi/G/OTTmMsi8turxnsJZzxnqtPmVYeFAopO
	 ibQiMhEyXPQmg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXcyV-00000001tSp-2Yrn;
	Thu, 11 Jun 2026 12:49:27 +0200
Date: Thu, 11 Jun 2026 12:49:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulfh@kernel.org>
Subject: Re: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 'genpd_provider_bus' defined but not used
Message-ID: <aiqSty1-fQI4pF2-@hovoldconsulting.com>
References: <202606111746.kAxaAbwg-lkp@intel.com>
 <aiqIx_ayahpHI_oF@hovoldconsulting.com>
 <CAPx+jO8-wvkXh84+kY2rotRU7Jr5RC68bF0HeWEC=bTO1uAoDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO8-wvkXh84+kY2rotRU7Jr5RC68bF0HeWEC=bTO1uAoDw@mail.gmail.com>

On Thu, Jun 11, 2026 at 12:47:09PM +0200, Ulf Hansson wrote:
> On Thu, Jun 11, 2026 at 12:07 PM Johan Hovold <johan@kernel.org> wrote:
> > On Thu, Jun 11, 2026 at 05:36:21PM +0800, kernel test robot wrote:

> > > >> drivers/pmdomain/core.c:36:23: warning: 'genpd_provider_bus' defined but not used [-Wunused-variable]
> > >       36 | static struct device *genpd_provider_bus;
> > >          |                       ^~~~~~~~~~~~~~~~~~
> >
> > Bah. Apparently the only users of the bus are under
> > CONFIG_PM_GENERIC_DOMAINS_OF so this one either needs to be marked
> > __maybe_unsed or be moved inside the ifdef.
> >
> > I'll send a follow-up fix.
> 
> I suggest we move it under CONFIG_PM_GENERIC_DOMAINS_OF along with the
> other corresponding parameters like "genpd_bus_registered".

Thanks, that's what I settled for too.

Johan
