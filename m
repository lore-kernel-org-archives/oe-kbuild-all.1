Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B0C257B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Nov 2022 07:33:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6A6C9320095E;
	Wed,  9 Nov 2022 02:33:51 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 09 Nov 2022 02:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667979231; x=1668065631; bh=9gwdRpqCDd
	Cciy/eGOAUVb6T52zUDET7VqpaEA4vwLQ=; b=CpE8mjCUKSUB5bIhzehrCvwbVB
	oTLgqmWg6YbzcHSt5Rco9L8mrwtSk6wQdi6bhBtYn8p9ywYrk5tGx4nlSk5TBpeN
	IOoiQob0zXCWQPqu65c1W4groM7HflMThogPVBeOGJ1/TZgZdWqB5teWuwSyrMOz
	/lS0mueztu2rTEvSc0Ao3MsET20dCiUpHiZBKHATM8ZwOJEHg1c52YXRjEjr8acr
	jLN4V0e3wMpf4TmnDJcW6X4SkSCi7BG7THcX8ScmelOJQYZD+70ZikcBR3Tq+8Q5
	2U7kBAHKkVgWctAl3WA9XUem2VadRary7ngPjkkyhyYCHKBWgh6Duj0hpNBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1667979231; x=1668065631; bh=9gwdRpqCDdCciy/eGOAUVb6T52zU
	DET7VqpaEA4vwLQ=; b=c3pOQyeMGbcAV8AXWKhAq+FHHiZAGUc2gdjbKlsKZILd
	RailCXOuBiJ39DpBeIOP2t6BRtlPuznLdFY17OjBo15FrrcHR7e1tjVJJ6ajYvus
	dZ+KKJCEnfkABHHsx/xB5qEwty//TWVcxp9Vx94Jah9ogQNQ19XFwGArfQ730D2w
	9mkbQNS5OppC4j8bzdC5PFlrOrPQYan29wTxO+pbojEIRXGf3+hPw9qmX2WTTs8G
	ou2ggLgsds/TzjvZSkGkINF1Ntu4sTRnRziy9xg6Q7qk5pi5feamQZNjpX8b7oC8
	7DegcqSXvh8rsMP1VqYSVLkw+1NvpzWUVXrg124vsQ==
X-ME-Sender: <xms:3ldrY0Z8U6rPNUn-QE1H8BIjon28enwS-BgRvXTYhbnjm2XFHQxoLQ>
    <xme:3ldrY_bpsBOH-kT8Saxf9cyRLgX-tPu1IttjDfRE1d3xXRTaOUbdcLEYgtSSxvMPD
    VrLK827xCT2e_gp2lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedugdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:3ldrY-_5rk4hWTab1CDeQxOeKVzTakDm7esLxfrj3lROkypkVcsb7g>
    <xmx:3ldrY-qQRKRK4NuzjHp0vUwyRL_tbSsNwz9mhq0-FXFh7Y0RVTz95A>
    <xmx:3ldrY_qzX0tEmv0oY_CeV6IHWYmGJSqUaog6yQdYca_GqYNHKyj84g>
    <xmx:31drYwl22gY3zDHDmrbSewB0IktESvK_HBBq5aOiiz5VTtkERSwGsw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3D386B60089; Wed,  9 Nov 2022 02:33:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <5f51b4bd-3bc2-487b-aacd-9d0a1129c615@app.fastmail.com>
In-Reply-To: <202211091154.quYhgunB-lkp@intel.com>
References: <202211091154.quYhgunB-lkp@intel.com>
Date: Wed, 09 Nov 2022 08:33:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Kefeng Wang" <wangkefeng.wang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Will Deacon" <will@kernel.org>, "Christoph Hellwig" <hch@lst.de>,
 "Russell King" <rmk+kernel@armlinux.org.uk>
Subject: Re: drivers/remoteproc/st_remoteproc.c:114:20: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Content-Type: text/plain

On Wed, Nov 9, 2022, at 04:54, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> master
> head:   f141df371335645ce29a87d9683a3f79fba7fd67
> commit: d803336abdbc1bfacdb32b2cf9f4fdbee072b8ee ARM: mm: kill unused 
> runtime hook arch_iounmap()

Thanks for the report, but I think it might be better to stop
reporting address space violations from this patch, because it
only started showing existing known issues with a slightly
different error message, or flagging issues on arm32 that
were previously shown on other architectures.

> sparse warnings: (new ones prefixed by >>)
>    drivers/remoteproc/st_remoteproc.c:98:12: sparse: sparse: incorrect 
> type in assignment (different address spaces) @@     expected void *va 
> @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/st_remoteproc.c:98:12: sparse:     expected void 
> *va
>    drivers/remoteproc/st_remoteproc.c:98:12: sparse:     got void 
> [noderef] __iomem *
>>> drivers/remoteproc/st_remoteproc.c:114:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *va @@

      Arnd
