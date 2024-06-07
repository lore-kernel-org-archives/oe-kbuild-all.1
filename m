Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C227155328
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717749083; cv=none; b=fUi6gvzoJAcStug+yXoC6hbfgNeWFCXvEMXsHZBEIO34YnKk6KtZm+aNkPraW8ftaoWCxeGhCsqWoNtFdz5slwIrrYGUa9V4Edu/RdQA425m7/7Vi2AUPNet9vbopleCL43Y2sq71fTmWWhMIYs7VHvzSE/QlB9YeGBvDiYG/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717749083; c=relaxed/simple;
	bh=UmVEOr6PldRB4UQj7PFbWh0cEkA1HnWZKAihYWYYAVQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=l8MPWn3WXzMzp9gpXfrrFjuAHB44qa0aQ1axH3AUbQlTA9ETtqDh6LE9218Yqtn0o5TmEQGC7GNWqR2FKZJNIyT17fqd3MCt0PS3S6qZeNNAxLyBBDBxNFUQePvsDHjLKhADafrOjxXZ0zHVQ/FnrBeFZ/cGLUWEdR70JYO3+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4LcJFkg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4LcJFkg"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b7c82e39eso2075878e87.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Jun 2024 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717749080; x=1718353880; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DuO23jZ0yNpZDQlXy4KWuQ3OqB8VX+2cVKHM/HssMw=;
        b=G4LcJFkgjPd8ssMuL+nBDmJWTBteRFv7ArKBF/pe38ZvxEuRozNA9SvJDacDEUnzER
         frTdYiuInY/gBEm4XyydXzqCT5EtHzL6BOnWjwfutXekuYMOe+j6I4V/Lnuixp4W6vG+
         ENRLPUK2yU/8eGC33NGO+tfYzS8GCsgAOZDYpZ+xQFQ9hSAnsTY/AzqOYW0j7DrPQzUE
         lqbguaXF+14kXcoocQWQ6hH/zkTbybUbejw2Rgs936iZ0Qe7nLf7aLuCm55aJOBVD3d8
         yZH0YxaxliKI4k+wMbu8B+Zu4KT2S5WnaNlnQf9oLuXz29GQnoL2kW/9HR6zBnTbzVLW
         GvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717749080; x=1718353880;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DuO23jZ0yNpZDQlXy4KWuQ3OqB8VX+2cVKHM/HssMw=;
        b=Xgk82wozSQp3EljH2nEEd5zea+6ZN0GKuKtQwhF8WfSWD9rKHAl4KuucflQHWmavMg
         hHeJqsGqcSx8W1nim+/PiBB/7rkTo+AYxkFslTiwy5XClrw567CjQEkYl671m+HkqOVo
         LZsDDyGtotgjhkhhduLu/2Y1szCYcVgzghE4vHS/hUwCUrqeRiY8QTOL6OIf6b8qoR1M
         mtZpApDtX/sDhihw8EtdSEx/eJ3ueVkSS4jRlLnldicuzfZmehsQMEHOHMxhkupm7KTA
         x1RagLbLaUiXXG7t9h8AVBMqSpRZzlkWwYhhYDqJHv6YkUycRZWAwPG+uLGobQgn8eyb
         g9sg==
X-Forwarded-Encrypted: i=1; AJvYcCVjXrKFxZoJX2WaCy8Ci8TDNqEDh25KcRktxODPKGNty1pz2XG7CaEp+kzNl8/xBTQvBt4Bl7i6HVa/nbKmMUGT6ZLd4UDz9+3/quqsaQ==
X-Gm-Message-State: AOJu0YyTby6PVv4vi4RO8zmqmPmuW43AHxwOWx9t28XKl1WVM0ykQjaE
	vgZlxvwheU1v7V3YhxN59FCPpbmPgzZL98plQdEW5Q1Qo0Zkzg+D
X-Google-Smtp-Source: AGHT+IF35NHJkt0/GZ2wA+6lejpaPF/1YIbi+EiO5wykf6Binanla8DE0xf9gcQLDJuseJaz3OnbDg==
X-Received: by 2002:a2e:84d7:0:b0:2ea:8308:841b with SMTP id 38308e7fff4ca-2eadce4cf3dmr15806201fa.31.1717749079372;
        Fri, 07 Jun 2024 01:31:19 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d69867sm3485152f8f.57.2024.06.07.01.31.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2024 01:31:19 -0700 (PDT)
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
In-Reply-To: <202406071527.fnfhnkUL-lkp@intel.com>
Date: Fri, 7 Jun 2024 12:31:04 +0400
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 oe-kbuild-all@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <FB2C9481-FCA2-496D-B916-E429BB8C0C82@gmail.com>
References: <20240606094513.3949323-3-christianshewitt@gmail.com>
 <202406071527.fnfhnkUL-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3774.600.62)

> On 7 Jun 2024, at 12:10=E2=80=AFPM, kernel test robot <lkp@intel.com> =
wrote:
>=20
> Hi Christian,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on krzk/for-next linus/master v6.10-rc2 =
next-20240606]
> [cannot apply to krzk-dt/for-next krzk-mem-ctrl/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    =
https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/dt-binding=
s-arm-amlogic-add-support-for-Dreambox-One-Two/20240606-175427
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git =
for-next
> patch link:    =
https://lore.kernel.org/r/20240606094513.3949323-3-christianshewitt%40gmai=
l.com
> patch subject: [PATCH 3/3] arm64: dts: meson: add initial support for =
Dreambox One/Two
> compiler: clang version 19.0.0git =
(https://github.com/llvm/llvm-project =
d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
> dtschema version: 2024.6.dev1+g833054f
> reproduce: =
(https://download.01.org/0day-ci/archive/20240607/202406071527.fnfhnkUL-lk=
p@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: =
https://lore.kernel.org/oe-kbuild-all/202406071527.fnfhnkUL-lkp@intel.com/=

>=20
> dtcheck warnings: (new ones prefixed by >>)
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
node has a unit name, but no reg or ranges property
>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
missing or empty reg/ranges property
>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: =
Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: =
unnecessary #address-cells/#size-cells without "ranges" or child "reg" =
property
>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6
>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: =
/soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any =
schema with compatible: ['amlogic,g12a-audio-clkc']
>   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: =
/soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any =
schema with compatible: ['amlogic,g12a-tohdmitx']
>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sys-ctrl@0: =
'#address-cells', '#size-cells', 'ranges' do not match any of the =
regexes: 'pinctrl-[0-9]+'
>    from schema $id: =
http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yam=
l#
> --
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
node has a unit name, but no reg or ranges property
>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: =
Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: =
missing or empty reg/ranges property
>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: =
Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: =
unnecessary #address-cells/#size-cells without "ranges" or child "reg" =
property
>     also defined at =
arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6
>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: =
/soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any =
schema with compatible: ['amlogic,g12a-audio-clkc']
>   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: =
/soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any =
schema with compatible: ['amlogic,g12a-tohdmitx']
>>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sys-ctrl@0: =
'#address-cells', '#size-cells', 'ranges' do not match any of the =
regexes: 'pinctrl-[0-9]+'
>    from schema $id: =
http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yam=
l#

Nothing to fix. The patch just depends on Neil=E2=80=99s binding fixes =
here:

=
https://patchwork.kernel.org/project/linux-amlogic/cover/20240606-topic-am=
logic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org/

Christian

