Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686861AAE34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723738695; cv=none; b=cwncLE79i/xfjq+ArfGTZs9UE25IBIx8Zzv8LEhAKZjdSKAjaj6XKVKDNMpnPyh7188N/9ClnowRjs5GSzLJMg9677TiIbh/5grNJvriSZrb1pTQCGaWwLgHjtl4ixNgxjOYkbB8+3fc/Z/e2kSv9eY7n6N3rvOFDAGJuvdRlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723738695; c=relaxed/simple;
	bh=tnrKnWeB5IE+MLqm/nrYMzmStUzN2VylRhN7V9yjfKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YL7/fz42hJTcxR+i83RaqRrVyA7CglfKTk2tiw2DlEPziqxfW85spTFZesAPiNvnojOvuAkyizG6Rh0anYk+31ZVMUC7ePng3vgFlf5z2RNqvDMOSRDFfdkLC+SFQK3vFWVlDX7FSnWjEfyuKd+Z+/F1G8gQSjRycfbp63fXuMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=lAQ3Gmlk; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lAQ3Gmlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1723738678; x=1724343478; i=wahrenst@gmx.net;
	bh=hJ68fndwIrOt/YzqKXK+DHX6kgSRlMG2KwyOzMPWF9o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lAQ3GmlkbjCsa3bwn3DoO/pk6TqG3kZi2CQ9qvZrJikzVKR0VQr8XjCnK7HbT0X3
	 8+pKIv8oISEA5FhF2SGX2OCfXCUQDJjbOY6WUM+wwCgnv5lGrbMWOOhtdUqasqTAo
	 G+dJS2LanItFniFIBiYcCpEweuaP0+DX/ieZ1GlHY+6Bh9kcbfTMsg2fxFClS4RZg
	 L6dxINLKweAGN4vbrSzIq2NWYc/S6M1miXpRZxV6Ou/l1Ac0+uitmyhE2x8If6+cu
	 lzjUMVwOWHzNcQf4RnGWM736eieOAxBtl2W1ds/6T7jiQcstNHYDEC6GOK/YbVZgC
	 qWxxIHnRA2ts4/Gc0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9gE-1sO6tV47DQ-00DRMI; Thu, 15
 Aug 2024 18:17:58 +0200
Message-ID: <9b26a27f-2612-4713-b92e-121548bcdcf9@gmx.net>
Date: Thu, 15 Aug 2024 18:17:56 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 4175/4951]
 arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb:
 interrupt-controller@40000000: 'interrupt-controller' is a required property
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <202408151514.xNSt9K25-lkp@intel.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <202408151514.xNSt9K25-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Od7uKWYQB21rX6YrnxB1K6JlrSCtjPupFxC8JFR9nzLku4YOPp4
 OVe/1IIOxGSJo/aCFuECEW0H3FsGEAQVmCTlgwXwdp8s/GUKXpiEEwR+9f97KebarjXyfaI
 mwbsCFPfHdjhvh2oxUqWV6OjZd/mhlLl/+dbn8ibSOG+EOm6KRpt0wMnIIq0pZxdHRvPB9S
 GwaRen7JWPzWNku+5ASwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LLbdJUOtkzk=;aTRn41i7PGJVb1FpwkBLv0UkM70
 tRS/0oY3b7Nfak0+pSdmiGmR/rOtjGpxRaVt6UXRL5h44cSXnUEmK5CrDlj8Gf6LnosoPlrv+
 PWstqHbF4PXWyUvAT/5Awetk4FsuGXk4HJkacv6UwrNZOmoJAndYsLcriIZEfYPZ9w9nOFxNb
 E50Wj/5lPPtJd0KF5MZVRJKx2iDzgfBF22yROPxJNZeI7fz997Zrrcz6PGim113Kh60X0T7y8
 MLgdl8E4aLya1nvdnsBe+qcjjDeP7XS7knmeZxmHvCNUz/FNdA7Dxw/qTiN1D6Z3U46ygvKWx
 Y3Zm6GvdrB7Mw9tXhtbR9xgvjcJyImeW57bJCjIlUq8tVPYsEs4pRVoEe1Bse9atmDqrFgVkn
 hGR3J5G6G8VzfVEpvWODTYrGJMbZvRmKg5PDTL85n3h5XWWwbEZkIbeoKgxZ06osdNspDLoHo
 aAf/hskfj6Gu8Boh0rYb1lTMEQWus0+DpA0uJKVttU6jtIqFFq57hyV/3Gtn6cgkSEDkOqxO9
 1IT6Ml7JThLEtYR2ypqeTXq8ZO15VlGcauWQrfHv6Hvd9vKqzj8mZxs8M8aF49sXONB/1qt36
 GMk91pLZb5jnxpv7M+9rjC2z3L/YtYwhdT0jy7F3JYMRF1owJIEn82dAKW+TpJ2dyK0c047kr
 2oNdHbqL3r1NDvXvNj6Qu0eKaKBHWp1qv1cA352mbKYAJy9tmMw845FclUK/5jRfVFH5UR+di
 rsLTrNhiIe31BWsoSvjSj8CHtJNMWQYOpwNQun/MHTORnOujLOwo4Y3o0HIxYJbDEbZN4bBR5
 veR6buESQeBe2i5pzBf2+SfECb/6XOx0VglzY2bFF8MiQ=

Am 15.08.24 um 09:54 schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   edd1ec2e3a9f5de7fb267a3af73e4f00e7e052b7
> commit: 44ccb92bc64a6f92666e69c7c30e5713758641e2 [4175/4951] dt-bindings: interrupt-controller: convert bcm2836-l1-intc to yaml
> config: arm-randconfig-052-20240815 (https://download.01.org/0day-ci/archive/20240815/202408151514.xNSt9K25-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
> dtschema version: 2024.6.dev10+ge5d88ac
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151514.xNSt9K25-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408151514.xNSt9K25-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: power: 'ranges' is a required property
>     	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: soc: firmware: 'ranges' is a required property
>     	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/cprman@7e101000: failed to match any schema with compatible: ['brcm,bcm2711-cprman']
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/gpio@7e200000: failed to match any schema with compatible: ['brcm,bcm2711-gpio']
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/aux@7e215000: failed to match any schema with compatible: ['brcm,bcm2835-aux']
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/spi@7e215080: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>     arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/spi@7e2150c0: failed to match any schema with compatible: ['brcm,bcm2835-aux-spi']
>>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: interrupt-controller@40000000: 'interrupt-controller' is a required property
>     	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
>>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: interrupt-controller@40000000: '#interrupt-cells' is a required property
>     	from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,bcm2836-l1-intc.yaml#
Unfortunately these two are expected:

https://lore.kernel.org/linux-arm-kernel/da941b0e-8e29-4ff7-aff8-683da0aef8da@gmx.net/T/
