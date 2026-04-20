Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDF63A1694
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690520; cv=none; b=M0HSRNsE9eX/aSwXynyjtD70ZtKSM73HgzaANfuZLZlEvTHxjN7ELr46KtW5kU2HpH29Eoxs6JAS13HHn4vMPspVPojniVMBS2tzRZPjMvmsJV2lfBakC9ONGQaM2Y+/t/9ZfliK7zcIDFBl2wiz738p7XFzAzrkxibTf97KLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690520; c=relaxed/simple;
	bh=WfdVss5pRtKxRJBglQrxBTFvd3jpqaaHpT5PTY30qcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYaX4Z/5O55IleJztmnOXIfoQSF03vmcx1g75UOv4wsBQ0L2c52ZyMPbGJSQo5BzHc7oVZt+AJA2zo4gOeRmZB/nvQ4dVl6ZoZcHQ7463bqIzTVWbtNhDCoGAzI+b1667f5S4FvgSwdJimDoyJJjiZw8VexbWjbLUm5o4PCerTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lmnh8ME4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lmnh8ME4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48909558b3aso20595495e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776690517; x=1777295317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2wEN4jEMCOiQ0Wb/rEfzmY335o62y1i/d8QKlDPNvdc=;
        b=Lmnh8ME4RCPjYT3j74WEHnV68rK+Ro0xMUEaQPH5UI3IBhivUGsaxHBo4YjUmEiXQ4
         osf+tEF29Vlvkv6HZbQCBXnUZJTUkhnY1bkOrEhYzKNBnYABRw5vrZKGdUuFc5/8dLBr
         Bm4dnNKdCLggEHSUAdhIF5VoE2r4se8oXJefmLIMU5gEgeI5Jouh2VnqsYAHf8/12ZU9
         m6RdA3IuNWDFHgSSosNR6muCjbLHE4FE3JsZjXhAfoR5u0N48uHZoKv5wkOI5YPfxZWT
         IdpqWu3f76KxjAT4K9Z2u1FSpimaDsgQAy5NkXzztEkQ/i4hOxnEiM9FbM1qnln+x779
         /p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776690517; x=1777295317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wEN4jEMCOiQ0Wb/rEfzmY335o62y1i/d8QKlDPNvdc=;
        b=osZfiHETdSyIxma6rW81tlaGiqp/EnfkXQ9qej7zmHrYmvWqPuGrqyITVqQV4ry+Kx
         z/7Ldd+5f5XoLWq5+AeTaAqzSpn9s/Pbq04LmTHHWHdepwqZ1v6flMAuHjAhGHYlE1Dr
         JvX/QkPbpFtMsPMjg57499+K5hyxZnL4Jp706C/qvAIIoGhp1a9q5tzFQiPAZoLeQC8U
         31l+R/td46T/zetEOaWuYGnbqvbHRkTh9rJE6nP+ifqo0OSwaAkikCdPCVHxSqogBdIZ
         Kiw3LFQ0U797ALJZEO07VZKpmNAlHgULRHCA/xwazT7mmkGHkELOwcoV+vG4/JSVE/35
         y6bw==
X-Forwarded-Encrypted: i=1; AFNElJ/W65RKs4Ekjj7ojBEV0HphCxLXSgvjuYPdtD89UyHmubqOjXzfLdyjI+9nYgskirnQp0VppQ1zAIztPuOC@lists.linux.dev
X-Gm-Message-State: AOJu0YwuNQ9Vgd0KLGuWLlRKWaLCl7JcE91HWTBl6B+/HVx+qne3OPgg
	pLT7jKZBtbItwzMNF3dDumRRjhxA2csvAEYNM3Wr+LjBYe19WOZBYQuH
X-Gm-Gg: AeBDiesKYuTRUqToT63ige/wgSFd5WNJ+QzRausTXrkmH0+kZmCSJSg5r0TodQAK8XZ
	0/r16qNuEMxmlMDImYG2z+xkf54walxn5gGs3Wkmr6GsOhDOtK0TACaskD3oNaXUBErHPgEMjTJ
	1UWtfIWInR4EZegD93Btwd+mli/J0UB1ngIXxZ/P/kSbxp5X9s4FMQ/hPzcRU7sz+jOrq6squ0o
	x3+f9lsSQitcUTfqr2RLcPRnxR/T7r1fNxg0FvcJ0gY0rmSSbJD2AOet6dRWqpM+ZJMOowvhCST
	cs2kuJG2w0w0fzopHOT76m1Y35xuaHtHaKX3Ax+mktuUSqPELp5c/nZUoZv0Rgu1EpkNFgBRzGX
	GRSscl55Tw8jf/I6KVIMKNQ6K5+sdLrkqM2z5WNg9wTcsWllcLTwWiUvkk/QXCYVJQGiOEhHw4j
	e9H7N6bvT2iTvIOFrBBn/pFiFJPUXwNFuB5bFkxX037QZPluUd2fkCNm2M6E8jsZ8BoyZNik8+H
	szU
X-Received: by 2002:a05:600c:c09c:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48a53638e07mr5220075e9.22.1776690517192;
        Mon, 20 Apr 2026 06:08:37 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm21505945e9.13.2026.04.20.06.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:08:36 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:08:35 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, lkp@intel.com,
	martin.lau@linux.dev, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v4 4/6] selftests/bpf: add icmp_send_unreach
 kfunc tests
Message-ID: <aeYlU9r1ZyQ7rcgs@gmail.com>
References: <20260420105816.72168-5-mahe.tardy@gmail.com>
 <4cfe307cc6b1197fc7bb3a11e79382764ac1d269a42eb4e4ffec9e991e6868e6@mail.kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfe307cc6b1197fc7bb3a11e79382764ac1d269a42eb4e4ffec9e991e6868e6@mail.kernel.org>

On Mon, Apr 20, 2026 at 11:36:13AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
> > new file mode 100644
> > index 000000000000..24d5e01cfe80
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_unreach_kfunc.c
> > @@ -0,0 +1,136 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +#include <test_progs.h>
> > +#include <network_helpers.h>
> > +#include <linux/errqueue.h>
> > +#include "icmp_send_unreach.skel.h"
> > +
> > +#define TIMEOUT_MS 1000
> > +#define SRV_PORT 54321
> > +
> > +#define ICMP_DEST_UNREACH 3
> > +
> > +#define ICMP_FRAG_NEEDED 4
> > +#define NR_ICMP_UNREACH 15
> 
> Jordan Rife previously suggested in v3 that these ICMP constants should be
> imported from <linux/icmp.h> rather than redefined here. Would it be cleaner
> to include the header and avoid the redefinitions?

Yes it would be cleaner, but looks like I can't do it simply, maybe
there's a solution, see the answer from the cover-letter:

to Jordan: I couldn't include <linux/icmp.h> because of redefines from
<network_helpers.h>.

> 
> Reference: https://lore.kernel.org/bpf/usz5bhydsiejr37owgt3zypckzh7fa7ygmhsyaaiprsljx7iy5@ipopnr5n4ds7/
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24663313503

