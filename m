Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BC1D7E4A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 17:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758993091; cv=none; b=MbTjlo6r8tY09XuIxt8IY9ietVMTP8A1v4iqGULm5aVPZIxhqv7o5U+8Zh9+p6xH/hPq8ONdq/HbS6QBe65W3L8mDl1MF+yNxQ8dECzGctiwIbbEaTAa6Zny1LXockibD5WXbb/TvWv0zfboZSdesNorPJasH28USNF/sE6fRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758993091; c=relaxed/simple;
	bh=jLTGj7TkI3Ao3G6fjkGNq91iG8hi57GalN6H5JskdNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4TS/xwpDIx3eKJUVUIPZEZDzn5iMSmd9xJgnemsnyfjYXfA9a7mO11szigQg35J/vPRiiOP2JxR3GXKCwOIehyj8FlZMSFpyw4ZmMXF8AOzTDsMwmFmBhl0X91Et47C2zcVjvOyTOguVFfPTTp4ab6hBx/D6obkOVieFfS8dDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VmVRymDT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmVRymDT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so3027385e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758993087; x=1759597887; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbeUyzyqJ85LOMF/3QiljbDGg+Chlqh/B+61TR2ept0=;
        b=VmVRymDThiPmxunRtpnh5XcxCFz6e0FV2Kw3FvHAoDeVJtofPnm5SohAN3wIf26Gps
         gmWlxSLQLoHMWd4uQraUWLgplfx6OFT252JNDIDBheT86ZcqkG+vmFGnmoqVNUBj/zcW
         OX4bZUw4iM2Spr5bulIbVsORbZXq/Hnj/WThz6Ser3kxysaCmJnIynKfq7kZSw3CZG/C
         MNPynWVKzDDb1q0xp4zOw2Cg6Qw2yWJRbA/uJBJGLBCguFoHuAaEl0Qr/XKKlNQpGbD2
         mEexnRLi31HK4TWYRbsU7/POMk7ZGgYLeGxOeLSQyBrMFjWz+8V+yxT/mv8D4zrdPHQU
         wytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758993087; x=1759597887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbeUyzyqJ85LOMF/3QiljbDGg+Chlqh/B+61TR2ept0=;
        b=dpd/noB3jEDLPSrSmZRigzLoQVMUNrrdtBLFDDQolQyI0yWyjVQ51XUBKFl0MOQbqJ
         MGxrsByxo7DE1nimHXM8WePObarJB3Mn1/W/tuqzRSwD7Yp2nmlgkx5HDMuUxRd4v+gJ
         N3pUBOjNUGnTZqQhrhWTWnzNgRHheaAVvvx2h6wEUTWYPM54gztfJOyjwwX7+iprvKzf
         qqqerdq5fBmkp1AjL1p0mnqEHYDHrZEN2nk1+o3fwZxS6sw7dbGvErZbU7dSVq+yVU5q
         NhxGRKLt4PrqQrcMZo4OEVtQcCf845IWT1dC+X2FyD1OsU8IOpjAaZ2p7OfHfRmzlYq2
         V1eQ==
X-Gm-Message-State: AOJu0YzrhI3U7UHFutjkGOlSCSjSqbJtNZ4MWIxmVWPidZFaSSl+EF2p
	KEyN1+KrfYvvO+HsTiMTTisuuQg6sb/QujK+Z6d2H8CZdZX0a6BZ6YoTOW11UXHh9Ls=
X-Gm-Gg: ASbGnctc4ChK3qrY1nWsjMlpZ58tAtIuti0BXw4ivmm/PqjrCmydYJ11tSRd0DdB6/z
	TFxHILRo7z9niNC7rBvLShFOV4IqUg1Uff1paK6lxFXA8ApkUFmBx8bPLucoTmgk9uy7sPLU4vx
	9KXtSW5NZ6ksKsxIwpvq14KfWQ9/S6wnRyW7DZZVYetZo2yPU7zu9pYK1jNipwS/iZbzb3rcjDq
	qAcT8fG+UQJa6HTxUBcDHc/tijhSe1aTEbX2LmhuhVqbZPEKPErrmvf8PojDJcPQaRru7be+3IC
	VVGs7u5YS4BLQKBhx7jllYWMlXuHXiNKaHz8jqBjw+uF+5MFUUsvZlint97XuLJoCRfHZZzU7nb
	n1JcQulvEbc4j8EvGZ/oahKLMY3rNpnR5MtrvVgEsn4aZ+CiPuWzSPyD+1NZ+h7m9/c396bsgX0
	sIodaSNRsDFfjX
X-Google-Smtp-Source: AGHT+IGhA0np51CcL3qcNT+WE1KkvbIaQ19qBCZnqxXm13meLrjWUEx5/Dmm6EdytJNhtqmrmZm2Mw==
X-Received: by 2002:a05:600c:1d22:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-46e329a7e49mr102444265e9.2.1758993087380;
        Sat, 27 Sep 2025 10:11:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e33bede39sm122196965e9.18.2025.09.27.10.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 10:11:26 -0700 (PDT)
Message-ID: <772c5800-23ae-42fc-b7aa-7b9eb3b9cc2a@linaro.org>
Date: Sat, 27 Sep 2025 19:11:25 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
 target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
 'drivers/thermal/renesas/'.
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 kernel test robot <lkp@intel.com>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 Biju Das <biju.das.jz@bp.renesas.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>
References: <202509272225.sARVqv2G-lkp@intel.com>
 <OSCPR01MB14647236D33DECC1590DB26EBFF19A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <OSCPR01MB14647236D33DECC1590DB26EBFF19A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/09/2025 18:11, John Madieu wrote:
> Hi Robot,
> 
> Thanks for the notification.

[ ... ]

> 
> It looks like while applying the patch [1] in thermal tree,
> maintainer probably missed adding the .c file, while original
> submission [2] includes it.
> 
> Daniel, may be can you double check please ?
> Or am I missing something ?

Yes, that is resulting from the conflict I resolved, the .c file was not 
added and stayed locally in my tree.

I'll fix it by sending a new PR with a tag #2 later today.

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
