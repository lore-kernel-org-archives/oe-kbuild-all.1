Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB34260569
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 23:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495767; cv=none; b=mHAhY2G4jr20rhSV1bgDes9O3BSh32yDPL8ogZwvto9asfUhUFBEGZDt6JxdEnnWh/JtusH3tc/zRghc48/4Za7U+4VtwazlfLybHwdPtJCakhA6K56Zz5JkjWOvd+wewCs9DXmb1MGWLp3Esuk4rt55Z373uViB/9FYLBjLQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495767; c=relaxed/simple;
	bh=1qzwV02bV09dOmCeHlRCyTatMjj2+lK51O7j6el49HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzzsWmvND9V5AH8Z2vjxLntJl71SPz+15L5bhLLIqKQoZ8CcF0odnbEXDrePbTmHjQOL7b/o2MVCSbV+ZN4w5UlAW7BbrWrETcnQiuaZYyWXZbiyZ9v+t2uvcMzZsIUVf1ImsK0eq+suq/D4Fc0uNoD1M3ND24dkjU1on+Ol0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaMoPmsv; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaMoPmsv"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-880576ebe38so6502586d6.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 15:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765495765; x=1766100565; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dbJc1OJNTPxtfWwkX/KBFBuJPaakfzFAHuCWrkILadQ=;
        b=YaMoPmsvolJAyi23aniLUauSeHFS/a7Zf5QIkcp6Hzs9nTSKKcbKfPebL0OKLS2Yor
         pMiJkKpG3nMn9fzK8JeApvSUHrP55UodVJC2WlGbny8LU6A44xSZqzb4HFqbvZ/QAdPv
         zERfb0JRelLy0mkUUhwnEjGcXHA4PzKsmaxVxw8Tf/WwRPt6ZZINKgqCwpxhMd3KEC3R
         wgdodN3aCJLAZUNQrkeWs/D9sKO0AWb9x4FA5qZIBIrp+/8oVTg5x2uwwOhMmrqamrlK
         Lm96AyxcmJeynQlckZem45pWiS4Wlp9WZcqEqs0z0erHpLnvxW2/w1rpY8StDGcz+d7p
         smVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495765; x=1766100565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbJc1OJNTPxtfWwkX/KBFBuJPaakfzFAHuCWrkILadQ=;
        b=dSdcX7f+pvsyn+cE8Gp2QUAJUWmtrHTBTXh3g2gboKpAyCy/znBw1tVaL77V6U6oXb
         eBsJY0prD7FH7atbxUXQLJQe6GrK4TLB5F3A/Meo2hYLxw66GJh/q3LaVgiYKvR+y7GO
         JzBulawVT88QFJnxt9BfNUHp4o1J9AqJ5TOSAVuGTSmJZyW8DINvqQVStc0Q/xO9760h
         VYa7VXiJEbOXakV9loioUX9NNLSBZk1OIOcMlE9qIebC5pYKv4vlRNf3YNCtgowwQsHT
         /Z2Jw9rLfeR3Yiv7j0eemPyNL1hUdEkgCgln0E+bGDcb40z1bU5KCz0Rl70CkxZsqwwc
         QSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU17WvGU6Qi+NlWCUlAVmjM+PqGYAVYdPTRs1q7g3QDWj+ZTNKigB5+a8dmaiKzfn7vBUvulTUwAJAfpgDS@lists.linux.dev
X-Gm-Message-State: AOJu0YxlMVlAoK7R49ZHrIwQEpmuXpWyMmuma0/Jz7T5sPBVsYeuiM4r
	MxvTQFD+YUINnjtPU1i7hYBxi1kirEpvW4PqB2IKakmHAzmIdv/CApR9
X-Gm-Gg: AY/fxX6oy3Z0pvQDVXiRg/tQjLiT3UabUFtQjJfI0H4FuM3hOD3wkIQPwfoDegk6svj
	pVhlG9Cd9+dMq/jXrrqUDfmLaw659jpWqk0abpZx2v+W7BmZK0n71m37cQk/zHxpbJwO/WlgVOI
	/aiN0Rm9BTCOK4cq4oorJEAAiHF2ts7DI3xxySfR89LsLA+XQOkT1awz7ttE1QGSn1LJdPrBz0I
	5hpDeZ1RU03yuD8+2c6j5L65I5ItEo91947rPqzwqNq1M2prNKM/Gu5B91SYTBW/QQHvDtxy1Dx
	qwZWloIzVqOgJ+6e/8rZTSNaRixGm8ZuUxk/4GAlUfrL0UKp17LOkbZ/wHYcctKi8kghGGqdUN0
	/5HmW4iidgOtKnNWelQ1wYcpsrzxQvk/Mr+8CIJ5JkRzvn1JfjCfZnxv9fwPhoV0Jihgdo3h4XJ
	teqf5IKDAyk2sfGp83wsQQnk2TzqDy4VoikSsVPCCMjwfNZzsGgW3Onla+0gzS1zy6VNEx5nMaW
	1YntGnIZAWl9D0eEUklOaHQGA==
X-Google-Smtp-Source: AGHT+IHFf2LFvbLGYxx6dXxdC8TeQEz90eXcCSaH9CyHBqDy90aL+WQS6Oeg098hvM4Hg4X8L4RqsA==
X-Received: by 2002:a05:6214:766:b0:882:437d:282d with SMTP id 6a1803df08f44-8887e0454c6mr7085056d6.30.1765495764727;
        Thu, 11 Dec 2025 15:29:24 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8886ec5506bsm33737486d6.18.2025.12.11.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:29:24 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9DB57F40076;
	Thu, 11 Dec 2025 18:29:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 11 Dec 2025 18:29:23 -0500
X-ME-Sender: <xms:01M7advYVwYbjHKGHrQCUPFma3brbagCdFJyxoApCjfN_P97Jaze2A>
    <xme:01M7aQ-_2x4rdDcVKsgGFaDAuo-_SJYZB49_qvDJc6dGoEazL7Zt6Q2mxY14D27-G
    b9OyK38Up10sdRHRHPlytAB5H2VMyVF0u5zqfRh2ZMIh-WiJZuXfLs>
X-ME-Received: <xmr:01M7adtwMfsKnGWgBQLG1PqrVSljFtz-hCbvhNxRQQB954co_3xAXZ75Q3xrc-L-60diKqcYEShfgkbpSDV6_pqXr4GLhR2yii4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehpvghtvghriies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthho
    peifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnh
    gusegrrhhmrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrd
    hgrgihnhhorhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:01M7aW6Wwm6qRSN7OWmpTNn5n7m9s7gcF5309pV6eytpTwp3yx63Qg>
    <xmx:01M7aWMkJ-J1lXRjWa7nICMzQoYFCZ95p7r7sfJCO2Hv4obn-htnSg>
    <xmx:01M7aSLH1_D4i6Lunbol24QObBrNnNdQMq5ckVqfRlQxlqC3vMdJaQ>
    <xmx:01M7aRzO129C95xCoHHW2hdKQdmsJnT-9HF6n6szKQL11Y01uwn3Rg>
    <xmx:01M7aS7xqOErWs5UQzu1jdlV0m9VDlYrd73SO3MV3X20kubOHGdcsEdq>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 18:29:22 -0500 (EST)
Date: Fri, 12 Dec 2025 08:29:20 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, x86@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rust: sync: atomic: Fix fmt warning
Message-ID: <aTtT0HcnP-1RDoWM@tardis-2.local>
References: <202512110753.8B3YlvtX-lkp@intel.com>
 <20251211213133.56265-1-boqun.feng@gmail.com>
 <CANiq72kHGjVmcje5fgHYqsZOdM7kN6HqnrvMdoLsbp7c_4AUhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kHGjVmcje5fgHYqsZOdM7kN6HqnrvMdoLsbp7c_4AUhw@mail.gmail.com>

On Fri, Dec 12, 2025 at 12:16:45AM +0100, Miguel Ojeda wrote:
> On Thu, Dec 11, 2025 at 10:31 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Commit 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> > introduced an import ordering that rustfmt disagrees with. Hence fix it.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/lkml/202512110753.8B3YlvtX-lkp@intel.com/
> > Fixes: 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> > Hi Ingo & Peter,
> >
> > Looks like I missed one rustfmt issue in the commit 14e9a18b07ec in
> > tip/locking/core, here is the fix. Feel free to fold it if you want.
> > Apologies for not catching this earlier.
> 
> Linus picked 309e49039f12 ("rust: sync: atomic: separate import
> "blocks"") in mainline a few days ago (but the solution I did was to
> add a newline to separate the import "blocks" with different
> visibility instead).
> 

I see, I must miss that. Hence I'm happy to drop this patch ;-) Thank
you!

Regards,
Boqun

> Cheers,
> Miguel
