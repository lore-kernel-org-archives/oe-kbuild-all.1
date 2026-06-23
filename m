Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D59D34252C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202935; cv=none; b=i3YHwsU7bbB4Z8NvA5swnWNcfzQIIOaZlmN87s3IlN3goP7Bro6mteGPLIvMlSHBRX81bWMTq/+UYeVLycTCk0bGAWxT07KUURp4TTGx90aalZ9mz+M7xBHj72hi+sziiR1tigM9HvMQCVVBSI9OppVO9IitLGCk8DnJ4SGC+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202935; c=relaxed/simple;
	bh=39wXNoIWiOvvqIChs1ODPrHhnqQGDCGxPi5BJ/VZZoM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnVuBdR99JFiJfmkmcdwZN1b1m4iFCpmHlD6vYiTNvbtEeDcX4eWE/ZpEM8NJXzVJZcJNfLN+bDofmb+JqjTqHG7PZEPskTsNeyCCrZ7GF30/Urmb3ABwtb0vLKVPgoXjg+eMZbKPID8/HWZy0ftJWuxXsWZaO08btnC8rbgNXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aS1UCzkp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aS1UCzkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189F21F000E9;
	Tue, 23 Jun 2026 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782202934;
	bh=hMzE+66Q09lDJXjqObjnv3qomD+dbfXZbnfOUw454EU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aS1UCzkpgxnIEokR3EY27vBfP8PoALGWpjf5R8j9x484PtdhyWLHZFpNMhRXsYj/2
	 HEPhzF9h5LL4j/lqbSJkH/pBKZ9Eae/3lKzKeTbj2G86JJprKI3nKbIG0WqaOysp6I
	 qbn601R9j/GSOnrclWDCSYRB3u3m7NyyeVh3d3wRMpmMZK4V774g2TabrMWIMAhGnE
	 aic3F7pf1XMJ0PZBfoPoxezFE9azrxVuh2q39jr9FsGyJ2vsR2oSJxldltl2/cma6C
	 iUmNzPp9EcVq2C14c11pzE3azuXch4lHOm7sJ0QWzqj+J9ByGDKsqUiOGOtJYY4nE1
	 VclscB/NPOfIA==
Date: Tue, 23 Jun 2026 09:22:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Piyush Patle <piyushpatle228@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [jic23-iio:testing 36/53] Warning: drivers/iio/adc/hx711.c:90
 struct member '__counted_by_ptr(num_channels' not described in
 'hx711_chip_info'
Message-ID: <20260623092207.6eeaa1b9@jic23-huawei>
In-Reply-To: <202606222214.0QOs1Ug4-lkp@intel.com>
References: <202606222214.0QOs1Ug4-lkp@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Jun 2026 22:40:51 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Piyush,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   cc746297b23e89bd5df9f91f3a0ca209e8991763
> commit: b0949f79b8ffa6f02c713cc2b14a16d8f32c08cc [36/53] iio: adc: hx711: introduce hx711_chip_info structure
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260622/202606222214.0QOs1Ug4-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606222214.0QOs1Ug4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606222214.0QOs1Ug4-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: drivers/iio/adc/hx711.c:90 struct member '__counted_by_ptr(num_channels' not described in 'hx711_chip_info'
> >> Warning: drivers/iio/adc/hx711.c:90 struct member '__counted_by_ptr(num_channels' not described in 'hx711_chip_info'  

There is a patch in the docs pull request that I think addresses this:
Tudor Ambarus (1):
      docs: kernel-doc: python: strip __counted_by_ptr macro
https://lore.kernel.org/all/20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org/

> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

