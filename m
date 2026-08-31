Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA61D5ADE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 03:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145943; cv=none; b=Cho3KYb8JgnkLegog/QEtbvrHH/I9AaJNQ4j04j2DlvM9KMcUzNDvsNTInq8KkPZJPHVjyiz2D546jtuD2hsAsu1NMxVm/siOH/5fIyQh8pFA+kNzL0zdu3G1tIMLlwjaBQurNSJK4d+Tm8LxmcLrQ/WhHJiMr2y0AH2itDHFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145943; c=relaxed/simple;
	bh=8YJsnXoiLwIrk5EoNlnB6Jv+oW3gRm6JVXQIfLK4qoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tM4YmH4DvwbpW51TGo2/phlgwZMPUngEhQYKPZVUOCX+9NTyeBxpp4KUt6SJzgwEjIbHpn5aMNXJM9VB5ZaHjYZQxSO1ssTPT5ymKK1xlEUXQFHQrBABMPleMgrGTgBXSMBxLi8Fd61pT7a31fcGSlSue/wwB5TvLavaxZaeDuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Zn0+ho5q; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Zn0+ho5q"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E36B11D221;
	Mon, 31 Aug 2026 05:12:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788145929;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qIbhQVrprN1vlHI0j5TeEUZFkHwmXP01zWpYWxN39Is=;
	b=Zn0+ho5qUzi3pEjLDFna/EVvDExGu6dZgJxsd1NCIMoPsg6zmDD7xyXoXdqPVV85W2GYLl
	46UM2gdDpjbmv+piRafoHpQvT6m8D6YtUoe92SHUQrTBC1vBVLfUPrmarFz5EUBQ1c/LbY
	tpipCEgLEor0wiWdUjMnCpmCpabUomS9Hwm/YXJF4yun81ihBhAyZfXiuuYfBoG6OO705Y
	55OwXNNBQiemMZzUyjtotNOt4qsUtBsNUEYBWi8tM+waE/Q5U9JerAjTfjtBgwsSdiCRIM
	0xNhcKmcA2m6g7RtNotj3+jzDljzWMQsM87NascvPC8xwOwhWWaoCCvr/D8sEw==
Message-ID: <bbfe7f10-3c96-4516-9576-276f69be8e96@nabladev.com>
Date: Mon, 31 Aug 2026 05:12:07 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/usb/dwc3/dwc3-generic-plat.c:114:35: error: implicit
 declaration of function 'FIELD_PREP'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202608310438.95i46Myq-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <202608310438.95i46Myq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/31/26 4:39 AM, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/dt-bindings-phy-Document-ST-STM32MP25-USB2-FEMTO-PHY/20260822-094634
> head:   37913ed44bd5c9e2fe5e7bd8ea4188171e6740b7
> commit: baaedb19717a9c195ea1823e134a40ac6ca68036 usb: dwc3: dwc3-generic-plat: Add ST STM32MP2 DWC3 xHCI USB controller glue
> date:   8 days ago
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260831/202608310438.95i46Myq-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310438.95i46Myq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608310438.95i46Myq-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/usb/dwc3/dwc3-generic-plat.c: In function 'dwc3_stm32mp25_init':
>>> drivers/usb/dwc3/dwc3-generic-plat.c:114:35: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
>       114 |                                   FIELD_PREP(STM32MP2_USB3DRCR_HOST_PORT_POWER_CONTROL_PRESENT,
>           |                                   ^~~~~~~~~~
> 
This should be already fixed in V4.
