Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC491373
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766622053; cv=none; b=QzufeejCsNKWlHUcEGw1fSyvyuNtm2LgdPogYcRdlRNizEw41HmlZEVnHrGXLDUFsppL1AwycYiI7zLf7X9uVrp06Q/4wQzqLfjjZLMA6EUHh2HTLJxrHDjFA/mS66N7NYObuVuSGFvTpWlqqL5K3CciRvOnAFNv2xfh5adGgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766622053; c=relaxed/simple;
	bh=HmMnzSCVOzda4lFUyKUre9uzxIVJCJZK1uSda56mdMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NdosLf2QbJAFU4xQXmGR3BQK6Fb3ySYS24Afh2782MI4Kk+htINMHR/+vSK/52TgT4LkPmMxRIBxsGDr76g0D6DyOi8RekIA3mCftTAy+sPGdCLcr6SlKnShhvr/+l7j5nVJzn1pOtx7Ir1jPLC8/WY4kJYqYMnDNxh5/E9EZXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nxfZLen6; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nxfZLen6"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 443621D00119;
	Wed, 24 Dec 2025 19:20:49 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 24 Dec 2025 19:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766622049; x=1766708449; bh=GqLER5/He2ATZFOr47hO2xqlE5rJXmXQubw
	aLbaCipw=; b=nxfZLen60ZujHlXgIEDOxUgmUTYfrfcywayX4kxqwOdHuj8/9ex
	xmyAFnsioLUSB5uBE2273n8o1+ZJtalbxSxPhWYX5uOsUCAVodW0C0pVoNrRgytT
	LVo2JO3GCHXzq+nSjnMSxr1e/RgpupXqcz+9GTFyy4FvWu3Qrz0vpk1Z5606p97a
	13X9vZyJBnA5ImCCLm/KYU5ktFETmT6vh8XPfG90xJPstrupm5nlFI5aC1guwwuT
	NJ/t0N45RQfvP3MIe6CZ7cRHTxg9Lp2ZOnjX7lE0nd2n8xAyqC2fONSpCWGvCk3t
	cKQBm5SMNFrYSvMmG8tr4h/fkzajeh0ldsQ==
X-ME-Sender: <xms:X4NMaXn6Uj9rebLZkmMIy8fJR8Ojn3lAFb3LDvYhLTC7LyKW4txxkw>
    <xme:X4NMaeicWlDY25IZqOCJw--YEjbp8WCdgGRi4SLwkJ6v8H0Ud86a6hUcZJ9shT-Jr
    YSPtKrI7XVcMarpg7rEjXNZAhSqo8z_AM8yiwy5EPbjVXgTGYKfSYA>
X-ME-Received: <xmr:X4NMaXeZML4F5GGOfiyi0Nx-fDgTw6RjaSJsdr-wvc0abA8SplyAtKedKOvoS6FofBn4pGpkIOUCEXWRtDujW5v3FW4_gr9osOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeigedufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephffhtdehjeelgfeifffhhfeffffgjeefleeuudefuefhvedtieehheduhfegheeu
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhig
    qdhmieekkhdrohhrghdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    lhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlse
    hlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrgh
X-ME-Proxy: <xmx:X4NMaWixMzSV9KkcJ5LNMJ2fU0iS_h95QjBhLEUlkaDh2KhV1fSYtQ>
    <xmx:X4NMaXzIu83omezfAWmNS8lrjVMIgdnhyIWDo70afWyVXbdxxW-D_A>
    <xmx:X4NMaaPjkzjq2yP9YFmDTaLwGy-gGlF73b0RH21kMziw1gFljCBRoQ>
    <xmx:X4NMaQXVyDcwssCwOy-H1SngGiuV8sTbhV-7TSyfKK5sxqkJKkrbdQ>
    <xmx:YYNMaYDGIyyfRLLw6y1A1BLRh1_2x30ChV0UWHEvYU9CU2jph8i6l92C>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Dec 2025 19:20:44 -0500 (EST)
Date: Thu, 25 Dec 2025 11:21:56 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Peter Zijlstra <peterz@infradead.org>
cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
    David Hildenbrand <david@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-nonmm-unstable 68/96] arm-linux-gnueabi-ld: error:
 zImage file size is incorrect
In-Reply-To: <202512241835.avmTEP6X-lkp@intel.com>
Message-ID: <b59bbd77-7e5a-b0ca-cf39-ae34bda80267@linux-m68k.org>
References: <202512241835.avmTEP6X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


I've reproduced this failure and it is basically the same as the one seen 
in linux-next (which also involved CONFIG_EFI_STUB). The same changes 
which resolved that for x86 also resolved this new error:

https://lore.kernel.org/lkml/fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org/

Peter, this patch has your name on it, so I wonder if you have any 
comment. Would you prefer that I submit my version under my name instead 
of yours?

On Wed, 24 Dec 2025, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   c40f0b9f72a08d208c7793090ae98faaf6a58719
> commit: 613bf373e660523dbb3f2567fceb6cbd8bc2a469 [68/96] atomic: add alignment check to instrumented atomic operations
> config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251224/202512241835.avmTEP6X-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241835.avmTEP6X-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512241835.avmTEP6X-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> arm-linux-gnueabi-ld: warning: orphan section `.data..once' from `drivers/firmware/efi/libstub/efi-stub.stub.o' being placed in section `.data..once'
> >> arm-linux-gnueabi-ld: error: zImage file size is incorrect
>    arm-linux-gnueabi-ld: drivers/firmware/efi/libstub/efi-stub.stub.o: in function `efi_stub_common':
> >> efi-stub.c:(.text.efi_stub_common+0x190): undefined reference to `warn_slowpath_fmt'
>    arm-linux-gnueabi-ld: arch/arm/boot/compressed/vmlinux: hidden symbol `warn_slowpath_fmt' isn't defined
>    arm-linux-gnueabi-ld: final link failed: bad value
> 
> 
