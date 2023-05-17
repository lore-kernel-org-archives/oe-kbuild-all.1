Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F392F5B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 May 2023 15:23:16 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50b9ef67f35so1673861a12.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 May 2023 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684336995; x=1686928995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+zkVtFJZH/s/sKmb4Z8mX0ZyNeCSr7JQnjUSM8vJbU=;
        b=XOJ7UidV7vBcKsNvYy0i6hI3SXR8MinSpo8BS2kNkNEr6R3kCJ6pLCTX7WGWZTxIUL
         EJ3Nce8MX7iCpyr1f5uKpeKDizDGNwsRfIDHEVeUZMMIbR7HuRIruxcXeVhwCPvVBq5q
         dYfjXwks/D4nWnLJexNp3QucAB4g9L/FdSTaT53bS+wfnJqJb5PVxw0yTMnDQdomE4vU
         Hc0ZlFT0wpU0Q8SYC9hBzhcFUMyc/Y9jhI2bgMC1KxSWwVETcbfOSXC2EyBA08Wq4oyL
         vCvFPFylERfz980CDSp7ul5mtAp3QCSMBUdc5OhUzN/afS+RTViUQLSp61lAQr+KCwzl
         8QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684336995; x=1686928995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+zkVtFJZH/s/sKmb4Z8mX0ZyNeCSr7JQnjUSM8vJbU=;
        b=Xt+Dt8JZEhCmAruFQVlDdHCzFPHTCH/YeXceHFpey9Egx5pefDskJmqxR4p4ErcTDN
         AGU/oysVvMd0sumOlOL8diUIz5njxQa644PEeehcgRWSYTd3OzpVTFF7t5bFtUPxCZEE
         oBje6O4K6bDv045RKDQT4595zGvH+KmOq6M5/MVYDVdunQJOxO0M+HEJHrLuW9+HViZC
         J57cjZl+u2MXY7uRltCii/DdK4wfHiaijkhoZeu3PB42KWwcClORkYYCyE06WskMNpxV
         qYtmYwiafLGXxIl9/fDT+XgnIMw4TMb3u+AHD1stQPlmWtSfsI9JbRLQjFaHhmFQDIN+
         DBCw==
X-Gm-Message-State: AC+VfDwkZeLZ4jKjK1DVywny8Y+15/WS3sckJeDDWYoi5MesBhBfhWGa
	4Egkm49VRWVyMNcRUo3JTW4myw==
X-Google-Smtp-Source: ACHHUZ7DdgZpbkeB08gqVo1Il+baYyg2vTm+oBF8DTFemau8YO/NFvnHReGV+WIt97skRr1LrjBtRQ==
X-Received: by 2002:aa7:c2d7:0:b0:509:c6e6:c002 with SMTP id m23-20020aa7c2d7000000b00509c6e6c002mr2084928edp.39.1684336994785;
        Wed, 17 May 2023 08:23:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id ay20-20020a056402203400b00502689a06b2sm9512864edb.91.2023.05.17.08.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 08:23:14 -0700 (PDT)
Message-ID: <28889e6c-0040-5adb-25e1-f8284931947a@linaro.org>
Date: Wed, 17 May 2023 17:23:13 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] dt-bindings: mfd: stm32f7: add binding definition for
 CAN3
Content-Language: en-US
To: Marc Kleine-Budde <mkl@pengutronix.de>, Lee Jones <lee@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 michael@amarulasolutions.com, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-can@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
 <20230423172528.1398158-2-dario.binacchi@amarulasolutions.com>
 <20230424090229.GB8035@google.com>
 <20230517-corset-pelvis-5b0c41f519c9-mkl@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517-corset-pelvis-5b0c41f519c9-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2023 16:16, Marc Kleine-Budde wrote:
> Hey Lee Jones,
> 
> On 24.04.2023 10:02:29, Lee Jones wrote:
>> On Sun, 23 Apr 2023, Dario Binacchi wrote:
>>
>>> Add binding definition for CAN3 peripheral.
>>>
>>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>> ---
>>>
>>>  include/dt-bindings/mfd/stm32f7-rcc.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>> Applied, thanks
> 
> I upstreamed the v2 of this series
> (https://lore.kernel.org/all/20230427204540.3126234-1-dario.binacchi@amarulasolutions.com/)
> that doesn't contain this change to net/main without noticing that the
> DT changes in that series depend on it.
> 
> This broke the DT compilation of the stm32f746.dtsi in the net/main
> tree. I don't see the stm32f7-rcc.h changes in linus/master so I'm
> afraid this will break mainline too :/
> 
> What are the possible solutions? I see:
> 1) revert the stm32f746.dtsi changes via net/main
> 2) upstream the stm32f7-rcc.h changes via net/main, too
> 3) upstream the stm32f7-rcc.h changes via you tree, so that it hits
>    mainline in the v6.4 release cycle.
> 
> I'm in favor of solution number 1. Thoughts?

DTS should never go with driver changes or with driver trees, not only
because it hides ABI breaks but also for above reasons. The best if you
just drop or revert DTS commits, so they can go via platform maintainer.

Best regards,
Krzysztof

