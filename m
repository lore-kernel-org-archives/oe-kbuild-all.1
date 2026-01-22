Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E985395708
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099740; cv=none; b=KsK2dwXr7Yikfuz8swT7da6kUT1qiZLC2WWQau/CQtSFi1mMrTYjnHvmr4U+CIUmRruR6W5eWAW9sr1XmT+hj/IkYY6As4Nvm2F2TP7481vZIBj1rH9wAnwg3iyrv6/XpH8HMFOOcnL16m1fOsxOe9oge8sJ420duVUvX7g70V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099740; c=relaxed/simple;
	bh=ZeRwDa8Rb46d2rBpoH6/CC/k21Uf9fAOTivadwrpHY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQ1hx59WYBM48mcxPdO/x6MizmEoWefmota8hzb1t0fZTndROzW9MnsdcdZxw59H7z93/qfcNvc9XW1xUPWWT/j7Fjg/Ue/vtgCYJD21Eqg5FIRDdn4+CjMnFHROWk+ejqHYO9uWrfLDTXZl6MudW2A01bYgRcnZyOOia25cRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQVCDplN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQVCDplN"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so1715418a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 08:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769099727; x=1769704527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0kz4ZiUZYReaaffs5Nzc33lR02WRzRUUmPU/gSlaqg=;
        b=FQVCDplNQZJq7ddLJ1fyTmCDXQQAl62xi7pwoFXjqv87fC869NSwztyFrIEJlYwM1H
         KRA/tXvCzBxFnyc8S5yr/0Ee9NKgOjPZkPmyELWknkj/gS+IkSgn1kTrNhC3UD/RW3RX
         9lpA1zn/vIQ5j4d2fDofm0SGdQJSL/sN4EbgcKDtKYhTp1ldTZoyBDmWIc1l+TwHQTP4
         Zm/bttibzr4DkUvMX4sH86h707uOOoBCKA85toUgSqVC9yZgD8aa57vbYiT/Asj8sGJG
         4rbtFh1PqE4ulMOtpZXTecOSzUDyUo8V7C9mYUKjuwoUeObTY6IJNn5pdOJ26NtQMcSj
         zcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099727; x=1769704527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0kz4ZiUZYReaaffs5Nzc33lR02WRzRUUmPU/gSlaqg=;
        b=Hf8FCoLTnTNd0bELlFHX0qLbrPjd3wAyZsyl6KStbyHMHTsdF20c4hTZU4WTOud1U+
         cwlYTczS2ShXr/YuDKbR1+Fc53a/Pk3mBSgtC6cyftTJ0QIhkWpuMxcs0ucbfFCpANK2
         m3VrihmXjEpHd98unrWIsPzNHv4oqCxOzmqeU5YmY3MtPu15EXbbCKZmHw8fwLzhrEz9
         oBZcjAppREWB4JTr0lKL7pqNyrP6jkT6K1rc/V4xTnCZTOKANpavpF7C0eH9Iu6QzhM7
         w7WN9wUTa4ytu0TT7Awn7EhDtE960GYJkCQ+B1uT6py2NfG6fmaapu0RFcvWV7ZLv0SY
         ixVw==
X-Gm-Message-State: AOJu0YxMh+TBcKfMSi7eBuUWvpe+Xel+fk152qsXS2ioGOWIeOI+JxRO
	KBKKjiEW+9sUuRRQzxv7Yd78ZFrnN/znDjC1Wj1N1Z9hJp1u65kZLioQNfO4+Q==
X-Gm-Gg: AZuq6aKeybU5K2OX7O32rC66ObQNGG6GeZyJo81iyAmYOqwWubqv4WPJymGMPjKiGiU
	VJAe7tOrK+3a1aogzzojjZEW/FDbamPC+kD5nCfOeMcaXXe5+U0Wzd70/r1g7MKAJIIt1Emf4Gz
	4DwZiAz0seM7Im9Iazyv2t6IbqHweP8Ief+ud+1+hVbJIMRtXlt/aMqXchevC9B06PcBc5rLGis
	6nAaDV8xQyXiyiPUqtm7wvD7fpOc7UZKn4/zrdcZJlBwe2qDqEUwwBq2PdFvBCIvQeJrjG6F2pQ
	y1nd5MdnfjEpcK7r5VZRR0MwZG5sF76d4hOhwWq8yDAzFC2VAjnxfUedLs7JNDlqIENxnlNxsDK
	INS/dWJ0eCegYeTxTZdXk6qM9vh5fvhZ+utLp/XhjnM/FXDnJzmKyzOdIzIXFlECKrpI5629phr
	yJEX10pNF36TL/+s2GCy55hwRSiYN8SqNXnUVI47H6YNujb3X8GbUS1vFJBv9mWeg=
X-Received: by 2002:a05:600c:1550:b0:480:4a4f:c366 with SMTP id 5b1f17b1804b1-4804a4fc5d8mr32785425e9.20.1769093874088;
        Thu, 22 Jan 2026 06:57:54 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dad0sm46479226f8f.27.2026.01.22.06.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 06:57:53 -0800 (PST)
Date: Thu, 22 Jan 2026 14:57:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Andrew
 Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Nicolas Pitre <npitre@baylibre.com>
Subject: Re: mips64-linux-ld: lib/math/div64.c:undefined reference to
 `__multi3'
Message-ID: <20260122145752.1e4c4202@pumpkin>
In-Reply-To: <202601222217.uzed54La-lkp@intel.com>
References: <202601222217.uzed54La-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Jan 2026 22:43:28 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a66191c590b3b58eaff05d2277971f854772bd5b
> commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
> date:   9 weeks ago
> config: mips-randconfig-r062-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222217.uzed54La-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222217.uzed54La-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601222217.uzed54La-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips64-linux-ld: mips64-linux-ld: lib/math/div64.o: unable to get decompressed section .debug_info
>    lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
>    lib/math/div64.c:(.text+0x60): undefined reference to `__multi3'
> >> mips64-linux-ld: lib/math/div64.c:(.text+0x188): undefined reference to `__multi3'  
> 

Known error, duplicate of a different build.
Really a bug in gcc, fixable by changing the compiler version in a test.

	David
