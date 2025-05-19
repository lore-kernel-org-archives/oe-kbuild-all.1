Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C731B043C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747619945; cv=none; b=OZQpOJyHDCen3aidLexcBt8eNoEPzwNCcLC6Fg/QES1Xh/T6gpXIF/o8IQDsh7foGVXdT9XAe8lJZQ5c51sGq0k1c4v6p8PrORIPm/gkYAlnbqgbFxCBFa/k8BvgUaj6/p4TZOWQbIgvSJHpSKaC/k8PAGHrvTQuKqFkLaUXKic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747619945; c=relaxed/simple;
	bh=WWknmnTXcv1WYiNw1GpNgnFUPuzSkHXAntd1AlmTgIY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CSe45DgcoqUoYUh1k+fXTcW0gPCwix1nTfOHVP/V8+8HVaaClVrHVi6sv/MGP0jM7eWXo8t0qS1RqnX/bLis4WnkcFy/SVTFHO5YVkBwZAQcylA8ihSw7ybPlP+XT5Je/C7HXFoPTWsKjKORB7MW1M6DyP9QIaOGK03dqXiOxuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duq4wSZq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duq4wSZq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22d95f0dda4so41811765ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747619943; x=1748224743; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=465ybCN69urWCKwsV8zHhnkvhBdyoDe9eDKU2Bo8TAI=;
        b=duq4wSZq/wW6ECDx/XrkrBR1L4vWy8zjRQW0KsKQNyMeBpELk+aqKNGA4f6rmTfizJ
         f3iqH+xwNXIlbGkGaLQk0IWYyp+f2PlVgRP4qe/RAG19cYzwzz0AYQw0o16ClbZl8Zro
         nB1K4zXted9vC4AmVxD/4L8wbqkNBMHUUU+nLoNzyyKO2t/qeo58Nxm2JIL09fuJMFjM
         YtOVVkSSDkUYqUtDheccZuYiJ9H7cwgaMVwsZ7oFGHEVfIMVv0nDL0snafKoLkksEDw5
         BvQg4fVHktQ3Ld9HkTvidgzjO1+LW4rP7ifFmjBlew0rAsuUznJZWMfImpX17PsT+ZOu
         kOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747619943; x=1748224743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=465ybCN69urWCKwsV8zHhnkvhBdyoDe9eDKU2Bo8TAI=;
        b=pP7uNyaGiUev5w00hZHIT0ssAZiGoe2SFWmGbIccum8nlzi3lEJW8avOlcVceAaeku
         Bpa/u31d9HgL2en8jXoyocHTRA8j0vpkkLN7caW0gwMFBtFSKMGg4ZdbMZLW3BG1bRxo
         bAFpzfel7Lao1m3Faqdoi+BhwpbIIU0zSCqpurOPK4fPkCmqh3xBadd04WkBbXSMiOwr
         yEzhgbzZ8+aS08lcef9pg6fNwpAHWT35f3liAo5u3abcupy314AvflT8426EtA6m0hRO
         76TAcnlC0KCx22Jje+7BbRE9F22PZ8yoZ9dHMYcvmpyhi6yW8ROyDd4ln2PZhG0oKyf3
         uLBw==
X-Forwarded-Encrypted: i=1; AJvYcCXcnLPeWbtSlWi/SjVeaToR8xgI6hTny0Fj+viC+MmvpPuuzGV1BdlwLN9p1KABL47utjLAu8o2nkBoFalS@lists.linux.dev
X-Gm-Message-State: AOJu0YxllGjps/xp3Mr/2n4x2imvHO7rugpEazKZASvXqKOtHwT05W1m
	F8CR3s5oUIqwG3z7ZAcYvbe/JfT91WhO0z5YMxnD4E0mC3tgLtQuMHBj
X-Gm-Gg: ASbGncvqCOSP8fmcC6qs+kQvrKDeYKQK81w4L0xRVYAyBccBspcLt3ttpVyJS5ELSfP
	TIKwOZFvNHbhRyZVtrGDp4NMlPqptO7FbQbGDzTGw1pDFe7IPouTAgdJXpCQXH/zihKleaIHPZy
	3rLjFJjYQ8FO71xYbv+R/kSZ7uOCbkvilRkrh7qId7broZKJ/MFIsjCc9rnlu/CFXrovEUrN/pj
	OuZzWycLpOq1uZ7HV/WmM+tZiEaxkCdGhXv6zMqPKtygoUuRLGQVHS3FrEiyXNtFtXbRldNLjOJ
	+2qW6Hr765JJE1JiF9KEl67GecECeYyNbwb9ofWhiWsVB3fMb//rF8oBuTjPlbQ=
X-Google-Smtp-Source: AGHT+IGtbaL6Rwx3Tp83tljaaL5Fb4pAonzvRiQVTrT6/GDNWs9E3hM2f206ofLvP2fHF/APsFgzIw==
X-Received: by 2002:a17:902:f643:b0:224:1294:1d24 with SMTP id d9443c01a7336-231d43dc980mr123322975ad.3.1747619942933;
        Sun, 18 May 2025 18:59:02 -0700 (PDT)
Received: from [10.189.144.225] ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4aff935sm49179165ad.94.2025.05.18.18.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 18:59:02 -0700 (PDT)
Message-ID: <2faff963-c96c-4576-8680-a3e9b432aba5@gmail.com>
Date: Mon, 19 May 2025 09:58:59 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shengyong2021@gmail.com, oe-kbuild-all@lists.linux.dev,
 Xiang Gao <xiang@kernel.org>, linux-erofs@lists.ozlabs.org,
 Wang Shuai <wangshuai12@xiaomi.com>
Subject: Re: [xiang-erofs:dev-test 5/5] fs/erofs/super.c:659:22: error: no
 member named 'off' in 'struct erofs_device_info'
To: kernel test robot <lkp@intel.com>, Sheng Yong <shengyong1@xiaomi.com>
References: <202505190150.4HUHevyn-lkp@intel.com>
Content-Language: en-US, fr-CH
From: Sheng Yong <shengyong2021@gmail.com>
In-Reply-To: <202505190150.4HUHevyn-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 02:06, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
> head:   7cd18799175c533c3f9b1c2b2cb6551e2a86c921
> commit: 7cd18799175c533c3f9b1c2b2cb6551e2a86c921 [5/5] erofs: add 'fsoffset' mount option to specify filesystem offset
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250519/202505190150.4HUHevyn-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190150.4HUHevyn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505190150.4HUHevyn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> fs/erofs/super.c:659:22: error: no member named 'off' in 'struct erofs_device_info'
>       659 |                                        sbi->dif0.off, 1 << sbi->blkszbits);

Hi, Xiang,

dif0.off has already been changed to dif0.fsoff, shall I resend the patch to fix that?

thanks,
shengyong

>           |                                        ~~~~~~~~~ ^
>     include/linux/fs_context.h:239:52: note: expanded from macro 'invalfc'
>       239 | #define invalfc(fc, fmt, ...) (errorfc(fc, fmt, ## __VA_ARGS__), -EINVAL)
>           |                                                    ^~~~~~~~~~~
>     include/linux/fs_context.h:227:65: note: expanded from macro 'errorfc'
>       227 | #define errorfc(fc, fmt, ...) __plog((&(fc)->log), 'e', fmt, ## __VA_ARGS__)
>           |                                                                 ^~~~~~~~~~~
>     include/linux/fs_context.h:192:17: note: expanded from macro '__plog'
>       192 |                                         l, fmt, ## __VA_ARGS__)
>           |                                                    ^~~~~~~~~~~
>     1 error generated.
[...]

