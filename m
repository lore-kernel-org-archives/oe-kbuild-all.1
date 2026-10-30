Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395185;
	b=3J8sAEGb0d3yH3+0wG/ARC9dd+cMLBwMZiXspf7/asdB0JPMS0V2l7YKAFPfYHnIgVHU
	 mxD73v5B+LsWg2rbaFVSQ+06eAnh2C+d2FH5oZCS+U9deaCrwtB6nSFTZmoRd79NraJ2e
	 4Q97om0u6c8PaZRoIdojbmDNM0LMWOYDLcqsrWKwAjG1erkfiJsTirO8+ph7DoujpHaVJ
	 h8XoEg8BVMTXN3+tp1nzW5sygXkSS/GCqkJ5/EQe5U6yPzLs12nBe0kQ2jYJYIN6RSd/V
	 1a+g+27itFm52bUmj0pzVpj9FaOvFpNtBNbBIzdJf0kUys8YeQ/7rOtAijymZ4zBGGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395185;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Dl1LG0Y6RzLXrRfxv+91NkboHhB++1KT+VI/hXOnas8=;
	b=MvLTxm9VeMK6IhUUwIoPCr1o8aFXqLLNc2RwVeODAk1LnubuvZXg44svD2Lj93jjEtY9
	 D2VEcQP5nHUQX6yvd04qEwJAvDh4uFd4Xl0hy5mw37g8DGG5Ii/s9She30ynCb2KuPFaq
	 BJs+ayeJ1SDRr3bt58NFY3KcauLu+M2RMef+wklzenVXypyjbYjJbZd+yHL1b17CNMK91
	 XdUTyMDPd6sQaVIyBvKKlF18ZtTr7OVolPRXfGslroaLRCVKAQCDeysvZKEWuL9LfolbZ
	 eSqOUue3MMRteOfANUz6S+oQ7OiDNmu6WTUNoKPL66vpmJk6quyPVIlC929LMgLtecA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=R0EhaWD0;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z5yTrlF1;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8860A2614
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 21:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F8860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=R0EhaWD0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Z5yTrlF1
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 5F52BEC016D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 17:19:43 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 30 Oct 2026 17:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793395181;
	 x=1793481581; bh=Dl1LG0Y6RzLXrRfxv+91NkboHhB++1KT+VI/hXOnas8=; b=
	R0EhaWD0glqlAYetqHP9Ja6C96jrEhWB3wSZI6VzNiuoTCCVXc1UHwaebnK1IyEg
	79WvABcWEArSQxpu6b78zF255M6ugNXSMqVdDxL/SILxJ6jwe9FbgBcyY1vorJGm
	5oRT/BVLLesLLVLgD9du0OBIrTb/kjEd3Gr5UtKkfwqabnIbtvuz9F7tR5hIoj1u
	MHm3wY/bt/EgDwlSO28yrxPQP9dFCrbgKkwqOXcGeLGvmWzWMROzJL9dJGoFHSwZ
	OXDhiSXj5QLS6Z5a65lqQh3aQ54erwwOdkCuvqghX0ropV3HQcy9Rg5/4UAKkSuS
	ABtER50GX5LBpOnGEYZO1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793395181; x=
	1793481581; bh=Dl1LG0Y6RzLXrRfxv+91NkboHhB++1KT+VI/hXOnas8=; b=Z
	5yTrlF1K8Bx+GGJh3vT+CRDs98zizzfvz2L2qpP4P4nHhsoQJ1BOfwEm35tmpYSx
	Ci6K6fNr8CwdmPcAIJG7c4ir1XYUFTRHtznTw8NH4K6ExPS3LFEVzO8t8R+L/kvH
	m860SMVAoEJkL3AbZmiBO1VjMKr4R6t3AoWY5LS4ZcinjMqLU0sZzrzfhIAm7wBL
	GZk0utE15f9crwZKGGAD1B8kG5QPS7Qfo1gzIR4dlfF878jR/2dDwRKXHvRgfa21
	LvhnjME+dWxCDgmPXggltKFVQskZ0mlF/9Ck2Ouh7uIqqCnwEKM02I5qXegA8JJF
	uKPx/ihSS5JWMEGd6nLzw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793395181; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PG9lLWtidWlsZC1hbGxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:l6kGGbJj81cT0UnomHQrbY0U/wdnFsUZYvBykOEtLf0/YAP
	8lgiAIqgxviYsTcOf8LM78N4wR6z0kHM/ju30qfCtSW132OCZ+7DxIi6HGZDSnQT
	kS3In6BJ0MFUP+ucoMkPtTQeXaPwBK4BZ0176iudVU5tcU155vHKWqcSuA2sreb3
	dgw3ZTEEHpfWqwJDPlWgftqLR4P6HLTOgbXx8sTVKWzNApXNkT2U9S2m8Gyeiaf0
	aKNaiU7kfKgz0jccEfWKHVOE9if6Y6aJ/SLLuKmEfQKXtcXznC6j4HOTMH3yEBDx
	xN3Jtzh85s+6PPshxom08ClBKp9XuQEo6kB1xWA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GhglIsL3uu6nEtiuA3MobcUZlxx1huwAF0Pf5N1Xnl8=:kTM8AS4UB0+gUZDZkMLnPfvC5c9V7l9e1Y/veHALxpU=;
X-ME-Sender: <xms:6QnlameD8brMS30tx9lsvkhYNLC2YvuPbr6p33PgT2O-WgaomGgoIQ>
    <xme:6QnlarBQZuWSubC8k7Fuk93X0Yb2KHi9_Ar3ffCzN0ehd_zd--xgLqbeundl5UM_O
    lBYVMwvcG2bFRPCmP0_g_foJq7yNRMPkz-ImjxxOcwQ0NXrSyUr5Yn4>
X-ME-Proxy-Cause: dmFkZTEHE8Apd9U84xVPbS3T5EaOX9zQ6tn1ko49jsbH1txIARGoXweFutRVrEw7AYzJ08
    KdP+z1OcfT+37axmqkfNpq90uZK7KBIHNXyKuXnVEpI/zNRq+NdpIkFfd6ouHVC3oJybgo
    HSsgLKAgakHTS4fQXyu4kJYYt5nJMx7B75q2L3BD4QyYDI5VUqlvTZZnXCWIR6HPg0K7tt
    hbHy72G3HYu21HXWR3iVtVPPuzK/mL3U1MTkdN7stwm8O0vqCYepocQQ3J1qbzoVxD4iAp
    +6FsoDjfuspqqJ6g9dmRYP7Ez+gzmlC8UzVcTfMtpAimvCIA/aKUrLQ2INAlrZWMk9xIM5
    WqI7L07jNXSpaXvsE78C9IkoM05pGRsnTS/ULlWLQ8jHXhOA2hNkvVzQbzbH2EKDcEELXy
    q/U7QIFb5fy1XblL0BOwkX+Xz0c2xi+SuDBbW92kx9D8RC7eoDXIe8L75JvSN3ymIGYhb0
    GdceRtvRTgUyDOLCpBJLN4aHWRx9bzHkizPpb8UUwAHxnQDbscbSpewGvx2UHQdkGz/71f
    GkbnoyFBtmc9KdZ1poqniQJMS4qnV8vZ1RkhJfA8xguCnrQ98bzFgdKkY2b/T7CSTvE+UJ
    4dfCv97bEE2dAj58Teh+PyPLVN3lvjaIceYZhoyMq5kW2xEHQazLvUigf/8w
X-ME-Proxy: <xmx:6gnlajPxCt9_R_bYbqEWis8dwI2RpBG7say7iZSKuSHVwGl8hRpS6g>
    <xmx:6gnlaghlFJTerTIz5k4_U3gSOtn1sFHVchvK134QSnQvbsJRKbCqLQ>
    <xmx:6gnlal4J8vknUa5xET2pCJIvMrmdUyNgkm4l2HQFi6_EIvkGKYYySw>
    <xmx:6gnlan0mrRQK5xaWWO9Fv_C-VM5D0QrBEHdSq8ZYgLEJRae4vrOZ1A>
    <xmx:7Qnlavni9x1lDrdOtW-fq4JXnf7anM6j79YhzEloMB_8bEim6AGel6lU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3280032A0093; Fri, 30 Oct 2026 17:19:37 -0400 (EDT)
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
X-ThreadId: AA4M8BakChSJ
Date: Fri, 30 Oct 2026 22:16:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Huth" <thuth@redhat.com>, "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Message-Id: <33492528-ecd8-444b-a42d-d084857a57cd@app.fastmail.com>
In-Reply-To: <5f898f0f-915c-4aef-a3f9-0118f4539951@app.fastmail.com>
References: <202610291918.kHO0GTDB-lkp@intel.com>
 <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
 <cdf09fa3-e251-4d8d-9f0a-316998df036b@redhat.com>
 <5f898f0f-915c-4aef-a3f9-0118f4539951@app.fastmail.com>
Subject: Re: [arnd-asm-generic:asm-generic 15/15]
 /usr/aarch64-linux-gnu/include/linux/types.h:12: Error: unknown mnemonic
 `typedef' -- `typedef __signed__ __int128 __s128
 __attribute__((aligned(16)))'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2026, at 19:23, Arnd Bergmann wrote:

> The idea sounds right, but it doesn't appear to do anything for me,
> I still get the same output:
>
> arnd@studio:~/arm-soc/asm-generic$ make O=../build/tmp/ ARCH=arm64 -C 
> tools/testing/selftests/vDSO/ V=1
...
>
> It looks like tools/testing/selftests/ is built in the source directory,
> while the 'make headers_install' installed the headers to the object
> directory in '../build/tmp/usr/include/'.
>
> I have never been able to figure out how kselftest actually wants
> to handle this.


Nevermind, I figured out that your fix works when doing
'make -C tools/testing/selftests', since tools/testing/selftests/Makefile
is what sets KHDR_INCLUDES. When I tried to use 'make -C tools/testing/selftests/vDSO'
the assignment gets skipped, so I got the same error as before.

      Arnd
