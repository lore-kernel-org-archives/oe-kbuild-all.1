Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F245386575
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169888; cv=pass; b=nXIF3rqchSxjD390uGLCTzgp5Zllvpv8jQpC9YAjhbsujGuZFWhQ/vFFsBQQzjl0EFG8wEwaAdZJZFbkqg4SoEYmiisTKCMjQ6zGVDx+SCuGFLLIYV2yI55vTdVL27zhobvfCuiPVFX/9Y2NyV9ZO7hc16865Xdiy9fYXC++JpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169888; c=relaxed/simple;
	bh=ptpjUzlQRW1tacZ47KxbrmuVX9kEVKwX3KItC4VS0co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGoZyVvtfk/TxIZfVJ9+xAj9xsHVp3ghkYneB1fhwFMdDfp5o4wbMfxHlGuxUTb8RbIT1FtiesYp+Vc7ikWpEcYFkwtDo1svI4CYzdgSzkLw6t8Wmkub+RxTOQtsoFRF3B/bQxK35+V0xPiGfeIY7vhuR4ZIMzTOcH+UQyI6LQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mgZ4iPOl; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mgZ4iPOl"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13807d2f898so7216139c88.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 02:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781169886; cv=none;
        d=google.com; s=arc-20240605;
        b=ldz2NeoAyHnPQNTrPVf5qPsBL8JVkT5Z7diamtEwxFfg3VbWxXMfe7KcHNhA39breU
         oB5c+POgLt/AYkqTc6eXXQd6ZSi3fLbs7Sy/BBLZA0/WEWa6ue9XEzLkjlMycgYMOe4M
         wmTpeaBccyAjkHMLSWJIvpMgZRN/uS8vOCtyZtk8WY8i+ZUEUQi7/gZvbbSTwYXg5qMC
         EMhdVDa6pR1QI1zmJdgxW5aVH40DVGIV9BMDyRPB3w1IoPxVjgJoKC34M5/d6hzS2UTG
         CUUx3EIfQ3ztrfi8Ku2+y75YkL5//Q8dnUjfpknsi5pAA06Pd9XL1lr/bmWNwWa6CVoX
         RB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jxNaQG6Oi1Xty0lZOZ4/NPsjnTXhNNGyA26nZBNmjac=;
        fh=005lzH03Y5bAG3EyYD5/E8ItpWs6/Vkv/MsXofzpXh4=;
        b=iHGnQFuLTYzdYIB6ac/b1mJH6H3e7efaGrvm5qYtYZPuGcNxR+KuhoxvaxxFxbv8Y6
         Vzx+uHhQqnedFFzoIMV9CSnIdPcyPZy8T6cK+x/xC4YsgYZUNr00Ao/d+329tQJ1RBHa
         d/zJ2EMZ2iqFqEmgIR90hvudYZdiidFaIIAxY4d3FrqWcBvytix/4VwZtj59sxIBl2sk
         5P7gRFpMfZlA0RW8e1IkDgRtVtHVAW+RNN9H2eK6+9jsIzEbulVbDImKrjyyC4iaN36Y
         0UJbhlYEbkWA4K5GjahXK547lxkj3TkYUZGWjmV9EGxmFb6LTf0DFzNQyW+xlOQ9+hQK
         apOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781169886; x=1781774686; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxNaQG6Oi1Xty0lZOZ4/NPsjnTXhNNGyA26nZBNmjac=;
        b=mgZ4iPOlzGeot9PinNJnh6lA73cJ5I+Fcipvd7AyixavbipH6B1NTGBgs+TDRV9tKl
         oPFD+uNvBZlRDd9PcSk6E5LjFa+dS783Nl7Ida2IStSlw1DZKRh3M0AbSXCulCNepCB1
         WbLxIg1Tf/umIWNrlPP+ifkjjbtdpn0N5PwtANAtS4ANEHoYO7fWk9WkaCIwGWDG2AZG
         4kI16SaCphzoI+/Aw6066qWOZRze2xiAwGDxhRAhdnNh476CvgsdmB2X4uniiIGoatom
         ad/ljoSTjG30F9Wk7F7ZCWKiu5/KHVlQupzjrzf3Db3W6yXtlCtdNH0D+pRvHyaWcA5w
         ksLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781169886; x=1781774686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxNaQG6Oi1Xty0lZOZ4/NPsjnTXhNNGyA26nZBNmjac=;
        b=Ml54goHlhlN2w33QTl1HiCHPbCCgIU28A0qjZZHJFwlrXgd+0MsxkyqoCv2Hdd5kZ2
         F6B0VMRcavkKcvI4SEICH2T1ALQ0V4J46epFM6tQ8oDDerw2V072RUiYQzUX3ousd3TG
         FlGrIH8TN46a8Fz+3LnhHk658McdzxWUPlJ1SJX/dPvnknR5cGJse0DLUN4LSSm523H2
         lN5bKqzUiQV+LmZ5gnuZ9RjsF/JFPW9BT315YStSoL+FggNnLTD2KmLcJqqPkccyOlon
         n2KoztuV79qrO7l8D+QxEu/MNoiLE8EEBycO17mBNQAbZ49GXF6t5zjLbM6GAu1qhBwP
         FlKA==
X-Forwarded-Encrypted: i=1; AFNElJ+uT+zgbI95jhWIrH5LfkvRlyAsX5YHgqITx8j2UK7njsGW0PXgEDSriAwqy6XQ8X3ET8RM2AyGg4UBAfh3@lists.linux.dev
X-Gm-Message-State: AOJu0YxFINXns55VhWVQ9O2vtEp/7tTek/kttAvJ8VWrg5ElCAufregT
	y9fjTFY6Y+kgIBTB5vis3DM6+0MPjW6GFzkpQPLsux8TDIR2iup2MCJ9AQ8sKgCzrNt6HJdLjYX
	EFN1uCN1nnIDK4V8KNv3KiuBqyps4pj8QGE9Xd6vk
X-Gm-Gg: Acq92OHVXMexsJMh/fVWWdd1eaHqSu+AbBxhbTwXGpT/5XJFUMao23mDpceSogCgJA+
	D6j8ET6xiOeoeJSRjWQdv6mbQ18/oeBLgX4h2VwJolVahgz3Bm8lhRSY/5ZN9hV2GPrgEnPzZoe
	J90zeebC8Au3g1YcuBh27OVWNMcUgkrcSpSCtVrg2l9RBPCuut0A8gbzwP+XALX45Q610E6k5RM
	QFua+yhYIyyeMJLzZ+u3nYXqm/mNwXwscBuIrbTMYOmZ+JV0gmp4w0rI06waZ/qMIkMNVRlpBEH
	v7IZmlEtFDqDOO95Nmv+J/TbgCkX0VncC5s8WafPYzLzw/w=
X-Received: by 2002:a05:7022:1b08:b0:137:1ae1:bc2f with SMTP id
 a92af1059eb24-13842181f98mr1005419c88.13.1781169885639; Thu, 11 Jun 2026
 02:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606110958.2CPRMnM0-lkp@intel.com>
In-Reply-To: <202606110958.2CPRMnM0-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Jun 2026 11:24:09 +0200
X-Gm-Features: AVVi8CfR5bv_cwVh1j_mobE8Sz1NOjQDmqNkwS0WX3LWG1D7btR5qlprUv15XLU
Message-ID: <CANpmjNOZ_11Ef0qYnagaDshHoYy4=cUOQBsd+0DPJyJt02pWnQ@mail.gmail.com>
Subject: Re: [linux-next:master 4283/12670] drivers/dma/sun6i-dma.c:792
 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, "Harry Yoo (Oracle)" <harry@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>
Content-Type: text/plain; charset="UTF-8"

+cc maintainers of this driver

On Thu, 11 Jun 2026 at 10:59, Dan Carpenter <error27@gmail.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   49e02880ec0a8c378e811bc9d85da188d7c6204c
> commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4283/12670] slab: support for compiler-assisted type-based slab cache partitioning
> config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606110958.2CPRMnM0-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202606110958.2CPRMnM0-lkp@intel.com/
>
> smatch warnings:
> drivers/dma/sun6i-dma.c:792 sun6i_dma_prep_slave_sg() error: dereferencing freed memory 'v_lli' (line 793)
> drivers/dma/sun6i-dma.c:873 sun6i_dma_prep_dma_cyclic() error: dereferencing freed memory 'v_lli' (line 874)
>
> vim +/v_lli +792 drivers/dma/sun6i-dma.c
>
> 555859308723d8 Maxime Ripard       2014-07-17  783      dev_dbg(chan2dev(chan), "First: %pad\n", &txd->p_lli);
> 9aa48806edb8c3 Samuel Holland      2022-04-24  784      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24  785           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
> 9aa48806edb8c3 Samuel Holland      2022-04-24  786              sun6i_dma_dump_lli(vchan, v_lli, p_lli);
> 555859308723d8 Maxime Ripard       2014-07-17  787
> 555859308723d8 Maxime Ripard       2014-07-17  788      return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> 555859308723d8 Maxime Ripard       2014-07-17  789
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  790  err_lli_free:
> 9aa48806edb8c3 Samuel Holland      2022-04-24  791      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @792           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>                                                                                                 ^^^^^^^^^^^^^^^^^
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @793              dma_pool_free(sdev->pool, v_lli, p_lli);
>                                                                                           ^^^^^
> freed and then dereferenced to get the next block.
>
> 4fbd804e009ae9 Maxime Ripard       2014-07-30  794      kfree(txd);
> 555859308723d8 Maxime Ripard       2014-07-17  795      return NULL;
> 555859308723d8 Maxime Ripard       2014-07-17  796  }
> 555859308723d8 Maxime Ripard       2014-07-17  797
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  798  static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  799                                      struct dma_chan *chan,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  800                                      dma_addr_t buf_addr,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  801                                      size_t buf_len,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  802                                      size_t period_len,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  803                                      enum dma_transfer_direction dir,
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  804                                      unsigned long flags)
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  805  {
>
> [ snip ]
>
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  868
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  869      return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  870
> a90e173f3faf29 Jean-Francois Moine 2016-04-28  871  err_lli_free:
> 9aa48806edb8c3 Samuel Holland      2022-04-24  872      for (p_lli = txd->p_lli, v_lli = txd->v_lli; v_lli;
> 9aa48806edb8c3 Samuel Holland      2022-04-24 @873           p_lli = v_lli->p_lli_next, v_lli = v_lli->v_lli_next)
>                                                                                                 ^^^^^^^^^^^^^^^^^
> Same.

Not sure what's going on here, but is this a latent bug in this
driver?  It appears some recent changes made Smatch see through this
better.
