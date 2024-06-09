Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD753D0D5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717938043; cv=none; b=em2J190tvATBrPp3mYHnRoViPhEOJIEW151oFBN+SUfzvGkwjR8qcXOYaq2oi3hFdx86db3DtR/xVXXqQcBYx3UTLTD373mJu8NL28c5b74EL5L7mAm4+1/1MDUqc1I+cjc/PqQo5uOyIeDJ4oo7FY08HdvUK7XURfbhfk0U8Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717938043; c=relaxed/simple;
	bh=QigNoW77ClCeqfOYTx4Et4Hd7mgkHkgVnWWc6yIPB28=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l7cHjv/7svWGO9FLEotzEK+VIf9XJblLuVt3ubIDrOiiF3fUZS2nHHVs/HCnxjMfjokPj8RqE6D5PvwU8dVMe2jznPnbMfHlmfMKG1ZJznhy9I82gIMZiD5ydIcdGQX7iLIsq4x1pxUCzglPW7XI1k657e4NgTlS+hb9qp8WnEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GzSaghAv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GzSaghAv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f20e798e3so139068f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 09 Jun 2024 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717938039; x=1718542839; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ky3F7lrTtIDOfgJFvUgAjHSa1goIJaZDc94U4MqRHYw=;
        b=GzSaghAvlzkehp5D/eln15/Nn54VEh32N1PdiUdaHhMx5MwPWjp12oq5+hIza1UCtZ
         4g0KjOqlIlPnF42wMe60Prg/+439ZlkEUfPCPJ4jA10h8QK/+FMJOAg5i5NiUctrwvrc
         aL0GRuD4mRdr086E+vTHITJS0+kmdYeHeS+0LQdiulfV32urQhQnM7FxD5IjY/8KrrwQ
         83lxd4/C9L2j83Au7FJKMO7RGailhpom1Gv1Y4nGlOCDxRqwAftrMM/o03lwjV+ogJs7
         XqwovJy/eoNsUf788+WcoZAMKFsvNxhIby6uA8Pi6KNmCgvi34xlI675E10BH6PupKuq
         GYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717938039; x=1718542839;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky3F7lrTtIDOfgJFvUgAjHSa1goIJaZDc94U4MqRHYw=;
        b=oa88dEhC2fNtUAXkwfhEWL1xPbuxdMxMlvR6FV2aps01cpxpO0rzO9cNRhZGJCwPqr
         /qiAfDU85J1/qZ3P7owU6WwCCog1kC8SrdkJcGdpiDWZjqyYD7NugpkhXWM6G5OaOA75
         iVpqS8WXgMxs/4ZpCOZn+LyQNFZvMu/2be6sQRnpjTJUJRqIuIajsiUX/rGMvOWtOiGv
         Cmm755JlgbKlkTI7g1y7f77DryxfOCktyd98tcZkYBEFnu6PaQf57YWkgm4YgD0aJho5
         V6iTKURj/7WLsGAmrV9tQ1zcU10ypUSSwBtDQ/YueqLMxiTMsWC22bp6r7zSXTyET98U
         2oTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtoo4qb/hcTN1EcdkRNU94bqIOjDNo3hVDK6PeWjFX1gE1G560PqneUNXklwt/qjo2XTrRBKj7brY4Fmn312Gg1aSF4b1EfBYdQBhuCQ==
X-Gm-Message-State: AOJu0Yxof+HGpcfbU1APtRTFZqXO4AcEUnoC0LS287H8hAfq9gL4NQVJ
	Te0HWzBWNIfLdIsTDzNvB6Xrz23peNmP+qpCjjmrTV5vQSewSXTrtxOD4AsB9LI=
X-Google-Smtp-Source: AGHT+IGRsbqTVIFgZ6p18PEJuNiLJHAflv0f2yiem7/+NmsB7nGwV1Zbdr6NLv9+xKSWGMAW3A3S6A==
X-Received: by 2002:a05:6000:184d:b0:35f:209b:c10f with SMTP id ffacd0b85a97d-35f209bc1bdmr870170f8f.68.1717938038958;
        Sun, 09 Jun 2024 06:00:38 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d66cf6sm8521473f8f.49.2024.06.09.06.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 06:00:38 -0700 (PDT)
Message-ID: <8412fc44-d3c1-4283-aceb-7aa4b95606be@tuxon.dev>
Date: Sun, 9 Jun 2024 16:00:35 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] ARM: configs: at91: Enable LVDS serializer support
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>,
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>,
 "neil . armstrong @ linaro . org" <neil.armstrong@linaro.org>,
 "rfoss @ kernel . org" <rfoss@kernel.org>,
 "Laurent . pinchart @ ideasonboard . com"
 <Laurent.pinchart@ideasonboard.com>, "jonas @ kwiboo . se"
 <jonas@kwiboo.se>, "jernej . skrabec @ gmail . com"
 <jernej.skrabec@gmail.com>,
 "maarten . lankhorst @ linux . intel . com"
 <maarten.lankhorst@linux.intel.com>,
 "mripard @ kernel . org" <mripard@kernel.org>,
 "tzimmermann @ suse . de" <tzimmermann@suse.de>,
 "airlied @ gmail . com" <airlied@gmail.com>,
 "daniel @ ffwll . ch" <daniel@ffwll.ch>,
 "robh+dt @ kernel . org" <robh+dt@kernel.org>,
 "krzysztof . kozlowski+dt @ linaro . org"
 <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt @ kernel . org" <conor+dt@kernel.org>,
 "linux @ armlinux . org . uk" <linux@armlinux.org.uk>,
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>,
 "alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>,
 "Manikandan . M @ microchip . com" <Manikandan.M@microchip.com>,
 "arnd @ arndb . de" <arnd@arndb.de>,
 "geert+renesas @ glider . be" <geert+renesas@glider.be>,
 "Jason @ zx2c4 . com" <Jason@zx2c4.com>,
 "mpe @ ellerman . id . au" <mpe@ellerman.id.au>,
 "gerg @ linux-m68k . org" <gerg@linux-m68k.org>,
 "rdunlap @ infradead . org" <rdunlap@infradead.org>,
 "vbabka @ suse . cz" <vbabka@suse.cz>,
 "dri-devel @ lists . freedesktop . org" <dri-devel@lists.freedesktop.org>,
 "devicetree @ vger . kernel . org" <devicetree@vger.kernel.org>,
 "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>,
 "oe-kbuild-all @ lists . linux . dev" <oe-kbuild-all@lists.linux.dev>,
 "Hari . PrasathGE @ microchip . com" <Hari.PrasathGE@microchip.com>
References: <20240421011050.43265-1-dharma.b@microchip.com>
 <20240421011050.43265-5-dharma.b@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20240421011050.43265-5-dharma.b@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.04.2024 04:10, Dharma Balasubiramani wrote:
> Enable LVDS serializer support for display pipeline.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Acked-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied to at91-defconfig, thanks!
