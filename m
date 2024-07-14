Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8BDF6B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 04:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720932195; cv=none; b=AxpTq6bPWdhGfX8jZt3jNyrz78/ab4T6Z/9Z5+iDU2XlMkJsZK1pEVRhD2dD2yxRV4UJi5Xeu8MB2xyeSLhj4l/KpUSst4GYzMpaXHv1/K/ayGEK0jqkr+IzH3gtUGPnz+kuG9fAlmMNdVXMU+gICK6I5+JCt4qUDRW1CZdF6bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720932195; c=relaxed/simple;
	bh=aseRciaC/UFHkMfMjIsAPgwhwbsuQ1IeyE9cQiTqS48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5iudSGWacM9FFHPkxeTq9LXNJkm+4568bYqqY1riwO1sARwLhcAX/0FnL46c8JreD14PS3e9SvhOBUIjNhg1N28+habhe2YlmhDPWMVmAzT+cOG0o5zsWNzpUU6w4MPpzLi9zjjkm8OiSuPVZ0jRknAacaxO7Mw7GuQmfQNk/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXNhLJwL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXNhLJwL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e99060b0dso3488390e87.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 21:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720932192; x=1721536992; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lJVLYi+pE04YOrrCFHXVXYXIWButASzCZnzKDh4ZGOU=;
        b=UXNhLJwLaHpxxeXywdo7FLKFKA0Xerd36Zf6h7xCzzkT5yB/kUlGq9gTH7+oU3a6bc
         hiwOlLecpAni2kjniuia/2l2kM5wmMkXzw8fvtNbVkgnhjtODutMYvAMkWNg3RfWjgbV
         TI2h1rCLncDmftRTErB64B60MegNfrS149ZY9oH0fhKsfOOy3ODjAs+0n5WwKxTHV7wg
         0hS8kM/Egnwci/zSjL4aGww4oZZynC8Ld2dQqeNdfuy3YHIIN7KzCji4GssS4xqjfPWy
         gRVKyqlKrsBngmQOGSLiGvUDZAHZtG8NgtTD4jkLtjPx82scWhfDe+/UOhLSBs4T5XA0
         8ovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720932192; x=1721536992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJVLYi+pE04YOrrCFHXVXYXIWButASzCZnzKDh4ZGOU=;
        b=m71fTD1Hi/skeWoXLl93jhCllcrX60Df3CkqyJSZVywu+z/JuPL6DWaXEVL+gbui+c
         +DTCc2RtC5Sn1ObaUD5UdfDt+PcDqZELPH2FzyLWV3GepFk1YbNj3mb68FUzXHEfZm02
         qJbAvN0wN+NOIITQv8BBUdPeVggNWwoxAK/WJd2VRJtUzJ6MJ35Jppw9h7OSbWYhCf+Y
         K16ux3OT1m1I8+8ANYMHV6qPPj6nEwe39oZXy8rjTJyk6B7CFG6OCjesXCsyKgaj6Zfs
         FcT0CDNljC/BRH+GG6G79GotQANDKJfO2uvIERFgchiF5yXJDgh92IJIYoJf6sfE3tFs
         QOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM6ZTpj4IP38w7wVQVTPQN3JdzWKRuye06uVmWnSqJHfSDqgnCQ3ZEotnG13Ok+6nAquQDCcyhQLazL53vdTjdHXJC/7mtAuymkf5FoQ==
X-Gm-Message-State: AOJu0YzPzecx/x1zXwq7lk1+a72UJBcT8We7l1VubAQfYupyIq5R45dP
	BTXN+eMHBEioeO27B8hIQjITdrf8vEN+1WasJebQOXlBUZpybnw4hQeEsDogvbVfuqHzTsXFGuO
	+qnMCM3GBAY7OnKAZAcTkn92TUC8=
X-Google-Smtp-Source: AGHT+IEveCVlfZLVXJBHR90dZnmVx2pwSADMUlIbtkIq79k5uJZENwwhysMVMYxHLsknIe9g0lDKWihmS5z1YbEu5Z4=
X-Received: by 2002:a05:6512:2810:b0:52c:e326:f4cf with SMTP id
 2adb3069b0e04-52eb999125amr12348016e87.3.1720932191396; Sat, 13 Jul 2024
 21:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240621130903.2572986-1-net147@gmail.com> <202406282049.ZRM6qCDn-lkp@intel.com>
In-Reply-To: <202406282049.ZRM6qCDn-lkp@intel.com>
From: Jonathan Liu <net147@gmail.com>
Date: Sun, 14 Jul 2024 14:43:00 +1000
Message-ID: <CANwerB3oAuTcwmy4FdjmH-XRa5M3raHAt4DKLspThC-ryQmagw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable RK809 audio codec for Radxa
 ROCK 4C+
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Conor Dooley <conor.dooley@microchip.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 28 Jun 2024 at 23:07, kernel test robot <lkp@intel.com> wrote:
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on rockchip/for-next]
> [also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.10-rc5 next-20240627]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Liu/arm64-dts-rockchip-Enable-RK809-audio-codec-for-Radxa-ROCK-4C/20240625-210156
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> patch link:    https://lore.kernel.org/r/20240621130903.2572986-1-net147%40gmail.com
> patch subject: [PATCH] arm64: dts: rockchip: Enable RK809 audio codec for Radxa ROCK 4C+
> config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282049.ZRM6qCDn-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> dtschema version: 2024.6.dev3+g650bf2d
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406282049.ZRM6qCDn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406282049.ZRM6qCDn-lkp@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm64/boot/dts/rockchip/rk3399.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>    arch/arm64/boot/dts/rockchip/rk3399.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>    arch/arm64/boot/dts/rockchip/rk3399.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: ethernet@fe300000: Unevaluated properties are not allowed ('snps,txpbl' was unexpected)
>         from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']

> >> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: pmic@20: '#sound-dai-cells', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

The new dtcheck warnings are resolved by "dt-bindings: mfd: rk817:
Merge support for RK809" in linux-next so this patch should be applied
after that commit.

>         from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: regulator@40: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: regulator@41: Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
>         from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /syscon@ff770000/phy@f780: failed to match any schema with compatible: ['rockchip,rk3399-emmc-phy']
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>    arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: pmic: vsel1-gpio: {'rockchip,pins': [[1, 17, 0, 194]], 'phandle': [[138]]} is not of type 'array'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Regards,
Jonathan
