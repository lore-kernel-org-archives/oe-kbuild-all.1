Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BF2E54C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752853848; cv=none; b=FPrxH9nO9PnmAFxDtZE6eyPrmWem6n9+/8QrqUITL6iXHCmH3i4UWtoOxMKeftfrNchZZa4jVL8fdWIRdOFA9ZBc/mvSMii1V7jI8EC5w8OPvfllJ/XIMIFcaHrfD//cNY6kwjm6nCEwABr5HM33NJuMxp5/KOOyS+qGzr3VgmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752853848; c=relaxed/simple;
	bh=MJTqa2PCkQlD0thFjBaZ9MfCMwcFJZ4YgeF0xD959aw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SQjBDeAeRMTL4N404i1eL3xeqV2exLe2kAPBuJl6LAG3i5OLGhppyQzDZnn9+SR5DmowvT/tQV1FXex0d3PcCPFTvX63iajF0UbFjRCGJH/uIw52IaGTVFE/dORRtZbAxr4HLlKhVo3kl8vV5jfoxzsAPtiNHyXYV7xCKYxu9Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Dn/7Q/pb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q/VIzxLz; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Dn/7Q/pb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q/VIzxLz"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id C7A9F1D001ED;
	Fri, 18 Jul 2025 11:50:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 18 Jul 2025 11:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1752853844;
	 x=1752940244; bh=B16N1UWt6iI1JTHxVoLsWgotKo2IPYgHiuLE3m2G4PI=; b=
	Dn/7Q/pb5YJQpcv4cvZ/nm7set+xYDxMgZdX/fWnpE3FenWIRcxe9ffGHGnl4G/k
	+sO27FLT9QO+4G/slzpqXxo8qL1+SVd+PKYdsAu6Hs7SZs2FMsTBm7Otd986aUKc
	8CJkGvTgqSYmG61oEZP5Nn2zOIklkBogunu/kR/AkJTSq6yTAPdLh/Iqrzhg1CSU
	wn2QCEMpXNp3xtg7Cgjd8v3kCEvKqJSYrMacydwrxYsGT2GFbGyeVmmS8RKICNhA
	I7AzzYNpR+1diqnFFRCfiNQTqPuQm6NX9XvL/95EJwnq0ofrzI4O2AEoFnnhs4yv
	FItdel+69pNJaleb9TWcug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752853844; x=
	1752940244; bh=B16N1UWt6iI1JTHxVoLsWgotKo2IPYgHiuLE3m2G4PI=; b=Q
	/VIzxLzMMq+4TI8zzM+yncIBk/kpKL3ONauOw9kZetjvJ7odQwr44H/2++v2Vu76
	sS8AUCJaIeFXN+1Gfb21O5F8oVCiyW5uQ2QuLnrZBadZLcEqDVPioYL85ehXq6nP
	5sUauNXEnV1b9+S5kqP5LMMNYsQemEdOCX8/J0AvpLJ9BdlotHA436ZQpGk+BvIx
	Wv5pvfSX5fyxEU5XyjE3qwdxkYk8m7sdEH2lEO+Rg0BK8EeoN3D1quGX9rfQ5fY9
	HI4pFWKe2Qv9Fs00cY/DypwFpahlQL0h3DrKHGhRTdKq4P7Y1VBLbBlOZcoyoOiW
	ByDZ5TtG58XQqtSModaJA==
X-ME-Sender: <xms:VG16aM7qy8gpv9y5Ml07VJi49ShfdwOIout_4DAf9F-a2b4cpPtoPw>
    <xme:VG16aN4pphWe_ZgaiHd6Bg9ptwdvUbW5mRqql9jWo1qqj3-PrnlnIA4A7Y-kM-CaX
    k0GklXIniPGhGnoV6s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeifeekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlh
    drtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheptghkvggvphgrgiesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomh
X-ME-Proxy: <xmx:VG16aALI-5YYH9SzedsT0-iEZ001Y2y4XDap9TCOt2w1KB2k2gUbMQ>
    <xmx:VG16aFgIqST71azyGFP_WaowQ3ybz_qQMXX_RzjhGd_9YAeMdsOUvA>
    <xmx:VG16aA6ExJVIW6c2Iw59ipGzMjGnQaYIeO4V_Lwdt5xjr30tkaNQsA>
    <xmx:VG16aNZgS9cL4P6W-7aOq1-vNrVkFg0kxeH3PpYmeN8dnUFjsQwdwQ>
    <xmx:VG16aFGQweRVdxGrjeGUThhYUp-SlEtVINcJDd280iHXpTNdN4fKXTFU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 413CE700068; Fri, 18 Jul 2025 11:50:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: Teeaf69f6e19bae6a
Date: Fri, 18 Jul 2025 17:50:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, "Mark Brown" <broonie@kernel.org>
Message-Id: <28f4b539-e88a-47b0-a7db-f04a20c7275d@app.fastmail.com>
In-Reply-To: <202507182222.OLgOy9fX-lkp@intel.com>
References: <202507182222.OLgOy9fX-lkp@intel.com>
Subject: Re: [linux-next:master 8699/10823] sound/soc/sdca/sdca_interrupts.c:220:1:
 warning: the frame size of 1264 bytes is larger than 1024 bytes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 18, 2025, at 16:43, kernel test robot wrote:
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> commit: 6894e49b7b62cdb0edbcaaa23ea0218edb3b02dd [8699/10823] ASoC: SDCA: Kconfig Makefile fixups

The actual root cause was commit b9ab3b618241 ("ASoC: SDCA: Add some
initial IRQ handlers"), which introduced the new interrupt handler.

> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202507182222.OLgOy9fX-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    sound/soc/sdca/sdca_interrupts.c: In function 'detected_mode_handler':
>>> sound/soc/sdca/sdca_interrupts.c:220:1: warning: the frame size of 1264 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>      220 | }
>          | ^

I have not seen this one in my testing, but I have looked at
a lot of similar issues recently.


The first thing I see is the "struct snd_ctl_elem_value" structure
on the stack, which is about 700 bytes long. This is probably
too big for the stack, but doesn't explain the warning by itself.

Seeing that only a single integer (ucontrol.value.enumerated.item[0])
is actually initialized in the structure that gets passed down,
I wonder if it could just call a different interface instead that
takes a u32 argument instead of the full ucontrol.

Alternatively, the ucontrol could be preallocated, e.g. in
struct sdca_interrupt, as there should be no concurrent callers
of detect_mode_handler for a single sdca_interrupt.

    Arnd
