Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393F1FB4A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 18:43:01 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so11159545e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691692980; x=1692297780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SdKouwlT/oGIo6LiqvsGWbbls1AGv3uLOH1vnufr9x8=;
        b=oV8U1Ycd24HVmZnohFnkQmWKmGg4biBV/LAKF4bVcDXwWYqS4zrvEU0OGthGm/sLjE
         O/fZ/orxxveE9C9NE9YPPm05xd5QKpMfITBvjD4x6ESBe0xQCGFFaDufMQE/uf9qHOum
         Vg2mRl/k5u3m6H51m+6gpjskKLwYVCunlorEIGCw9G58IQzmd5fkQB4qCoodR9FwxaRU
         CKvSuUCbY0Iro+y286MZRFcSsgL8pOyP+SDt2Mxun3zYlvhOG4qCfzH4V75PVcFJL2Kv
         TwddvMqBbLxVXiLcfx7urC+YUIn+jGBqIZZ3i1emMEgUyVNMFpf/vUTJ1TemLn8UNv+9
         iCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691692980; x=1692297780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdKouwlT/oGIo6LiqvsGWbbls1AGv3uLOH1vnufr9x8=;
        b=YO0HzYi0XiB+uHfK8aGDQJbdGL2KjOS3sohCs+0SDDM6cvKL8Erhy0tYwS2/EETFNs
         /gE/yX3iQohZh0VI7tHAOmBfCYqcUZa4nsf9f76QgJchILxS9niHv1CnXV5Q9m+bHoyK
         4wldvBA1SXCvSD13L0rk0llgGC9ytI5cZBerk1NMfx2iGkZCaya350+pd1qjbeBUXGOm
         r9r/dkV2uolZtcbox0IVrq5EzXkmuHjraawyLqzKs15sNDNfcZzUAqGO0Wf8OL7wnYXr
         3DLN/J2uHrbmB6mBxN3vhtN1XUr+3afklgDucPzeshRJIvGy0jWO1RV6m2thpG4FiVqo
         I9cg==
X-Gm-Message-State: AOJu0YwN1QWTvfuPSUDpOMBEvwoSoUY8USy6DyVMhzAWLQlouiu/QjTv
	qsuCUWFFgNrAI/HEY8J4aYVyoetvdr+IZl/XNw6zaQ==
X-Google-Smtp-Source: AGHT+IED2Ly4+y2WT66WMkUIU7qKftUG+xMNqKoJ7MinlsMHH0j1IJVgE0xbZn7OOFcOR4mUH90tJAV6k1Y1fSGSX90=
X-Received: by 2002:a05:600c:2181:b0:3fe:45e7:1d6f with SMTP id
 e1-20020a05600c218100b003fe45e71d6fmr2676148wme.21.1691692980051; Thu, 10 Aug
 2023 11:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202308091820.0dPY7D6f-lkp@intel.com> <ZNN1WdZ5J/e5OPAt@elver.google.com>
 <CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com>
 <CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com> <20230810100202.93059f4ba94e4400e9a63b39@linux-foundation.org>
In-Reply-To: <20230810100202.93059f4ba94e4400e9a63b39@linux-foundation.org>
From: Marco Elver <elver@google.com>
Date: Thu, 10 Aug 2023 20:42:23 +0200
Message-ID: <CANpmjNMDMmmbgvkHqDRurBmkdyMENDejfg+Vp+VHoO_Maaap0w@mail.gmail.com>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this target
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Aug 2023 at 19:02, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 9 Aug 2023 18:00:32 +0200 Marco Elver <elver@google.com> wrote:
>
> > Andrew, please shout if you'd rather have them as fix patches.
>
> I grabbed it, thanks.

Thanks! This should help with more -next testing. But as a heads up,
there will be a v4, which includes this but also because of the
Kconfig renaming that Kees asked for. I intend to send it by EOD
tomorrow.

Thanks,
-- Marco
