Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E2C29ACC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 15:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780155215; cv=none; b=Ki0qa97/YcTJ9CpYI6fUhtj1nIiKRoN0TGZW8hga1c+wDjJa+m1TbIYazUsAusVNTFfXnP4F1bboCKIixOzPWPoWLuYxJ0IER81IaedVGz5s25/BWT/2Nv53nO+1L4Q2VCu18WhVFZFgqbmMnzCaef/G+4o5epvy+afZ0emGU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780155215; c=relaxed/simple;
	bh=UoDXPZVW7wCxVRZj9fmYmGsT+qtVDw7WSxGP+hmAl58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnOV3vdu9+X2C7AAkE74zaAohoTroa38drKcnoSB9e5TTL6TGfRTTmcTx+D5GkFGpXmZIywUBWvV+94ECPKzcTv2LgjtWDd5dK/FKSK9rkWhKfjVdc4DcaOFDowlTD90kVttuZQZasJ1/1h8M0/BV8luIvay755/dAJ9VdkWAtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=x3Uxk3b5; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="x3Uxk3b5"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gSPPv0WKMz9v9G;
	Sat, 30 May 2026 17:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780155203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9MiiKffw1/uK4zYJYTv6msTZkIg1ZjdIuxQf8Sysh4Q=;
	b=x3Uxk3b5zZLlyBH/dgClhqudddJ9E2RPDU/TokQuh1/nF8uGW4q+Ecje9xYrJEDA1AnIns
	x8NLWV/JsriojTuABDkAjQGQ3LN56TOdvce1Ot6XdONq2IZq0yAjKBdBdIismaSG6auh7y
	cKSw76GFg8RT3z2k+BGaV78bB7UcS6nb1vd2HhnDLz3GjEB8a0pQkwK1LY/Z7x2RfM6A0U
	XtKKb0ZaO+hfsqgXCcfkrpN3xqzDL4ByRaXX0KlUxZFH8nM1ThjsjUi5AXyMkxcOxFwimF
	2X7DMF+cESVe/eDQ1d/fh1VUW2IZLsUOEcrZTJFGQne3NTSGwPLN+nCUj85OGA==
Message-ID: <09db37b5-808e-44c4-ae41-ff9594e39c4b@mailbox.org>
Date: Sat, 30 May 2026 17:33:20 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 7314/9870]
 arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f
 (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of
 ['cirrus,cs2000-cp']
To: kernel test robot <lkp@intel.com>,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <202605300905.msiJHWF3-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <202605300905.msiJHWF3-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: pbgskcqepexhacrt9sy49mkffuqfyoho
X-MBO-RS-ID: e7bb63528a375d9a969

On 5/30/26 10:02 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7da7f07112610a520567421dd2ffcb51beaefbcc
> commit: a3dcb0a3204f75f6841d8f7d0dc232f51706dfb9 [7314/9870] arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist
> config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> dtschema: 2026.5.dev9+gdf9ad30c5
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300905.msiJHWF3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605300905.msiJHWF3-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible:0: 'cirrus,cs2500' is not one of ['cirrus,cs2000-cp']
>     	from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
>>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: clock-controller@4f (cirrus,cs2500): compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp'] is too long
>     	from schema $id: http://devicetree.org/schemas/clock/cirrus,cs2000-cp.yaml
>>> arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: /soc/i2c@e6510000/clock-controller@4f: failed to match any schema with compatible: ['cirrus,cs2500', 'cirrus,cs2000-cp']
>     arch/arm64/boot/dts/renesas/r8a779md-geist.dtb: mmc@ee100000 (renesas,sdhi-r8a779md): compatible: 'oneOf' conditional failed, one must be fixed:
>     	['renesas,sdhi-r8a779md', 'renesas,rcar-gen3-sdhi'] is too long
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-mmc-r8a77470', 'renesas,sdhi-r7s72100', 'renesas,sdhi-r7s9210', 'renesas,sdhi-r8a73a4', 'renesas,sdhi-r8a7740', 'renesas,sdhi-r9a09g057', 'renesas,sdhi-sh73a0']
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a7778', 'renesas,sdhi-r8a7779']
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a7742', 'renesas,sdhi-r8a7743', 'renesas,sdhi-r8a7744', 'renesas,sdhi-r8a7745', 'renesas,sdhi-r8a77470', 'renesas,sdhi-r8a7790', 'renesas,sdhi-r8a7791', 'renesas,sdhi-r8a7792', 'renesas,sdhi-r8a7793', 'renesas,sdhi-r8a7794']
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a774a1', 'renesas,sdhi-r8a774b1', 'renesas,sdhi-r8a774c0', 'renesas,sdhi-r8a774e1', 'renesas,sdhi-r8a7795', 'renesas,sdhi-r8a7796', 'renesas,sdhi-r8a77961', 'renesas,sdhi-r8a77965', 'renesas,sdhi-r8a77970', 'renesas,sdhi-r8a77980', 'renesas,sdhi-r8a77990', 'renesas,sdhi-r8a77995']
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r8a779a0', 'renesas,sdhi-r8a779f0', 'renesas,sdhi-r8a779g0', 'renesas,sdhi-r8a779h0']
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
>     	'renesas,sdhi-r8a779md' is not one of ['renesas,sdhi-r9a09g047', 'renesas,sdhi-r9a09g056', 'renesas,sdhi-r9a09g077', 'renesas,sdhi-r9a09g087']
>     	'renesas,rcar-gen1-sdhi' was expected
Geert, could you please pick up:

[PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500

Or would you prefer me to send it separately as V3 ?

Thank you !
