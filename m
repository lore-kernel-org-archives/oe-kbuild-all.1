Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AB27FD4A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759386968; cv=none; b=hwZo4N0QVIrh0STG0LLeFLxa2E82MTLXad83ciur2X7tX5cLwPodGk7f/A1geJFbqQmMFjXxzcZxRxhiWPsA2jRqS8HY1ZNzG5lt3jLYy2IhbaGjNafj2Ddzd7JDQu6iLdrhHYVrzXJILz/xMG/Utz/4nK7Zv9jRA8gK6ZL00W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759386968; c=relaxed/simple;
	bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2S3pj+pM16Pn9S9WJk420c/9WQijwZ1y7oXvwzaKqFqkJaJyQF4tqoC2/34pNAAuOALaoy/2CIL2/3Hr/KUyFUPCzy9WCEei20MhCPsIYYzjwTz8xWnzsFQlu+q1n8b5CE6GfeM1kpgZD1hgWEP+JiuCzL9kw8vazudoEgyyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlemI/mQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlemI/mQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso848721e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 01 Oct 2025 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759386965; x=1759991765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
        b=RlemI/mQrWJ42vinM7wVZf7CUdGbddI/QK89+Xm79aB7+MUq0GfTaCSoEmwfiGhtUf
         /r+ABvv58pndTnr8MI8uChShP8MwvjJhU+0UXTyPBkUBCtnaSQvxt8ENO1AwiuZ67tCd
         22RbEimVgz0VJENP7L9oPHM1r1zhkp5d8S04k6tG47PNitoe+E+IfYItGEeo/jx20djK
         NRWgnPojddfaFSj7CbQWMWLA3DVC3PVWMJhxjiKzNAvenDgH87aBWFLxDplHYaq2Oc5e
         kr7DjZNBeGIelQJhVRW1trHzedNMLxFo7Zt7Pon9KnKUBGECNKJkNmg8OfEtbmm8NZpa
         HJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759386965; x=1759991765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
        b=P+fYKyEVRCpxlFdNsJK/M3k+cUlqif7pjjJ2wPl6I5bQjJrHh8UGnefAwAlLT0niw5
         z0nqBCZozNQ5RQ1fM8O3+eLqNJm5iCAlN0xkKnytIuf/Pp3rDMcTeI0sII1aeeO3MfBX
         +z2pw+eoiblXPTViLZCHVft4Xu0ExkbHAJRcHgTB1BWafojwcQpBPgFiHhSpxZK6+PSS
         5zZjgwscvsTkORpymOnOAAvy2D+QS8w8aENZUVcQ0CJd4bD/EuMTfRDgd46Lei3Z31U7
         tA/+0QEdy70T0tuwKLSnHwhS7A5tCdCUFS3ws05/0j8HdSv8n1sJBi88tWzverLlqNZw
         sf8g==
X-Forwarded-Encrypted: i=1; AJvYcCUIFdyGFDg4bPnKXC3oDbS14kksWagbBmU3cIlup6BGAhFTef1g9OGCRtQ0N4fAgCTQTOlKp/tmVlhtvv3e@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+Dfccy4OYSsGBh0OcWKB5MnI7aE8xE/O9Kv4obVVWBuzyhR6F
	wj5632fl+e04qQlgDc1rbjeG8V6Kfz4RSXfJIanVaIwPS1YzjJ84sxGTUrNo2Dtkn84OypLoAx/
	dH0J+k+EOjhVgA4dYZFU4aSNsTVwaxUo=
X-Gm-Gg: ASbGnct5q893jz2vcdY+8VHgkoDSFKu6vHO/UhEpLhbuOlIAZScHQ9J/T0x8kNeCd8V
	92ICoHogsFbW/ikZX/ka5r9fY9eXv3+T8giz/5Vd/eOOvdJOzrMG00ARW8589Uwfq0yK0/fXVVa
	ScPjIqRdnl7k92NfWml3oFfaWGpLugH6+Shg1xHe+/tkoDNYd3ZCKzW5ze7DSOcPXulQYgXjtx3
	ibghyBh8KjXI2BRqX8+gIs8fxkDa7mA7fWGnwiABUN9rSmqdgPkt8O0WsN8kYYOew==
X-Google-Smtp-Source: AGHT+IF99G3AYiAUEQrPtjf+2h2PSZdL5Ih8yjphXmvu9P7cETElAJxwS9A+P9E5rAaBZ1LwUTeNFcGEcpOdmxasB90=
X-Received: by 2002:a05:6512:3b8d:b0:573:68fd:7ad2 with SMTP id
 2adb3069b0e04-58af9f6b129mr2083801e87.35.1759386964675; Wed, 01 Oct 2025
 23:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924175743.6790-1-hsukrut3@gmail.com> <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
In-Reply-To: <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Thu, 2 Oct 2025 08:35:53 +0200
X-Gm-Features: AS18NWAtwoESXok4b8-OK2ehiGbNAGs6cVgv71Xx2MQ4h4uKtcLLpvhfJQAkNZ0
Message-ID: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: David Hunter <david.hunter.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>, Bernie Thompson <bernie@plugable.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Zsolt Kajtar <soci@c64.rulez.org>, 
	Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,
Apologies for the late reply,

On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> On 9/27/25 12:12, kernel test robot wrote:
> > Hi Sukrut,
> >
> > kernel test robot noticed the following build errors:
> >
>
> Did you compile and test this code before submitting this patch?
>
>

Yes, I had compiled & loaded the udlfb module with no errors. Please
let me know how to proceed
in this case.
