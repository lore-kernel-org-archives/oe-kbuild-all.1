Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F96200AE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808159; cv=none; b=tNKaS5FMxFtFB5bprV4596PtUd6k04ZHcyclkH1FbjffosLrvmHuKCq54uAz7Rl/g+Nu5CfWiY6+CwTB0ovXlwl08uelkhlOh/jY5pld2OqTV77RRUBoh0ftht0XwxC+vzVDrI+9ot4JjUtrtd6vhhCBJuEHwwh/jncepSppHV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808159; c=relaxed/simple;
	bh=utiApLSzMutmu7OEF/8rt22Sk3ytdrDytRDP7uyu6+Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RGYxl0dWfUQsGxxKQFMDIQzAKVAwgI92kRQ2VpJDD9hH2ho4SRtIyrPPPcRG6RIuhh21NJ9bj4GvQMLF1H9lr6ZLr/R7LWGZbd/bbenL/cZfSMlb2ndAefPTY1wi9+CmAzaOg5BMw8F5xoVQnA08m2+DBVf+a310QZPd90LmBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CV98jzyy; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CV98jzyy"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so83478551fa.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718808156; x=1719412956; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrNaD0zVW3DChvXbXhKCNiu4238wS0EYPxxc2VaoSyQ=;
        b=CV98jzyyosj8eoNzdTz7m+av83aG9YkxcEeWz3dGGSUvZxfNhKvQtSPQLWuihciOvQ
         Oezf+b+n08myakhpBtvw1SGQxR4C48kQL16bTZWfZIGqRIBn/77nIA4ifEQsYllRe1W3
         DLegdEbS0lU4sOVlrXll9hHdxcpqmOnQOuMXunh+3K+Yry/BCg8cg+hheOIbOkso/ara
         m8X2muwwLTytl1Kl6lhUP6XU8YFpTISU/tlEx04JgNf8v0S3qdhQ41bOp5/ovnxjaGwh
         5dmdEn4sRj915Ukv8HA9bBYWKJSr45m2QiMPtky4fZdMGIzMQ1VZ8JK9tJxMLGDggg+G
         4EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808156; x=1719412956;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrNaD0zVW3DChvXbXhKCNiu4238wS0EYPxxc2VaoSyQ=;
        b=GyZ+rVO7rHoQRnycsTG+4sUSDN4wdyNgyVyBVzH61fTDAXfS+l6vEawrOP/YKfUUzf
         hPOXnwgDSCiaNjz2uCSs+vAcssgQTT/fbAICerk/ifbMjz+HHmo4dGv+P6G/vjP8HUKJ
         l5F6trgI/d9T1AVFnNjksDK2QOUf+xqi/8SOJElS3c69Co8P6LlSsVfd7MCqqNmdxhcL
         ecGXftOFaM2XqrPXsqIgKRO+mDvgBxlZVSqZWdPourKKZh3LgISHmGXjH/6svpIzDI3Y
         BWxGmvsSEsNCjXAuv52F5yZLGZr9FI4XdW7iZt6wAHhNG/tz/r7Tp2BV+RnpCUqL8gzr
         8euQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDgddMW1/4FU/h+JCZyMEmCHOxoSXvCAKFRM8t2U30WOzXiGJH6Ww9aeJu3Wejtzkx97MyJCcB9hc9Hpw1Ay8yZw+v/HZslyWhM5kK6A==
X-Gm-Message-State: AOJu0Yxrhwh0eFtFS4CyOoX/Ni2gCgn7QUj9NDtnrBRe8ty5QJ2fyXj4
	yrolhJZ1GAVOkuelC3EZPxoB7kQqO2VtJ4AzGUumFBuR1xqE0Kgh
X-Google-Smtp-Source: AGHT+IEa405I7Zca/4R1by2D1xir1eo+sByG2M6vyPFJq1gddTkxv9fbkpe26ZtAvIt4YYdQlBBtFQ==
X-Received: by 2002:a2e:9210:0:b0:2de:8697:e08b with SMTP id 38308e7fff4ca-2ec3ced12bdmr21232381fa.26.1718808155415;
        Wed, 19 Jun 2024 07:42:35 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fb282b057sm29603566b.31.2024.06.19.07.42.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2024 07:42:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox
 One/Two
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <39d1c5e1-e27b-4736-87e0-ca42ccf8885a@linaro.org>
Date: Wed, 19 Jun 2024 18:42:20 +0400
Cc: kernel test robot <lkp@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 oe-kbuild-all@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <893D54FC-6796-484C-B000-FE6DC185BA22@gmail.com>
References: <20240606094513.3949323-3-christianshewitt@gmail.com>
 <202406071527.fnfhnkUL-lkp@intel.com>
 <FB2C9481-FCA2-496D-B916-E429BB8C0C82@gmail.com>
 <39d1c5e1-e27b-4736-87e0-ca42ccf8885a@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: Apple Mail (2.3774.600.62)

> On 19 Jun 2024, at 6:06=E2=80=AFPM, Neil Armstrong =
<neil.armstrong@linaro.org> wrote:
>=20
> On 07/06/2024 10:31, Christian Hewitt wrote:
>>> On 7 Jun 2024, at 12:10=E2=80=AFPM, kernel test robot =
<lkp@intel.com> wrote:
>>>=20
>>> Hi Christian,
>>>=20
>>> kernel test robot noticed the following build warnings:
>>>=20
>>> [auto build test WARNING on robh/for-next]
>>> [also build test WARNING on krzk/for-next linus/master v6.10-rc2 =
next-20240606]
>>> [cannot apply to krzk-dt/for-next krzk-mem-ctrl/for-next]
>>> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
>>> And when submitting patch, we suggest to use '--base' as documented =
in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>=20
>>> url:    =
https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/dt-binding=
s-arm-amlogic-add-support-for-Dreambox-One-Two/20240606-175427
>>> base:   =
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
>>> patch link:    =
https://lore.kernel.org/r/20240606094513.3949323-3-christianshewitt%40gmai=
l.com
>>> patch subject: [PATCH 3/3] arm64: dts: meson: add initial support =
for Dreambox One/Two
>>> compiler: clang version 19.0.0git =
(https://github.com/llvm/llvm-project =
d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
>>> dtschema version: 2024.6.dev1+g833054f
>>> reproduce: =
(https://download.01.org/0day-ci/archive/20240607/202406071527.fnfhnkUL-lk=
p@intel.com/reproduce)
>>>=20
>>> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: =
https://lore.kernel.org/oe-kbuild-all/202406071527.fnfhnkUL-lkp@intel.com/=

>>>=20
>>> dtcheck warnings: (new ones prefixed by >>)
>>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
node has a unit name, but no reg or ranges property
>>>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
missing or empty reg/ranges property
>>>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: =
Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: =
unnecessary #address-cells/#size-cells without "ranges" or child "reg" =
property
>>>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6
>>>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: =
/soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any =
schema with compatible: ['amlogic,g12a-audio-clkc']
>>>   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: =
/soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any =
schema with compatible: ['amlogic,g12a-tohdmitx']
>>>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: =
sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any =
of the regexes: 'pinctrl-[0-9]+'
>>>    from schema $id: =
http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yam=
l#
>>> --
>>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
node has a unit name, but no reg or ranges property
>>>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
missing or empty reg/ranges property
>>>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: =
Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: =
unnecessary #address-cells/#size-cells without "ranges" or child "reg" =
property
>>>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6
>>>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: =
/soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any =
schema with compatible: ['amlogic,g12a-audio-clkc']
>>>   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: =
/soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any =
schema with compatible: ['amlogic,g12a-tohdmitx']
>>>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: =
sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any =
of the regexes: 'pinctrl-[0-9]+'
>>>    from schema $id: =
http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yam=
l#
>> Nothing to fix. The patch just depends on Neil=E2=80=99s binding =
fixes here:
>> =
https://patchwork.kernel.org/project/linux-amlogic/cover/20240606-topic-am=
logic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org/
>=20
> Can you resent but keeping the assigned-clocks in the sound card node =
?
>=20
> BTW keep the reviewed-by.

Will do, thanks.

Christian=
