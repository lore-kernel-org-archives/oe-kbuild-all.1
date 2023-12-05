Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF46D1D2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzwOaHQW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-54c64316a22so5543555a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 05 Dec 2023 13:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701812644; x=1702417444; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtPODTHNMByw4rsHzSlvkWk3wVQbetWpeccUPj/d6as=;
        b=IzwOaHQWkexu1nyGNIsg7TFmG5ZYnv3J8vcsrck2V0byrqSbaASqeqXgf6jNw3uWZe
         kwhwVv5DCkrPFEUj5grHH4v3uLuXCoV/Hm3Pqp3JFTdIpKMaJaCtAwAubQf54ungsWWh
         pUYjqQZM1sCPmE00pt1ds+aX0+9eN2ISUNwjl3mE/J1ee7zkva7gUTy6H4Nj1fYOqrzu
         /uq9NUTgQ9yDlgBVV/QaJRgLrC5J/g14U4UUt+l93KMELrBl614Xx6d0lVuavWSVyT8d
         tPgllzrwUAOpI7RtNkX7zZz6lzBtri/WEWAyPcCnsmticK1qpEiC0Oz2MKwrsUe83Bzj
         29xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701812644; x=1702417444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtPODTHNMByw4rsHzSlvkWk3wVQbetWpeccUPj/d6as=;
        b=ScD7san0CkqrzlvofTNLN5WnOFL+a7l0WSOT+xhhEUDao3QDLRMYDuA9NSuqcZO7RN
         GUqhP5XmN4zuIXF0ipJfiI9RihVIAcgv3+l1x4CBXOxOsmsj3o0+RhzevnM58kpvVJtw
         nx8jDzSSLWDQQjBABOlmCpDLokCmYK5vOAZbABrPdjgQ0//Pml8uMcE2BKTmsa9ocFGG
         gqDvYUuv4hVBjv8y4cTG6NdWUTpU2hr5OVNaHPGQtlynt/Vwthgl3ktmFm1AQaGMUKp2
         qGCXEfeBAgxeGf/E8FizykY8uXVOcTcCchchoAEZaCBHFOD4tXrOJ9VFouRMGZKK295R
         LMtw==
X-Gm-Message-State: AOJu0YyPGMu8rotrjQT3o885GkPn/rJhvWcObSUedDbeuEFQ1N9lWPYf
	VeOj/jtKfkzJeiY/BWnoPZU=
X-Google-Smtp-Source: AGHT+IF1vMo5ATjjFj0hYEASG1eV3bg6VLC9crTxdALyAIVt0wYlW+9/bW/mvqNlF1Ks3sbIjz8R2g==
X-Received: by 2002:a17:906:5992:b0:a19:a19a:eac7 with SMTP id m18-20020a170906599200b00a19a19aeac7mr818787ejs.128.1701812643685;
        Tue, 05 Dec 2023 13:44:03 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id g5-20020a170906198500b009c5c5c2c5a4sm7267888ejd.219.2023.12.05.13.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 13:44:03 -0800 (PST)
Message-ID: <708e46fb-5aaf-4c47-a8f5-4cd5171a8d76@gmail.com>
Date: Tue, 5 Dec 2023 22:44:01 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
To: kernel test robot <lkp@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20231204200907.5687-3-zajec5@gmail.com>
 <202312060400.SeDMAMe7-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <202312060400.SeDMAMe7-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5.12.2023 22:04, kernel test robot wrote:
> Hi Rafał,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on linus/master v6.7-rc4 next-20231205]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Rafa-Mi-ecki/dt-bindings-arm64-dts-mediatek-Add-Acelink-EW-7886CAX-access-point/20231205-041120
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:    https://lore.kernel.org/r/20231204200907.5687-3-zajec5%40gmail.com
> patch subject: [PATCH V2 3/3] arm64: dts: mediatek: Add Acelink EW-7886CAX
> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231206/202312060400.SeDMAMe7-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060400.SeDMAMe7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312060400.SeDMAMe7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> Error: arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts:103.3-4 syntax error
>     FATAL ERROR: Unable to parse input tree

Ahh, required change stayed right there in my "git diff". I noticed it,
fixed, but forgot to amend. Sorry, I'll send V3 shortly.
