Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81721891A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046893; cv=none; b=l+TPXR+lhad8GK3ZdsTEbB+Eh4LqhLf82iexwNEuOQLlRN9zT6ulO3w5qGsEfruI7953w6eHogjYHYVHzlQ/yuQEFllZHQdoMTplSmoy0ijkABC5WPnhJIc0UacJNMU2qms2YzJUbb4HeNBFlfphBw4P6+nVpO0+H4TWlsjkGLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046893; c=relaxed/simple;
	bh=KejzK1PxmSC37Ilq/y5zFcjhNuoXt/dvukw8rkeQ/J0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=RZxYRzr3xwCbsDFEkYKv7NoR898//CrPN2hM4e42LOyu91LDm2yNymezzYlT2X3KTci2+00gNlgwB9GFhPe9zMSXAT6onc6VsSuC5AlDAx0fIRsyvw1bjKTqNFUALMK402sqO5o9nxTLqXz1VoXEq15d8qunAIcdbsQRdQw0i1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Wt8w9toB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gtrqVqa4; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Wt8w9toB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gtrqVqa4"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id E0BA01388C6E;
	Mon, 15 Jul 2024 08:34:49 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 15 Jul 2024 08:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721046889; x=1721133289; bh=ZFxJtd+i93
	QBQWnvDAdYE/qsYCVxPHUYBpwxpYgj7xQ=; b=Wt8w9toBNte+fxi/ipN5NFeB6B
	q5Haazv5W+Qwn/Yd92jlTlP0JAToejUCujdhMjF3QlBUnpcAenLGsUI4v8ZdbwXC
	Kz3YtAfh7Bxowss2xMxG2PxUEXZLMIeYkcsET7ULs6xHZeGuHGGNNsyDWPN/bkFr
	imN7ZKN4FTInTbDhIuuIltU3n8pVDW3ANDosixR9KmJTghnDO6t64cWYS2rValRu
	F92GZlKktMqRQDeuU86vnyUG7S7D8lnxwf0xTG0mps1vxFRwhxl189dBiEy/9HNR
	2CkSnoJi71AMkZ0xnemFkS0ZGLYUgKzXP6eWBuDLUaSDQUYz+mJiUNcHeXWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1721046889; x=1721133289; bh=ZFxJtd+i93QBQWnvDAdYE/qsYCVx
	PHUYBpwxpYgj7xQ=; b=gtrqVqa4BCIJlKBpDzemRvjbVl5D9GM+p9zdXz12vTqQ
	WgdomdsFPM2AoT1vg5T3yjj2wrhhqigDnRMyFbatauEW5cfD4RRrjObN9BKowklo
	8lHcaoGMHa90uzjJYLWCMtLIseuz/fIXNgFpFETPKHjHPLOWl/YKG01vRjIQegD0
	zPkZSemcvVxlCcnDt1WcyYsFI8Ockc2bOTzAoMGalw8HYpWR9/ZKnf90HTwR5DPw
	fLYb9CIoLUP/yoNm7kgfRjxJ623CbjEE51iyvKIV1qFyiJPTc6kB2aA31w28A8cx
	kcttbYuWMjmnC4yI/zi096UgidoM6KdZptHxDp/2QQ==
X-ME-Sender: <xms:aBeVZvnpwoxJHh3WibncnD_aRL1pQaIiCHZKVrQJzJf6UHHftqDqNw>
    <xme:aBeVZi1xtfRlvuiD7MJiOKH_Wc-CUsCOSAd-Pf9BbFFHpjxelRsIyFooAdKNgYhZs
    B3hYtS22-3tfk8CUB8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgedvgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:aBeVZlr2y4fWQIHYihvJGCOqFhOoOplbajul3oc8SCHcbyKUBlieQQ>
    <xmx:aBeVZnksCH1tfJoy3ltumu6BsxUqjBYqHf30yafZsXokHV837XGVyQ>
    <xmx:aBeVZt1pP75HFo_PKCD9JFGtZg2RTnuPtZGdWHm8EWKwxpOCyrWhoQ>
    <xmx:aBeVZms9v7hZ3UzBS4JtBxxoPQ8rgVqhv1DyZ1ZCuXG3YWfGgWUXvw>
    <xmx:aReVZl9Ewr4635qhTw7eLb9dE5T3egALvMlzk3CcUDXGn49413Ee2WsW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8FEB0B6008F; Mon, 15 Jul 2024 08:34:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <5637dbc2-de31-4b30-bd14-9c4d670ef790@app.fastmail.com>
In-Reply-To: <ZpH2s4byt7aby7_p@google.com>
References: <202407112039.cyyIQ3Js-lkp@intel.com>
 <ZpC_xsx0t9KFgCCh@google.com>
 <0de0aeba-da02-4fa6-a1f8-a468dcbfac58@app.fastmail.com>
 <ZpH2s4byt7aby7_p@google.com>
Date: Mon, 15 Jul 2024 14:42:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "kernel test robot" <lkp@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [linux-next:master 11606/12643] arm-linux-gnueabi-ld:
 arch/arm/mach-pxa/devices.o:undefined reference to `gpio_set_wake'
Content-Type: text/plain

On Sat, Jul 13, 2024, at 05:38, Dmitry Torokhov wrote:
> On Fri, Jul 12, 2024 at 08:41:58AM +0200, Arnd Bergmann wrote:
>> On Fri, Jul 12, 2024, at 07:31, Dmitry Torokhov wrote:
>> > @@ -684,6 +685,7 @@ struct platform_device pxa27x_device_gpio = {
>> >  		.platform_data	= &pxa2xx_gpio_info,
>> >  	},
>> >  };
>> > +#endif /* CONFIG_PXA25x || CONFIG_PXA27x */
>> > 
>> >  static struct resource pxa_dma_resource[] = {
>> >  	[0] = {
>> >
>> > If you are OK with this I'll submit proper patch.
>> 
>> Right, that's probably the easiest way. I was trying a more
>> elaborate change (see below), but there is a good chance I
>> introduce another regression in that, so let's go with
>> your patch. Please send it directly to soc@kernel.org
>> Cc:linux-arm-kernel and I'll pick it up.
>
> Done.

Merged now in preparation for my pull requests, thanks!

>> One more thing I noticed: if you are doing more patches
>> to convert devices in board files to use software nodes,
>> we should probably try to move them away from static
>> platform_device definitions towards a dynamic
>> platform_device_register_simple() or similar interface
>> at the same time.
>
> Sometimes platform_device_register_full() which operates on
> platform_device_info structure is very handy, but in general
> what is the issue with statically defined devices (when they
> are never unregistered)?

Greg has been asking for this for many years, but it has
been unrealistic in the past because of the large number
of board files using static platform devices. As far as I
understand it, having static platform devices prevents us
from better enforcing lifetime management rules on device
objects. Adding Greg to Cc in case he has something to add.

The other point of course is static memory usage: a platform
device structure in .data is much larger than a
platform_device_info, and this adds up in a kernel that
tries to support lots of boards.

     Arnd
