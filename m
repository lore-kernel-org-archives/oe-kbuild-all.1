Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95F26F46E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211546; cv=none; b=Du0RGGU+hPHdF6qYERmi1soEcqwzbz23TdagKQl6IDck21aT00Zr7OkWvarBhRSvSLXQvvmzrBHNiIxRBnxfw58FWxfDHwlrm9Lh4w8fWCQh6epL9d4Cb9YTjwAfux7eCGnfvzaMgF+62IUlf5dzC90oElkGP8fxqlSYhYAR64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211546; c=relaxed/simple;
	bh=C71DcTAX30y0Q2dNAKwHj7pUQXjE0YKH6QoW5+aTv9g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V8qBdt6zqoaIslJeU4mCwWiwGMdbTLpCpdQMfHdwoIFLZTDXBUAo8JB88W7vNNcAw2/Ys1T6crlLHMANrge+PrkGJ8WuulS5esdYGO+PnmdeNSxEN1baa6C2ETZH4GPtKDnPcRqZvR8g4IsdSNT5FxI5iK27kVQ+DXnyk+q8zGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=w6DQnRHV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dA6vJMrW; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="w6DQnRHV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dA6vJMrW"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id AE971EC00FF;
	Mon, 12 Jan 2026 04:52:23 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 12 Jan 2026 04:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768211543;
	 x=1768297943; bh=PbrUSFQ6CqJKvLN5oFbJhGefWwQ8oY5X6MccpfR7whk=; b=
	w6DQnRHVaJd4hHPDSNxaobtkB1gIoV7Ay9IFGWKrMhZHD+bN2Dgc7n36ZwjSglaa
	SlSVOZc78vXWHeoHplFpB+wvGHGHuf31LVSknLhhzhuqzgzJnZfV1CWCNKNI74UY
	yLSaQayqPeSE72ki8ZYDYbVi0QHd2s4G7Rto3wwK39liHCIMGRy7zU3AapbxzYeE
	M4zbXFlr3xmctgY0ImBmv+QIguNrOX7lJRiHfwYcfiwHSK3z3Nje6MwW9x64M+J1
	uyzHdAt76bgUhUAL0rvfHWxV9KqHgsTgHLa7Fz9W/w/Y8t7vDeK5MIFyVqz50ec9
	3G1Bt2SuKAGUt+NqybDC3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768211543; x=
	1768297943; bh=PbrUSFQ6CqJKvLN5oFbJhGefWwQ8oY5X6MccpfR7whk=; b=d
	A6vJMrWDTjYLAxepZpooMw30OMrIuzS/T6g1XP/B8wyxuBk6xkBJHO7B4pabIMGZ
	0YxgOsv+Lp/9xUl6gEMb9sfIFFwOC0eOzawtORrfyDoMUj/jYsHBEW7PCp0RYfjd
	CI6n+IU/YheNlIr2vX/v3A1jzAUf+zk5Msxbab/fh2KvkIxqzs3UsMDg9P8BqnXe
	7+EoEZ9pgJprt2sEUE3hrSR4kjLomITgIndBf8RcfOpQTzC4zQBqAjYN7vTDoeak
	B8l68S4JekLeri81LpI3zq7TYQhnpl+ZL8Iwo0ZuXP4mqHk12EnTe8GBBmo3Ic2D
	PbLYhwBFE95791lNU9tag==
X-ME-Sender: <xms:V8RkadQgmHthw39FcpMLQdzdhl6kSk7tPc4kSSc30gYub6j4iT4Euw>
    <xme:V8RkaRlGQ0RqrryXf6BmvNH6xIx6hsfdhpHgxAST9mw2Cr2lU3GJTOgTstWYt5U-f
    mM93E2YcmDM0wNyem77v0DdBAZsiLfnCLPFFeZNiTOjkpXwsj7NaJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudejudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvvefkjghfufgtgfesthejre
    dtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghr
    nhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejge
    egteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtth
    hopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlkhhpsehinhhtvghlrdgt
    ohhmpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugi
    druggvvhdprhgtphhtthhopehlihhnuhigseifvghishhsshgthhhuhhdrnhgvth
X-ME-Proxy: <xmx:V8RkaYuczSe9NAd6RCEYqV3brztHR3kDcqiFL0Zl4YTiidqTR0A-NA>
    <xmx:V8RkadMMH3BJPgL6RmAmDg9ftxnv5ngHu17xiRqObxT6wG37rUA8bQ>
    <xmx:V8RkaW2Do9k6Vs-60DnOVGvr1Q-1cZZctkxqk9JHm4pGnF4AdV1XGA>
    <xmx:V8RkaZNkwEu2AoJZRNsiLmaaE_CkGM-XaYqlfq_3k6V4wzGxzR2XOw>
    <xmx:V8RkaQSJarh0oh8Fy6KOaiVlmTLGdhc8aADQeXklbCvsrcrb3JMhBvb->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A20F700069; Mon, 12 Jan 2026 04:52:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AvLHsOQpubTN
Date: Mon, 12 Jan 2026 10:52:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <e27cc429-c068-404e-8c05-7818d7017ceb@app.fastmail.com>
In-Reply-To: <202601121047.KK9S4DFQ-lkp@intel.com>
References: <202601121047.KK9S4DFQ-lkp@intel.com>
Subject: Re: [thomas-weissschuh:b4/nolibc-warnings 16/27]
 tools/include/nolibc/time.h:42:9: error: static assertion failed: ""
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 12, 2026, at 10:14, kernel test robot wrote:
>
> Note: the thomas-weissschuh/b4/nolibc-warnings HEAD 
> 86fb92e6ec2c53a7e240650aa8a7043341b4ee5d builds fine.
>       It only hurts bisectability.
>
> All errors (new ones prefixed by >>):
>
>    In file included from tools/include/nolibc/nolibc.h:96,
>                     from tools/include/nolibc/stdio.h:8,
>                     from nolibc-test.c:12:
>    tools/include/nolibc/arch.h:32:2: error: #error Unsupported Architecture
>       32 | #error Unsupported Architecture

This is the preexisting error: 32-bit s390 support was removed from
all of the kernel, but the toolchain still defaults to it.

>    In file included from tools/include/nolibc/crt.h:12,
>                     from tools/include/nolibc/sys/auxv.h:15,
>                     from tools/include/nolibc/nolibc.h:99:
>    tools/include/nolibc/time.h: In function 'sys_clock_getres':
>>> tools/include/nolibc/time.h:42:9: error: static assertion failed: ""
>       42 |         __nolibc_assert_native_time64();
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The extra error is just another artifact of the same problem, not
a new bug.

      Arnd
