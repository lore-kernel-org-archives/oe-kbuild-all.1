Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E443786E;
	Tue, 21 Jul 2026 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620706; cv=none; b=gMdPenkhazDkL/eybd3PSwQrT5UvyeG6oWrsh2lIbci61O4CbyaS2eY6AxmYHdZm8Z2e6g7sXhOyApWSPnB/6UX42cl+id1VVZ45oo92TCsGQOmBK3pmWuZTyspRUIGtii44b31ksZRfjtqx5Of8Xk6bUtUKAzCUPD9/LFaCr8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620706; c=relaxed/simple;
	bh=V2YeJl86oEm2parTHajOqFzDyj5meMmJ+Cp3atonFow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ixm60UbmeaVtse5bd7PWJuyCFPZTw/8hFnKZw70fCD6VWSiz0Lsdoa8HNCY9Y16f1DYXMKVdfRnJchlR4fCZt3BT6GekvOo/jP/ovJ/DecU62Fq8OP+IDNhYvAx2S19AibJFjgIm7dQCaEqUVcPajspoueKF1nOtKq/PVM9XPek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIj5pJfc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIj5pJfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3251F1F00AC4;
	Tue, 21 Jul 2026 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620705;
	bh=V2YeJl86oEm2parTHajOqFzDyj5meMmJ+Cp3atonFow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=JIj5pJfcSno5fe/bqF2XWafImOu/44B8sLc4CWm6emb5k3gL+Aqu7p4XM4Z9PZAm4
	 KtpmJPIhTrZ7y0TZOhOvQMORaYz5cQ7wt21bd2z6T8S718AsZqbxl2VDK/GA6XQNAM
	 rdqa/sx4lEVuaHbYEzDF56YbBR2uu5zxomouFLU6zZJQEgOqqCNetnKoUVpOGqLvYG
	 jLzvI1G7WL1pCOYrXDEuhkyTCyzLARxRnwSAwkBgP5NDT7DSWxOULHCGK27UAMuAz/
	 4On9HAJhBuUO93e3moPzwIRgilT9ER9lO2lXVHp0J0A9b+vEE3Yvywzm6MPNeIAlmU
	 113V34CpL+vvw==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, peterz@infradead.org,
 luto@kernel.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Sven
 Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH] entry: Provide stub for syscall_enter_audit() when
 auditing is disabled
In-Reply-To: <688eda6b-c5bd-4745-b45c-7e40ba3e53aa@huawei.com>
References: <20260720094921.537716-1-ruanjinjie@huawei.com>
 <87cxwhn09i.ffs@fw13> <688eda6b-c5bd-4745-b45c-7e40ba3e53aa@huawei.com>
Date: Tue, 21 Jul 2026 09:58:21 +0200
Message-ID: <87mrvklqoy.ffs@fw13>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 21 2026 at 10:47, Jinjie Ruan wrote:
> On 7/20/2026 11:34 PM, Thomas Gleixner wrote:
>
> I will revise it according to this.

I've folded it already into the core/entry branch commit and force
pushed the result.
