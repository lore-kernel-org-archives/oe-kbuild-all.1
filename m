Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199B1850A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413625; cv=none; b=Cy7qidr1ZCpV3F3CPcwsXhhZWriiLpr+DRt9hZadjeB/eHFBp/Ft6hyWynu8I6p6jh1Uu74N1368zCi4W9waIKg9e9b2K6v3i8J2fs8FqD/Bn8Jr3GiHg65iAe1BU3RwuRzB8J1S3YfQc87P9nxCOzAABGgF5EX/xZ9fB2eL7NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413625; c=relaxed/simple;
	bh=Rfm5OosKe6psXTdknXIwRGKFzu7TUgh6ALgS1SSl5vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx308gjyenQ5gjyzzJk4i4Jic6c3ZpbwyRVDCv4HCzixBMhwYYbD7ZXuhRZdxJ6Fn/gCAjIgMgSYDUKnEsEfBx0fTT3fZH1JbGSOz/j/OjeHEoknoIDetB+7dT1o4J3UtFjxQG4SwEswRD//QkuQuDWOBHSILCV5U3acxRzUNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JyGUXYdB; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JyGUXYdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719413611; x=1720018411; i=wahrenst@gmx.net;
	bh=TGLZLHVJHcJ2qZTtmGTqfs7PAH5p0YsXATc/PLfPJJ4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JyGUXYdBBx2zGHMfEzf5gpGdsXGHTzkgC41C8yINqoxTESC3XzypG9NlDE1eun73
	 3BZHFoandRr4ik9i26r56xZByHLqA/5rFQ+JkZZn4zVN24DN50qU0QiLwB9qjzyQN
	 f/2fJqVX7aEk95IwtgVqf4DJHu65VpdoRlg2PUc1IHjjvSTByKqi3wz11ZRVvLz6e
	 fEPSEWqhCk3zMLHmHzoYQrXPaCR5OZbpKyYL7UVwSq8VkOVgBtOAWl9dqD4RblGw4
	 9F2q+cEgWdz5B0WiajD0VP5SPfDeiYuTiFGRQDNjiSez1b2PwAUFDtbC+QziucV9r
	 e/ba3xyFa4KTNYO4Tg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1s7be52biE-0001ye; Wed, 26
 Jun 2024 16:53:31 +0200
Message-ID: <bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net>
Date: Wed, 26 Jun 2024 16:53:29 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3392/8232]
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb:
 /soc@107c000000/timer@7c003000: failed to match any schema with compatible:
 ['brcm,bcm2835-system-timer']
To: kernel test robot <lkp@intel.com>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <202406260927.CS1A5Ugr-lkp@intel.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <202406260927.CS1A5Ugr-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:frMVKr3gf7LWOKj+VgZNdc2YDbuwEasZ4fGeRMz16CU5Jw+ox8q
 szQGXHgZqtV5jY8EFbhKqoXsWTpARBtsTNZObo5P7uN4LZG4zM7r61cKI61MonwqrpExxiq
 UKYzGhbgMzSq6U5ePkRSGgl3uSLdZhKU93w0dqJGY+C4p3dejS2qztCQYOgjUzKIE7fYm6a
 efeJ+HHEubT/MFHcvCzsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sD9rS9xM/Pw=;2qu7SMBAS6n/Qnc/K559qE5jbCr
 Rv4FCwwX1X2X4P4UbsN4SCZKYvNwmrf7+qg3KD+beAu946mMsCFH7WxGAaG+mCUJRzdyZ3z+e
 sThRoCZ5KmcPd6/pIWrhZZGa+q6NQk7i1TS+9sgACEAkWzzTwMlW+LAfJnZPBEktAtxQKinka
 bBLw120KbaTBA5QPV8LFk7+/MZ3i5Ep8YBj8a/02q3BHQpSxp+NF88bIxsCo0qHEAhsEqQn/l
 2zoTVI7WCqBgOHd0mQ6I/5lh0bYRpPgjZkKxz5UI5G7UdJwor/wRPhR06Lt09BF8POzGE8XrU
 BrKJeOQ4+K5GtoL1F4T4gHiiotMzC0a8QIlRNx6Z9k2LvSPGonnbqypYsZziWdsRYbd7ClR53
 qX+ZAcdmKB501GRgGhEzTeP0a/T1klBuaxt9O54OJ7wigHvpMXXJtrHW9UiKMvKNVF0ASew1t
 Jye3AFNRwY0zJ/L156MnnoH20IstOS/RUaP1wrzjmInW+F4A8JR5MBv7MI6DltOO0UuP0rPEY
 2RJFERpii8BmIcmGCps/QOS8S7s2nQZAKUHKrx8hgxmSMil8onTaJKv/848SU26eWHIDD932W
 2VhAH3mw0OI3jcaqMeJrjP/Pat9JKY6MviuRBgJZrChcKHmcOAE6JwicJ9GRxXIKN96R78KEl
 lnZDOgSFk+mZast9wbx/pQnM6DX+UqgMjpRBg9O/1SwPmlJG4WQgV6Z9Jme0qSbZ9w8JvMx/4
 JZBAvGHJIJk51Gk0KpGFwYniTlvxI+5H/EoNNdWHnfLwSG7fILJLbEYDCdJz2ZMImShAlk8Xk
 7u2gfnOWuse38TrPEfTWdzbM4dcGrLS32NusF8rOjOAYU=

Am 26.06.24 um 04:02 schrieb kernel test robot:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> commit: cbda7c3ffe6d78933ee8c2d5e71de60ff4f4847b [3392/8232] arm64: dts:=
 broadcom: Add minimal support for Raspberry Pi 5
> config: arm64-randconfig-051-20240626 (https://download.01.org/0day-ci/a=
rchive/20240626/202406260927.CS1A5Ugr-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cb=
f1a2591520c2491aa35339f227775f4d3adf6)
> dtschema version: 2024.6.dev1+g833054f
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20240626/202406260927.CS1A5Ugr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406260927.CS1A5Ugr-lk=
p@intel.com/
>
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /: failed to match=
 any schema with compatible: ['raspberrypi,5-model-b', 'brcm,bcm2712']
>     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /: failed to match=
 any schema with compatible: ['raspberrypi,5-model-b', 'brcm,bcm2712']
>     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/mm=
c@fff000: failed to match any schema with compatible: ['brcm,bcm2712-sdhci=
', 'brcm,sdhci-brcmstb']
I think the last one can be ignored, because the relevant dt-bindings
change is in Ulf Hansson's tree.
>>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/time=
r@7c003000: failed to match any schema with compatible: ['brcm,bcm2835-sys=
tem-timer']
>>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/loca=
l-intc@7cd00000: failed to match any schema with compatible: ['brcm,bcm283=
6-l1-intc']
>>>
I can take care of these binding conversions. But don't expect fast
results during the summertime.

Best regards
