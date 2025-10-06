Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E62D2486
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Oct 2025 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758596; cv=none; b=l0KKj6rpX5sceJzMWwQCIy4dL6RFo+NwyNrlb3lCgkfQLo+6ohG1/y8O0H71MTHWg1OGEW0mkDMMJsZWiFM8Ed+VlzU+cK4lVxenwy9Vbc/M8xYFny/gfvGovJbFIbQtCE8NDTYHon5DzYlzBOr1r/GsSxZmiYY42FSxFco0J5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758596; c=relaxed/simple;
	bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kB7kmLWSnHwTH57Q2A7bJLxTcUPe/8WZqo5KO+5BcVKVzXiwLP24Y5CGkLZ47OeDCWQDpxVSj+V/8qU5LfcoRj5zGwQQk46dXdgQLTDYIUfgw0vYvpal2L3HJPi2ONf+OB3Y8V+HxDR8mPjpbk6WmJxUtS5bEywAzTNGS4HVvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e75AMdGi; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e75AMdGi"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d603a269cso53034547b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Oct 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759758594; x=1760363394; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
        b=e75AMdGiw1RQL4gIxtkHbIKs5RR8pLiA3qhDtKK3891G1hkS+Z76FebFJr+No602CD
         Pqhi26L+7EJ5AEbwZplzZ7Ibf56F/8WJathtTl5qi2jQOfZYMo2thmVXZf6rpOVJKBsV
         eRgcB8wcPOx1OhfpHWirvu40V+mI9Yb4TmzLeKLZK4WWN8nPPfH0PL0cIon8H7GmdX4E
         HLzCRPke/4lmEOCeh9fGfD15ryZQDnnKCAiVxWfYUS1dfGIGikA3Pk2pH3RN9h2X7bim
         MY7deB7YtX45jd11iHFzfBYSCgQ52aSNrdK4qN8fL9ZRM55EdLHlY5moFIJPILWlv668
         XCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758594; x=1760363394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naBllE4IE535a1UhrtE/NG5vtCFsBFvSt2Qvtj+AiGw=;
        b=k3KCI/0c/vDw+IyX3iEEPVD4jJm+XAW8Dz6Y/qPiA+0aenztkkWCN+K9wr+tkmpjrk
         c1vDZf+1HHHaOBmyIExgbSwCyKD8qKbYwoSrySVDhjLKwnk3kc9GI3HNwEXmZFmgjfeb
         97jivZMXaO3zwMPXaGH3Du4JwIEZQz9gu+PyqJx33WdpXZ8A5206OzTDcyER8M2O4r2I
         wuwspjJP8FacJQpjAn2jbPRJ9t5WSgvUkgNnUUhYHT+5/CWkZzlnhYrCGsLiKvAoH2Dd
         p+2+sNDAwPtwaR0WP37iNBLq827GOWU6tn9+O79b3n9nI7TmvptYK58HqDE0pyVlIFzZ
         W9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVBTtKGmxHF7I6PYALeW7CZ/C//rkG8uStpkVsWrqOiDY9yStHaQlMuFTqvcwOq2vDyv6oHN2XDBVHIxB9+@lists.linux.dev
X-Gm-Message-State: AOJu0YwbiOY7jWjrvdFccrRs2/Buh7Mzf53ylqg+8swogLOo8Cp/hCCV
	UJimoJ8jtV3H1zodkU8GvhvEUbzLlCLZgop/drMz7V33Ss6eensiATHY
X-Gm-Gg: ASbGncva+wE1K4HAg15u12aJkTEkBsB95aovkgi9OcLuxwEGKP9Qjx3g2ErVZHWoyIn
	s5PNUhEz/XxHxPg1oEAsbqwZYpDgSSc3s0/C2pjhg8RIeD5brbfGn5L0hyGVvnlK8nmBBIuNfvv
	0meh8E2sSt6P0kmOkC5rwEBZwR24Zc6oClMaPkSwBRyAIY+6unSmXqEtWIOzOdlX/K6mKzjH/Cs
	CiiwZB3hKpBTMvJPiHKEdCLbBJcEhV1q1GbVfs51UQBbPBmpT5NMfMZNKyXhswZHKH1lY6s0SYg
	sDwLsg5NPSsvxlbh0Qab4nOqut7H7i+B6ylai+vxTzK9OP7GagyA4p1cvLS3QwV9igqpnFgeFT6
	7Icb0r5eM4tXrFXbrc49NZGBvNLj2TfDo91wNRlJetFN7TfZ/Pl792qPGXjp6HfJ3Qv2ZAeT7pY
	3vFK3EXSxq2/+C3jR9VNGKh9DJ8QV79w==
X-Google-Smtp-Source: AGHT+IF95I/GWMOy7K0yQH9P573Gh61Ga6VWxZPEu4GIRjFsPKAyfm6hJudD/c1aH+Spd7nOuM10XA==
X-Received: by 2002:a05:690c:f8f:b0:731:76db:a5e0 with SMTP id 00721157ae682-77f946a89e6mr163041287b3.25.1759758593563;
        Mon, 06 Oct 2025 06:49:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:83e:4131:1b09:7d81? ([2600:1700:6165:1c10:83e:4131:1b09:7d81])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77fa19a7d6asm27562527b3.55.2025.10.06.06.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:49:53 -0700 (PDT)
Message-ID: <51030f00-48c6-49b6-a4be-0b4e238f71bd@gmail.com>
Date: Mon, 6 Oct 2025 09:49:48 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: sukrut heroorkar <hsukrut3@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>,
 Bernie Thompson <bernie@plugable.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Zsolt Kajtar <soci@c64.rulez.org>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org
References: <20250924175743.6790-1-hsukrut3@gmail.com>
 <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
 <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/25 02:35, sukrut heroorkar wrote:
>>> kernel test robot noticed the following build errors:
>>>
>> Did you compile and test this code before submitting this patch?
>>
>>
> Yes, I had compiled & loaded the udlfb module with no errors. Please
> let me know how to proceed
> in this case.

Hey Sukrut,

When you make code that deletes something from the kernel, you need to
make sure that all other code that references that code will still
function properly.

When you surround things in the #ifdev, depending on the config file,
the compiler strips those things out and compiles without them. That
means that you actually need to compile and test under two conditions.
Once when CONFIG_FB_DEVICE=y and another time when CONFIG_FB_DEVICE=n.

The test robot gave you a sample config file that you can use. Please
ensure that you have the proper version of Clang on your Host machine
for that particular config file, if you choose to use it.

Also, I strongly recommend that you run the code on a sufficient
hardware or emulator after you test it so that you can verify that the
code does what you think it does.

Thanks,
David Hunter



