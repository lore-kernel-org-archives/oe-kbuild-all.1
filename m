Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B591C1ACEAF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320028; cv=none; b=AVBK/HyebunXiEWm9DVCh+iglr8EIbhu3LFmi7GpksXkCjcdlZs/KXiR9ZwyNH2yZ+CRnOILwgI0z5Mu8aNCaVW9VsfJ+9WYMC37+Tv1BywegP6veXd4ZgoTkPKAMF357aFQ7LpHQj0cac69vnUqghp9sSQybPYXyN5EoSjxXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320028; c=relaxed/simple;
	bh=C+Bq8ipYnz92+Enmh0aXVFabM7AIEavydUEvr+Wrv74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YeVvU6rrTIOx8ap/z9pI/h/Zkaj4VckjobbJ2MkYAVJk+I+WLNwVwZuv2eh7roCZCc+1QxChj+ijGklLGGYNKseGeoFpLNbeiQujVep9enDLF+l0LLthM7P/jKslD78VIrDQuwTLM/KmTnBc998lrVstsBsZ73fALUl+kUZAnEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=q2lX5h6S; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YrAmy83J; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q2lX5h6S";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YrAmy83J"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ctRkv5FpXz9thf;
	Fri, 24 Oct 2025 17:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761320023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HkNLoc6iDrQi/3DxxT8TMORWFf6VmxqpceH8wU9iPc=;
	b=q2lX5h6SifuOMko+Yg8tlj5CQHxRQmrH965ZxVKsRrvHtRoPQkdjx8XHRHqJp9MXO+oCzb
	/xdEOGamcHDxdbqMSPLITCh5h3z5DCjzVyz07fxwNSfOPRfYXQ8B3/iLgWdLPUqoSP8zXX
	G1v/bzDZPC8drHGmUVlq/Osis6EPJF+bakYsx+Wyjy+0jbEMwyRn14leZ93HEytRohQw+z
	Ux93Pk+1mB/QCfkiNe7kkmE0LJlYhDF730ChTViKeyLAoMMHJ+Lmr5/ixC8IH29roVBYnN
	D914ADB87qPS6+HGpEv9AYopQufSN2womc9GuklHjrse0yoDY6JZE0z3FK2Dig==
Message-ID: <5dd249c5-0754-4031-9cc0-0916e92075eb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761320021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HkNLoc6iDrQi/3DxxT8TMORWFf6VmxqpceH8wU9iPc=;
	b=YrAmy83J2KkhE1qPUggVwfrhQefK6fnxH8UnFWjlqEKeDaZfyLBOk0C2f5/+TqTBNqw/Bx
	tTDcRVIpNpP7kPBZO4+JBMQISci5WAMQCruhspmTNbUiGWvLii68uW8mS9W+0ITgDVAH7A
	mBAOiw1xFZMnxvjLJKtCCn27VAXQjfN+2bz7hjt19nZT237h8SR3zog9WVOMiuGHL5iSx5
	pDXTReOgTbMZqcNFkpjCOtefs4LLp91kGXAUazE/VpvlPQTAWNIfS+dhxvGW/2ZRhbWHBx
	SYoeHV+VOr6LinRqKkq8KBrjT1SPNbusIAM7mAKnvtfaGD3HwGR/jKkzEUphkQ==
Date: Fri, 24 Oct 2025 17:33:39 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 3845/4098]
 arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000
 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
To: kernel test robot <lkp@intel.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Matt Coster <Matt.Coster@imgtec.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
References: <202510242309.6p5FyVLQ-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202510242309.6p5FyVLQ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cctw17opkc1wqfm83iy6majamrrn8pji
X-MBO-RS-ID: bc8623e4fa881a8a942

On 10/24/25 5:21 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   72fb0170ef1f45addf726319c52a0562b6913707
> commit: 0eb6f5143b1daede692ee143df604197f9922164 [3845/4098] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
> config: arm64-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242309.6p5FyVLQ-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.3.0
> dtschema version: 2025.9.dev7+g3b6fdac89
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510242309.6p5FyVLQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510242309.6p5FyVLQ-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/renesas/r8a77960-salvator-x.dtb: gpu@fd000000 (renesas,r8a7796-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
>     	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
>     	['renesas,r8a7796-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
It seems [2] [3] landed in next already, [1] did not yet. Once [1] 
lands, this will be resolved.

+CC Matt.

[1] 
https://lore.kernel.org/all/20251022033847.471106-1-marek.vasut+renesas@mailbox.org/
[2] 
https://lore.kernel.org/all/20251022033847.471106-2-marek.vasut+renesas@mailbox.org/
[3] 
https://lore.kernel.org/all/20251022033847.471106-3-marek.vasut+renesas@mailbox.org/
