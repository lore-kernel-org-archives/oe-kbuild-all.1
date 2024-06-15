Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B2F52F6D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718474064; cv=none; b=c+SXCN4C8TnzrgHN2hVRAmXi544fbJ8KV16OHPzF5A8X1q9h262zKNFHMKHMSbsDTVcSzudjiVIEIWZS2DXN0WESeP/AbejlIfdT4UHfWXjuawU8SPBSeFb4TCFCKkR7ZdE5oqD2ib/h91kg1rpXhxT9viNANxGxlaqQkM6vdhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718474064; c=relaxed/simple;
	bh=RkaROT2FXl0egyzn+uKnwi7a+INr2wrD2pqwZqGGSI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5WOn63JiiknyO8CM061qVTyxsfhGFkNi9cCIFA2xB28HVkDEpu3xCWPWlV8W/VMUv72grBxJ8hoJmZ6j8Xxj58r4YvtlG9WDs2JY8CFFICwHeUfUQ5BNniYX0MsouYI6+VDloSkajeNOFirmxj/BZiohukAB9H1PP4dnCh+zXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLLZ4p2b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLLZ4p2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04238C116B1;
	Sat, 15 Jun 2024 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718474064;
	bh=RkaROT2FXl0egyzn+uKnwi7a+INr2wrD2pqwZqGGSI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZLLZ4p2bzjIFWrxZBAjh9GW1HYpspRzPM5W15uwbhyeHHmjuHAEDlRIOVx5Pc0R9s
	 LjzYm8zBxz9qpP3aI8sz/fLMntDfBZU+2JWwbP1MRp1SJWrK/qOVnrgYhwxeoNsA1Z
	 N+vRmO5NWd8O4OWP6CVskmfQtznxBH9vy1VIvkW2GBBUcxnTXn/Yr0cvNh/UAeOkD5
	 CqZ+1zOWnkCoEc0+F7IR2ISFVBdXIkFZ9M8eDykqXv3SB5mwNAmtPyq8gAasNDFb7v
	 lih0Lsjbq2ZFOvXYeLgCIi5MvHZ90F+i55ZQ9IFl6sjMtlPbp2YABONoBkrgfJZq/h
	 /eAodoTwJWsrQ==
Message-ID: <09d83e32-762c-4e49-a581-5af4bcc0872f@kernel.org>
Date: Sat, 15 Jun 2024 19:54:20 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mediatek:v6.10-next/dts64 44/53]
 arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/syscon@10006000: failed to
 match any schema with compatible: ['mediatek,mt8365-scpsys', 'syscon',
 'simple-mfd']
To: Philip Li <philip.li@intel.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <202406151352.R650eixq-lkp@intel.com>
 <1fcb8eb0-add5-4b0d-8aba-98db7b6677fc@kernel.org>
 <Zm2M4C0E5rhrK90+@rli9-mobl>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Zm2M4C0E5rhrK90+@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2024 14:45, Philip Li wrote:
> On Sat, Jun 15, 2024 at 11:30:48AM +0200, Krzysztof Kozlowski wrote:
>> On 15/06/2024 04:59, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
>>> head:   2f950510411a33d98eea28c22d7880eeb48adb61
>>> commit: b5ded35667ce9eb330083116e67af1f2f7886102 [44/53] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
>>> config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/config)
>>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
>>> dtschema version: 2024.6.dev1+g833054f
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151352.R650eixq-lkp@intel.com/
>>>
>>
>> MFD patches are pending.
>>
>> I have doubts that kernel test robot reports on each, known DTS failure
>> are useful.
> 
> Hi Krzysztof, thanks for the info. Do you mean we can ignore the DTS failure on this v6.10-next/dts64
> branch or we need ignore certain patterns of DTS failure (that is caused by pending MFD patches) so
> to avoid useless reports?

+Cc Rob and Conor,

I meant, regardless which branch and repo you test, there will be a lot
of false positives in DTS checks. The problem is that often patchset
consists of DTS, DT bindings and driver changes. The DTS goes separate
repo or separate branch than bindings.

If you test them independently, you often get warnings, but these are
expected.

What matters it is linux-next, but even there patches can end up with
some delays, thus causing warnings.

I don't have a clear solution, but I am afraid that after seeing many
false positives people start ignoring all of such reports, regardless
whether they are real or not.

Best regards,
Krzysztof

