Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BDB23816C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763813987; cv=none; b=DKQ8jhxMiHBu9ueZXjsiD9q+2llCx0Nx3fH/QMqxKoifCQGReLQLFA4VI7cFM01qa4KbWDjN8qg8nm/eTNNcoagcaO9D9d8+vFdJxa3SQY0K7jqqGnuArKnLx3SEgE+MF8paotydU5WMopUcmKLvSwAzHagvsZQqfhQ88vIpo9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763813987; c=relaxed/simple;
	bh=VttuaMOsYpOLvNWNkoSJUnem0+aGfHD/X3ngf4iHy2U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=m9I6XJYxG54dAS9b2RP9ldlZbLE4YkryoaOEKYAQLZFhYaRkthsHlm39oiUyZCv70g6EE+p4t069Z23c1rXBl1upj0zhNaTsbvNRoYFbBqDtWTCx4NppmHBUI3EIteaCsOBlJxTRoWK6LuzSViAuBcF2NuAW3MCziI2GN9IbqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SKrcIvhI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ffr6Nexf; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SKrcIvhI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ffr6Nexf"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 037441D0014D;
	Sat, 22 Nov 2025 07:19:44 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sat, 22 Nov 2025 07:19:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763813984;
	 x=1763900384; bh=zFhzvB348kDb1GqCK1TW9ow2fBMgGDzI+Zj1EDkA25E=; b=
	SKrcIvhIh9OG9P5IwSKrKyUlyVq/MV3j64F8bS34SB6BCOQUeMC1VtZpssR5QFPL
	jKnkm5xXaKMAnOxcLYCOMRkQQLPfRchsfmLnuMUXSSIdGOWHoR8kvGnv82V3t+RC
	s8uOUP5qJ22ug5rt40c0Xzo3x3YjoXLVHz/Bcnko45CKO9oDX0VY5sMCvPewdbqI
	vd5igZJdMkRSMWVpRtB5AEyxFTvMHRZOvkBJyEG/lFTVvHpqCbTDOxeMz42g0QSb
	wT0IvggAPQLoD2M1JLYwAesFguJYMvyt76kR+Fz98WBaYAHuFPF2RnmtJq2y+/bm
	qZ9NqpEvnYPpyoIKik53Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763813984; x=
	1763900384; bh=zFhzvB348kDb1GqCK1TW9ow2fBMgGDzI+Zj1EDkA25E=; b=f
	fr6NexfXB11Eax/cPmzsW8YBbzvb4D/0FPDmkq6hnYdENUZ/Ny/KzxHU3CqgdNXJ
	9lMpDa50cwgU52VMTdLxrYl2ajnpDSZU4Oq01ccDMFfPmMId9qon+L8yaPguUCpl
	camF1YEDZQAH5lyFcNX+2i+APFnyjIpVt31zG4fY0PUPV5375wZHyLuUcUo/Za3Z
	6E3lZ3Oks+qhkZFMiKW6QtPsVsBTtzB+WP2lwfN5MVUhPItW5vT0qKuLuWBVepA6
	OxUgaBivKnJFMO1yHE6n0zQSoc25+sFBHMTBbVYn638xxm4gjqrVv9Z/Nyn7DCYI
	7QkWbuwpKB6q+qqOYbkeQ==
X-ME-Sender: <xms:YKohaYpQUNGGoSGOumk3uoQP4dzmq7MBEQNBbzUOF_4txHY05S6BGg>
    <xme:YKohaZcaVQ4_AuQG8g1aYRtas8W_7G3yAWiLcAQWnlgTcld6asXNWF6DTGN1zlgJs
    Qrx369Rr-nnl5bX1IiYcnU1jUd2jj-ZoDw6PwfR91QnQmtkksJT-VM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedvkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefgleekvdffffehffeileeghffgkeetieevvedtfedvheekkedvudehjeejkeef
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdgu
    vgdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplh
    hkphesihhnthgvlhdrtghomhdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgt
    ohhmpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugi
    druggvvh
X-ME-Proxy: <xmx:YKohaWO9tjgQLJgL2l3Hc__0hID6PYGXhevZXEXr0ypiGmqRVXeKJQ>
    <xmx:YKohaVEWy883bXaytJWAyDoH5w3_VoRFuq73pBcsSA6GX1kC81sAOg>
    <xmx:YKohaVNQBC6SzGpKebF85mMKqFGP_pUzgS3XDIgdy3Q1nD-o9RzIBA>
    <xmx:YKohae-Fs-EFqmxTDPQ4GXGZWhBHmfL_5R3Svh-G72x2Hfgd_K-lkg>
    <xmx:YKohaXKY2L9TBP6ck-H8smbhQmbLCWrlTOgyJ1azhHgX-V4SltK6KgQg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 66362700054; Sat, 22 Nov 2025 07:19:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ASHDA90bHwo7
Date: Sat, 22 Nov 2025 13:19:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "Heiko Carstens" <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <1ee47520-446b-49c8-a15a-871e38827a10@app.fastmail.com>
In-Reply-To: <aSEHOMJL7a6QNfoZ@rli9-mobl>
References: <aSEHOMJL7a6QNfoZ@rli9-mobl>
Subject: Re: [linux-next:master 9003/11041] tools/include/nolibc/arch.h:41:2: error:
 #error Unsupported Architecture
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Nov 22, 2025, at 01:43, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
> commit: 169ebcbb90829bec0429ff9f6012a0313169e45f [9003/11041] tools: 
> Remove s390 compat support
> config: s390-allnoconfig-bpf 
> (https://download.01.org/0day-ci/archive/20251121/202511212331.pYBUDx2S-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20251121/202511212331.pYBUDx2S-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202511212331.pYBUDx2S-lkp@intel.com/
>
> Note: the linux-next/master HEAD 
> d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    In file included from tools/include/nolibc/nolibc.h:96,
>                     from tools/include/nolibc/stdio.h:8,
>                     from nolibc-test.c:12:
>>> tools/include/nolibc/arch.h:41:2: error: #error Unsupported Architecture
>       41 | #error Unsupported Architecture
>          |  ^~~~~
>    In file included from tools/include/nolibc/nolibc.h:96,
>                     from tools/include/nolibc/errno.h:8,
>                     from nolibc-test-linkage.c:5:
>>> tools/include/nolibc/arch.h:41:2: error: #error Unsupported Architecture
>       41 | #error Unsupported Architecture
>          |  ^~~~~

This is clearly a problem with the toolchain used in testing. I don't
know which toolchain this, but if this is the kernel.org crosstool[1],
you can blame me for it. This is a biarch toolchain for both 32-bit
and 64-bit s390, but since it uses the 's390-linux' target name,
it defaults to 32-bit.

I should probably change the future compiler builds to be 64-bit-only,
but I'm not sure I can do that without also changing the target to
's390x-linux', which would likely break a lot of scripts that
people use to test-build their kernels.

Ideally we'd have some cross-build hooks in
tools/testing/selftests/Makefile that add the -m64 argument in this
config. There seem to be some related to this, around
${tool-archpref) etc, but I don't see an obvious way to integrate it. 

      Arnd

[1] https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/15.1.0/arm64-gcc-15.1.0-nolibc-s390-linux.tar.xz
