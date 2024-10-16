Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4EB21E3DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 10:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073290; cv=none; b=MXiboNxrSIfhvJqsKLUdFQhl0afyeZ7RDyOwndQa7kwcHr50L8Sgi7cHoYhxXtuGyN+8sjW50TOq3lmGF7hefT9x8mLLsIVW6FpKXL0iqTxsyCtWU64zUgg0OfQeB4JkaSpByVQXkZ7rKvpcVsn84nt2sjiVUkdPZ//kAZLybYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073290; c=relaxed/simple;
	bh=Bsj2wg8iNsBy17mCLRhdo23JB+yGKK06j/LOapxOPRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFXoChrZjBc4ssY2r5pVqINBbk9RBZ47gGzuQUZDgWY00FjMFV7lH2tlB3RUZwDeyGmzy9/Lal5W2rTt2MO/QFgDoJTe+MUVnvrp+zzMWHmRMlmF3uBWskYZrOwzcyqeUBsDJrgXNhH4v87nwopcvzEK5tnzlL4LJoXTg/XR/Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bss71Lo9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bss71Lo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729073287;
	bh=Bsj2wg8iNsBy17mCLRhdo23JB+yGKK06j/LOapxOPRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bss71Lo9OQuQ5AogYz6rSQKRkwnjuC7D7cREGVEnXU3BoyBFK86FFu4PYx/MSlCo/
	 UZKY1LQKgSHOs0Ybd5H3O5tsxu1uTkpkEvnHXtOuPskvMYFb+6E+DyVx7VC0U+fq2K
	 8HzshMhfMZ4sqpD1biQHg249RRsrkSp0NL0orWjPkW65n5/12aQbz+YAhYpjnaF3mZ
	 MJjSwKZ0QIgW8t++XQGSUPG0r/ztTkO/SSBztwyGkrGyusTkrUwCS0j8aEtwro7Iy/
	 G6oQQvUOzVk7WC1FN3mopPB/3zwnSee7UdeACaIB79Qb2HOIjh3p1uZ7k9cRx36F2F
	 1uX8ul41fhTgg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAB2717E12AC;
	Wed, 16 Oct 2024 12:08:06 +0200 (CEST)
Message-ID: <c094ee1f-9870-4958-beaf-16d23c44ccb4@collabora.com>
Date: Wed, 16 Oct 2024 12:08:06 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3879/4439]
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pinctrl@10005000:
 'pcie-default' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
To: kernel test robot <lkp@intel.com>, Fei Shao <fshao@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Macpaul Lin <macpaul.lin@mediatek.com>
References: <202410160906.ckDFQWGk-lkp@intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <202410160906.ckDFQWGk-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/10/24 03:36, kernel test robot ha scritto:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> commit: 355508880d41cfa5b0643515f27b6da490a1345e [3879/4439] arm64: dts: mediatek: mt8188: Add PCIe nodes
> config: arm64-randconfig-051-20241015 (https://download.01.org/0day-ci/archive/20241016/202410160906.ckDFQWGk-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.10.dev6+g12c3cd5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160906.ckDFQWGk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410160906.ckDFQWGk-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm64/boot/dts/mediatek/mt8188.dtsi:1442.35-1447.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
>     arch/arm64/boot/dts/mediatek/mt8188.dtsi:1449.35-1454.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"

That was bad. I fixed it directly. Fei, no action required from you.

Thanks,
Angelo
