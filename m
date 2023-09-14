Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151E68F40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 14:16:51 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso891835f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694701010; x=1695305810; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2kB3K2UJ4g8w/oEGmp+zgtYqt7DRAr5lRj6AMn1pyY=;
        b=I4s1rd2PNqHHkpMmytWPmZL141dkvR7jZrKnxAmqSSr3XBLRyPKtvT+DCRFlvzCfOt
         nHqiAd/3mUl2mPk8f+bd6q7ysOpLCsgL+Eu7HVV8/WeHzKH1KLF+7geg1RCdqV4llxFy
         ojLx87MULHQfqInEnj76zpSLpSuy5ItY17TXIQK8PgtGPZUKUhaDCoce+itUG45uDtok
         zQpbgQNEYMEEh/v8SeAqB97w1Uk3BDQpFqYx1sSeATnb+//nbMbhr4Z4C2ujJnHjgcr9
         F4Sol5m9CxjVEYdAisWCgURBzob0noyCgM4aosaQp8BqpoBDY4RnXTQuiHiGwQFiIo5B
         K3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694701010; x=1695305810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2kB3K2UJ4g8w/oEGmp+zgtYqt7DRAr5lRj6AMn1pyY=;
        b=W0PTs2chfOYr63waaJSj+5CnVCc+md+m+ni1efTc8Cmq4HDWE+HOoazr9jBleMePU/
         kcl5Vr5Rh/AoY6ItOhILX5AjDwzVkFvZpI3YcoDkcqZkuE27BQDZcgM6Hk37Q3tqiL9G
         d/maQWA6pqmgGGXq8dQeBFa/qyoZDKsdICueY4TXOAu4qTmu45wS5WrzLxp9NnkrRu8o
         xBA/VOYdnHnvXR3CYgkg6fyzXH6aE1mDYRpfxnt/kwm1bmK3hpNL2vKyDCDorid7/rOH
         8m5DBvBs2wW4cpc5ZV8wfhCB7Afawu3HnOTxocoz+k8vO2q2dqvISMVo6XA/xlvcGjfW
         J5pA==
X-Gm-Message-State: AOJu0YzehKqGKOnDsjqG7lqjWmRupuCjF3KhPgipgcQeqF8sHpEPkncu
	MQfw+2ebuEmRvTlSxbnE5Pk=
X-Google-Smtp-Source: AGHT+IGX+qWfRKpSfsJR0HeKvM9FR6IfWa+a/g5/HteSVFNj9/AAHq4VQZwDAuuBJxpAAAwoSp3X8g==
X-Received: by 2002:a05:6000:68a:b0:31f:d5db:a13 with SMTP id bo10-20020a056000068a00b0031fd5db0a13mr2302589wrb.61.1694701009817;
        Thu, 14 Sep 2023 07:16:49 -0700 (PDT)
Received: from gmail.com (1F2EF048.nat.pool.telekom.hu. [31.46.240.72])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c0b5500b003fbe791a0e8sm2127131wmr.0.2023.09.14.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:16:49 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Thu, 14 Sep 2023 16:16:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Huang, Kai" <kai.huang@intel.com>, lkp <lkp@intel.com>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [tip:x86/tdx 8/12] vmlinux.o: warning: objtool:
 __tdx_hypercall+0x128: __tdx_hypercall_failed() is missing a __noreturn
 annotation
Message-ID: <ZQMVz/wepyo9rlhE@gmail.com>
References: <202309140828.9RdmlH2Z-lkp@intel.com>
 <90f0a4d44704f9c296f3a4d8b72c57f2916aa09d.camel@intel.com>
 <377b1ce2ecd390f4b6f8cdf68d22c708f7cef6d1.camel@intel.com>
 <20230914072959.GC16631@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914072959.GC16631@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> > It appears the __noreturn must be annotated to the function declaration 
> > but not the function body.  I'll send out the fix as soon as I confirm 
> > the fix with LKP.
> 
> FWIW, the reason being that...
> 
> The point of noreturn is that the caller should know to stop generating 
> code. For that the declaration needs the attribute, because call sites 
> typically do not have access to the function definition in C.

BTW., arguably shouldn't the compiler generate a warning to begin with, 
when it encounters a noreturn function definition whose prototype doesn't 
have the attribute?

Thanks,

	Ingo
