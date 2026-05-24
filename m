Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7227D346AC1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779614633; cv=none; b=bWwCk5y92erfirjje7Ku0v1nAifXBQRTmUb/YuRDp2+RkaITN2CaePWXJN1bmzVn3kT37zSovJtlF2a+NUzUXlTNo2dc2wlFm/MCth3ExXvUqa+h0+JeCO5LeNjCINu81niTzvOQAAn/owMDoHiSSNvz02+qc7X3TMIxA6ldGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779614633; c=relaxed/simple;
	bh=2bLSFX1PS6o3nDpcWT5wi9+YzkXWw1ftPJsetz6F2hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIFuLDa0gUC7gVQyxmo4fnyVR2vCN5jQgNgbjCNcynNgWljefAfUVIkwZfDlDK46bZxbh+VGYVuv5DwAolsWteP+/Yom3DSRECs944g2aUWmPSk7FKD2F2FIhsW2V7+in+C+gyRM59hhIRWi7NApVZ+f19QFBoxMlN/KpNiqdaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=sgjiuXT1; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="sgjiuXT1"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59A2C47461C;
	Sun, 24 May 2026 11:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779614620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=U2wnp1Y07ymTUTkOL/dGV240UBe7WckA6H14Jr1TilM=;
	b=sgjiuXT1yjGm72IWI7wPHQlWAKVZg7nLptKOyOkw/xhdoU4cplaEcXOApabBfyCMyxJ3hy
	HLoOA7eINl/0QCigzF8Wg0zeB0zuHlZ6vNEftgBr17ujBQbJMvn1Ub9a2F+UwvYMNQKAci
	jRfEysJQiKo+gotkQz3RVq6cA89UCXul+MVADox89NhF2F4LYq6O/H67lVMdExgN4Mbd3O
	yeyiOOXUn94Q2+VahPn/1oieEDMX34W5GThkKMsIVMA5bEfZZSWkq5RU2Dv//XHmtVAHEm
	s2GFYhaHkVVqRbJeEON3As/UEtFFmlr52JaN8hNXrW8NAPy4UEw9lC9zSEWVhg==
Message-ID: <92578b3c-2c54-4aeb-ad70-b07f65adbae6@cjdns.fr>
Date: Sun, 24 May 2026 11:23:35 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: sound/pci/mixart/mixart_core.c:39:19: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <202605240216.sJYhxkvw-lkp@intel.com>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <202605240216.sJYhxkvw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 23/05/2026 20:16, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   eed108edc1170404bbef9e7d0189d18a3cc354f5
> commit: c7dd395d7b53a66de8503507fe7ef21b8fab3e57 mips: dts: Add PCIe to EcoNet EN751221
> date:   7 weeks ago
> config: mips-randconfig-r133-20260523 (https://download.01.org/0day-ci/archive/20260524/202605240216.sJYhxkvw-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240216.sJYhxkvw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: c7dd395d7b53 ("mips: dts: Add PCIe to EcoNet EN751221")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605240216.sJYhxkvw-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> sound/pci/mixart/mixart_core.c:39:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void


Hmm, I would like to fix this if I can - but the patch is a DT for 
mips/econet and didn't touch anything in sound/pci so it seems like the 
blame was incorrect. But I don't know well enough to say, so if anyone 
knows how this patch might be related, please let me know.


Thanks,

Caleb


>>> const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:39:19: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:39:19: sparse:     got unsigned int *
>>> sound/pci/mixart/mixart_core.c:39:19: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:40:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:40:19: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:40:19: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:40:19: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:50:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:50:22: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:50:22: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:50:22: sparse: sparse: cast to restricted __be32
>>> sound/pci/mixart/mixart_core.c:56:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:56:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:56:9: sparse:     got restricted __be32 [usertype]
>>> sound/pci/mixart/mixart_core.c:56:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:56:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:56:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:74:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:74:32: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:74:32: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:74:32: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:75:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:75:32: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:75:32: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:75:32: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:76:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:76:32: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:76:32: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:76:32: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:77:32: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:77:32: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:77:32: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:101:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:101:19: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:101:19: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:101:19: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:109:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:109:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:109:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:109:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:109:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:109:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:116:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:116:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:116:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:116:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:116:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:116:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:141:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:141:19: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:141:19: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:141:19: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:142:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:142:19: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:142:19: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:142:19: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:153:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:153:29: sparse:     expected void const volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:153:29: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:153:29: sparse: sparse: cast to restricted __be32
>     sound/pci/mixart/mixart_core.c:161:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:161:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:161:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:161:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:161:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:161:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:166:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:166:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:166:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:166:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:166:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:166:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:167:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:167:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:167:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:167:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:167:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:167:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:168:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:168:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:168:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:168:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:168:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:168:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:169:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:169:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:169:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:169:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:169:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:169:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:170:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:170:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:170:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:170:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:170:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:170:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:171:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:171:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:171:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:171:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:171:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:171:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:172:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:172:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:172:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:172:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:172:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:172:9: sparse:     got unsigned int *
>     sound/pci/mixart/mixart_core.c:173:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
>     sound/pci/mixart/mixart_core.c:173:9: sparse:     expected unsigned int [usertype] val
>     sound/pci/mixart/mixart_core.c:173:9: sparse:     got restricted __be32 [usertype]
>     sound/pci/mixart/mixart_core.c:173:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
>     sound/pci/mixart/mixart_core.c:173:9: sparse:     expected void volatile [noderef] __iomem *mem
>     sound/pci/mixart/mixart_core.c:173:9: sparse:     got unsigned int *
>
> vim +39 sound/pci/mixart/mixart_core.c
>
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  32
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  33
> 67b48b880062ba Takashi Iwai   2005-11-17  34  static int retrieve_msg_frame(struct mixart_mgr *mgr, u32 *msg_frame)
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  35  {
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  36  	/* read the message frame fifo */
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  37  	u32 headptr, tailptr;
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  38
> ^1da177e4c3f41 Linus Torvalds 2005-04-16 @39  	tailptr = readl_be(MIXART_MEM(mgr, MSG_OUTBOUND_POST_TAIL));
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  40  	headptr = readl_be(MIXART_MEM(mgr, MSG_OUTBOUND_POST_HEAD));
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  41
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  42  	if (tailptr == headptr)
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  43  		return 0; /* no message posted */
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  44
> da3cec35dd3c31 Takashi Iwai   2008-08-08  45  	if (tailptr < MSG_OUTBOUND_POST_STACK)
> da3cec35dd3c31 Takashi Iwai   2008-08-08  46  		return 0; /* error */
> da3cec35dd3c31 Takashi Iwai   2008-08-08  47  	if (tailptr >= MSG_OUTBOUND_POST_STACK + MSG_BOUND_STACK_SIZE)
> da3cec35dd3c31 Takashi Iwai   2008-08-08  48  		return 0; /* error */
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  49
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  50  	*msg_frame = readl_be(MIXART_MEM(mgr, tailptr));
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  51
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  52  	/* increment the tail index */
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  53  	tailptr += 4;
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  54  	if( tailptr >= (MSG_OUTBOUND_POST_STACK+MSG_BOUND_STACK_SIZE) )
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  55  		tailptr = MSG_OUTBOUND_POST_STACK;
> ^1da177e4c3f41 Linus Torvalds 2005-04-16 @56  	writel_be(tailptr, MIXART_MEM(mgr, MSG_OUTBOUND_POST_TAIL));
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  57
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  58  	return 1;
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  59  }
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  60
>
> :::::: The code at line 39 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
>
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
