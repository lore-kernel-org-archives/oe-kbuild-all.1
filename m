Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991A34BA21
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638522; cv=none; b=pfDQjYaVng67v14gwR1pjCJv5MsGGGjRMjM2r6d8wVYc5q+6noMXwfwi/pQ92xEGMsWe2Gmz/y3jP/P0YIEeXDqzcVKKlSLNCDx9Eb2UkVtji1x6pGAw2tqqIL8LCstjT4yzJ1lmo6plz6/E4k7Ax5VEMbPO/G6Qw0mtui8cmAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638522; c=relaxed/simple;
	bh=lj0Pz9TkA8wMfvIqwopRi6nT7hU93c7m1ZyRNGoTF7k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Qrg/nyyzx06g+PsdYjzulvVN+YnWXxB2gv96lr8vEeVFPBLkT9x/Wp2o4v8Tp0s/k5d/qwPW0J689+cH1BHSqMXlLg7neSzM2DBV8LK3HNAbg6zrrw/drCFXP3jyhmeUhRzxpyu9PNnTVvcNXFKGKHN3v6LFu+9aYo5WLUHEHfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ79D0uP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ79D0uP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFF5C2BC87;
	Wed,  4 Mar 2026 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772638522;
	bh=lj0Pz9TkA8wMfvIqwopRi6nT7hU93c7m1ZyRNGoTF7k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=PQ79D0uPVur1I/JzPUtC/Ge6V7LNj8a+buEGlh4pSIYahKAeI5bC+v6D8nOHBLCMP
	 nNV7sCH0v5asB12D4zPI0GYeV1wEqfhcSTm+kf6Gz3DIZdfoBJ2XXBvRuUVGfi3I56
	 ljgVxBfHg8qt8NYol2ypteWpDoeJEL1cwj0M6gLhME3nNyqydNJ18yuncw9KdMop+a
	 sB1ZcmaNF3NCKHgJroF7WvArPZ/BB9MiB+plOvGDqU+ew06uvFsYKKFAjtXXAZgLt8
	 Bqc9icxgTgdeC7AK4zJfsN4v2JIS8lJgKWZKqIMa+1KCXhnnwir5Rd6RsDfLAnmj2c
	 yt6G0jS8cMPJw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 878ABF40069;
	Wed,  4 Mar 2026 10:35:21 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 04 Mar 2026 10:35:21 -0500
X-ME-Sender: <xms:OVGoaU-GLJssz3YlKWJHxbryAg3Mn9Y1wMBeAbTNIh7mcTVHvlBOHw>
    <xme:OVGoaXj9AkFdulceWnhVBkEbV83QvCvNgH5SsVrpe5peh6jC-qM0KWwqve1aAFuG7
    C7Vuz1F8YOglwu8YZAExknXK2apaQISmlI-BU5d-pfwWKsCnBAXkFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieefkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvg
    gvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnh
    hkohesihhnthgvlhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhr
    tghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvghsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehpjhifsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrgh
X-ME-Proxy: <xmx:OVGoaZXi0YeXJduP9NY19WM-5e4wN2a5n57lD3z0hY9VeG3db93rbg>
    <xmx:OVGoaRspSqiqAg6Q-zTr8gR9ysJ3UU_HbpwQbrk_t0qMxvKFpLja7w>
    <xmx:OVGoaU7Q_mBhtX2DgOD0n3k8LmCUR2iPLs5qOPyli-v1kt5J5nSIFA>
    <xmx:OVGoacRD9zmODc_tHhYkrw9EWwqcm5EZUcepTMdxX1qS0SxFk2M08A>
    <xmx:OVGoafsTysKZ1bWOpeXrR9p5o5fiUTFsYk_Fg7ObybbLu_4jv3Zsj_Wh>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3E9E4700065; Wed,  4 Mar 2026 10:35:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AFCgwcuzDHfo
Date: Wed, 04 Mar 2026 16:35:01 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "kernel test robot" <lkp@intel.com>, "Kees Cook" <kees@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: "Dmitry Antipov" <dmantipov@yandex.ru>, oe-kbuild-all@lists.linux.dev,
 "David Hildenbrand" <david@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>
Message-Id: <529d4fa6-e163-4b4b-9c51-f9f880492b76@app.fastmail.com>
In-Reply-To: <aahAgJ0G1uYSCFnF@ashevche-desk.local>
References: <202603041925.KLKqpK6N-lkp@intel.com>
 <aag95SSwClx4IzJU@ashevche-desk.local> <aahAgJ0G1uYSCFnF@ashevche-desk.local>
Subject: Re: [akpm-mm:mm-nonmm-unstable 49/110] __efistub_cmdline.c:undefined reference
 to `__efistub___lshrdi3'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Andy,

On Wed, 4 Mar 2026, at 15:24, Andy Shevchenko wrote:
> And since it's riscv, adding people from there.
>
> It might be that they simply need to include the corresponding library to their
> architecture builds (we have lib/lshrdi3.c)
>

I didn't manage to reproduce this, but if EFI boot on 32-bit RISC-V is really a thing, then doing the below should be sufficient. Alternatively, we might just disable EFI boot on 32-bit RISC-V, as I don't think it is likely to be used by anyone in practice.

--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -31,6 +31,7 @@ __efistub___init_text_end     = __init_text_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display        = sysfb_primary_display;
 #endif
+PROVIDE(__efistub___lshrdi3    = __lshrdi3);
 
 #endif
 
