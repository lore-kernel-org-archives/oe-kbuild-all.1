Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A3B4AA58A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155319; cv=none; b=EDN0OuiBrOBmwevH0cyyEYf9GWw6OLC4qekj07QbFFnxUjlGQVQ+cZ1sVb6wwTl95fLXtOASSMeczRUnE3weZNGHywsFUAxIOlOKr5wCLFewirX8Lp1n3f3nSXzCpjkWh4O+zuCT4vk4qMc5KXidAk+Zv7jdgcRFUDa6i00ld/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155319; c=relaxed/simple;
	bh=3tzqI0q+zxlAWzlJmWWOoMgiD4euVahNEXOUSDYl3to=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlLy/f6w6wR6XIHRpM3EDawhztqh3fi506x59kQQFAHnb21obOFKrx21rRbx466pFtfJtZOP8Q0k6RAFBj6yG9HtDrqkPTTyGnmFiQmuhP0sk0V2uGdQoMxj/tJ5+CNDHPcC8YHaX2p4wUEkavgSASw6HdUzJ/FqpPfGvPp7vQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=QUloOQvt; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="QUloOQvt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ECA3109880;
	Fri, 16 Oct 2026 14:55:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1792155310;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/gVXuOntWQBeXOSFHG8G4uuiT9X+kqHug4bIp6088+0=;
	b=QUloOQvtxiqD3EsmfJ41LkOewIsO0LE3/NaolkoKbl3mBaYIWsi/V/G1UtTVys2vCxZCxp
	d/xbdgHiyPAF4/zZWSkh/k2cGt+YStkRj5DWud1kQHAaIGI0RhCW2jP2t0m3LxioNt6gLU
	SrLPFcb0B/yE2+LuaopbHQNdrORsKO/d7Gs7fDj8qNWGi+rPXq18ptFIMTZIfk/pGfO9nR
	jGFkGQWUrWDHNhjFZiXUuoKS6Neg2zTy26SthcSt+5JdtiM2Y+tpPpUi852BDQyz56yg2U
	Fqc/xs1rGk6YHZpx7HacLKYGv6TSD8ek0Y91oVKB+D0aw4FmwvUyjoGf+A9BLw==
Message-ID: <7ab1fd2a-185a-49f4-b2c6-cca54cc3db91@nabladev.com>
Date: Fri, 16 Oct 2026 14:55:07 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10997/16498]
 arch/arm/boot/dts/st/stm32f746-disco.dtb: syscon@40013800 (st,stm32-syscfg):
 False schema does not allow [[1, 0, 174]]
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <202610141435.Tun39EHI-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <202610141435.Tun39EHI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/14/26 2:49 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
> commit: 3cead63752de9036025d00ab910540d1104f9317 [10997/16498] dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes and cells
> config: arm-randconfig-2404-20261001 (https://download.01.org/0day-ci/archive/20261014/202610141435.Tun39EHI-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
> dtschema: 2026.10.dev4+g568711590
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141435.Tun39EHI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610141435.Tun39EHI-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     arch/arm/boot/dts/st/stm32f746-disco.dtb: interrupt-controller@e000e100 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
>     	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,nvic.yaml
>>> arch/arm/boot/dts/st/stm32f746-disco.dtb: syscon@40013800 (st,stm32-syscfg): False schema does not allow [[1, 0, 174]]
>     	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
Maybe this is a non-issue in next-20261002 and newer, where those DTs 
are removed in commit 6fa463cad26f ("ARM: stm32: remove stm32f4/f7/h7 
MCU support") ?
