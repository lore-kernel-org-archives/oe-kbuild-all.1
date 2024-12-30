Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36C17DA88
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570183; cv=none; b=M6DopBs9o/WxiVyGrZHxisL061TukOyifOdKCgumO30M+OOUj7kbqMkyrdtmHROiaRbb7u/Den62wRBAjok2tz4chJqUjYt/MvJcigdnGX7XMfRUJSDrb/LcwjfaRwfoMCPZPRJU9906rQ8rLQ7Fl+j0rsBoOhVbs21bOSJj0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570183; c=relaxed/simple;
	bh=eW/BU1YW9X+cj72JxOX4s+Kpdq1Z8F+pIPiZS0VFGNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GN4HVJppaxPZfWAUZis3SLL/dGTrnw5a7mFkPpWqOdk3DtCB/21QRFacmnPBTY6IeUwOE3JHiRHtHF/IDQR8Qk7N35bdmijbpr5xh6obohIsAIYUY4AEthYGiPzAxxl7TS2aFSwmqHZwZuA6IynpYF2DQgH/9iygGsA7XuKEJ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id27ikw1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id27ikw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BF3C4CED2;
	Mon, 30 Dec 2024 14:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735570183;
	bh=eW/BU1YW9X+cj72JxOX4s+Kpdq1Z8F+pIPiZS0VFGNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Id27ikw12CWcnIsxgLLwpaOSw8IZd2AOyWCOupIB+R7vUvu2YvE42XKCB0Bpdm6TN
	 quGRKYVInW2+NlHNDXpQJCeJHP6LaeM6K1VNPqXBxVOcle1xxK8Bz++D1umX40QQg7
	 CkolSaK05VGqMXCs94GJoMGGxP7lhlAwG8GyUhyodzjEENK4OXx4D/lw2sPCkWNVqM
	 5gRGCb4q+ZEuprsA+jA9Y2+0g5marYFQdWbFn/xCLOfEV8yv1rcHuDmHH15+9sjuzo
	 tlUahhSIzE37VJCDEk8MsXsF81vGDsFZMbBLmzJV1VkNy0akICZfmEiMMDdefpu9QM
	 XZLFzEm7cYKMw==
Message-ID: <876c0be8-51be-4578-8037-64bdc4f2753e@kernel.org>
Date: Mon, 30 Dec 2024 15:49:39 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [krzk:next/dt64 21/21]
 arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error:
 'dt-bindings/clock/samsung,exynos990.h' file not found
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
References: <202412300233.Ey9SD8JJ-lkp@intel.com>
 <8065b144-4d4c-4055-aa5f-e71897468464@kernel.org> <Z3KWdMqz_HKgYW3Q@debian>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <Z3KWdMqz_HKgYW3Q@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/12/2024 13:47, Igor Belwon wrote:
> On Mon, Dec 30, 2024 at 08:25:34AM +0100, Krzysztof Kozlowski wrote:
>> On 29/12/2024 19:51, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
>>> head:   f21231ac28f44cd5daf50bc8fdae381f451b46c9
>>> commit: f21231ac28f44cd5daf50bc8fdae381f451b46c9 [21/21] arm64: dts: exynos990: Add clock management unit nodes
>>> config: arm64-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300233.Ey9SD8JJ-lkp@intel.com/config)
>>> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
>>> dtschema version: 2024.12.dev5+gea243eb
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300233.Ey9SD8JJ-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412300233.Ey9SD8JJ-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    In file included from arch/arm64/boot/dts/exynos/exynos990-c1s.dts:9:
>>>>> arch/arm64/boot/dts/exynos/exynos990.dtsi:8:10: fatal error: 'dt-bindings/clock/samsung,exynos990.h' file not found
>>>    #include <dt-bindings/clock/samsung,exynos990.h>
>>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    1 error generated.
>>>
>>
>> So this wasn't built (no dependency mentioned in the commit changelog).
>>
>> Best regards,
>> Krzysztof
> 
> Hi Krzysztof,
> 
> Really sorry for this. This patch obviously depends on the previous CMU
> driver patch. If you would like, you can drop this change and I can resend
> with the dependency in the commit letter. If not, I will just keep this
> in mind for my next patches.
I applied with dependency.

Best regards,
Krzysztof
