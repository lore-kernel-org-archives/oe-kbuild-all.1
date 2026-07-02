Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D62381EA8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007080; cv=none; b=ex5aOX5pbpZnjPOnGzddnhqSdg/pGSIAWve60cgJKhAWASB+Ei6NdX51A4XMVgaz2lSgRyLUnu+lWWjhJ1VCLz4UDsZ9RzJCqW2csq6UEnMZ2ryrEQL/SyDkfR2chuskmTbsvuLYOYvtkHPHnJEkVENZr+7NbwVSBoEcWpanuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007080; c=relaxed/simple;
	bh=ukEECO4lr7cZ/ZXiIGmTaB22Bkn46FPfTjwC+LxkTUM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h6nzsvXRoYBVQWEYOs8rM1NH4UpA6nnAhpWSvmAxTfrRhAWyR+MGJH7GRD/MgibFneJCRcV3jJiJ0Vje5tjr5cmprS6GaMGe09sWrRpiCyue+cyFkOdFzyeQgclbOHwguEqNUQUoDLtbYAQiHoQgB9z8nHN2xIhtTyEjl4kZ6M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAs+Drpa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAs+Drpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0911F00A3E;
	Thu,  2 Jul 2026 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783007075;
	bh=fqmSoFoHfVxfl5b+7h9jjaxibcmTpN0+A1CoJSSI+Uw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BAs+Drpa05PRXjf7cGo7/oMPpN04krudgvl1bfMnr5BwMJm0ySZVn5XzEQ/nJjms/
	 r4tKDbIDRVGFuhsRu11DstXxJZdATTj5Z35ZJR0NiwIhfy/7TjpYcBSQilB1KuY82A
	 X2QXW4CyQY/v/AnQoCEO1fuisg+/MapcDmm3Ldkv6RFYNwJTaYbzJ9Zes7wr5spVKY
	 FqYKADaFumWQHUBey3pmGDfZo4HT0hogsbmfmetyThdmM4/XemlMeu9gNNEQr8ge+H
	 QigLy56Zs7qxvyyGy3GFZK6e2xk+W/BeAoJ1EV5jFOa+17CX1tPvpPj0eZ7hKHb9RB
	 17llZgtSGwBFw==
Date: Thu, 2 Jul 2026 16:44:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Roman Vivchar <rva333@protonmail.com>, oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@intel.com>, David Lechner
 <dlechner@baylibre.com>
Subject: Re: [jic23-iio:testing 86/95]
 drivers/iio/adc/mt6323-auxadc.c:25:10: fatal error:
 dt-bindings/iio/adc/mediatek,mt6323-auxadc.h: No such file or directory
Message-ID: <20260702164431.5b884147@jic23-huawei>
In-Reply-To: <202607020953.EPrGWOdn-lkp@intel.com>
References: <202607020953.EPrGWOdn-lkp@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Jul 2026 09:33:24 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   2bf164847e2e83599b4c2454e301a3aff92fddfc
> commit: 022cc99d5d1cdc76b09b424a769c3cfea3812378 [86/95] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607020953.EPrGWOdn-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020953.EPrGWOdn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202607020953.EPrGWOdn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/iio/adc/mt6323-auxadc.c:25:10: fatal error: dt-bindings/iio/adc/mediatek,mt6323-auxadc.h: No such file or directory  
>       25 | #include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
> 
> 
I messed up a merge conflict resolution.  Fixed up now. 

Thanks,

Jonathan

> vim +25 drivers/iio/adc/mt6323-auxadc.c
> 
>     24	
>   > 25	#include <dt-bindings/iio/adc/mediatek,mt6323-auxadc.h>  
>     26	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

