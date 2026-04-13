Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06630F806
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776072649; cv=none; b=Zmx5UB/1vU5uPMlvm0zDJM6lGYpByi5NMUoB2Zwb0lvfjo6x7sn94BwBMuDuSqvNZ2/eO3bwgWp4kq9tVV8C99QDFh9/z0VwGYkhOV01Fn8dDBUQ7EYgtH9bkNLTZa67JJH2YwGzv7M14q8+SrEZ0HcVIJmXgClmJ2AsshVppcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776072649; c=relaxed/simple;
	bh=K7Xn3/0UQ1u2sVFIXSZH2D76tXqSXKQ8P+NDYOlWDy4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DyGqn75aTz28YsythVaeiS46eAk+fkFZhKmW+QwH2kCzwGmMI0Qub5ZpzOrG0mL5vL/ZyY3Se99/D1ykqkLYhRtfXm05kD6jDTCjFmocEk0tH762xF9p++3HdJSl+Akv53QnMFmB29tMPSEwZ8gWWtMYDkGTF/hNVJJkK8xyr60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=olMgBw68; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GQqlRipT; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="olMgBw68";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GQqlRipT"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 861FEEC0433;
	Mon, 13 Apr 2026 05:30:46 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 13 Apr 2026 05:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776072646;
	 x=1776159046; bh=6LbyEM/XQirQMawKnSY6R8qeS1kJs5lf05aFaiBtCGA=; b=
	olMgBw68ALEC22FtN/ID6EuziXh/MI8KKz5+JwV9cp1znR9E5YvFoSMqwnOGD67z
	Vx7xYqdYRwIDnGN/M1ho0nfqrupyrn2b81AP8iiKgMtYm2/Gz5aGHwtJMbEVuj6b
	031+xBaC7R3ToihZvqPRAh3y7gQHCCKgt8wrwxSoQW+QXLNO8uB2J0kVVhKbN8HL
	AKqT5JkAsW4Fl2RKPy3zOnQYwxKB+Ze9Zkxe3AG8ZewfuD5pbbvos37uYxspMgef
	NK+KclWjoX71mVZYQEO0PxfMyiWfG1ZTOSD15Bppa8F4Ek8Qo0AfZJzwsiMLcePR
	BJ2iK5ErW++J92TTvEtggA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776072646; x=
	1776159046; bh=6LbyEM/XQirQMawKnSY6R8qeS1kJs5lf05aFaiBtCGA=; b=G
	QqlRipTqN3bUqGH1ae40E0IeMlW70nJ2d+LOAQAZJewb6cxStFSw+xj8f9CWLMj5
	RjXvqAi+sEbIUgScs3hW6C1gW8C+PMBpcl/3VN4vJV6YnrCRRhW26X2zj8T+zVEa
	LSt/gTB8hgbx/QTDYgLOcrgv1Vs2PlhnGRygBDEiQtGKa3Gk39/9U33rpFBQREPX
	Zw+wwoiCr3qGLNThVUwYtfqISiJC9aO4lAK3cNxZf+9LSljyYi8FJDMKGuZko2IQ
	xVpSAhJ+NYoybYdU7vBTcb6i8B+yddXA6E9cpfQFLU/W4zX+KlJK0JYs2MTaV00W
	X9Sy5G5xmLzGq3hI8qPgw==
X-ME-Sender: <xms:xrfcacTNOi3KiLHLo7rZlrwqV9cq4qspzv25L2nskWC-gwucKlJECg>
    <xme:xrfcaUmIJpsL7KxyP9jvB7pv7cywTOZbYHEv8I9yXFeyniMq2GV-gBF_r6lM00902
    --uLJrslukQUeT1o4DdawImkOr1rVng4vge2hMAx_BaWMoyiXTLjxD9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehrthhlkeekvddutggvrhhfvgdvsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhig
    qdhmieekkhdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepphhkshhhihhhsehrvggrlhhtvghkrdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:xrfcaUSnt56-Btq_mdMa825_m_GDU0DSat4GhnHImwf6w56_KXteaQ>
    <xmx:xrfcactuWU7zYvScheE_jCDnjmhHwgn7pBoGQF5L2YAz-Fps1Ic08g>
    <xmx:xrfcaQ0Fy_CtsrQzTBHk75tF7CKE4gKKhztJbO5UCK36b3ua6UvoPQ>
    <xmx:xrfcadXYxNkNWNysyR1OWWJZ25Nefxq-ogV46zTOL9gtMnIIiwiiRg>
    <xmx:xrfcaS9vcVbVsPiYXrNHdspT9yz9r1HY_A2JOmr4nwyd1WTsJ2oJBP1B>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 25A8270006A; Mon, 13 Apr 2026 05:30:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AWTLBUgPHbtJ
Date: Mon, 13 Apr 2026 11:30:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Ping-Ke Shih" <pkshih@realtek.com>
Cc: "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
 "kernel test robot" <lkp@intel.com>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-Id: <6b6310b8-2b0d-4390-992e-5ccd81cef2e0@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
References: <202604101721.fsv5XmCX-lkp@intel.com>
 <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
 <1e02bd10a68747f4a342caedde76ef04@realtek.com>
 <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
 <c09417ea7d534e2c812d470bd166fa3a@realtek.com>
 <CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 13, 2026, at 11:15, Geert Uytterhoeven wrote:
> On Mon, 13 Apr 2026 at 02:48, Ping-Ke Shih <pkshih@realtek.com> wrote:
>> > On Fri, 10 Apr 2026 at 14:15, Ping-Ke Shih <pkshih@realtek.com> wrote:
>> > How can that make a difference?
>> > Both rtw8814au_efuse and rtw8814ae_efuse contain just (the same number
>> > of) bytes, so __packed on the union should not make any difference?
>> > Moreover, rtw8814au_efuse and rtw8814ae_efuse are already tagged with
>> > __packed, which should also not make any difference.  Someone's been
>> > sprinkling too many __packed all over the place?
>>
>> I have similar thought as yours, but arm-linux-gnueabi-gcc compiler seems
>> have special treatment with union. For this case, without __packed
>> the offset of followed field res5 will become 0xe0.
>
> Hmm, I can confirm the original issue, and that adding __packed does
> have an impact (it reduces the size of rtw8814a_efuse from 522 to 520),
> but the actual size is still wrong (should be 512).
>
> drivers/net/wireless/realtek/rtw88/rtw88xxa.h has a similar issue, but
> adding __packed does not make a difference there.
>
> Removing the __packed from struct rtw8814au_efuse increases its size
> from 14 to 16 bytes.  Looks like that ABI pads every structure to a
> multiple of 4 bytes?

Correct, that is a unique property of the ARM "OABI" legacy ABI,
triggered by this defconfig line:

# CONFIG_AEABI is not set

Nobody should be using ARM OABI any more, and I think we should
remove it from the kernel once support for the StrongARM
CPU gets removed (I have patches for that), as those CPUs were
the last ones that regularly used OABI.

Annotating the union as '__packed' is the correct fix for
the theoretical users of OABI, and does nothing on other
supported targets in Linux.

       Arnd
