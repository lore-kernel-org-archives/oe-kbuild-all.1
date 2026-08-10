Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39BB437864
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786392104; cv=none; b=mk7ROgzT0Zvd977ZZuObDaPb8icvk7hvwiq0MjldPCJHEHWQRMm0MmLSS6FlIO7o4BL5x9FsZ3LsOFydOGz43Nb8cQm8DlBtH0Ash3OJUeTo724gxVH5SvkL66QxnK6+Db6ZJmTeB2zZpq68yOlyCVEh7Srh1MJYOw2QlqQeQZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786392104; c=relaxed/simple;
	bh=QqjSkyuRby6IP3MRFI82NFcztPzGF7GKK5Pi7JyEaPk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CXyxBP4z+Ho9Z8IMn3lKe11+GWH8x4KnCeTEvibcAM/BvxJOaRM5FGCkIVfJwnz7H+xpoTmNRCV3mTKC2TJ14ycmz3QNOwH4O72ax7DT8m/EiMpBbtAihgfyJGvoHTP4ffD4tApiQautnOc+ZVf7NxGRzRSJYzG0U9NFu+R1gt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=OO3jziih; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VTZYizkr; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OO3jziih";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VTZYizkr"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 4E5F2EC01EB;
	Mon, 10 Aug 2026 16:01:40 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 16:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786392099;
	 x=1786478499; bh=5NZqLxRdwIk3mQ+SUN44zCI2FQ+UgmPlrVn8El+5pX4=; b=
	OO3jziihSn4PR4SE+sIIQ2NCTFZj41sRrt0Ixxj2woTUM1uqQSnHkWKW2+Gt+Woc
	PxlPJUydKyzuWcmSTBcNkmUzHS8HQIY2m5gR2N3uxVSIarTmWRZi+IJq6LMsHCKV
	FZZ93eEWoavRbisRJolW77bOwIiTqd2AXi4iFxm1mZn4wlORnLJAuvR1iFm7nbJR
	1x7g8Ht0PCkMwCwX/VWxEy3STTxacPpukTCNgz0KPrKWcYb2qMHtCIl3Pb6UQi8l
	0xm9idx603+O2cQQd3EfI9lI0GEKhfW4h/c4VX+hSpscTGs5EBQ/VF04yEsFtCjO
	tZHHOaQnSifRm0gfsZMuRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786392099; x=
	1786478499; bh=5NZqLxRdwIk3mQ+SUN44zCI2FQ+UgmPlrVn8El+5pX4=; b=V
	TZYizkruOmOyX9WAG4M6+yWj15/V/30/IQQ7UpdSrfkKP/MVoXQwv2ZfqynU9YAw
	iEryn4VTvIhtkdBumvNWx278GWAJtP3FehAUceL+CxrBnlUx6953ui27z+89nXMj
	pigIBRnI8P2k0pEQ096H5qKjn6ytBaUk0V4wDBbC8zHcRNUfHjJ5wwpgoVcExr8j
	WLGTpzohs0MuxoQVIzj3U3YU/61E4C0EG98qi6qpKaut6eShOY1XGiqlN2+OznlH
	ILBj1V4ymYuAaU3cufHmN8/iSSixC3NY5Ql62yzJpRx/usGI68GccuH/XCguZGHk
	WQb87KDJcJFNM/Il744ew==
X-ME-Sender: <xms:Hi56aok2888cRFQcMdL-lzJsH8mwrxBkcZqpKUX03l8bRncaFgjr2g>
    <xme:Hi56aioiaP3F14nT9YXcMpkYcg2i3kmIwaRVqMaJlE8fQ6aDYBKDCOjqUwTafgoxM
    a3WpF84L49cOiXfb_QbctPQOeRpr3zxMhc3wjH-GbEavZ8EyOjNe4dD>
X-ME-Proxy-Cause: dmFkZTEafj09dN5yHCqNIa1W56QoXEuwogK8SsDcdqmiroJiLIQ4zDuvuOTZZscJtArqZX
    Yw2Ry9+sRu+ZLWqoyixIjQ8W5zHfIeyYPeA6YwoLLlQLdKxY3zbiptxNBEYGki2pRzTZa6
    ydVUEOQ2m+heT7DtR+Nae8e+r4JZ3rOo/Jl0dFIz2rjMZiTEH6g2wQP4ZBe5cwh/bvTiv8
    fMdnuInbjMxoXExnhnm6HyEDihYqBTnsisKsJKFQPvuJkIjMGuigcZWUMltJRbGqeS9q7S
    ZI5ZRrCB5Viq9qwyxkDlP0g12Ptav5TvS18T1LCnQKShr+IrhSh34w4e2/chWFNqVPJ1mW
    NggcQx++OJApjfImP4Thoqtl7kSHnhEni+rN7gfb74U3jJRxDA8PQCvadQFDSE2mG7tkpf
    UPYebAuH6y3O/28QMAZ5cF3iIOOibsu9oMWz71f4SAmcgy7A7YNU8/vOx+t4V8jUyADZQt
    g7BxACKGp2s6IApjsXPMibZEZa9H88WDLsD2QV7BNdItgSJI0z2S0MCgso0nFGSrCXRbzm
    AmuKGRFgg2llmkDJTemFnG3uO4pu0pa2ufV+smBaNhSoDrWbvTx+cFkhnc0J8X+ZvQQUVn
    MTciFkzHFYGwS7dFmBEMbO2FwHEIPlRJurldCCtNVdErHkwY6uIMoZtiTgCA
X-ME-Proxy: <xmx:IC56agzYgZHVDNui7dBPAW99-2_j0tVjGIQ6ou4NQ_CyitAB4ig37g>
    <xmx:IC56atMecDMM6ur2LNJkiaz6Nm1mr_pS_G6Q8zLrb6a0MAzk13Vxng>
    <xmx:IC56at75K10zwJwgznfjxYX89mkbJNKMQzHPdNwTYHWbzJ8-ci_wOQ>
    <xmx:IC56aukYUALpo2qK4bvZAXxJkPMawKe5lYRSg7jKnq1otHAB6bAyPA>
    <xmx:Iy56akWAmYRvjTq8WnCPVTu9WCe5qojC8m1QQmMnDpInWqCEHOeIV8gj>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DBD9132A0066; Mon, 10 Aug 2026 16:01:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AyJzrsxxrgkN
Date: Mon, 10 Aug 2026 22:01:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Huacai Chen" <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>
Message-Id: <25b2a242-9a28-42fe-a361-477f4298617f@app.fastmail.com>
In-Reply-To: <202608110230.c32X9KXj-lkp@intel.com>
References: <202608110230.c32X9KXj-lkp@intel.com>
Subject: Re: loongarch64-linux-gcc: error: unrecognized argument in option
 '-march=la32v1.0'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2026, at 21:47, kernel test robot wrote:
>
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> master
> head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
> commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust 
> build infrastructure for 32BIT/64BIT
> date:   4 months ago
> config: loongarch-randconfig-001-20260811 
> (https://download.01.org/0day-ci/archive/20260811/202608110230.c32X9KXj-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20260811/202608110230.c32X9KXj-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 
> 32BIT/64BIT")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202608110230.c32X9KXj-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'

I see that this option is supported by gcc-16 but not gcc-15.
Clang-22 also doesn't have it, not sure about clang-23 or higher.

How about this change?

--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -224,6 +224,7 @@ choice
 
 config 32BIT
        bool "32-bit kernel"
+       depends on GCC_VERSION >= 160000 || CLANG_VERSION >= 230000
        help
          Select this option if you want to build a 32-bit kernel.
 
