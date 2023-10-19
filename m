Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E182747A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 15:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjabFQQM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53f9af41444so1190560a12.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697729100; x=1698333900; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEqB2gyeRnOJBAJu0wqduiXVxg7qFEvJGsvQSH7dWUE=;
        b=UjabFQQMF41LP6kXAdJ58qEni3GGtUhMV+Uq8gkZaZXKX/hrZP/kz/qpLU6L11RNXD
         GhM4m1TM0yiF8wfQzxJQqcp6r2SGkZ5EFkQgct5ly45bZcNOnRFc6FesNA45e2ZIrJAg
         kDdb77s4ylmiAdF1Limv18qN/lxR/x90vCY5TkgWP4z+3vjD2eLHnHXriCEmEOYwAIZ8
         EQRs+/gJPh6s+GNCqeLteojHcDVvIcMfPtCMsf+Zgp80wT7yJjBjXAo5LyB+OA/BenCe
         gGyHBeFtLztQenHylzofS1X4oRLaB8ZTEIIMiABNJo8Lt+hb1CKuCq7a11no7ju2koDn
         8tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729100; x=1698333900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEqB2gyeRnOJBAJu0wqduiXVxg7qFEvJGsvQSH7dWUE=;
        b=qPOb3QoxpQYS68X5NBSbvSAerMBgfHVKcJ4Q9ls33A0NDj8KUIYzNKzStIJ2hfldK0
         lZXAkliun6jQXDRIullNQYhswPOv8lM/r027pbSM7fi7juCWYfIMcYMl7asKN1NMjDoj
         5BDgc6A2MBIYXTH28gWq6Cz3Y1UyRIypq9pmfBp6/OQ43chG+XFmOdTYfZk2Bji4H9mX
         Xd5nk1HXoIQexjTAcSG0Wb419hQEDjVQXuxVtxnebsOmHAWAnbJyDjngAefRH1z12NLr
         uus/xNCo0tnBsVGitDgSaNEpL7gESUQ0LznGhR7BmUxFFRZ/En/36oa7vc0spY1rjFy1
         dvlQ==
X-Gm-Message-State: AOJu0YxXmZGR6HKSuZpLNLZk8anvkaQ+P5R5urN1FjgFV+rbnPjpTvbh
	JcQDiXYBd3TAHZfoboOBBSo=
X-Google-Smtp-Source: AGHT+IEqfGb3FyORtSKdNszXYUKa6M4A/MP7lf0ZVoa+8ymDn3t0Sq4QDKESsjO+swiz8PMKo6RDtg==
X-Received: by 2002:a50:8d11:0:b0:53d:e139:64a5 with SMTP id s17-20020a508d11000000b0053de13964a5mr1528038eds.27.1697729100060;
        Thu, 19 Oct 2023 08:25:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id 16-20020a508e50000000b0053eb9af1e15sm4729210edx.77.2023.10.19.08.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 08:24:58 -0700 (PDT)
Message-ID: <1ac32f8b-febf-f041-e28e-ddc477d9ec43@gmail.com>
Date: Thu, 19 Oct 2023 17:24:57 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [matthias-bgg:v6.6-next/dts64.2 7/19]
 arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error:
 dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
Content-Language: en-US, ca-ES, es-ES
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel test robot <lkp@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 oe-kbuild-all@lists.linux.dev
References: <202310162249.WBktvf2B-lkp@intel.com>
 <b318ff5f-7fbb-42d7-b871-dd0bbaaaa63a@baylibre.com>
 <CAPDyKFpJ6apLwabXS++Jd9CB_Y=y1EDokpcY1TQZ1j12RY2SyA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAPDyKFpJ6apLwabXS++Jd9CB_Y=y1EDokpcY1TQZ1j12RY2SyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/10/2023 11:56, Ulf Hansson wrote:
> Matthias, Alexandre
> 
> On Mon, 16 Oct 2023 at 17:29, Alexandre Mergnat <amergnat@baylibre.com> wrote:
>>
>> Hi,
>>
>> The missing file has been applied into the Ulf Hansson next branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git/commit/?h=next&id=5a19210db6dc40ede6a12b62cad773640807745e
>>
>> How should we proceed ?
> 
> I am sharing an immutable branch with DT doc/files updates for the
> pmdomain subsystem, which is available for soc maintainers to pull in
> to address issues like this.
> 
> For some reason I forgot to share the needed commit pointed out above,
> so I have taken care of that and fixed that now.
> 
> Mattias - please pull in
> git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git genpd_dt to
> your tree/branch to resolve this.
> 

Pulled in now. Thanks a lot!

Matthias

> Kind regards
> Uffe
> 
>>
>> On 16/10/2023 16:15, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.6-next/dts64.2
>>> head:   976868a021ee654f4cf6eb6a2f40f95c78c04093
>>> commit: 39da9a394be05ea5ab1e08131916354e176ddd7d [7/19] arm64: dts: mediatek: add power domain support for mt8365 SoC
>>> config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/config)
>>> compiler: aarch64-linux-gcc (GCC) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310162249.WBktvf2B-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202310162249.WBktvf2B-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>      In file included from arch/arm64/boot/dts/mediatek/mt8365-evk.dts:14:
>>>>> arch/arm64/boot/dts/mediatek/mt8365.dtsi:12:10: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
>>>         12 | #include <dt-bindings/power/mediatek,mt8365-power.h>
>>>            |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      compilation terminated.
>>>
>>>
>>> vim +12 arch/arm64/boot/dts/mediatek/mt8365.dtsi
>>>
>>>     > 12       #include <dt-bindings/power/mediatek,mt8365-power.h>
>>>       13
>>>
>>
>> --
>> Regards,
>> Alexandre
