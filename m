Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997D261B86
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 23:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759102165; cv=none; b=ozGlL/zGFlHGmAKgAP9dAFz0XwjjQ+vbFZ7i/RXkL2KixcaDiv1X2MZkfAIAbmKqPxYv83OWiDd3po/USPFRBaX3gg1BrI1Gs19i3kxPfcHv9hFI3A2YKxxilM59/S6ToebASO/0MsyWu3bHVNXKq6/yCfOmgl2IXxun6rOl3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759102165; c=relaxed/simple;
	bh=V/jzRpqEcOhYwBw3Dnxdh4YkMwhb3CbO4cM8jjUKGXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ui/x6NLfOUU9McrKcVzGss6soDFTR2XOxPTLvOnTW9tee5AHa5XEktDmm5YhjG9OVZasF14C6lmOb1gQt4ZXRWx9x0lNzJaHXgUbrBsn4kjAWgodBbnGEV5DqzAvoBW/59etij/mtDdGl088U0ES0ykb0ZUWgUpgyJIgT9tVT9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Do2WFVRI; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Do2WFVRI"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-72e565bf2feso41083527b3.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759102162; x=1759706962; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVT14YXhZO/vL323RFIMRVmhhyNgiqUs7sCBFMwP2Vc=;
        b=Do2WFVRIiY0u3xe8VbDOkmH9W3ygjvmSvvub4umq3vsGAaIgt45So5cCkt+w161JYr
         BmSif0ycWGOOkeamTu7vjk+uFTxERUG9QrB88lpN3ptuiY1ZGoRAI6RN6KyknsSlg3PE
         S6IhVRaU1AxClhVuOnwbjrdWdRgoWLa5nNvqt6UXVMqKpwVTnf0c8XClUtYJrnHG+V8J
         WR/wCxuPJTGU1kZQ9lMHHPamADA0vUaTh3vF8Z3KACqkuJ5Gq4ZlkigBsjRZ5RTwyfD8
         GlxDShyWw3VAx1vVl1/OYdCmKAr62JXeCd6TFL8g33KtzI/qglfZat/MzcW5XG49A2pn
         49GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759102162; x=1759706962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVT14YXhZO/vL323RFIMRVmhhyNgiqUs7sCBFMwP2Vc=;
        b=s74fjW+NYbc+STmGEJLdwR0RWe0ybYQBBqYHQrX98qPvKtWbQtZWAm3npVwPvzzUj0
         85QlHpGRCmtj4tJvquTvH+F3OYogcIa3a8pQ/zaVIRG/ctmBAIkQfpnkee+Ex573G4u3
         fBNQzxM1/Z6ygIXktXjHr5MW0sHX7PVMniVh91folfZcyCfm02mJFCEnsMkxAIqDrNXb
         Ti1YHJimlcPTOjBvATYARdRqguIN1bWoZVD+aaeeDFyIP53Jg05WE3rveHKlOE9jOZuw
         8rwWYpNV706oN7HjXNerqYB6pOEBD61jyVYLmd7ykJSA+FQ0V5RU9z0m91f3+VoUy4n4
         iejg==
X-Forwarded-Encrypted: i=1; AJvYcCW4H/oKn38iutPU6YbovSsWksutNpSOBnhA4OhCVSpXu+CQQKmLZ/zVRssxo2+sY5iGBMxgtEOC/WRY7oCV@lists.linux.dev
X-Gm-Message-State: AOJu0YxwrOWxnifGcOcszs5QcjyM3wRE3mjr8TgybmjbwAbW6zQbTLkX
	TEpamVsmFKpsSt7cfjInobTB/GO5Shy3ldV/cVT49s4Qcc3C5JOLpWOP
X-Gm-Gg: ASbGncu349amTEosCUUFGdUELfHkVX51MYFu6bNwQGfgZOZDgkfVHNOru73g4Km9y47
	VSL+5NJBt2sJ4cFp9Uh21MHJeA8z/GArw+tf2O7NtYg2xEiQ27D9JrHtiTjQit3uoKG4VxrOuxU
	nRS6KqdqTJHcqKpSnMYF5wieSqi9tTZQTEHftQ/1rw8avdgEss3O10CQw7RBa09H4cuJCMIVyz8
	DLLDzKQRkNgJMPxIyUXTeKXLvjUowNEK/6FeeI3ntmu/gXfRefxXMdhaqqwxE7AlGNB5NAcG99A
	AkxeUHkLh/rSx4Bnqgx7gzlf/c4p5MBWgkouASutOATPN2e5xpl16JlwkMdb4mMfNuA+ITl01fr
	ldaNmOU7SO7unir7nHL0KhpPGUd2ZdfDkgsryikJI
X-Google-Smtp-Source: AGHT+IHskYhayDwfzsV8lkE/Uops7xgSMHfw6Sw7Fk1JVYa5Q3Ma+PAZWIZOs7Aj8ggB//5BDs9q8w==
X-Received: by 2002:a05:690c:6f85:b0:727:1d96:46aa with SMTP id 00721157ae682-76405202175mr180066857b3.53.1759102162293;
        Sun, 28 Sep 2025 16:29:22 -0700 (PDT)
Received: from [192.168.201.155] ([76.200.76.117])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d960sm2016142d50.31.2025.09.28.16.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:29:21 -0700 (PDT)
Message-ID: <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
Date: Sun, 28 Sep 2025 19:29:15 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: kernel test robot <lkp@intel.com>, Sukrut Heroorkar <hsukrut3@gmail.com>,
 Helge Deller <deller@gmx.de>, Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <202509272320.3K8kdDCw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/27/25 12:12, kernel test robot wrote:
> Hi Sukrut,
> 
> kernel test robot noticed the following build errors:
> 

Did you compile and test this code before submitting this patch?


