Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFC11C91
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 15:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EC2C433C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695657216;
	bh=ooepbf62NfNRRnW2emPPD9TlOV1yoGGZl++MJ3mT9Go=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=QThg+/g7tA8Q3HNuhk0+kLCehf7YQzjdrl4CpbT0BQNnn1dnMs+3QptIx+ZJ7LTFB
	 AvExkjG6I67lo43r/de/V+4QMikc6CTYzaRwjPKqebOwLpWxDgskaMNFhf//J+lM+T
	 KkDe9MGJSDbLB/a4eEb3OOUv3oPfRPs0k3f/rvwb6vdlWheWuhw8xmrTdD1v3gFj5D
	 NJ5uGMJdsGrpg+VkYrnEUFx1sLTBOihcuEWfZ1XkCfwWG3UUH3msQ9dIjatmF4BFJJ
	 lMlA+LbdupehrjW/zBLrrFBbbwVUYuQV6TG+LR5JLE7HJ7xUWzlT8Hs+PMBWO3HJIU
	 qiIOLvfe0xm3A==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id AC2D927C005B;
	Mon, 25 Sep 2023 11:53:35 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 25 Sep 2023 11:53:35 -0400
X-ME-Sender: <xms:_6wRZcVsS_CY8bCh6HwGhe8AHmBKbAzzEKXMK2I_vRD4qX9A3eLWww>
    <xme:_6wRZQlqaHdFSn6rafJexjC11X2oIVpgZPORpdNBAjpDGXOUV5JZjn3cWwZu6msPq
    tldA7qiVF_sU7eywMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
    gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:_6wRZQaUZSxSsRJr0CT8Zad0ZHRh54apFhcuZMDxHk4laqtwZFXpWA>
    <xmx:_6wRZbXWqBj6gFaS7YPZ7Wg2aWJOVAWRss5sltFpm_ekuJHudi_g4Q>
    <xmx:_6wRZWnN6VFI3ktiw_a0dUAeIeipS0edcfF71yn8vah0MweVCJSriA>
    <xmx:_6wRZasjnpnFEAv42HOAduv-kdK6J5Y-qbtfhIUiUckL8yxKr3OU-A>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 20CE4B6008D; Mon, 25 Sep 2023 11:53:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <d1e0c228-04bd-4cd9-a8b0-1104a49068d0@app.fastmail.com>
In-Reply-To: <202309251926.bPl23AhG-lkp@intel.com>
References: <202309251926.bPl23AhG-lkp@intel.com>
Date: Mon, 25 Sep 2023 17:53:14 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "kernel test robot" <lkp@intel.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [niks:has_ioport_v6 17/36] arch/m68k/include/asm/io_mm.h:375:44: warning:
 passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer
 target type
Content-Type: text/plain

On Mon, Sep 25, 2023, at 13:04, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
>
>    In file included from arch/m68k/include/asm/io.h:8,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/asm-generic/hardirq.h:17,
>                     from ./arch/m68k/include/generated/asm/hardirq.h:1,
>                     from include/linux/hardirq.h:11,
>                     from include/linux/highmem.h:12,
>                     from include/linux/bvec.h:10,
>                     from include/linux/skbuff.h:17,
>                     from include/net/net_namespace.h:43,
>                     from include/linux/inet.h:42,
>                     from fs/smb/client/trace.h:15,
>                     from fs/smb/client/trace.c:8:
>    include/asm-generic/io.h: In function 'ioread8_rep':
>>> arch/m68k/include/asm/io_mm.h:375:44: warning: passing argument 1 of 'raw_insb' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      375 | #define readsb(port, buf, nr)     raw_insb((port), (u8 
> *)(buf), (nr))
>          |                                            ^~~~~~
>    include/asm-generic/io.h:916:9: note: in expansion of macro 'readsb'
>      916 |         readsb(addr, buffer, count);
>          |         ^~~~~~
>    In file included from arch/m68k/include/asm/io_mm.h:25:
>    arch/m68k/include/asm/raw_io.h:101:50: note: expected 'volatile u8 
> *' {aka 'volatile unsigned char *'} but argument is of type 'const 
> volatile void *'
>      101 | static inline void raw_insb(volatile u8 __iomem *port, u8 
> *buf, unsigned int len)
>          |                             ~~~~~~~~~~~~~~~~~~~~~^~~~
>    include/asm-generic/io.h: In function 'ioread16_rep':
>>> arch/m68k/include/asm/io_mm.h:376:44: warning: passing argument 1 of 'raw_insw' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>      376 | #define readsw(port, buf, nr)     raw_insw((port), (u16 
> *)(buf), (nr))
>          |                                            ^~~~~~

Not sure what caused the warning, but it should be easy to avoid,
I'll send a patch.

       Arnd
