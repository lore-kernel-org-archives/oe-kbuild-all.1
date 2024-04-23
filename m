Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E114653C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 07:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713857519; cv=none; b=gR7LWsfRa+thSAl9lUSe+FIEkziP3FAYO19Xh9sTAHr05Inj8AT+qmNP7co0/CexRI5mx7NkGOL13M8ZapX9bZLOxPGDLOdvWmhC4X6lKMOJo2bIBNB/H7zcrUr/ncCErLNh//pjl7nV8WKOTJ+ht1sgJ3eZvZlPx+4MqmDFVTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713857519; c=relaxed/simple;
	bh=vFg0PnW0QQak5o0PgV9TFPerX7uBdhytKIDhd+Oc0Js=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ilNkGlgwV9fFDEF4G5wph5BL5z9zjhoIBIxDgTzrkmnKGeEm+Ww2EoHn60JKkFTvKi6G6JaFGPn0NyL81fwi5W/S9NWOLWP4hZnzqHiS4WW5Phg30o2kfpcml1ZZbywhnfWg4ZUfaE8O7Ppy5J9rWkBzQJ3CvMNm86j2UFH6yBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZtOLDWn9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZtOLDWn9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-417f5268b12so55036245e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713857516; x=1714462316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Sg65QOPtcQZrOuYCGKYckpDE7YmJS9IWjjcvkkY/64=;
        b=ZtOLDWn9zkZpEBpQ/HFO0Jg/X1RSZjT9MFRhus3Pr72jwAy5/w1bytpYEhYLnNsKRh
         59QB+i4RcoKw/i+lKppHd7xJV6Mn0mkhJINl1atYpnVw7DpM/VH7FCrh09SrMj4QpdyT
         wACaxaz8JilIl4n9x6eTpAJPsQHuHlJCHtNZNN5/mExZeP6xqeApoRcttqmPiXWEnGFn
         18gWlQWM63U9THRnoLSHgVN3EaaiLWIEtNiMVDObEE1XiNmIwZ2A5tayyhvZYUM5zq/o
         6g+TbmuwrN4VfEPoRFbYuLHfeJAzzFXZB49PDyTBRKNNGljhRYsR83Xyvliskp090hCe
         dC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713857516; x=1714462316;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Sg65QOPtcQZrOuYCGKYckpDE7YmJS9IWjjcvkkY/64=;
        b=KlXBxWo5qGRBJRFVzKY9gzwEcVlC/sasPoDJE7ppOjV07sXTLEJzdKnpLxeOu6sf/5
         Xt1iUpMZd6sRBtSml5cRyQn0oXUYYj9Rt1kl8t1Da/f5t6cECdj7uvW3SFRCWie/IoaX
         CuP1BWkEKkaXZDXKisVWhqZnbbYh2d4MFDPs+DzD0wILQnWDBvDrjDobHZlQmIptNY7n
         Hg9JglHV/JjEu1tZxpPBA6xXEZEYUo9qvhpCnd1Vah4tz4qCLbg/rleQbPE9XXOZTCIl
         giP2///9CU0vTCJd83rey4VLlh9XmCkw7QLqhCR95cOFbSdknkkGfHL5aqCMg5dlyltT
         eV1A==
X-Forwarded-Encrypted: i=1; AJvYcCXbLbtyABDdTEAQvXHX5rAQv4u/ulXAqL9BlBpTZ4EOQewluEEli0wgtB68uVRRJxOwGuTfNru16E9HFYU/noofEHLAd44q3Fx+Qg57ew==
X-Gm-Message-State: AOJu0YyEE3qou3TGpbmnQ6FfTppM3Xj/gGNMAPJLLvICY/5AMLkUK4q3
	juUO208bAGG4Xo+Kq79RVDddHyLDQka5KFR5pGJXVeC7w99O+ON45wmcJQrruOk=
X-Google-Smtp-Source: AGHT+IEjX6XmY23ztXbTm1qHkzpcVPy7yUfnvurNDsfJDLw/qOQdKczcN+j324+ogboWYhVA1mtzgA==
X-Received: by 2002:a05:600c:4689:b0:418:f308:7fa2 with SMTP id p9-20020a05600c468900b00418f3087fa2mr11273273wmo.14.1713857515759;
        Tue, 23 Apr 2024 00:31:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b0041a9fc2a6b5sm2456064wmo.20.2024.04.23.00.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 00:31:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: "dmitry . baryshkov @ linaro . org" <dmitry.baryshkov@linaro.org>, 
 "andrzej . hajda @ intel . com" <andrzej.hajda@intel.com>, 
 "rfoss @ kernel . org" <rfoss@kernel.org>, 
 "Laurent . pinchart @ ideasonboard . com" <Laurent.pinchart@ideasonboard.com>, 
 "jonas @ kwiboo . se" <jonas@kwiboo.se>, 
 "jernej . skrabec @ gmail . com" <jernej.skrabec@gmail.com>, 
 "maarten . lankhorst @ linux . intel . com" <maarten.lankhorst@linux.intel.com>, 
 "mripard @ kernel . org" <mripard@kernel.org>, 
 "tzimmermann @ suse . de" <tzimmermann@suse.de>, 
 "airlied @ gmail . com" <airlied@gmail.com>, 
 "daniel @ ffwll . ch" <daniel@ffwll.ch>, 
 "robh+dt @ kernel . org" <robh+dt@kernel.org>, 
 "krzysztof . kozlowski+dt @ linaro . org" <krzysztof.kozlowski+dt@linaro.org>, 
 "conor+dt @ kernel . org" <conor+dt@kernel.org>, 
 "linux @ armlinux . org . uk" <linux@armlinux.org.uk>, 
 "Nicolas . Ferre @ microchip . com" <Nicolas.Ferre@microchip.com>, 
 "alexandre . belloni @ bootlin . com" <alexandre.belloni@bootlin.com>, 
 "claudiu . beznea @ tuxon . dev" <claudiu.beznea@tuxon.dev>, 
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
 "Hari . PrasathGE @ microchip . com" <Hari.PrasathGE@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>
In-Reply-To: <20240421011050.43265-1-dharma.b@microchip.com>
References: <20240421011050.43265-1-dharma.b@microchip.com>
Subject: Re: (subset) [PATCH v8 0/4] LVDS Controller Support for SAM9X75
 SoC
Message-Id: <171385751450.47981.16261973588553752989.b4-ty@linaro.org>
Date: Tue, 23 Apr 2024 09:31:54 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

Hi,

On Sun, 21 Apr 2024 06:40:46 +0530, Dharma Balasubiramani wrote:
> This patch series introduces LVDS controller support for the SAM9X75 SoC. The
> LVDS controller is designed to work with Microchip's sam9x7 series
> System-on-Chip (SoC) devices, providing Low Voltage Differential Signaling
> capabilities.
> 
> Patch series Changelog:
> - Include configs: at91: Enable LVDS serializer
> - include all necessary To/Cc entries.
> The Individual Changelogs are available on the respective patches.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: bridge: add sam9x75-lvds binding
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c24177ca3b27e5a7ddaab8d330cedecd7eb9244a
[2/4] drm/bridge: add lvds controller support for sam9x7
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/179b0769fc5fc193d7837bdcb6ddee118a0fa9b8
[3/4] MAINTAINERS: add SAM9X7 SoC's LVDS controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e95752752eaf06c860811ac5ddf9badf6c1b43ca

-- 
Neil

