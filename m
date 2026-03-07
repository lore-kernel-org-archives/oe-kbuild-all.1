Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EB9288C2D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772907252; cv=none; b=YiDtn5RI1pZFedZtJ8Br9fSXSKrLftI/NkZYUQMcausIlbu3UhZZ7RfVJ2IaeonSOAx0RbF0iL4C/TYk9aA0ILYpgL3b3WdcGPrtClQfS3IakG7HTn3DRtCscvKCpsfNMmUBwIb7OnMLkgEMao7jrbK2pZZOX6bSXjhgUDvfXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772907252; c=relaxed/simple;
	bh=2bpNFQYrY+4AxovPokblGV+YZqGYq2o3LMzrIO8FHhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OcKo3OBeFpXM4lqNDNfATuZMqP9KMtlVD+BW//PnlnDMAci8RnwKZKALw2/uDGDupuT59nOhEpOhN1xhFjKvJxdCrXkDHPbYBLJxEKGskTtTS/n3l/9jfsUP3xswJmDtRzI+HMka3mOqZFg/LN2dH+/EK3mghnITqhxYL+Lo+Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KzqHuguv; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KzqHuguv"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d738fe814cso744516a34.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 07 Mar 2026 10:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772907249; x=1773512049; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRdsLK7weBsl9Qz7+q1Z86EFK/E2/7vFXBMivgf8qR4=;
        b=KzqHuguv5EmM0oUuyay1wFRiNWKZib99teJFujF1ylfhPWTsNZCcXz3G9pbXjgnykM
         egcjQf40mspqQoM9kTTXS5LFfBGnhMLHr7em9w9FfrqIIeuLeeETUPfeVj+7Olm7G0my
         IAObSz+WslDT7DHM/5SrNrKbEH0OpRBSjbY5c3stHLqEuaYef+mXdAeYk7ihjeTawLxN
         Spb/j8IE7wlprgeosnyiFN8f0HcsCyBPfzMNpTdveEHWeGpID+QPtSLXa/kFunh/tCVh
         1l6PV5cC/4GXDshdNQOnFQ31KqloWaJxmXhJeDSEh+SPA4IqPjEXrodZtV9wrZz19UJW
         4+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772907249; x=1773512049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRdsLK7weBsl9Qz7+q1Z86EFK/E2/7vFXBMivgf8qR4=;
        b=BXJy6URXynSbfIMN/0TITx++YkGVIKJHLdOjqwFAjp04QKLVhSXKKcV/S5ycpRpvdq
         rq7dUMvSxXzCUumVfQrbntjw6e0uh4BMtcWOmtXLlItSB5pKdJpWnTSwI3UMwWVxgj28
         Rx9y584ddZBA32FHFlK5z7l6KB4EoQvgUyPm/h2b9IdO6JVof4AfbBHP2CWDEp1VOQK7
         d+dU9kSSe5h9pxLnptJsvwOuybV+l8pBQn9a8KI+1l2TVudsD99u1Gr/PhImg8yDs8ME
         MQHOGaJurauDlA9/5VrqI/VGbF6IgVLwstv0wzfcoPDTunb8YaFrvEDOeav1Li/PhB9O
         H4LQ==
X-Gm-Message-State: AOJu0Yx0+z/D1d25qJX1QqfQow5Sygq3FnxZzozBSLMoAltZC50BPZKK
	6dT/9Wq+lDshEhbEtizS2NIi+KeJFK5RjJ0F/nknQfZ/N0fFkG20FHN9Otio60Sm3Ig=
X-Gm-Gg: ATEYQzxUxk/qt7fJk5RB99RrQl57bN1C90FNKDmKBSf+6hYCVfupRaVEHsmAitYJNG3
	tQmuPIqF5nVv0C05NpoxNK+FOoX3Gc9hLoD2OiGTZvKxO6ljNF4tS+ssSzahW/aDbqzbLiK44Fs
	2WGQPI7N9jj1o+Kh7RsB4t+1ucTidQCSHw523kEG5TI8HW4PUPUoxVhiUoNXms0n2Wb00pR0PBd
	13di/iArP1t/L9LjHQGXG0l0Az/Idm1f7964bv28z0SUwb1Z+NO6eURuKC+7eitnEjE9d1CBUSq
	c1DSc4reuiZBw1XUsFksHY3gXNCfq3rXUVB/FAvExWcxo4bv9gCOhOAtfND0lV/LUsiCbNNhnUy
	KQf8wdza53GO/A4dRykVz7zK/teZ/b3IicjLB9kILEZzmmEsPYNLamPHFHSB2qWmCYxww4ob5Lx
	IoP6hAAG2D5rmCVA5Ep3rmZRX0InXPT4phrZlQV5L335nrcqvm6j6Kp5hI8CYvlka0CmO3C1bQc
	atNKUxyeAV4
X-Received: by 2002:a05:6820:1ca3:b0:67b:ad2d:1226 with SMTP id 006d021491bc7-67bad2d15a5mr92348eaf.32.1772907248856;
        Sat, 07 Mar 2026 10:14:08 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bacd85dd6sm152199eaf.11.2026.03.07.10.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 10:14:08 -0800 (PST)
Message-ID: <ece644e9-fa6c-4be2-8159-4e8d1ef52cab@baylibre.com>
Date: Sat, 7 Mar 2026 12:14:06 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] iio: adc: ad4080: add support for AD4880
 dual-channel ADC
To: kernel test robot <lkp@intel.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
References: <20260305113756.47243-5-antoniu.miclaus@analog.com>
 <202603080146.6a7IzS7i-lkp@intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202603080146.6a7IzS7i-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/7/26 11:11 AM, kernel test robot wrote:
> Hi Antoniu,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on v7.0-rc2]
> [also build test ERROR on linus/master]
> [cannot apply to jic23-iio/togreg next-20260306]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/iio-backend-use-__free-fwnode_handle-for-automatic-cleanup/20260305-194647
> base:   v7.0-rc2
> patch link:    https://lore.kernel.org/r/20260305113756.47243-5-antoniu.miclaus%40analog.com
> patch subject: [PATCH v5 4/4] iio: adc: ad4080: add support for AD4880 dual-channel ADC
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603080146.6a7IzS7i-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080146.6a7IzS7i-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603080146.6a7IzS7i-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/iio/adc/ad4080.c: In function 'ad4080_probe':
>>> drivers/iio/adc/ad4080.c:739:31: error: implicit declaration of function 'devm_spi_new_ancillary_device'; did you mean 'spi_new_ancillary_device'? [-Wimplicit-function-declaration]
>      739 |                 st->spi[ch] = devm_spi_new_ancillary_device(spi,
>          |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                               spi_new_ancillary_device
>>> drivers/iio/adc/ad4080.c:739:29: error: assignment to 'struct spi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      739 |                 st->spi[ch] = devm_spi_new_ancillary_device(spi,
>          |                             ^
> 
> 
The cover letter of the series should call out the dependency on the
SPI patches that have already been picked up.

There is even a git format for this that the bots understand to avoid
messages like this.
