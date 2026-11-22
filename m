Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795389904;
	b=d0/we+ofbgagWGE1gNre/ed0NGh5b2cAK23wIk4YqcfD0JRrOpQ5X+WZJ1QCCFVhC0Kl
	 DR0kqcY1LgjJ03K8c3Dn/4OBS9Fl+q2iKboJvL3uu3MC1FPAn60jFtV0NhV2pKsV7w4+M
	 wZoLzHCeTiOZ2Xe3psx3JEf3a08W+0NUcdUcsWnGTgVbQwdyBsaMXzUmsvma8lY4rwvUa
	 QWd5FoHXMSLQXKLP6qJW25FScAivKUqtP64E09eH2SALZ9SnP2njtNA/k2hFXAdbGeIOr
	 cl7AWQiRWoG6hLPI5Tc7qiKAFC81K4tX+cPfqgKAZR93ffJGeo3vRieEVAs3NrZsttA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795389904;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=cOQdCwhVkAoJA2pStXVgauJBpDSTM6O1UgNedxKIlwg=;
	b=Levbmdi/5DI1WK0HHfKfuzyliGcQCDz2EQ7p2cqQ83ezP2MqeTdnyucsr9XSN7IiA+59
	 uk7O1wPyZZo6lCZzABm68otCJUfmEF4JhCIbi4gcC0WRbAB1dGAiRwpUwarFQENK+gT23
	 wXyah1h1CtRb5BitNclN50IRakJAgq1DXlsuDdqs+mTeqUN27CIf5qPDbjdlLkOL1Th/V
	 qH6V54U4Ikr5RjSgieiKstok6ReOYtE+KJrHwOeekMBbnUsDXKultFKOH4NbCNBGE6Wrm
	 /xpvYAFYtBf1cdWRfyx5BCzdKTBZkBwRs95NJJcDznVtq+HohQzPPKJhmr6Ku2RNEJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=L7IbdSJq;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WOdYPVB1;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1887606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 23:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1887606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=L7IbdSJq;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WOdYPVB1
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 623FF140003B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 18:25:02 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 22 Nov 2026 18:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795389900;
	 x=1795476300; bh=cOQdCwhVkAoJA2pStXVgauJBpDSTM6O1UgNedxKIlwg=; b=
	L7IbdSJqUTLkPoi2ujiG/tNloKUoL8tvTbC3NKcDaLGm9OaqWV1KT3zRjIxOQ7eJ
	FUHzu4lZT6pGGj4ivqIGA+YqeP89PZu9P0XUo9hE3lFL/TDhFnDXEvZEMVw5Jly+
	ZMKOnAURn8IMYs5Jcd/l/jCupXlr4GpL5SCMq7aHR5JouUU0qOx/6541fVEkKoH/
	1n9L+3bHBssBc6rLLrGIPv8CEaK6MIAiK4ltX/T9XrJDZoQbjI7nvON/VDoiSuhm
	Pu1htiBaSPYUF0HUM3sg/0bxWqHkZRoyJmqwPfpNmx56KcU02wEleMxbD7DI+7uW
	7gPH36nza35arl6EppuWpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795389900; x=
	1795476300; bh=cOQdCwhVkAoJA2pStXVgauJBpDSTM6O1UgNedxKIlwg=; b=W
	OdYPVB1snJ0EVPopgPYWUBZrgsRz4bH+Y5gQzAZNxhs1zPPEmVofiPokOWOpUn9U
	Y+JQH3gSjk+nH2lhJJXsN8D0tg2zCqN9N/j/V9W+2dMHL54x3nqV5avkxyuke0SI
	e/E/V+MoIt5b8W121OGGgNzW7LCHTpWKej9VjrwiP/fZFiKbLz40o1d3+BzJd8dX
	ujO9jEls+PJ6DjyqZFQ+iKu2kB58e//02+YHMeaf4LEallyhLd63juaANBEvgYf/
	5BGwn++0iMdz6NSugGwRPx0GzlNK4+ChT0lmG6DtovxXlddl+AVwtTW8VV87EKes
	SKMVEoXWgyQLwYdszqe2g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795389900; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PG9lLWtidWlsZC1hbGxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:kZdBP5RIwkosXy4nPrt9O7sHd1jcptOhZO4OkblF/b20wAo
	0mLK9AhcMDg70En1HDDDd67Gqh38mt2aHISxQacQ7v4GQoKqC00sWR3tFj+B1V66
	Zywj10smIV/jc6ghBYJMfzAwV/1B0TZSTwiMJa/CHS5s06vAiB+C2OCTD1i1x750
	zFWy46/ufvWGvqekkAxf6hrKheoS+hawDbJ1BpfrYiW7LeoGfRvZn5aXImqdAtae
	rxjiI9ENNumFrm/kVKdNf+gXfvEXa8Tee5ADu2eIQk2H8oeubcs8ofMnQAN9FEfY
	sbB28YZNAL1K1c3Js+94xxdEZIT9uqwZw2fD1rg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:9/XNgCwS/y4FKhXxnXNzTWsfBRc+1aCL0E+uocRtTD4=:rR626zSvfl9NlqrU46cDXjXrqBcEPV7/iyB6YNZFfd4=;
X-ME-Sender: <xms:yXkDaw9YBCcKVY3I4weCgOdrHUfeQG7CUA1LIEaQJ7bA8bJoz6ZZxg>
    <xme:yXkDazjMWY-GQmuOfCaF7W1PRFTTWl66IP_6CHrl4Ihb8Uy4ZDnvh6O-fJvxSfqD0
    991LrK1oeYZlUaXEJG9aVZZPyeriJKnUhnHFlBdfJe98W_Q17wZ7hPe>
X-ME-Proxy-Cause: dmFkZTEXWVeCuemb4iTuYd+LaUPI8odQufbw5r3yfmXbSglGVJ58jQZIZGoX6nwJuGq9v5
    +kDcMuibiJphUbd2y06pcOCqgFQIckN5C8mfMplvrWUVcuSuFj3Jon4BFKzifjA0bouJ36
    nmD+xnuqaTy9YveUsiMivGJJteCLUWwseBNMp+7hQ70NKyp4Urkt4RV7eo0FsKyrHj2u7e
    zqxX2tuFbmXSIzZGsWbx+ORez/rtwceMPx0Ild8Hl7LjbX5P9+JvLKYQDG2gK57BKkzOR7
    15//zvVyay8kM+PIcnqbT6MeqIwgCkOk2hsPuexdTProPMhwIbJ7tp78suWQBq4xOfi0Fs
    KMwd0sjGn98lbbxq/qpgzLW7ERL27DHAf2z3OK0Yq5lIEG6QHzy9RsggRQOnMDOBe5FsYf
    umW9OJlA21xJ8yiz+Lon/XXifKlPFpzPwiTw0Am9298iN5I4MTt+lhcpnQDVzOAO/uwYQn
    pxC94Cj298pn9vOjL4My/Vkwf/pRZCmuBu4EggO4xNlo1TDWXaOqQvqIcCAled8HxRaPOP
    209z4o1bRD1Ii3JCAxCWnveFaU1q385urAGsqaBTw/iBeEFcsow852oQ6E0f1r0zKW4Whj
    E30O/OrtDB8WdFafg6l3Icd6eHzodjdywvTD/Z3kgQEVV5wI/qjyEzu9ZpGQ
X-ME-Proxy: <xmx:ynkDa9Hp9kM7junHBcxHnxqez8HRPi5Q0LnEalDH7FONmyLUO-MmYQ>
    <xmx:ynkDa9yhdd8bOt8kQJIGe49hOm49NNoYDLSXozLD4sEZdbk2KCX1Vg>
    <xmx:ynkDayqmPFuHaJkQ_uOZb_bfTB1uTUsfCzj72e-JQ9cCKykfipBGzA>
    <xmx:ynkDa3hiAQzWdFMGaouavvgbj56QtTF87Z0TPSmcds3XYwX3V1BASQ>
    <xmx:zHkDazW-I6pl5Ex1zV90IOs4IfeiRIlFaKR-4T-W5eW_oh7Q5_yyIbOS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 26F6932A0099; Sun, 22 Nov 2026 18:24:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A7YRnwEcAcgN
Date: Mon, 23 Nov 2026 00:24:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Message-Id: <57a96de0-6990-460b-9a52-3e38f6a0beaa@app.fastmail.com>
In-Reply-To: <e96c9d87-53e6-4e82-9502-40e86bac3edc@kernel.org>
References: <awDriH64LFbN0dkI@rli9-mobl>
 <5d49465f-8584-4e75-8973-9fbf326bce58@app.fastmail.com>
 <e96c9d87-53e6-4e82-9502-40e86bac3edc@kernel.org>
Subject: Re: [linux-next:master 8956/10560] main.c:undefined reference to
 `__st_r13_to_r15'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2026, at 00:14, Vineet Gupta wrote:
> On 11/21/26 02:18, Arnd Bergmann wrote:
>> On Sat, Nov 21, 2026, at 01:53, kernel test robot wrote:
>>>
>>>     arc-linux-ld: init/main.o: in function `__traceiter_initcall_finish':
>>>>> main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>>>> arc-linux-ld: main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>>>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>> I've managed to reproduce this, but only with gcc-12 and older,
>> not gcc-13 and up.
>
> Thanks I was trying to do this as well, but couldn't since I didn't have 
> an older toolchain handy.

You can always use the toolchains from

https://mirrors.edge.kernel.org/pub/tools/crosstool/

>>   I also found a workaround, but I'm not sure if this
>> is a good idea or not:
>>
>> --- a/arch/arc/Makefile
>> +++ b/arch/arc/Makefile
>> @@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
>>   CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux- arc-linux-gnu-)
>>   endif
>>   
>> -cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -D__linux__
>> +cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -mno-millicode -D__linux__
>
> I thik this is the right fix.
> Ideally this is only needed for OPTIMIZE_FOR_SIZE, let me send a v2.

Ok

>>   tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)  := -mcpu=arc700
>>   tune-mcpu-def-$(CONFIG_ISA_ARCV2)      := -mcpu=hs38
>>
>> The alternative of course is to include the libgcc file that includes the
>> millicode helpers.
>>
>> I also came across the "-fno-builtin", which seems like a bad idea because
>> it prevents a number of optimizations. I could get it to build without the
>> argument using two oneline changes, but that doesn't mean this is correct
>> or complete:
>
> I don't recall the history behind this is, seems like its been since 
> since th eoriginal port.
> I can do a follow up cleanup.

Sounds good, thanks!

      Arnd
