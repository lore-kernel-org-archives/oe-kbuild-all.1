Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99061D531
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706284743; cv=none; b=MngrrUuUobDvtfglzJwMLmE8jpVaYTo4KMgiCF65vQY9iWqn3u7MzAfE+XGwSzEKQa3CTXYVGakkFADkoIUNGKR8yMlPWPy3dzV2U1OA5QsH7zdIpG0PXRPlkToGXLg47CR/ENRqSW4jp7c4ZfgD7cHXTPpPt+eQijlTdiW6DnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706284743; c=relaxed/simple;
	bh=OslJcJ9cN5hUT1LgDnzf+krL4XBWMYjA6yiQtNBy/6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oJvUEYXkOCErJVOEMiPqlqPfsDCUIZz9PZY9Md9gTvCrHvHHBQcSmKAgSu4fzjq12gj/JjeDIPAi40fiKKQHfP6fUN3ks2pInAZSkzeLwAG25LBggyI41E4pI0AUcag01mhA2u/k0X7ReAFeEzTeFHfnQ1dWCxsF2bTRUMbAzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R9fs+H+W; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R9fs+H+W"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso15718255e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706284739; x=1706889539; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8gmuD8rLdg+AeBD7EliGJYESPLQVe3NmRJVANn2G78=;
        b=R9fs+H+WexhC9Yw58KUKJ5TFCq2fo9uF6kcheT/oPNPv0v7L0YKVwnOVM7bZ39/hWe
         V0BPZGlfaQkWoDQHQm0XKbXg+YeWxN37urILMUgu1YRXE5G1g84IsZ139Q/A4RSK4zYE
         IUk7oAFVbDw0YBRLaNpAzTy5VzpUyvYt2mYZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706284739; x=1706889539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8gmuD8rLdg+AeBD7EliGJYESPLQVe3NmRJVANn2G78=;
        b=UARqfIuKt7ZVMho8qGXHEpYtW+eWwXEjFNte8gWj1vBoYzlG40uumPPKs2l0lXbQru
         6yc434XRkQ5rtDBWznh186/NttrUXs4MFKn/vXd3hMvdeyOE+p2HJByA0UH9h8f/eC3T
         G3OPneT4Hkwtr0Pyj6jPUuU7/M5FgrDoRvCoGyF0qKj+atQMS4LvNBPvhOIyOsVasQgw
         xz5MV/9P4FuEeuHY6uTNldXw0IIzzYZkJrfsm3Gte7BcL6n3JRcCJsWarombLe0r6+OZ
         Y3EI0TqKFEpHIEfC3C12qF1Iv06Dzgj5tgyXOqgCNhVk5ZF0hGXrLmME8U2vsU5ZJJpq
         Jmsg==
X-Gm-Message-State: AOJu0YyzL2pbzMmMzFGrtSwi8nBPzEdiAYkxnWWZHNELCROMG9+l2N/w
	g8S/5XYsTIQmVdmt0eDHb/qa6fN+QEN/v4ficDg1EtD+W4grPrcPdwCuk6Kl5hDCY9/ZjLIcqIE
	DM+wn
X-Google-Smtp-Source: AGHT+IFuwDk4Or852vWiKPeBN0mRuMuNcfhlURV7mccIz8ILzsPqmPbcf3Q6eLptXG73NPH9Jfa4uw==
X-Received: by 2002:a05:600c:524d:b0:40e:c32f:958c with SMTP id fc13-20020a05600c524d00b0040ec32f958cmr3207wmb.64.1706284739380;
        Fri, 26 Jan 2024 07:58:59 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id my28-20020a1709065a5c00b00a28fa7838a1sm777239ejc.172.2024.01.26.07.58.58
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 07:58:58 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40eb95cbe52so24935e9.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 07:58:58 -0800 (PST)
X-Received: by 2002:a05:600c:510f:b0:40d:87df:92ca with SMTP id
 o15-20020a05600c510f00b0040d87df92camr141511wms.3.1706284738537; Fri, 26 Jan
 2024 07:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401262204.wUFKRYZF-lkp@intel.com>
In-Reply-To: <202401262204.wUFKRYZF-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Jan 2024 07:58:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uc8dPrc++jC=toV+7Tg1VtpFMxBfmTKmg9TEzif1z1CQ@mail.gmail.com>
Message-ID: <CAD=FV=Uc8dPrc++jC=toV+7Tg1VtpFMxBfmTKmg9TEzif1z1CQ@mail.gmail.com>
Subject: Re: [kees:for-next/hardening 2/2] drivers/misc/lkdtm/bugs.c:302:1:
 warning: 'noreturn' function does return
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 26, 2024 at 6:56=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git fo=
r-next/hardening
> head:   edb6538da3df83806fffcfc1b873d0895c81b9e8
> commit: edb6538da3df83806fffcfc1b873d0895c81b9e8 [2/2] lkdtm/bugs: Adjust=
 lkdtm_HUNG_TASK() to avoid tail call optimization
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/202401=
26/202401262204.wUFKRYZF-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240126/202401262204.wUFKRYZF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401262204.wUFKRYZF-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    arch/mips/kernel/head.o: in function `__kernel_entry':
> >> (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_en=
try'
>    arch/mips/kernel/head.o: in function `smp_bootstrap':
> >> (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `star=
t_secondary'
>    init/main.o: in function `set_reset_devices':
>    main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 again=
st `_mcount'
>    main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 again=
st `__sanitizer_cov_trace_pc'
>    init/main.o: in function `debug_kernel':
>    main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 again=
st `_mcount'
>    main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 again=
st `__sanitizer_cov_trace_pc'
>    init/main.o: in function `quiet_kernel':
>    main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 again=
st `_mcount'
>    main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 again=
st `__sanitizer_cov_trace_pc'
>    init/main.o: in function `warn_bootconfig':
>    main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 again=
st `_mcount'
>    main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 again=
st `__sanitizer_cov_trace_pc'
>    init/main.o: in function `init_setup':
>    main.c:(.init.text+0x108): additional relocation overflows omitted fro=
m the output
> --
>    drivers/misc/lkdtm/bugs.c: In function 'lkdtm_HUNG_TASK':
> >> drivers/misc/lkdtm/bugs.c:302:1: warning: 'noreturn' function does ret=
urn
>      302 | }
>          | ^
>
>
> vim +/noreturn +302 drivers/misc/lkdtm/bugs.c
>
> 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  296
> edb6538da3df83 drivers/misc/lkdtm/bugs.c Douglas Anderson 2024-01-22  297=
  static void __noreturn lkdtm_HUNG_TASK(void)
> 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  298=
  {
> 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  299=
       set_current_state(TASK_UNINTERRUPTIBLE);
> 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26  300=
       schedule();
> edb6538da3df83 drivers/misc/lkdtm/bugs.c Douglas Anderson 2024-01-22  301=
       BUG_ON(1);
> 00f496c416122e drivers/misc/lkdtm_bugs.c Kees Cook        2016-06-26 @302=
  }

Ah, I see the problem. MIPS has its own BUG_ON that's an inline
function instead of a macro and that means that the compiler can't
figure out that my constant condition will always call BUG(). ...this
should just be changed to BUG().

Patch fixing this at:

https://lore.kernel.org/r/20240126072852.1.Ib065e528a8620474a72f15baa2feead=
1f3d89865@changeid
