Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4420ADF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374306; cv=none; b=N0RZUuoWD+EAoCiHmEZ0y506zRRQ6m6rCWojEKg6ATwKpa/hfoWxyfVuDp9RoGZe6Ek7Y+Z7Z5t5fkjmlrpj+UxO78oF+nOu7qicWmoWI+k4MQkQR4et0EY+3kRAWD5HA8zq/KSAD6WWpeuH8EvVt21jl/bvpkXHlZxGae+fOVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374306; c=relaxed/simple;
	bh=Kd+6DzKTiuHkjzGkdtLbyCkTyy0yaluQp17EPwunXIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XESDRZWSAAjh8qcWmgbKpdM/8j3F45Y3AudXZju+R/BdhSzgHsulegatTDbIg2ogY338DgA6Pet/sxHCI/orxvUGKgyJ9aq6DEcaoiobTK2owct6YDYeafLq2YUPPmbnyV7NUJefCxvPcgS/ns49NExzZUw6ANj2uBVcKqZ+WKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYKgoQnp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYKgoQnp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so1015064666b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739374302; x=1739979102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSq+cHNnWSDiFyg3hiZUKEZKM5fOb5ovEsLt9hQ8kFA=;
        b=RYKgoQnpE/q/BQlY54PW5GQNkkBdRkhisiUH99+x69gKY05sg2GblrumjfZgouHAiZ
         LvXhWSY46+AhV3C4/zhGktfZ8ZEc3GwLA1ehXBfLDZ0cgT0B1pZEQ1OQoePqJ5fNkaNR
         tlJ1g962lzPmWO171sU+hTpcf80ZWte622U5RuEeLCvYM9c2Uz4V2fOB7vZoUecMyQN0
         gOnTaRaM8Zwn6JGa3lVSXC3z4MLcLoIa6+KDQ5sg4kein8BxTnE92dSk3HkVGqJqyoSi
         n3VJ2bVwtpvvMy4pGXUXh1430wHSpeE/0956nGUdzPgsebZWJyXAufU5la+zlhSvgSC+
         sI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374302; x=1739979102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSq+cHNnWSDiFyg3hiZUKEZKM5fOb5ovEsLt9hQ8kFA=;
        b=Vqzz8//8RBzSMGamZSE6TsDQM+grJOflZfgpmxcHVsHPv2i7V4CmfL7DQFZFHwQcvp
         9dyzS307N2+hUlBajBR+yQBAUEXxOkkQDZzXlvQRfxI9oDk16Fgscw9/FNXOAVAIBuEj
         pmr3JlREoNSBUVfAgWFDJZXnj1DsqJGZzTPr0qSuxDvjaLHKWRg15LnyT82UiAhUOzwE
         g2n9EthEXIBZdiHgHtuizrZncjypLycmDIBCaSL5yE1+rWyH9WohszV+gLfflCS26kK0
         J+8KX9+80Sf2B5lCY2EZaKcuyw7B53hJa1U7syWykpUj9eYKp43iHs14ymW6TTne2xhP
         9QoA==
X-Forwarded-Encrypted: i=1; AJvYcCXo+ltU3M1ruCpAEdd4hY3o57TXMSzt4aM0cLRoYuRvSk8JNdEU5dYLxLKWBcT1MgdX1zGZknu/T5ahp5K8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2j+EJNhxv6u5lJTd1+fDE4tc1bLsajzi/oBG+uLloytxp8VnT
	qIktKhlDA8AIxQUkJCChAjWk6iCSykxYyc6S9vANGJwzK6QJBfsdvIs61wJUkso=
X-Gm-Gg: ASbGncuXGe4sJjerWoPEQGyOzPbcUzRG/nRNZZYCSVMX0PikTQuHl+9ZYhv52gDREws
	aFeQkF5h2bi0dOAEaanYH/9fTbpMwTT3N4aDhZCEZDy4FlgaC+ycrIU4G4yK65au5udhEloMLBB
	TeI8WjXo4xjV9e8qXeqOm0Z7sCejUb2Dt6OiY8LX42Dw1NCYrw1NkhYYQFxnYxrTCG3JOCKpOdo
	CHqix/7to70KHlhUnmc9YTRf3U2n0KV+mJRZYVeqQ4rdjHZ8Jaud2vfKM0QhmwyEz91HQgF4z+w
	mgOKFCbWUCUPgsHAXUNQ
X-Google-Smtp-Source: AGHT+IEL4lA8s78vp0Gg7MOmptz86X5Vg+sujBASU2RfYgzLtUU6Y26AXdNXUW7VE46t0p06RX/ymQ==
X-Received: by 2002:a17:907:60d6:b0:ab7:c426:f33 with SMTP id a640c23a62f3a-ab7f34a8230mr346620066b.56.1739374302011;
        Wed, 12 Feb 2025 07:31:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b4aba036sm737804366b.45.2025.02.12.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:31:41 -0800 (PST)
Date: Wed, 12 Feb 2025 18:31:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild@lists.linux.dev, David Gow <davidgow@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
Message-ID: <30998382-ee63-4a4e-8287-cd21c649b849@stanley.mountain>
References: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>
 <3dabe058-2308-4990-8e5d-0af1efd27431@stanley.mountain>
 <CAJ-ks9=mKzgLhJW0dV-L8eFtkW-xt8v3GM51V4QF5Ef_ENKLvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=mKzgLhJW0dV-L8eFtkW-xt8v3GM51V4QF5Ef_ENKLvA@mail.gmail.com>

On Wed, Feb 12, 2025 at 09:33:46AM -0500, Tamir Duberstein wrote:
> >
> 
> As an aside, how can I compile with the warning settings used by
> kernel test robot?
> 

This is a Smatch warning.

https://github.com/error27/smatch
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst

Run smatch/smatch_scripts/kchecker kernel/locking/ww_mutex_kunit.c

regards,
dan carpenter

