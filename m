Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DF833D6DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088034; cv=none; b=CHmHvd3uOqhAAY7eFnNqGTW/oFEZOAdVeDK9NKOBY7JX5dHhYMuInsUZanzaty0Iejooev+nKuh/Szmv/ZTEoidAZy16hy8uaxfNxXHOq85z1kyYRSRjj07C8tPkyFB6x7Rpd8J+4JjCwHsvuk9TUly2DDLyvk+mp2JYzsfJMbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088034; c=relaxed/simple;
	bh=Er+bwVJvUORcrhjkZj6p6phvcnIhk1nNK696B5A9Rts=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gfaQfJ9PxB/LcokJeM1uqFGsYzidB+fnDEt5G0Li4PHwPMXK5XfiTw5JkrYJrgaq5ZH/1Zj5/5KNzWFKWK8Ni5rvixtpiW8cJhxIqx8j09XosBF+lk2VNR6wzNVzOz/osFXrqvSGJvTRucx//0xGcTD/yKb2rJEXU1TDXhRFBSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gKTtPxIV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ijKhr3zm; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gKTtPxIV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ijKhr3zm"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 008067A01D9;
	Mon, 13 Apr 2026 09:47:11 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 09:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776088031;
	 x=1776174431; bh=e786dQaJprpDQxHDkNFqdM+3LAPWsUFNSC4gHleNVcM=; b=
	gKTtPxIVaJPLsBWN2B+vU9LWOETv4Ev++ds2Ebm9+MBN6Wz/oSzWp2aOifpmHZje
	cgIW34hDiNPGCPBxjhu4fF6FPHY3ikfB/km9pVdhEiBgB+AFbdwZJPi1I39yioKY
	yOF39axRgkddnOwzR7zQZh4WD/Edj0TGDDy1HnV9lhrj1sR2KDZAl/qTu5uRNGf2
	2fFncA7y+ydCYHeSk2v3hIQwkrSRK4F4qmU0Ir2ZMEmvmDevpW/gF8pvKPOQr2lM
	U5xW5rNk5qbAxL4pceLzBhiLwgXcgo3GwcUOiNAFxKy9P4gDwRgXFAGELS75z2Sp
	218mfuzEbxC0ZTVKl+dZKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776088031; x=
	1776174431; bh=e786dQaJprpDQxHDkNFqdM+3LAPWsUFNSC4gHleNVcM=; b=i
	jKhr3zm6LHwOIbCD0VJx9tafdWqNhYzI6fBpApjgmIylMd/rJlpKSSZtKhOC0+YG
	+rViouN3RQlK330NdHJidbi+7+BVspAOo9xPH0iXEaA+J5MOGCAzBxVknu9TebPd
	WyUAlXnIsiFCXJWk+G/VjYmMmXmpTXdjkYpxZLBUvpk0Bu/PXH/GQk5gxl3G8REu
	yNkRetFL0xnHaQ+Uol/DJpBGo+IfbiCs9bNYBbSjgWKXl32DzU5eXWaKeo4nk/UI
	dpJjC6U4xzUiJ72PvaZOLRChpSLpjb0jaU8gizEHtzeklu5PHZLrpq1hexrjjN0p
	pRZPSDddMlMrUAghCScWw==
X-ME-Sender: <xms:3_PcaU1plZpCOGgNzl8uZFx8Bzb9SezJ-rNbdelJkBoYZURWTQAc6g>
    <xme:3_PcaZ7Xw8JKatwxqzs3hyHtN63oVLKbD_ww_IM1dngAgSlvCVjQEZlkeXZBSdJWx
    jGjotIErIygpMc1XXI327Tux6-63hd5CW4Biq__SWBnpE1bUFSxaSKN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkeeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegurghvihgurdhlrghighhhthdrlhhinhhugiesghhmrghilhdrtghomh
    dprhgtphhtthhopehrthhlkeekvddutggvrhhfvgdvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuh
    igqdhmieekkhdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphhkshhhihhhsehrvggrlhhtvghkrd
    gtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:3_PcaWdjoeP3eyA8gxKm5FNb1Wej03TVznXeiGlmsIhnBmBXlIyofA>
    <xmx:3_PcaaQ8RzLfzlhi-6LLnnDPI5fcgZdnio746WrDP1SSC-8ep7IsMA>
    <xmx:3_PcaXaF2vsV3VCrTpi7bNyeDujR8jTDrq5sjRwkolWR4pJ7SW2g_w>
    <xmx:3_PcaVfSI3vDe9aM4voXAGvwLIv--lh0JUxRfl4vf24yQcaTPeDlkQ>
    <xmx:3_PcaT0-bUA6pQry9ZnznPc6Kmbi-SJd35KkgI3zNxELcQN99ko2HHX->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C9C7700065; Mon, 13 Apr 2026 09:47:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AWTLBUgPHbtJ
Date: Mon, 13 Apr 2026 15:46:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Laight" <david.laight.linux@gmail.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Ping-Ke Shih" <pkshih@realtek.com>,
 "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
 "kernel test robot" <lkp@intel.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-Id: <6284c801-e378-4861-9c1e-f167bc14ef89@app.fastmail.com>
In-Reply-To: <20260413140109.2b20de7c@pumpkin>
References: <202604101721.fsv5XmCX-lkp@intel.com>
 <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
 <1e02bd10a68747f4a342caedde76ef04@realtek.com>
 <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
 <c09417ea7d534e2c812d470bd166fa3a@realtek.com>
 <CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
 <6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
 <20260413140109.2b20de7c@pumpkin>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 13, 2026, at 15:01, David Laight wrote:
> On Mon, 13 Apr 2026 11:30:25 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Mon, Apr 13, 2026, at 11:15, Geert Uytterhoeven wrote:
>>
>> Annotating the union as '__packed' is the correct fix for
>> the theoretical users of OABI, and does nothing on other
>> supported targets in Linux.
>
> The other option is to ensure the specific drivers aren't ever compiled
> for !CONFIG_AEABI.
> Then it'll all get tidied up when you remove it.

That sounds like even more work, for my own testing I have
just stopped building OABI configuration altogether, though
I'm still testing ARMv4 kernels.

> I read that the patches to remove 486 support have been merged.
> I'm sure it would have made sense to drop everything before P-Pro
> so that cmov can be used.

That is an entirely unrelated discussion of course. I don't
think there is any need to discontinue support for 586-class
processors (Pentium, Pentium MMX, MediaGX/GeodeGX1, AMD K6,
Vortex86/DX/MX, Via C3) any earlier than the rest of the
x86-32 kernel support: There is no practical difference
other than compiler flags, and the Vortex86MX+ is still
in production (originally released in 2010 with a projected
10 year support life). This is very different from earlier
486-class CPUs that lack CMPXCHG8B and TSC.

      Arnd
