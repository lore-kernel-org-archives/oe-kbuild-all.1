Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B52D5950
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 04:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774411362; cv=none; b=P420tpQqCG8SLeCm5wNkITwmK2pFWbR1SJTUIdWN8QfgCM8+utQHws7BM38ksULtG9TmyIlvwbF1If0xxJl/Bas+a2dc2L0tSCfLih89FVLRDdo/HNXJr6iqYY+1QUKNUTElU8BblwQF7YFADBUquenviyQie2MJzVRJRHiuz+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774411362; c=relaxed/simple;
	bh=UAftIg0iP2CTL4GG/cYK3JPqeZRxazTdlKZPm4R/BjY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=c619ugRaZUivlGBz/yX3MZE1mX8gwZLrldjnx6hNQQgZk84riQ+hV2Uegbl0xQNbdJL4OAvAcg6NlwTTnQf92MtqGMhV7Rvofdg+0lYofGQwBJR2+oFbAQwBOKXG5N0/XgS06VRXBFL3iWkSrnEX1njUDD/0SX8jjOPSszQ2rrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mUgovg8O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mUgovg8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB3FC4CEF7;
	Wed, 25 Mar 2026 04:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774411361;
	bh=UAftIg0iP2CTL4GG/cYK3JPqeZRxazTdlKZPm4R/BjY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mUgovg8OO4pY+wWN5GhLHYSuthRryo4Vg5p5G/q/Zzzm2h2i4H6F6brO17xhMnGul
	 zpB6+wcWXGLeJr3/UxJVYxl5Cekya4sXNHgB8+z8UiOhR9zmXnhupb2nhyGCBdvSd2
	 PpiGwT32uVKZ7pf9RW98JjbN2uxq0ceVlJbYoSCY=
Date: Tue, 24 Mar 2026 21:02:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "kernel test robot"
 <lkp@intel.com>, "Kees Cook" <kees@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Dmitry Antipov" <dmantipov@yandex.ru>, oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand" <david@kernel.org>, "Linux Memory Management List"
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 49/110]
 __efistub_cmdline.c:undefined reference to `__efistub___lshrdi3'
Message-Id: <20260324210240.ec7ebca1b16a8fe6ed610f62@linux-foundation.org>
In-Reply-To: <529d4fa6-e163-4b4b-9c51-f9f880492b76@app.fastmail.com>
References: <202603041925.KLKqpK6N-lkp@intel.com>
	<aag95SSwClx4IzJU@ashevche-desk.local>
	<aahAgJ0G1uYSCFnF@ashevche-desk.local>
	<529d4fa6-e163-4b4b-9c51-f9f880492b76@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 04 Mar 2026 16:35:01 +0100 "Ard Biesheuvel" <ardb@kernel.org> wrote:

> Hi Andy,
> 
> On Wed, 4 Mar 2026, at 15:24, Andy Shevchenko wrote:
> > And since it's riscv, adding people from there.
> >
> > It might be that they simply need to include the corresponding library to their
> > architecture builds (we have lib/lshrdi3.c)
> >
> 
> I didn't manage to reproduce this, but if EFI boot on 32-bit RISC-V is really a thing, then doing the below should be sufficient. Alternatively, we might just disable EFI boot on 32-bit RISC-V, as I don't think it is likely to be used by anyone in practice.
> 
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -31,6 +31,7 @@ __efistub___init_text_end     = __init_text_end;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_sysfb_primary_display        = sysfb_primary_display;
>  #endif
> +PROVIDE(__efistub___lshrdi3    = __lshrdi3);
>  

I haven't incorporated this, so the series will still break the build.

Dmitry, can you please test, review and ack this?  Or should I drop the
series and we revisit for the next cycle?

