Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2F2D0C62
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Sep 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682039; cv=none; b=SuRpIRfUXEDPz79/Pts+LM7wQRqsTwC8UMLsM0W/xddVSLaTjgv2f/66JoNn9r8+sbLZYNJKqmmAyRv9IISbjPYOF0STh1HjdW5y5jKT83YlDP1cuFgG2NN5mDQd50PqgQVKY5H0AoFAsod461p0sG19CAX0N7ivhZT/0lksqsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682039; c=relaxed/simple;
	bh=nFWdCsLnj9eQWGndsio1PEEAhaNJc/Q6ltVujQG0skc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JEaTjnp+FSkQlkdBezH1YSc58ZSB9cxisR4HxpI6pXDeWEqll8BzsHvT1HrGgxe/dXele/aYh/81HcfFLLEbzZz4AnfQh95hqJ3bo0mUKMjwtyHCnAFqI2PqSuXA1u0Z7TIjANVJyjeKP0FAyUgPzZZ6S43xZvwcfEibqwyW8yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=3/cA/YFw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VQNZxDrL; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="3/cA/YFw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VQNZxDrL"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id BBE31EC008F;
	Sun,  6 Sep 2026 04:07:15 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-10.internal (MEProxy); Sun, 06 Sep 2026 04:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1788682035; x=1788768435; bh=Krpd/yZOg4UFRVNryatwmmy+o99hdkb1
	oFO1JoJzUU0=; b=3/cA/YFw9mTBYsoVflfoq2QFmphPP+HRhXDyNmLP+KDss0Wq
	SHt0k3lMURbw+JfIeUUYyffOm1OjWDS0yiaGO1uF9qzA69lEL4B1fS71ipKy/n0E
	WrW9RlOQSYj/xU16+oHFmN6c0bgMGSGvNWOduJLTAKLT6BFEMyT9ZDpsaWKYXitJ
	RrqsLUVKQpIsX7DrD4EWvt/cxYQNgWTLt+NJLq7aExMKerpgOMVk3RFsJPVkcFkv
	0BcaHdB0CUCiCqYeHNDFKPWgcc902E/FLiTfDlzEk5kTztWGx/E7RmIxiFhSID4a
	BJz0Swk++3Sd0+syt4LmTHLwK+d25CRvfYxZsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788682035; x=
	1788768435; bh=Krpd/yZOg4UFRVNryatwmmy+o99hdkb1oFO1JoJzUU0=; b=V
	QNZxDrLKrE0BrVshzfUYEM/zN/1iNaflHpeawtDusxRwftFCmzJuyo53BjcnAmvD
	ywHRgg9U/z2zJkGUKwbZZ8fwghgjJUdyA1+h8DTHL1qeg2mZ7QbDiPrUEQ7kI4Wr
	/HmWY86kDgj4ue3JMJoPkX2gKSjTjTottX75cgE/rBaRynwdmbOIqrWGVwRtPM7p
	szIxSrD/0PlO1mfqLZkCFTPzjms5cBvVooCfJ58yZsXlKbNMn0KKHTMhY27G5Go8
	1TJ2yweJhA8h6R1L7oYmjnksYftnEFheYZ4MYRu0cqfSqF6bArjfzhGj2/uc89Oe
	Xj4JbgOirRQMFA4lsa53A==
X-ME-Sender: <xms:Mx-daizXHjvpvcCQ5RWFpM5cBIwzLRD_yNzSYgYiSmOvoFIEZ8HcMw>
    <xme:Mx-dapH5kUEmh2UEmKLTe4UksY3DZHmjKftLwg04cS2cbwbrstXV2Bgp--ofSv-W5
    nJAzroiWYoJgCbmN7F1tC_Pz7FEidkDlVpQ3AXAXRJGFASoWTZU1EJm>
X-ME-Proxy-Cause: dmFkZTE7s/FPZNoj7JDKKd/wVdYegmWDwuizShtHY6nbQYuJAw/uI0XhQfjV3xpLjEDFAt
    yQXvtSB7Rcz1Hg3YC1zTN89ACICkP1LuCfFwA+ER6/1oUmHzQA2XM3V+82oyYWMmtxcp2B
    gC4+NGZa9vsG8WR5bExKfHTzGVrsBuAcYeF4UKZA0sYtOy7lm+z2DmWrL7CkXU3YwXOxck
    AVqwuqM4dAKWu2n5Zbl+e8eLb9oiRw/NgvGheWkpLH/MhSbblh86gon9apAfEllJIKmrbk
    b9BNExrudPfWklXv0bUq6nmkN350rWQvWyCorc5SdncDJ1/L5rSbfr8AoFHblLTCi7qxMr
    8haRyVPwREUWK4NoqAB2uAhnsubWc2DusKv/fNpE2BBFqvhPBGPKFAKBAQHK9pKZgBRVKE
    Yv4bWmulA5vaR6nHBLximf6e+2oLsaoCCiaJ5uVXKo3xKOamLvv/7PTCE539/0rpvpSgNB
    XL87NmqoA1drXVZVudN1I6MQdVqq2aZsvy5GukhX0VVBaB4dq3hT2nJXIVQHAeOzLKYejJ
    RcBwuHUCU0wWJI/GhgU2PoM35lAu2QFIN+UQgWH1sys1erOA2sp6OvyXPzMbKJFXm2oWd2
    UqLdjmxsrGnzWKUx6bwiNGuyQV6OSHaN/J5Y0W5A7VFCoqo5K+kdMcuqclGQ
X-ME-Proxy: <xmx:Mx-daldhvTtuZjmGoFPkVVLtWLi_3XH114qqRJSpqmRakSTseY3CVA>
    <xmx:Mx-dahLlJOsYNwRcqkf3IV9SrQwwqAaIsL2Gc5bwzGNuUBuDwpymiw>
    <xmx:Mx-damEy4vaoKN7z7838Squ4_chg_1fKSa14y12av-QNaSQTK_jo8g>
    <xmx:Mx-darqEloQIgimRGcIl7YTBSZqrO21pWxj_SfIOGeAhLaW-INw5ZQ>
    <xmx:Mx-dapiED_YQsJvJi9aLmYrJ6uv3weIazzLp1emdp8uat0WfS7yIU1UQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C21AE2400098; Sun,  6 Sep 2026 04:07:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AW2aaXTfq8mN
Date: Sun, 06 Sep 2026 17:06:42 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "kbuild test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <d44c2848-165f-4412-a8e2-af5d0bfb9691@app.fastmail.com>
In-Reply-To: <202609060257.8wQo9w9N-lkp@intel.com>
References: <202609060257.8wQo9w9N-lkp@intel.com>
Subject: Re: [linux-next:master 3200/4370]
 drivers/firewire/config-rom-parser-test.c:93:18: sparse: sparse: incorrect
 type in assignment (different base types)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Sep 6, 2026, at 03:23, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> commit: 23e0d2e849eb84b8451c3f90e660222eea20f031 [3200/4370] firewire: 
> core: add test to detect irm-is-1394-1995-only quirk in config ROM 
> parser
> config: csky-randconfig-r113-20260905 
> (https://download.01.org/0day-ci/archive/20260906/202609060257.8wQo9w9N-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20260906/202609060257.8wQo9w9N-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202609060257.8wQo9w9N-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    drivers/firewire/core-device.c: note: in included file:
>>> drivers/firewire/config-rom-parser-test.c:93:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
>    drivers/firewire/config-rom-parser-test.c:93:18: sparse:     
> expected unsigned int [usertype]
>    drivers/firewire/config-rom-parser-test.c:93:18: sparse:     got 
> restricted __be32 [usertype]
>
> vim +93 drivers/firewire/config-rom-parser-test.c
> ...
>     88		u32 *quadlet = payload;

Indeed. This should be typed as __be32. I'll fix it later.


Thanks

Takashi Sakamoto
