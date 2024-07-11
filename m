Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02B1288B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720715400; cv=none; b=snCaHL35RceZxrxsMrlhEV55FuehgNdvQBVZKvbVailQWEhNvKwr2PRacQ5BJneV7sQSTp9ML4jVLTnr96yhPvArwqgfird2MoMoPZAPCy5kp3pIzGOKyadfiOiAee1xVaFaIMM/B/zPZbFshJ+3xLmdSsG7Znb1dlrOytLspFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720715400; c=relaxed/simple;
	bh=DOf6DHBZgP1ICMc2Ldg1fy1PA0NSEu9Z6yTPriMP5tE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=MCi80gUfl07lMn1aJkQq99++GnI7JJGzYthWAPSc0nGR7uC1VDEinjDBmlhwzhLKIhb+e3PFd8lBQJSdaWo3Z50fDWkF9zmo3NR6coeTPTunsgW+iUrvdQKIg9BR/t6Eqotu9QNJsCaF0BeLMM4jkILCuT1uosDsC0L2+c9H/7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ioslCiUy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WT2/chxF; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ioslCiUy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WT2/chxF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id DA13A1388523;
	Thu, 11 Jul 2024 12:29:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 11 Jul 2024 12:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720715397; x=1720801797; bh=qquh37mx6A
	ELigM8QvDppKATxcr+EWO5DNiF/RkUA0c=; b=ioslCiUy/Z+a1BaX52/lQmpOCv
	MLmVTD2pNbSIj3MKrBy6d68PQzD8V0+yNOXhZtVeea3w3sdfGVS41mjHr9mo5bCc
	HC2tRBNUEkZdSxqsTbXTzT4Jvb3zykSGdhHhYEcJorf0Ccairc+7bneWDpNgJNKm
	RlXahakZBvgkFGh7MbmbbATrloZcURHDeGphbVX2GOu1vL7I7TFJeI9x3d4txCXz
	tKkJWE5I6PUQpIr9JLTHZ0HUroHU+jVyicLnT6PtDvrDkL0ExSVC/WUpmOy8mV/N
	UuvtoU/oKxGm1DiDmnCGLJMl+D1rDnFkipijgBGXNrsueRDs/UyGFh1DdTrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720715397; x=1720801797; bh=qquh37mx6AELigM8QvDppKATxcr+
	EWO5DNiF/RkUA0c=; b=WT2/chxFM7QXRc9gcglIwqFKxgkE9WLhVoSvRbE9aHKX
	+CNxbzzcVOVwJQ5ptxHfmpZXaDpLgX95TYVqoaDwrNzLhI20yysnH/IJwzBIA11B
	74UOPnzzhvHD6kYGW3msmPD5Vuo23lkavsyquG3ic1mLFRhz5s223s1WjkV9AUoK
	tIf5H4KBQMcgj1ubLY8UpV9M8js5OwpiyAHSTZUCAUXwioQhNDETvx0Tu8G8N/Rh
	Tqn1zIOGpMlgr6ZD98Lj0R7+FlEQhEoLtuVUpoNSiuyGNce9wCjVilFa4D9i4kGD
	a1WLQrFYT2paLu1pd+uc1FBB42H8UhdqYhbxRqY6LQ==
X-ME-Sender: <xms:hAiQZjRhEc1F5tNwVr5r204Ywkphr5kalyRI9UsPsExQa0PqRqpt9w>
    <xme:hAiQZkw3oemMuvsEYtu9WQevAHa5uZnvbl18KOfrxQXvXC8NaF0EEP6jttD6vJfB5
    SU0LNNrz_q7FQeagns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeeggddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:hAiQZo0rwyogTCBBZ3p25uIGLGQe3Acme_e8QOmR_Qz8KDCQ-QscPw>
    <xmx:hAiQZjClGT-k7bqAZpZBJpkVUg8WbKS0-qkrKaIH8xsb369uq5SEOw>
    <xmx:hAiQZsg52AynqrKnIlfWgDPP5KCiJ6GbJtV3qFUHf4wl0V4isA_tzA>
    <xmx:hAiQZnrmQPFxhjtUsjmlKTsKp6SDpcv5c9MUrAC2HuC40wuPl2a09Q>
    <xmx:hQiQZlvhzWNEisV03UGXFxqZgPFoNxkh0CC7a3ZCRezNM1kk6Uo9z7R_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 796D3B6008D; Thu, 11 Jul 2024 12:29:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <875b2f65-bc6e-4b9a-b40d-d2827bc3d54e@app.fastmail.com>
In-Reply-To: <202407112236.XxoETdP5-lkp@intel.com>
References: <202407112236.XxoETdP5-lkp@intel.com>
Date: Thu, 11 Jul 2024 18:29:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Johannes Berg" <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 12059/12643] drivers/ptp/ptp_pch.c:224:undefined
 reference to `ioread64_lo_hi'
Content-Type: text/plain

On Thu, Jul 11, 2024, at 16:52, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
> commit: e435f39b57d5fb97b6df67c3d6ce2400e907a69c [12059/12643] 
> asm-generic/iomap.h: don't check for readq/writeq

Ok, so this is a 64-bit architecture that defines its own
readq(), includes asm-generic/iomap.h manually but does
not set CONFIG_GENERIC_IOMAP.

>    alpha-linux-ld: drivers/ptp/ptp_pch.o: in function `pch_rx_snap_read':
>>> drivers/ptp/ptp_pch.c:224:(.text+0x25c): undefined reference to `ioread64_lo_hi'

After the patch I merged, this configuration defines
ioread64_lo_hi to itself but has no definition for it.
Before the patch, we fell back to a pair of ioread32()
calls

#ifndef ioread64_lo_hi
#define ioread64_lo_hi ioread64_lo_hi
static inline u64 ioread64_lo_hi(const void __iomem *addr)
{
        u32 low, high;

        low = ioread32(addr);
        high = ioread32(addr + sizeof(u32));

        return low + ((u64)high << 32);
}
#endif

I need to think more about what we actually want to happen
here, given how on x86 we have no ioread64/iowrite64
and ioread64_lo_hi() turns into a 64-bit MMIO access,
while on most other architectures ioread64() does
a 64-bit access while ioread64_lo_hi() does a pair
of 32-bit ones.

      Arnd
