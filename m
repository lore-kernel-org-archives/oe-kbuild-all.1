Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902830;
	b=nzVBNAZ5O1QskLl0/2S3FSH+5zjP1Zyg/t2g+8VUhnq6WcjJVapzudWFl6ibgE+d6jGM
	 7MqoZZyFTsFsOLL5O/d3OOG1w5+I3OStmu0irEtZevfL4SBt/8TeFhaL82u3Tb5Ema2Pt
	 30E88oA3tjgvCbqL36ShmvtE3ngQor90rX/ND+Xsgx4fb3+K5p4gUJXNTlnFoVCCmZSbI
	 myDFDtoYSWSM79yeKG0AlE3GeJG0c4a76JnTZ87+G3qkVOUy2D5g57827vRzGgidrKGZ6
	 W63i8/aIB7RPZWHCHMaW6GSbXNuOVw61Gc9E5rq28Ee2SDqpoHIbgfVFB52/g3HlwzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902830;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bDHf3vBviWsWX8+KtLBebkLrUkMtwtJMje7OaYqsIrw=;
	b=X/FKB9UclIlTgkrUgJrvxw/EL/OzQtwHdDwVST/e1qXKd6xeCFjP98+V/lc9r/d3xhE2
	 a23SSHBdheG8wyKQtXP72iW5j8xDxYYWEn6b86zp/ml1y5oeQZXeFY7Qnj5Gib3BTyE1E
	 r8DY/4s1YTg+BFRpxESHJ7Kk8k+ryuROgaAtGrxMIXhdToEDZoM7vW2rlkeAjS8JMrawu
	 tr17FU5ivIq+Rxk+Wsx/P/Hc0FWdR7MmkWgrcUZbB/IPTJgVFo5f2bg56goTKNwyKO6S1
	 7e66UImEY9Qo0hc5GQkjg9C1dbtyIqUyzQNMYix41pjliGkTFA97hm8k5xIc5NGQ+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZER8UFuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943F4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZER8UFuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE601F000C4;
	Tue, 17 Nov 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794902830;
	bh=bDHf3vBviWsWX8+KtLBebkLrUkMtwtJMje7OaYqsIrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZER8UFufVIMea8ypfSgs9vlkrfhvegx0/CwEb1jeH9TEOosm8vswgkb/LFdEj7YpG
	 byIuZrbb4tcRpOkfS10ZwOLRxWmsulxzo2V7T9ld9Mq2Cu6WKsy4YiZG0KadjZ1CcR
	 u6ukAopwHjbxs0ssYaGfOxYpOhPx5csjGa8AgsaP48/1INmhjCuEemA03cFt22Tjm+
	 Izma77Nhjid9Xm4yaemmfYWulpkQB/lHaK9xg117Gl2gVTb6/dIFXC42MRHG4Uc86d
	 C71t2CCAdO5iNjDL4imKNMbcuKa2d09AU0bFda3F3cgTAabvS4lxDRircHzoatet/U
	 wdVAzAVm9v5hw==
Message-ID: <3357e540-f451-423e-96cf-ba73fadd5767@kernel.org>
Date: Tue, 17 Nov 2026 09:07:07 +0100
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7081/7459]
 arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000:
 failed to match any schema with compatible:
 ['samsung,exynos8855-peric-sysreg', 'syscon']
To: kernel test robot <lkp@intel.com>, Raghav Sharma <raghav.s@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>
References: <202611170759.pEwFwUBI-lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <202611170759.pEwFwUBI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2026 07:49, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   749a4de370409464cf8501ec5b2451df45c84eb4
> commit: 14a87bfb0614d87b04134156e090d7b00590d2b2 [7081/7459] arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
> config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117/202611170759.pEwFwUBI-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 16.2.0
> dtschema: 2026.10.dev6+ged91b647c
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170759.pEwFwUBI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611170759.pEwFwUBI-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/exynos/exynos8855-smdk.dtb: /soc@0/syscon@15420000: failed to match any schema with compatible: ['samsung,exynos8855-peric-sysreg', 'syscon']
> 

Ack, forgot to merge and push a branch.

Best regards,
Krzysztof
