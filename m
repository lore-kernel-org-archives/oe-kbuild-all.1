Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520E87472
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 16:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW/STwQJ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-336166b8143so1186810f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 08:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702227296; x=1702832096; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hlPspBmKeHmjCloZaUjMxqdASetwSu7h7TshDj/1oG0=;
        b=DW/STwQJRkn6laLjcs4Dvdv7UGdy367LUrlbMaL/09rn9IJksFb1wiwKNiy6O4RzPw
         tK4nr5TBLjXH/GifZf3abeO1OpYkUTPTew3AmgCPrSYPW4VTL+27BQsMWKcY+LzNdYmd
         rHAzA3xjT5Lrod2BDrf2m2i0PkMTOOZLQUuwmFEn2Hux0gdiCIhikT8su45A2/nmKzQE
         Qq4giokUkqxFv9EEQbiwP00ACZQAPDB3X+d9323yEUvsom3EtTaCdkIQ0Wu2NEFXmL7W
         LvaeAYnDh+c/sqYTMXH8bF+CUIctiKUagwdhiZLdxCz/FvMq3eElcRAh2E/M6abMccPQ
         u9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702227296; x=1702832096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlPspBmKeHmjCloZaUjMxqdASetwSu7h7TshDj/1oG0=;
        b=NEU9V/VxIGbnAzD+MT4ViDBoO2lAEteS6SHPcX5XcQ9RCn8B+nkpV1Kv30iHciyGFG
         dba69WYbZQd3ReD8GmZ+rTxc/+vTKRqRL8mcMM8JpploQUKvnRgR4HyfOvy0hH57iZ2N
         thkeulHHCkUw8/9YDwiTwffvRrnDCTTYTz2fs6S9lTZnrdcHU/aD09vUGSD3Gb5KL7iQ
         4dNkfjWU5rwDD6/NY1KDi7Dxs9tTDOg4mqWpB9CCAlG3tq21L+fxF6B1O5MGpyjIGBmF
         DbddKClmrgc65GLIq/LdnTfz4shfLf2SYZi3rdPjBPIZzxCGl5pppJmPIoCTT8yc24Xm
         Nnwg==
X-Gm-Message-State: AOJu0YwFcCPm5hPATt+1V1eNP1/nbrQayWdM9vEOXtKCMAqhRSuQo61a
	yqwK0s0E91QG+R40zizI5Xk=
X-Google-Smtp-Source: AGHT+IEuf3TnXyF7DiDDFn4JYaORTjqzzNEVczRMFhAqU+Yvx0zPHaL8PJ/jY+T0sj9Te+KRTrULSw==
X-Received: by 2002:a05:600c:6997:b0:40c:361e:a288 with SMTP id fp23-20020a05600c699700b0040c361ea288mr1667345wmb.149.1702227296173;
        Sun, 10 Dec 2023 08:54:56 -0800 (PST)
Received: from [192.168.8.100] ([85.255.236.124])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b0040b36ad5413sm9872300wmq.46.2023.12.10.08.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 08:54:55 -0800 (PST)
Message-ID: <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
Date: Sun, 10 Dec 2023 16:53:36 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
References: <202312102313.zJHWVLAZ-lkp@intel.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202312102313.zJHWVLAZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/23 15:45, kernel test robot wrote:
> tree:   https://github.com/isilence/linux zc/rx-pp-provider
> head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
> commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
> config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)

Ergh, I have no clue, why lkp thinks that it's a good idea to spam
about someone's non-release repos, but just ignore it.

-- 
Pavel Begunkov
