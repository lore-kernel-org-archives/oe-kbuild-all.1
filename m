Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2642219E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 18:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293955; cv=none; b=PWbGTR7XM37EpXM2KrDo3gg9DXaReuJy2wMtMo2HhHoik3dWxPUnEk54odwuocAx1PKtggCODMxyGTlDk5aq4rtsBw98TuZNSzkRz2s2Ud/6zg6oG2AiuiKXsjSwcocYzoLRUxvyzWH5mKFU4R3fPJUeLJmcU78xIvblRO3vqHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293955; c=relaxed/simple;
	bh=/ynplVXB9D0lQMrwvL0RYA2GAwgK3HJc6DTbfKf3ZOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Etf4H5g6lFk8u5kufh7VJckb1JBzc8fz0WqRDCQKJm5WjiWM32GJLaklu2EAoaF3fxjbD0lcTXTOWnJsd1oXcDM7M2OMgS2Li/7+LNw5BaccdqH8n/6FcurLQafzlr5BeC9RdhN3VjfevQE+7s6HfFMBnpffP8IZdFyDeCTq8oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CoF25UR1; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CoF25UR1"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d3907ff128so614358a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 10:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706293953; x=1706898753; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MsKZ2dis8esREWVtzGB6O1bHoRc80ZxuQCGL9DFhV1A=;
        b=CoF25UR1f03J3ZBeWxrndvv3aM6025in5dkNCuTru+NKja5ZRhvwNWAIZZXQd+DOhy
         uxIaZpvDL5mi4yAmAu7BPC1HutPkoKpQdEoUV7gX9Znh2JzgbxrFGjtNeHlYnVuC1XuC
         2I8JFFlVyOGINFR8KxGZm3uekCwwpY6Nz3a9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293953; x=1706898753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MsKZ2dis8esREWVtzGB6O1bHoRc80ZxuQCGL9DFhV1A=;
        b=nAhbOjeUv+FvdluuivJwzjApk/9xvg42yvvRaKRWwV3BRS8sELjjr+jzaeXxZM7eWO
         KCecrX3aBD/p4JcWD0DLx3nY837dZ4NxsZ4XwwSDrvbnw0LXOI7syCu8NUMB/LIUhXT2
         CPzdJoQ7j9oTnrn/FrajiZjudAt2brlvqgObK/MQ3+5wtPOfDS0BGZgEHvEBexXoYxnd
         eKFJ4JbORT+U297OoBqMELd9F1lmNwKvvoAaSMG9p6JNO0TG4Tl5x9rsboeeQ3ENY+K0
         Fct8wLJlQ+cqZMRq6IU2Q4n/ALT6h4WwD4rqgj06IkpgvSifEcHRQkrGaeIOjf0XQYfX
         Lqnw==
X-Gm-Message-State: AOJu0YzgvP4Kb9mmR5MtD+v2bQEm0c3s0aWjlo0gkNIN0XfqifyDIdNV
	Mr6pEkmxFpIaB/BM55wozjo8BiSXfrSNp5P7MlKVDIBSvlcnM1OaKIuqlbQ+iA==
X-Google-Smtp-Source: AGHT+IExgcr4m0TzXBmfFWqyUOb/swwx7h0U0yqAEpY5BnVZRnHIBiQJtLKfdkzs1jRJv+NNMInnVw==
X-Received: by 2002:a05:6a20:4028:b0:19c:863a:acc6 with SMTP id z40-20020a056a20402800b0019c863aacc6mr119399pze.82.1706293953315;
        Fri, 26 Jan 2024 10:32:33 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o15-20020a63e34f000000b005c2420fb198sm1423576pgj.37.2024.01.26.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:32:32 -0800 (PST)
Date: Fri, 26 Jan 2024 10:32:32 -0800
From: Kees Cook <keescook@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [kees:for-next/hardening 2/2] drivers/misc/lkdtm/bugs.c:302:1:
 warning: 'noreturn' function does return
Message-ID: <202401261032.562F4D7@keescook>
References: <202401262204.wUFKRYZF-lkp@intel.com>
 <CAD=FV=Uc8dPrc++jC=toV+7Tg1VtpFMxBfmTKmg9TEzif1z1CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Uc8dPrc++jC=toV+7Tg1VtpFMxBfmTKmg9TEzif1z1CQ@mail.gmail.com>

On Fri, Jan 26, 2024 at 07:58:46AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 26, 2024 at 6:56 AM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
> > head:   edb6538da3df83806fffcfc1b873d0895c81b9e8
> > commit: edb6538da3df83806fffcfc1b873d0895c81b9e8 [2/2] lkdtm/bugs: Adjust lkdtm_HUNG_TASK() to avoid tail call optimization
> > config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240126/202401262204.wUFKRYZF-lkp@intel.com/config)
> > compiler: mips-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262204.wUFKRYZF-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401262204.wUFKRYZF-lkp@intel.com/
> >
> > All error/warnings (new ones prefixed by >>):
> >
> >    arch/mips/kernel/head.o: in function `__kernel_entry':
> > >> (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
> >    arch/mips/kernel/head.o: in function `smp_bootstrap':
> > >> (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
> >    init/main.o: in function `set_reset_devices':
> >    main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 against `_mcount'
> >    main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
> >    init/main.o: in function `debug_kernel':
> >    main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 against `_mcount'
> >    main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
> >    init/main.o: in function `quiet_kernel':
> >    main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 against `_mcount'
> >    main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
> >    init/main.o: in function `warn_bootconfig':
> >    main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 against `_mcount'
> >    main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
> >    init/main.o: in function `init_setup':
> >    main.c:(.init.text+0x108): additional relocation overflows omitted from the output
> > --
> >    drivers/misc/lkdtm/bugs.c: In function 'lkdtm_HUNG_TASK':
> > >> drivers/misc/lkdtm/bugs.c:302:1: warning: 'noreturn' function does return
> >      302 | }
> >          | ^
> >
> >
> > vim +/noreturn +302 drivers/misc/lkdtm/bugs.c
> >
> > 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  296
> > edb6538da3df83 drivers/misc/lkdtm/bugs.c Douglas Anderson 2024-01-22  297  static void __noreturn lkdtm_HUNG_TASK(void)
> > 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  298  {
> > 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  299       set_current_state(TASK_UNINTERRUPTIBLE);
> > 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  300       schedule();
> > edb6538da3df83 drivers/misc/lkdtm/bugs.c Douglas Anderson 2024-01-22  301       BUG_ON(1);
> > 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26 @302  }
> 
> Ah, I see the problem. MIPS has its own BUG_ON that's an inline
> function instead of a macro and that means that the compiler can't
> figure out that my constant condition will always call BUG(). ...this
> should just be changed to BUG().
> 
> Patch fixing this at:
> 
> https://lore.kernel.org/r/20240126072852.1.Ib065e528a8620474a72f15baa2feead1f3d89865@changeid

Thanks for tracking this down! :)

-- 
Kees Cook
