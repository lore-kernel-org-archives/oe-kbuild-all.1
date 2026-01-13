Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFDA41
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 06:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768284802; cv=none; b=s6DnLhV6AWsUydo2KUeeG2nen1K55fCPLMdjn9IGhTo+4h4QNnRZIljEMsjaCREtSIcppgbvw8C5UDJrHVQP/WB8L1jzPg9l/NpwB+j5mfvOcfvvhblpd37GGavQDJHfvJ0q3sXPC1rJNt6OyOeVCHUfxfTcR8RiZURqiU2RxGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768284802; c=relaxed/simple;
	bh=tcLwKl29y1Aw1jNZ9CT/XY/qOBcKIiMKPKSxUolbQ34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2MMNtlLceNUQOzFOGlL8e7mNwgwG5ioJWZ7dOHCdm1U5KmvB7s9+JcitQxQbghdi1gYd2Ie10Yo/FvtqjAhsRbQe3clORlZW/8zGpTmeSSnQc8IvtHLst0o6Q/zpf0kzK3xsNKKzEjhajFUGRd6h2SfX7DcFiUBV4Ys5faWwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNILGEeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNILGEeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDD8C116C6;
	Tue, 13 Jan 2026 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768284801;
	bh=tcLwKl29y1Aw1jNZ9CT/XY/qOBcKIiMKPKSxUolbQ34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lNILGEeE22XMTkyy+9XaM/YuwhrhL+Bpt5lI6j3CxM2/jhN0AGdyIKSnCiXWaE2CK
	 47jVtBvmFMe9e55/qB1qq/TVVFkw7vlH2PepkrhFsXakgXM9RMSU/pVKMkO+agoppZ
	 iZBWz3vCvFbQ3NJrRf9kID7DfVUorz/I5CSJT1NKZC8dIdXCyblnng3KaWijjp6Em4
	 wX2/ZYITTaqdkgoLOLzGhXsCgPe9BPbmqwRNqtetx1uJ7D2rm6LEKwvdYyzu7O4T6D
	 t4E94mDkDX7Wj+nfoVneOePR4noDUoGcAGLM6sZA9j0hONCtwhCiq0/DJhVgbgCZRl
	 uMpXFJrcs5zdQ==
Message-ID: <b92a06fb-9032-4b96-a733-e80fe6ddfb20@kernel.org>
Date: Mon, 12 Jan 2026 22:13:20 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [thomas-weissschuh:b4/at-vector-size-arch 2/24] ERROR: modpost:
 "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
To: kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
References: <202601131142.f4Kyqt82-lkp@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <202601131142.f4Kyqt82-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 19:20, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/at-vector-size-arch
> head:   48790f0896dc14ed71a371b1a81ecd5c32347185
> commit: 7ad4197ef8bdb56c2e4b411acc9bb311e91f6350 [2/24] ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
> config: arc-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601131142.f4Kyqt82-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>>> ERROR: modpost: "__bswapdi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [security/keys/trusted-keys/trusted.ko] undefined!
>>> ERROR: modpost: "__bswapdi2" [crypto/wp512.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/pinctrl/pinctrl-single.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/backlight/qcom-wled.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbfillrect.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbcopyarea.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbimgblt.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/sysfillrect.ko] undefined!
> WARNING: modpost: suppressed 92 unresolved symbol warnings because there were too many)
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for CAN_DEV
>    Depends on [n]: NETDEVICES [=n] && CAN [=y]
>    Selected by [y]:
>    - CAN [=y] && NET [=y]

Sorry my bad.
While ARC770 cpus do support swape, it seems gcc doesn't define the builtin for
arc700 (and generates a libcall) and as Arnd mentioned we don't have -mcpu=arc770.
As a quick fix/hack we could add EXPORT_SYMBOL this in arch/arc/kernel/arcksyms.c ?

Thx,
-Vineet
