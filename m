Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475109;
	b=dUBQEfgnWqhnwM0XWX4ewj3T46D3y9HLLtHXqnW+vZNc56YKd6XgNUbf7E8Y/m/FNdRw
	 seNqeghOuwYA+CVR/wqjRPcwatKuI37RYrmHxhldVZUcCVVed3Uo8fDCJDbz96MqsFTVQ
	 j/HsojCQ7ifNchFuRg2pLUQwYj4Tk6trh0ga9XFPl9kD1x3FCBiPS4KmQYiyOQlWqoxRj
	 ED5WqhPDnoq8MShjvn5bReUekPEl/hTzjuA6n2cJSKNocJ5wg0USfAigYlFgLhmTJkkSk
	 v8ToEJ7gfeDuRhvjtrDvdokkmzCZ07GJGW1A424x9hWzrhz78Tj5EVRuZnF1NZW6aBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475109;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=RBvnVcNyDPy2jbg+2CO4h/31R+00VEIJXbUaelLpP6Q=;
	b=QC4Od5IPCdiw9BYIoB/ilz1hW8YOKGNvO1qtgugyRbrtYYCyoLkB4IfweW+KthTr3RK1
	 4q4xBoZljYzgD9Qk6lHueOjXuBhTuX9HQS4/o6h0szNusvYoHvNTfP54yXUiHplYZ8CxJ
	 l5/qEIDjQ+6h9YcC31kdqsL+gEFXXS+CyRG4NN/QTDTHOVCwWV0NgxvB/s3evMDzM+4n4
	 rLIE6yz3IzW15uEtoyTRg4oItvE/noQyKl6XzS6xZTT7CDOj7KLHjy94qm3G5us9THCsP
	 ZCmse4tOMpIwQ1xdXc0f70JX41kajavGHtbwBw+PeSbbw57jBet11AoKkTOQaYdqJeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=none smtp.mailfrom=linux-m68k.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Vk8jcUbJ;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6CA606A31E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 23:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Vk8jcUbJ
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A69BE7A0633;
	Mon, 23 Nov 2026 18:05:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 23 Nov 2026 18:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795475107; x=1795561507; bh=RBvnVcNyDPy2jbg+2CO4h/31R+00VEIJXbU
	aelLpP6Q=; b=Vk8jcUbJhMnZxk0jtJlzAaUX0A9w4moWpDR8BTr5OpQc1v7BZ7k
	tpw+Z8MTPezKz/8AG/ws95/39OzlGp3hZSInvrvbT3kTn5j8xRiFy4TgBRcFRJHo
	qdJYrMGwAHAO9yPKgyXlAAKBAYRgfkDK5Wab/Sj6gdMZ9qa6yvZm8xKOBIRc1dQw
	KOEbbAnTnXp4qPWXDiYAT1iAYu/WK6Zkt1TeLnNx9J475Y8FQaaKpTI7iQigkeXS
	UkGGW/+y4Ie0SKg4JH9kuMA3JsN7ifN5dS8sFegM4OyxhfMu5+t4rtvonhSHTYHq
	/Dhj1Kzzz4rl8orSPs3i4HEV15y5FW3mH+Q==
X-ME-Sender: <xms:osYEa9eGu0zy5rDZzIpF17Ee6uJi2z4w7C6m-xj31i8HsWa0fiC5aA>
    <xme:osYEaxMLNMBGuKAM1BtIE-5b2rRomgdBalTU4uGDg4Fjv3f9qyowMrMNAkjDB2qBA
    V0UQHZiEt6O6rinC4yv6pr8ieAlc6is_6nZvEbzykQ7-_Bmj3o1goYq>
X-ME-Received: <xmr:osYEaxUyYNu3zQXMOiKcLQgBVjjySZTIDo1HEUlmkBsiRxUSLmYKfohge2sg>
X-ME-Proxy-Cause: dmFkZTFj8cQpLMgo8/MrajZhRcME6EZ+BUuZwW6Y59Xv7zUI/toTR2dglaTUfJQPxkzVir
    4aQOWtYh5eJ0BJjg7gk5xKv88gxEigcOuPF95e/tEPXIdcY3cCVkS1pjd+bq0pitdSJS3q
    uWLf9YDKf44ZzH7vEoFS95dt0bcvl+LLRFC+u7zt76NtXhVihMUK974Ad3eKNk8fWc+zGZ
    Nkn52V+ZNyfPLetCQ4YhRNgTqKJ7onI1IFnA1718Y0F+bRJHJpbOuTktjEUwSKLrRz4JWp
    /DVI/T4Yg/SxykZwVQyis3PCwdmTIOQ/yBfcYbRfzpnB1sge3t4QE8zE+aH9+liL1bwLko
    57D10mUeUaPcqMs6EYdQqHxY/HlAkVcJMetU+jTv6l7siuVta/h9Uh584maX9VKNKwUGaC
    dkld3GG5f/yUTrmtJLVJPWb1IcHK9ks+2Pk43YpL3/ATL44Q/CwafzaMBi8Ud+Hb8Dn1Qq
    dVgil0lCu+nlISzpiswwkEaViW4Jn+IKhICFEXb5ME0Uwe5Dslm2mSVEIbQMdB1Z7jJIKl
    gsk7SsSb00FxwcWBijh18p+yzUgieWdQnru4nbQJQ/NGCuXWi+lJ7unFXM3UNKn1PNCAML
    egm8mAU5Jdy/m9sQH2jJLWWbSXHBlCyhtv35PK2N+nw85i0MHTzEorW7lh6A
X-ME-Proxy: <xmx:osYEa5xBwvi6iirRatahRe4gJcSp2kQFUKWB3UeHgH4kRuSFfC4CXg>
    <xmx:osYEa4_Z8r49e8EI3aAVdENZZD7HxaRzasuAZk8ofjiuYX7KyKA6xQ>
    <xmx:osYEa--hKXGSP8Mm_elRXZmwsw5MYkR1X20wzdkFiO3MmMCAZDDf6g>
    <xmx:osYEa3Xw2Bd_XNLXdyDnxEA5iZNZIHV173o4swEKnorMYc-o3YO5uw>
    <xmx:o8YEawGfcQh_CaUjpgdK6vW3xCMlDtq_VJtDeD2we0_TG-SvkSkNOCMZ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 18:05:05 -0500 (EST)
Date: Tue, 24 Nov 2026 10:05:02 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Arnd Bergmann <arnd@arndb.de>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    "Martin K. Petersen" <mkp@kernel.org>, scsi <linux-scsi@vger.kernel.org>
Subject: Re: include/linux/compiler_types.h:631:45: error: call to
 '__compiletime_assert_433' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct qla_tgt_sess_op, atio) + sizeof(u->atio) !=
 sizeof(*u)
In-Reply-To: <CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
Message-ID: <669b9ce8-bb33-f7ee-1087-88c1e9d3b610@linux-m68k.org>
References: <20261121034304.2dPxVKzk-lkp@intel.com> <0b947a72-7a68-9bde-8b0b-adb539f09a8c@linux-m68k.org> <CAMuHMdUxYwD2t8zrqs4QBCtATOtf9xE83Djo0g7qbNFGSCWAQA@mail.gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Mon, 23 Nov 2026, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> CC scsi
> 
> On Sat, 21 Nov 2026 at 05:10, Finn Thain <fthain@linux-m68k.org> wrote:
> > On Sat, 21 Nov 2026, kernel test robot wrote:
> > > FYI, the error/warning still remains.
> >
> > That's because the qla2xxx maintainers at Marvell did not respond to any
> > of the three fixes I sent. I'm not a paying customer so all bets are off.
> 
> That's "[PATCH] scsi: qla2xxx: Rework BUILD_BUG_ON() assertion",
> first submittted in March, right?
> https://lore.kernel.org/all/4808a5dc1a71528ffa3360868561009744277450.1791502886.git.fthain@linux-m68k.org
> 

Yes, two alternative solutions were submitted in March (either remove the 
assertion or rework it). The build bot reported the problem again in 
September so I resubmitted the "rework" alternative. Sashiko-bot didn't 
have much praise for that*, so now I'm leaning towards the "remove" 
alternative. I have been advised to keep re-submitting, and I will do so 
after a suitable back-off in retry rate i.e. 2027 or 2028.

*
https://lore.kernel.org/r/93e35f60-e465-7f76-0043-f997fe2ec8c7@linux-m68k.org
