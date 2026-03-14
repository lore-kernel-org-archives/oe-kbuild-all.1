Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5C243951
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 19:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773516067; cv=none; b=YFXV4jYJq3YKGWZxeuog2ruQIxIfMMJKyzVOMX0opWi6Px/0PsOqE0SlCjCY6vfExwaYaSrhTm23vOQlh5CDCCmAowFy7AxGSG8gzyC9O1z+Z8PQQ383qNfg0BaDZjDOlZHci2nuWCmQ4dUGgo8s8qicSqEdDHpUDMtrJETYSak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773516067; c=relaxed/simple;
	bh=WbRbkG0szx293P7hYwFWsv2cbWSpqyt1TOqwpz+7AwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa9nzWYsZXCj4BubRerEN5ejevNo3DLlmbx7+q6gXvGhCfBa1122uK1tGU0XtcR9dHqXjxvw4IQeRixEP7g/AVj+IAgtV1lj9ciiHsi/ZNnN6rGb2s+AI8K8I2c1HhrZAp9SL16q4bWuleOxLv3HfTV3pGrGfz5wDiLMpk1bCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=YjWoOVCD; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="YjWoOVCD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F92810A5CB;
	Sat, 14 Mar 2026 20:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773516057;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5rG+1v7zL8jThS3dl69RXx7RQ9MLXQanWJkuXG3mdt8=;
	b=YjWoOVCDctRXhIX07wfInri1v5AyanGZhgqt/vvt+87gvzaaEX+diZ6Srmerb+TaxMt3Xx
	Mh7LdjyTr4ZYJyp6x1bYQ2HWL8sC9SLO3Fk4A4S4ezw/dSvZFEkSGia1BgvJPLZ+1JUUSn
	n/MvbpZWYvIFNb48Bj0qE/6cKsWC6GtMU2YYbzm39wEVFfM3uByRSA8Chy9G54lmZShCdb
	zJAu5XkyQDiip5x7SZOofAGpN/wZAU7MExLf6aE4i4hhmewCe0AF/MxFvx5Vb47+RpBLIr
	R3rt5vkl1Ry6mARwFjhkh8i5Xf788Iw8cEPI1NwihJB14+eavPk83gw9M6kFbg==
Message-ID: <b0b9142d-5415-45c9-94e9-a1f6f11a9688@nabladev.com>
Date: Sat, 14 Mar 2026 20:20:55 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5510/6488]
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb:
 adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
To: kernel test robot <lkp@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <202603140931.t5jOmJ5p-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <202603140931.t5jOmJ5p-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/14/26 9:28 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b84a0ebe421ca56995ff78b66307667b62b3a900
> commit: 3284bf3118242b0918dfb2908462296f50298e89 [5510/6488] ARM: dts: stm32: Add DT overlays for DH STM32MP13xx/STM32MP15xx DHSOM
> config: arm-randconfig-2051-20260313 (https://download.01.org/0day-ci/archive/20260314/202603140931.t5jOmJ5p-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> dtschema: 2025.13.dev8+g0515abdd9
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603140931.t5jOmJ5p-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603140931.t5jOmJ5p-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
>     	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
>     arch/arm/boot/dts/st/stm32mp13xx-dhcor-dhsbc-overlay-rb-tft32-v2.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
>     	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml
This seems to be some problem with the adc node in stm32mp131.dtsi , not 
in that specific DTB .

+CC Fabrice
