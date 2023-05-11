Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9A174F0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 22:21:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1aaea43def7so64261835ad.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683843662; x=1686435662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wlwojL1oOxSkE9A9E+XKPYHRgPZOzZBvK0faNul9WI=;
        b=Woh7eW/zLezx+tGcvpmJSrs1YDJCJJCMZAs0advUs5dvcXKQhCet0bdYHjzQ/SQjkG
         MIWaOCgflPc12/F/qzYLnCLtIDDOQeRiGCUq40AjjV43BNkTyHYjlFZIqFrRDescw19g
         wuiOK5rRib4rMTT3f73c0+QQGJqRmqPryqZTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683843662; x=1686435662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wlwojL1oOxSkE9A9E+XKPYHRgPZOzZBvK0faNul9WI=;
        b=bcGOFNUGbfimPBaw8OE3MFfsKCWkXaYR+8V3wCqKAITkplxm2qESmhUg5RhkH+f5Bl
         FLu5Feywq2dysb8nSdZ+CIXmcsbUhGDKDZRAqImBk7nClyJNcf/bhUWXjr2V1HI0F5mq
         udsvwaPEOzoNIwNsRP8oUb+6dJX7JH6cj3D8cBN9TGovODHZ5fTqHWL/LK0phodR1yGj
         NIqeHUW67/z2ALM6N/biwaw9gf0QkpPjIe3E7odTUDCqFdQpiaOJ6BaR/XqFQu68VeEP
         8Pod2GPNh/8oqKvCEMX4YzL4Sr5euNMMGXa7fqdpFhFJzi1K6pXlfrpEjcORNnKAtjOQ
         2e7g==
X-Gm-Message-State: AC+VfDw59izCR0keFVunLgVw1yhpIjMQlZavwXEEgYEbn2r3QOL7M+Hw
	7RLbwYoU+GXmpCRg9EVlBuxNaA==
X-Google-Smtp-Source: ACHHUZ5gx/nQTd7MJcU+6HgrvcbdkMWHr+5/LzInvYhhOp0ogFqj0xEE1dO9byBVj8rTrR2lt8KXKg==
X-Received: by 2002:a17:902:a609:b0:1ac:946e:4690 with SMTP id u9-20020a170902a60900b001ac946e4690mr11358838plq.49.1683843662240;
        Thu, 11 May 2023 15:21:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090ad24300b0024e47fbe731sm16068073pjw.24.2023.05.11.15.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:21:01 -0700 (PDT)
Date: Thu, 11 May 2023 15:21:01 -0700
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [stable:linux-5.15.y 36/9999] arch/s390/kernel/vtime.c:132:2:
 error: expected absolute expression
Message-ID: <202305111519.04845F7@keescook>
References: <202305111705.8j4cTm2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305111705.8j4cTm2s-lkp@intel.com>

On Thu, May 11, 2023 at 05:14:16PM +0800, kernel test robot wrote:
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
> head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
> commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
> [...]
> >> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives does not support instructions blocks > 254 bytes
>            alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
>            ^

Thanks for the report! I don't think the new errors are related to this
removal, though. This patch was just disabling a potential build config.

-Kees

-- 
Kees Cook
