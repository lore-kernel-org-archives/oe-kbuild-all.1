Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BB62576
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Jul 2025 21:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753046090; cv=none; b=shZRFCvY+JPjcfVNG+uuXmUKGOod3cnkkjSgsGJFHJi9xA8iQg9Idv6snROuc1HiQ1jvVL6j8Ef9iCjoIdn0w9KTlI/V4nAjL67IB10OUQFDMmmcn7sb0S05JSmzMKLKyH1bgBaT091vk3iGzRuOII5Nkn+Fsms+ed6KjqVK+4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753046090; c=relaxed/simple;
	bh=NgMm5AMYUgmOebAT769SArJn/B0GOuW6+vyZ+nfrjtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTb37dGHnlxIlZA++BjkjKhMEnBmdWYCN1dkokTA6sYfF26zwOL6YXoywMOtkcoGSIie/ilz97CbOv9GYNcZwBvgjqQu8Su95zqSd0ldSggg+u1zKzH0mgPdVDzIrm/GWPx5J0L2+3Fsh8bXrYYaFD9SFn2DPrL2ktvts4k9Isw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XdEc7Sj8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BguH5dSS; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XdEc7Sj8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BguH5dSS"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4blbrb2WRpz9t5m;
	Sun, 20 Jul 2025 23:14:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753046079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyufBir50c+be5CNIX+tqLelbLMQZYSnLFh/9H0aseI=;
	b=XdEc7Sj8cfddxTbPuFJyJAI2hWfrZRd08SwGE2hUd/LY4PCGzn+LpnPdSbJ0pI++YGQA6P
	8pfCHuB66jdaOn+/50bK54T/DGEJ02jMHCmceja/4/jzTmcKYoE3lNoqA5zV0Q51y9hwM5
	7NIYLrWBZ8fmzklCNp7TTTNs1DFAdhCIVNOeq3zchipffQfQN+28BRvUIhahWaxIP0Cfwf
	UzehA30YwQpDNOFmTsX/feoA6Pqbi17hu6iqC42LJK9sWgQH0mAL1jmyG+2pzCvE8Dtrno
	iVzQNtU7Ugr/UWsyeHjm4L0SIDjTWDroAEpSE4Jpo0IS9Q8hOZsaXkXYKBbtGg==
Message-ID: <56ed3191-21f7-44ef-9a4b-9cc91352fa4d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753046077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyufBir50c+be5CNIX+tqLelbLMQZYSnLFh/9H0aseI=;
	b=BguH5dSSRd5TTvhuTTh10ttBQapam1kdbX62794D2qM/7bYOO3tKtUwhkGyWb8/rftKj6x
	+McHmiLhqQOLoSLrufydgCB1d3sTdMgVr5Q0Uef3av1erxo+o7dcUNkMgpsjWkJGqwr8PM
	qIYE/gbjHgQ8MHmjCzn72TM/Ve6AkfOe5GtKcNtyaidIxK21nvNAua08tnUlLFJBT6ubVz
	zhtJ0l9SHjQ0ts2jdCEx2EYhB29LFZI80FueoD6AANFFC7KtovUwc7OhflScs4lrGBjEIG
	Kmmqb/lI9tK8iLbM8U2wkC7FVKPVz6riv5MQZp8rJiGgEoXa/3tffsZXI1ugsA==
Date: Sun, 20 Jul 2025 23:14:35 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 952/7381] ERROR: modpost:
 "devm_gpio_regmap_register" [drivers/regulator/rpi-panel-v2-regulator.ko]
 undefined!
To: kernel test robot <lkp@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <202507060637.LfSd4z0I-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202507060637.LfSd4z0I-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: deafcf476c3a4046cbe
X-MBO-RS-META: 7inw4n9mo8k6jefw6o5pi1or99u7ud64

On 7/6/25 12:23 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> commit: d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4 [952/7381] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
> config: alpha-randconfig-r113-20250705 (https://download.01.org/0day-ci/archive/20250706/202507060637.LfSd4z0I-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250706/202507060637.LfSd4z0I-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507060637.LfSd4z0I-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a builds fine.
>        It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "devm_gpio_regmap_register" [drivers/regulator/rpi-panel-v2-regulator.ko] undefined!
> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for GPIO_REGMAP
>     Depends on [n]: GPIOLIB [=n]
>     Selected by [m]:
>     - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=m] && REGULATOR [=y] && I2C [=m]
I believe this was fixed in commit

d6fa0ca959db ("regulator: rpi-panel-v2: Add missing GPIOLIB dependency")
