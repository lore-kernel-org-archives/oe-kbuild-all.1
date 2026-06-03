Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2913A3816
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780518089; cv=none; b=YSQdZ0TK/Lpupr4fvrttvWLLVISU/VPfpGigiVDDI1FZ8UpaXazy6ItBq7WoGsKdvlMnj0WFHdaY0nVfUMxffvDsi+DojsJCyDywPEscDa8HQWDxMu9P1M6a0KnCWC/8/FclOHlwjZzOXucklftQUG9GzrzV5RxbkS4uMYEjbHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780518089; c=relaxed/simple;
	bh=hPUJo38RimB6iil77KlJSku17sYlbD9VGn1vxJq94dc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SL2pbsCdouStD7azU9wmdJc+NHe3kHvBGCYptJ2PNvTVXnTxHNeKb22Irzyw9LIs6NWLkDoCLohc5NH5Y3DpsguBQOfB8v0p+PKZf1Vsd54/ezxF/kWZB3xpHMeB4aLun8PavMnRxKCie6HQjHW494h+ztWzFEQI9fnIbU+vUgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=U77kNaiY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QEqQpWbp; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="U77kNaiY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QEqQpWbp"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 82BC3EC0166;
	Wed,  3 Jun 2026 16:21:26 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 03 Jun 2026 16:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780518086;
	 x=1780604486; bh=wudPYMJbd9nBt6rRuFR7VGGHZ8OrCgWzbJU+a5+FDnY=; b=
	U77kNaiYmbQGPI+nm8WKhb9YhiunrIuvPd+7P0JCjb8vLKlDoYHA7L10GOeRPHsD
	9RW0y9Dq7OOdLQ//R+cDqIrzCVSi09rzZhbGdPVUiwKvzHzym/oJQ2HMrNrwxU2l
	it1QDT3yi8E/n1FLy0GnVaqAZHwDxt02tXMJ2Mniz6ozMBqAGkQ7tlNifirnDznT
	AWIeXBhAcWD8zXLHyPRkXwe5GMY0pEzNj98pFqIo+x2p+cpm0U6NydF6h5+Zuew9
	pxtVNW6oXHHpsvR1K3cyvl+K/rcKmj8iFKhsbKmXOTjwj0b2h91Rndfdf+K+nicQ
	VOanQaYxhzcvUje2habo6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780518086; x=
	1780604486; bh=wudPYMJbd9nBt6rRuFR7VGGHZ8OrCgWzbJU+a5+FDnY=; b=Q
	EqQpWbpFEK1rJaRrZnCZx5BIWE4ivz/XAKzuJDVJt6FIwjng3+k7GqBksN3UNDe/
	h1Mt1zwBP90Z1S7ZnDvoTZMwq9WhlDhQ8wbo/MQcfL4TNfyU3b8joTlIwxFNkRxK
	HbEIsW4dHDZ1pk/f9Eih/zdQiuwp2v/rKVdHk7u64UTgvNariAVqo8IRhwjLF293
	zDowS/QEk7TOwz8mhCX5KAk7l1xQqllo+ZmjnCT2Y/vVor3zBAs4IpbZa3dgNki+
	aMGfgr2lEMBk6JJHU/5qVzMSC7IrZI1dqnpNWeeeB5YE3/YM9Mmc+rus7ymnkYI8
	fqGrWFSwmoJEYCjMTYPzQ==
X-ME-Sender: <xms:xYwgaqQQWEz2eyqXbYT5JyiReKj2foNFw8f3PT6VdWK_q3q0qwnMnw>
    <xme:xYwgaqlBMQtzy8_GsEqZLzcVe1I7nIbJD8ppx3X7XoO5hm6MQMcyX21VzT5meejJe
    NgUtq2ziUge8zFFDDmsxLp4xZUwd3yy-sHWcEZ9yIx4GUIYNIzMrGc>
X-ME-Proxy-Cause: dmFkZTFL6z0FwDH0tnBaPQzrLvCB0HBtzeQMJLRtaNsjlTM3blpdIH09zaegPEmKGxPbz4
    bUkFHahuzpzRIBkslrdk9vR2dVWlan306r18FirdADsote4p6CzKEhkHoANYGOW2fK/MRJ
    AZyhhuiBYrlF/XGpyCiRA/3xO0SI8PIT9+p03jwHzqiRjHnIzwPTadWIIqebi98cmDro6O
    X0S8MeMEZxylGdw9AsHVyyee3lRPBEbLIOZsd0UX9GEov4X4GwH4KPS8QQ4kjcjBAjlIqA
    h/Kn26tJHBoCsVTNvlWGLh8E5Y2jslftjYz86udXPzxM1v0AhDLwVnePmPG5silA2TeDV7
    YHzXjnIUmsirjPWoeNuWEdNXQjtgLnQTWgLrU+ldu0TeIVJ2+KFj4bEVoblAeIBARmsFNX
    UdjdlTNEkSh5+AYU493hhOmLVr2IqsffGxIxllZFxmpl/6nIJBLxZLOBbQRfE+A56LT83D
    cnqEQUN68PDdb0uXj/i3eDS/CKRNHu4IzrRxBdaLmUz3/8glCAlgi1rV9MzwVG3OCozNaS
    IxVsu3db8X86F/vOhyJT5WzejCmmq0vvWpejSa/gNGdS5IQtItJxKPj11x0/MvUwZbjZU6
    OO7y2jxRS/w/mzwQT5EMt/5lo2nmr+B2FPE+eWz1ghddFOs2LbAUX2pTbFgQ
X-ME-Proxy: <xmx:xYwgat8H6_XnkWGWDmGT2EDF85o3xfAnAS6EHUVYST64RBtYLT6E8w>
    <xmx:xYwgarAjpmUO0JYXXlhBntDz8tVMdHADwzhKdHi6Wor8JaFQX9zeDg>
    <xmx:xYwgaiQhg3jRSFQaIDNpABITYgAEa-hFFT1Hl0kSyhkGXOm5sIAojg>
    <xmx:xYwgaiuT-3OxahQ8j2RJHpXyDWgZ5Tjqb6oSVu-mdT_smQoKtruRpA>
    <xmx:xowgarhjwEK_h2DsUBOJU0fo3JWqyGtHBl_2CpnJKvYpfvWgNZ5deLn_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B9197182007E; Wed,  3 Jun 2026 16:21:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AoYHDdqsMtKV
Date: Wed, 03 Jun 2026 22:21:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Alexander Lobakin" <aleksander.lobakin@intel.com>,
 "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <840bb432-ccae-4efe-93b2-be447834e6ce@app.fastmail.com>
In-Reply-To: <202606040044.XTS61C9j-lkp@intel.com>
References: <202606040044.XTS61C9j-lkp@intel.com>
Subject: Re: [linux-next:master 9857/10263] include/linux/property.h:226:undefined
 reference to `devm_clk_hw_register'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Jun 3, 2026, at 18:58, kernel test robot wrote:
> FYI, the error/warning was bisected to this commit, please ignore it if 
> it's irrelevant.

It's not related to my fix, that one just got the build further
so it ran into the next error.

> commit: 0bf6bc1fe82a9307fa772e64c3adb89e98390f72 [9857/10263] err.h: 
> use __always_inline on all error pointer helpers
> config: sh-randconfig-001-20260603 

I would not expect sh randconfig to work normally

>    sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `fwnode_handle_put':
>>> include/linux/property.h:226:(.text+0x1b04): undefined reference to `devm_clk_hw_register'

I'm pretty sure the oneline change would be the correct fix.
On most architectures, COMMON_CLK is set in (almost) all randconfig
builds, but on sh it is not, which makes it run into errors
that others don't see.

     Arnd

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8f2ba4121586..1498473d4160 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1370,6 +1370,7 @@ config VIDEO_TC358743_CEC
 config VIDEO_TC358746
        tristate "Toshiba TC358746 parallel-CSI2 bridge"
        depends on VIDEO_DEV && PM && I2C
+       depends on COMMON_CLK
        select VIDEO_V4L2_SUBDEV_API
        select MEDIA_CONTROLLER
        select V4L2_FWNODE
