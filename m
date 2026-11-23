Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462138;
	b=DtKqn8lP8NBTnnhPazTHAO/tbhTP2dSJXmZxZccy7pO8OABwU6N6UWolp/AExRlLgqTy
	 AJG/bL2wuKnNfDCik/0mfzosDJoBTT6RuWiDwN4iI9+jSXsRKGWnYDYjRhkgzlm4nfZ9C
	 fikKKe7bevQXurbAhV1yTU4EbKgMKd7eSH0AbLt3YkCWsSPX3B2TpBxThFKSmryOXsuBu
	 8Iw7QheRIuelC1xtA9xzcvzbJjPOQCZrk8E6e2dtL6L8HtHbLJttGoSr+bo2X9gMMSJTs
	 cZnjOL98cBQuB3TfUKH0QZzkCxVBo4XR3aP1T4/xXQ01mBHuqVAuZZtvsmP84tlFJNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462138;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=nv0+8UEgrELVnU1ZhVBht+zjma7q9Jj3FV0ioJuc72g=;
	b=jJbw5Qb/TmzKUmyTw9b2UPkX4kEUnYG5y4ciC9Dc3lOa7fxOITjBH9kv/ahl0UxThxnQ
	 hnW0vWxc8MRsxs6oL1g6nbEIpFJKEVXbq+OaHqyoJmAKwKCSLva/7yoOm9SvtWS63Ycx9
	 SNyCL1HaXRrqJAkDz2lFApkWx2nflT1vflq+5Au7i5+blFULqfVGmCJz62BEYbqKmK9fI
	 mZgXNwFvysptpy8CtrbNgdZkHK3sbJFVgJStb+O9ffKHAgY9b/p0ijgrH1x+WpY3cVWX/
	 NY+x/cgwbo+ZZrJGRN0qpZ4qOIhQ3oCVK/URNSsO/lfl6LU5ZfUL6Ok6Q+kI4Z1nE3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ASgseYht;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UIMi2vgb;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1325606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 19:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1325606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ASgseYht;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UIMi2vgb
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 85ABE140039D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Nov 2026 14:28:55 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 14:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795462133;
	 x=1795548533; bh=nv0+8UEgrELVnU1ZhVBht+zjma7q9Jj3FV0ioJuc72g=; b=
	ASgseYhtEKDnNbDLWk6YO3GbQWcBQQxTJroiFdL5lXn26ejetWWTqhTl0sbBCikw
	LSe2YwYdj82ytnHszX46V2eSf1D74RSO2jAvbD2pfRnLSox0cZZ8Kf3qOf+fRDxC
	hlf/4TF1STJH8wAFxSlaaOtYGv3EXR+5c2/J3A4OlcQ0Hf+1s3ddfH3dZlkT4tW2
	53HKjyKvzyAkKt+QCqewm9aIQ4i4fCiwN36LNdAVHXUGRH4wr2lkzltGEJxOVwb5
	BpnpjMl3BpyghAnzHXVLx3kVslkrbKn7eSEIvBhp77DzezoNfIx22fbNl7yUE8mU
	+E01krMAtay+fPE1rO34og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795462133; x=
	1795548533; bh=nv0+8UEgrELVnU1ZhVBht+zjma7q9Jj3FV0ioJuc72g=; b=U
	IMi2vgbg4wRq49Y2yF0JNhJIV9CcDT7E8Q8UeazPvtHdJBX7RuYDH9fgiVufomBJ
	ycqR57XWnjOhHSpXNjw2bSjbP7oSzPN6DjwI5RZ+7s3umbJKyfz0jnlChgL03hiA
	XRKSWivU33uohrcUEz5FyHzPFoYuF2/hd9imC6Og68GNSKjLf9afipS9rTflns+N
	WwQ/weHINbATXNzepcPUDhp4h/y7RD+rEsLIrsRBoxlR9m6OnQE/Tffb1xDMuPDk
	cWse7xQrkC+vagtsjS6uyu1bK9H9o8LFmSky6xpVC0DQhJbQlh2EWDrvXwH7H8nv
	X6bgtx5pavujONfrpqeBQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795462133; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PG9lLWtidWlsZC1hbGxAbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:iUfG0snd962hsJr9/+I+kJ5m4/xmMF5TkaIcrTYSxTk7MxO
	uiDVaVXvCUz96kVBqZJkhRCWSQSFr7OuiaDE+rmpuZjFWFBMmat1AnQ9aO1yS+ta
	YcMwo6DiOWIDkttA0vJoGKoKQIxI+C22fo5DwgXhWBJU346ouxMPf+MSRGAqLYzS
	klroEIuMEI6/iqiMJktmpdYhbtt7JzPq+GQoJYESSOg5R2gr8Eg48t0EHUFZyMnX
	yZ0lPIAs6VxXozG8/Zl2I8O0EZ+8uItf0tWYM0jRg3kLEOoxn75sF1130yR1LOg+
	RIODGmlDKhJXz0xeCGa5CURSjQu5FyvgGsmSHRw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tTTTBLr1wqTU2gwJ3YlsueZDb/vr1m02S+FtkuMIh5c=:c1TjzlgERhN/wkdOORZjtArSA9GcpDgtWwIpcwzViL8=;
X-ME-Sender: <xms:85MEazI4G5p5MIiL2Hm4p-uPSTik6lTLp56EEnGB4iP0XxJ0zBP6Eg>
    <xme:85MEax-tuhcWbT6RkcxZ1BTZHgiy-rQ-MBlWFEU4madszXwT2vKwR3uf265VcYvD0
    ZgTChjqo_5moYjF7p1_I5OlAng7XJjFpPTzyTBfCvibZ70NbDsp_G_j>
X-ME-Proxy-Cause: dmFkZTEA1QeBJ+cNKop6aMm6b4TlFnKwp+U1RX/xmcrzP/Zcw06VmFgbgIhMmGRK9db2SX
    OBVl2k/0AIxMOyZrNnBwJHhVyCsVPBvjTB6BMs0XniWhfbKAhgFbmrNVwU9sI3pu7tu5b2
    FRlGr85n/OC/7Po9FMRzoA1pj5mXvgN6k2hA4UX3VO2MU9AlsYlDHzN+FiL2rpMw6cvVBw
    /xlgotLb3UevrLD2JStJV6L1n6Euj0SQPCfJFjP4VgKggKYGs86JeWNmmxatMBSfYBIBm4
    4jx+MeMrdn3lV9xT/TGBKHhvwVGlGe2sgUhBnPBA23qqv4dxbfGvt7J3JJ50YWY6qOYTbC
    wvBdPywgk5tOyFz287O77t97+2FzNcFrWlA7dtjHlJ+XlcCoP12SWOE4eZ2IyCO9l+ItcE
    hny7AXrzzowju2dztWzYFYg/+fY6bos3SmAk9caSO2ZgpTGJDnVmagNCSh5voxR/IQpm0e
    SqMwgdfJ6ab7kzUUPytBycn2vu9KLLE4DTGwkCefdaE6KwKLtUOP1g/ZRHNW6uleRcaMMg
    LhEw2KPcn+JFKL6UCMIzHrZYhpilt+YRjCHUDocD4uidsI8VImpbhmz0REo02aGzh0l6JU
    PpJAYI/6RehQ6jsyJhp3PEvpSfJXK6ZEwhrLcWSHpUTtMOG+srPXQkkNmpwQ
X-ME-Proxy: <xmx:9JMEa3mgz5Y6wjxOdLQZB96sr6Ckur-QCGTO3qIsLX6JkJYcF98_tg>
    <xmx:9JMEaymN6oZ5JjzIOkguMWIdDGAiF55IO7yr5ki1kZhwxvCOWaBlBg>
    <xmx:9JMEawts3kaUUzLatk2fnMgVxsX1RmVXPF2iSeL0QpOaNMIGQBHieg>
    <xmx:9JMEa9ljezAtheTFTTA85fUGxHEs3Uy4usEG9Yhen3SgQtOv3rklAA>
    <xmx:9ZMEa92JyPZaK1FIh2fU4Hd07hAJGUmFOvO1ilK629nx1hygkamxsGqL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7CECF32A009F; Mon, 23 Nov 2026 14:28:51 -0500 (EST)
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
X-ThreadId: AK-j5Z36gAC7
Date: Mon, 23 Nov 2026 20:28:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Mark Brown" <broonie@kernel.org>
Message-Id: <1d91c6bc-a6a3-4e3e-b047-412e8b156652@app.fastmail.com>
In-Reply-To: <20261123201524.iJHCcGa0-lkp@intel.com>
References: <20261123201524.iJHCcGa0-lkp@intel.com>
Subject: Re: [mda-next:usb-j722s-fix 68/222] do_mounts.c:undefined reference to
 `__st_r13_to_r19'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2026, at 20:21, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git 
> usb-j722s-fix
> head:   adcad7f4e6332cff3d6d7165f41584899f598534
> commit: 274f32b374f68e4e1cbd9085e656467b9b29ea74 [68/222] Merge branch 
> 'master' of 
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
> config: arc-randconfig-r2106-20261122 
> (https://download.01.org/0day-ci/archive/20261123/20261123201524.iJHCcGa0-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 12.5.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20261123/20261123201524.iJHCcGa0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/20261123201524.iJHCcGa0-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arc-linux-ld: init/main.o: in function `do_early_param':
>    main.c:(.init.text+0x8c): undefined reference to `__st_r13_to_r15'
>    arc-linux-ld: main.c:(.init.text+0x8c): undefined reference to 
> `__st_r13_to_r15'
>    arc-linux-ld: main.c:(.init.text+0xd4): undefined reference to 
> `__ld_r13_to_r15_ret'
>    arc-linux-ld: main.c:(.init.text+0xd4): undefined reference to 
> `__ld_r13_to_r15_ret'

I've already merged a fix for this, hopefully this is gone tomorrow.

     Arnd
