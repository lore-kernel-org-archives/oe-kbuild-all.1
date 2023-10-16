Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67E933FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hi2PzDR3"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so47825315e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697470168; x=1698074968; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I027Ads24y6iLylsYWKkJq9QQUcU4zNw/9OdDpno29s=;
        b=hi2PzDR3GROhehiA5kLX9b4OenISVLuz8ojQbQu29mtLF2Oiuw9CfyUyrm4rTa7WDT
         Dbhr7qN7cQivoRQaVzVPiXrz+9e+ZjD6yaeqtZiEOAyHpR1mma6rGCDmpbXSyafO80FF
         A0PMcvTYL13LAYvh8oVV8BVISDkDvqsRKuXcBFqcMEVZHkbhLgCXR4nnJ3UnVkA6x2iI
         0WVealBF9Ot8aEgw3PqnR3N6jWVeJEGrCguba733b/lImfTdoBMdYPAkDZFLo7GLkDHx
         8SkSAgODN0smo3b1eXRnRr1I3bLSsg+hHt4ehRSTrkxbXm608R2mnA88c809wnKPP633
         LDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470168; x=1698074968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I027Ads24y6iLylsYWKkJq9QQUcU4zNw/9OdDpno29s=;
        b=QCN9X094Ocw0JoY2I5NVAu40FJvKv3eNWjeoJhJigxkhm/L3SiNi5b7asttG2Bdi9q
         4Md9izDMQuFGWV4HNquas6bJbwKidap3cKDDdpR+gAFJAC9LUDDqFu4Iu0Lw5EcPiZf5
         VKsAguU/ZLeuZwZoVV/iOFiQlnYcEQpJUEMZnOMTWfqdcGt3IplUcbTQdol3yTMS2Mdz
         QLgvdXwQapxtdXbfb/m2gYWSwPAKY77g2Zo+7zfe9zVkN+ovDHZFooLkY8axq8RtdkIm
         dTUIaH5iPB4/z2Ga0IQMx2AkDpv/8g52Wxn0DoCEOBjNgFIq3Dhnhx+kwHQev/gN6wWE
         A/FQ==
X-Gm-Message-State: AOJu0YyhCy8urpe20zoTM8zuP/37tqQw45EV+HjV+GR0EgbDr/KipKAM
	CKOXFkP5RIboDwCXpyNMHkv9Sg==
X-Google-Smtp-Source: AGHT+IEmLpGTYIKmHHnbQ7/jnGWWeeDlOrAxsPzN3i547sNHEMIVZh5R3VkyR9/4pMj0uXErZjZUHw==
X-Received: by 2002:a05:600c:22ce:b0:405:34e4:14e3 with SMTP id 14-20020a05600c22ce00b0040534e414e3mr28432112wmg.3.1697470167868;
        Mon, 16 Oct 2023 08:29:27 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id s19-20020a05600c45d300b0040648217f4fsm7469204wmo.39.2023.10.16.08.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 08:29:27 -0700 (PDT)
Message-ID: <b318ff5f-7fbb-42d7-b871-dd0bbaaaa63a@baylibre.com>
Date: Mon, 16 Oct 2023 17:29:25 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [matthias-bgg:v6.6-next/dts64.2 7/19]
 arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error:
 dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>
References: <202310162249.WBktvf2B-lkp@intel.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <202310162249.WBktvf2B-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The missing file has been applied into the Ulf Hansson next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git/commit/?h=next&id=5a19210db6dc40ede6a12b62cad773640807745e

How should we proceed ?

On 16/10/2023 16:15, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.6-next/dts64.2
> head:   976868a021ee654f4cf6eb6a2f40f95c78c04093
> commit: 39da9a394be05ea5ab1e08131916354e176ddd7d [7/19] arm64: dts: mediatek: add power domain support for mt8365 SoC
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310162249.WBktvf2B-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/arm64/boot/dts/mediatek/mt8365-evk.dts:14:
>>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
>        12 | #include <dt-bindings/power/mediatek,mt8365-power.h>
>           |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     compilation terminated.
> 
> 
> vim +12 arch/arm64/boot/dts/mediatek/mt8365.dtsi
> 
>    > 12	#include <dt-bindings/power/mediatek,mt8365-power.h>
>      13	
> 

-- 
Regards,
Alexandre
