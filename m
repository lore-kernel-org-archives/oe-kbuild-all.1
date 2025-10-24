Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FD019C553
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 22:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761345021; cv=none; b=LWetlrTARO2va5xX0xbJyAO1ECMwlsLylHXPRR0Tpub3QAPf5BIqzBKHgNj9h3pRClWXRhWmSvX5RPm+R2aEJb55onTSS62Fx8+CAkKzDm9rB+NkWnhun0x4X6p7l0LJADACfOWqyarbqTQktMsF4VMRMjC/GZ0wzcEx6cg93dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761345021; c=relaxed/simple;
	bh=Ydxj6crre/l2v5ALw2elEGuZ5zZR7Jpp921F4G56DaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuLOXh1YFVmdSsDwDu5B6g1EpUUEXQgZ4CK0irP4KsVi2Z+qZ3+RMNtBV13sVyRWaVlV6AA6nWn838+s8SKeMenNfhLOySJ8G95tQrD9KoAHnT6JqLG9IJxhM1F5WS35gKrsr1nrd8X7UnkvAXIMBpLmQABuikzp97FzdqQUwng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=N80jyCMb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="N80jyCMb"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ctczW05Jcz9tNf;
	Sat, 25 Oct 2025 00:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761345015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTMCzcxqtsynBbiOChdmbscD6kJmLLxiuMA+AcfeJX8=;
	b=N80jyCMbk72EDfqdxn1x7S2fa7MYXDzOAN9dtq/VAKDynqt035XoMeYopC/ro+RzEkkOVO
	FaCI6DTXA+cFc15FcTPkC4KSmNABUCupomFJDU90Q+GWyskCg/B8QAvQ59NFiVTBdkkTOi
	mjRXkN/kILtZAuBXZAgitB6uXI+vMpk4FknSEvekJeYqxjA1EUOFstK8q8qZQzmNV+mFOj
	80QFzVV17ymSBs2fjz3bF7kwhh9+0PdZ4OrGYh3vsJOd/bXLlueSlKpGFaeIbY908NcO5I
	r7GRvMLOtxqnPuW49IzVJGn6ieWdImXHUsCwTfSMfknA750H1N7gk48SAxAswQ==
Message-ID: <142eb66e-aa66-4903-a1e4-86a4dcddcfaf@mailbox.org>
Date: Sat, 25 Oct 2025 00:30:12 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 3847/4098]
 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000
 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
To: kernel test robot <lkp@intel.com>, Matt Coster <Matt.Coster@imgtec.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <202510250550.66T4zLPd-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202510250550.66T4zLPd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: cfc7ba9256ab70c1955
X-MBO-RS-META: qdj5botpksorku17qt7t3wz4ny7kq941

On 10/24/25 11:15 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   72fb0170ef1f45addf726319c52a0562b6913707
> commit: 08b1e69d08203e31c1c8819203040516683e40a4 [3847/4098] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
> config: arm64-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250550.66T4zLPd-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.3.0
> dtschema version: 2025.9.dev7+g3b6fdac89
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250550.66T4zLPd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510250550.66T4zLPd-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
>     	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
>     	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
>     	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
>     	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
>     	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']

It seems [2] [3] landed in next already, [1] did not yet. Once [1] 
lands, this will be resolved.

+CC Matt (sorry for the duplicate CC)

[1] 
https://lore.kernel.org/all/20251022033847.471106-1-marek.vasut+renesas@mailbox.org/
[2] 
https://lore.kernel.org/all/20251022033847.471106-2-marek.vasut+renesas@mailbox.org/
[3] 
https://lore.kernel.org/all/20251022033847.471106-3-marek.vasut+renesas@mailbox.org/
