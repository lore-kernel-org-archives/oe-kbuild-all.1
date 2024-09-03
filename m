Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CAF1DC720
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725392972; cv=none; b=q1h6TXftyfzp6SG0CoKloP9fSqmcEYCZaVVqDI8XGp81G+F4difdPc8aezucJMhkVK/2IvCGPiEremJR3Fz9EKz2NN5E61RyZhohhPymEszR/DfmPrU8FhCHxTF1PLYUruDILS6MTyhJ0aYqcJGsK1x32YPX+S2gTiHjoDdOPt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725392972; c=relaxed/simple;
	bh=q8yBaSCmEGOs0wi0p0eGVAK9EBu2hAh9q6JTrbF7T+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsnnUzylTe06V6MN4tih+7H9MStP5UFEzjvls6LpAebIggTG+cq4hy3LUypq9AzXK2/XbF42Ep+cUVPbNHMvJfMi9oqeB71yKEZcchOm6eY47al0zY+fQDIwV6vp4opF3mqL/5gyQFQ36rUx98woo0NXbbDqxCK4jhm3kcknLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bMt+VGBf; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bMt+VGBf"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0902C87C69;
	Tue,  3 Sep 2024 21:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725392968;
	bh=k80mM0g+cG1lqDv5+YwQh2clUljbvr+bcihE+jbD3qg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bMt+VGBfBdzD/q2Iw/+JWyXvI8rUnHKHzeB4nB5aqJKmqXWdsbZzX4yZadK3hDQE9
	 UW0gQ8VWJ1NXKdj9SIoxd+PRpU8a0rhjq3xX5BJt7ygt5kG/40x8Ff8zMgDSJILymO
	 K7mMnBzQM/7tFT6GFHmzejHXEw8b7XLTLdiHqMHyRTNQy7z58+P0DraEVJQWIV9TAv
	 S2cFhkT2oMUSWZ5F70qJwRJYzoPaV8hmL5Gcw3iCXgngp75omTG3aqSjia1yoankPH
	 WcIeYSkEItX95vdTjHhY01RpJsMAYBDYJV4pPncBVDtEamIHcr6ygla4FpA1C1K7H5
	 4/Bo3lCbAPvVQ==
Message-ID: <0c8eda77-cc03-4ba5-921d-a1da4beed7d5@denx.de>
Date: Tue, 3 Sep 2024 21:49:27 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5762/8400]
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: ads7846@0:
 ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
To: kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rob Herring (Arm)" <robh@kernel.org>
References: <202409031302.xp1kb3Tl-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <202409031302.xp1kb3Tl-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/3/24 8:00 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
> commit: 45d6486d2a5ad4310c1379071fc39d02d6784cbe [5762/8400] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
> config: arm-randconfig-054-20240902 (https://download.01.org/0day-ci/archive/20240903/202409031302.xp1kb3Tl-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 6f682c26b04f0b349c4c473756cb8625b4f37c6d)
> dtschema version: 2024.6.dev16+gc51125d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031302.xp1kb3Tl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409031302.xp1kb3Tl-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vusb1v8: failed to match any schema with compatible: ['ti,twl4030-vusb1v8']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vusb3v1: failed to match any schema with compatible: ['ti,twl4030-vusb3v1']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vpll1: failed to match any schema with compatible: ['ti,twl4030-vpll1']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vpll2: failed to match any schema with compatible: ['ti,twl4030-vpll2']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/regulator-vsim: failed to match any schema with compatible: ['ti,twl4030-vsim']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/gpio: failed to match any schema with compatible: ['ti,twl4030-gpio']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/twl4030-usb: failed to match any schema with compatible: ['ti,twl4030-usb']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwm: failed to match any schema with compatible: ['ti,twl4030-pwm']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl4030-pwmled']
>     arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: /ocp@68000000/i2c@48070000/twl@48/keypad: failed to match any schema with compatible: ['ti,twl4030-keypad']
>>> arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd43.dtb: ads7846@0: ti,keep-vref-on: 'oneOf' conditional failed, one must be fixed:
>     	1 is not of type 'boolean'
>     	True was expected
>     	1 is not of type 'null'
>     	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#

Seems this needs a fix like this:

diff --git a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi 
b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi
index a7f99ae0c1fe9..78c657429f641 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi
@@ -65,7 +65,7 @@ ads7846@0 {
                 ti,debounce-max = /bits/ 16 <10>;
                 ti,debounce-tol = /bits/ 16 <5>;
                 ti,debounce-rep = /bits/ 16 <1>;
-               ti,keep-vref-on = <1>;
+               ti,keep-vref-on;
                 ti,settle-delay-usec = /bits/ 16 <150>;

                 wakeup-source;

Frank, can you send the fix ?

Thank you
