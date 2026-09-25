Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8224E8DF3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 23:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377264; cv=none; b=bcPaT1Qs8+6eRHdGbuDV+K66xMb0utzqUX/Xe8vvFAlxurxtXLH9BUzacOhbIQI8waMP5/fiqFd+vVBDrMr87xfx+wITbdCXOfekJIk8tomKUJblAZFO15OHet9katKD+BgynG+fSnm7zOQnCLQQRvn1f1WiPf5ZHaWAbmElKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377264; c=relaxed/simple;
	bh=CzSjCGIf8qLDgGxK8lj7xArN5mz2Bg30MhaB5pPmOfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pz75WbHAF6RQDspLFrqaxpYkHHIfO5wfGC9M6zWu1NM/FOV3yRzdt+WD6q5fIhjJaJm01J7ZRjf8AfPr2hs01/vT4QVJLS7isPVBoUAErV+zeuwpeGDh1es09054IdGTr4KSKAUORokvH4lcPZqNuwzzYBNxXMG6UgJdwJt54kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=BwWKsmnN; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="BwWKsmnN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 226B2103213;
	Sat, 26 Sep 2026 01:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790377254;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pJe7otTXfhOzcPzw+X7YtUCZsLV2cZUKdHaUD8hd7Ok=;
	b=BwWKsmnNb//81DrMh4/ej8meWUKntUK8dCd7U/RYdgeNMsDFdDuvQl2IiW1w/STgEIn6YJ
	XOX6t5dB6QyAWNwyL+5Ot0xSXapQhxi4I66FTWlgWSbsYcvE7KWsSFpzEBkzl3ifin3mn1
	UX9ac0KuCxrRQ9za48NbFXIVxQh+bnPjalJH2WiJjeMoTLa9bsyzCXnee2iDB7I+0HSrQM
	0U7QwI0rffMVwGjsHumcGcstS8XFhmpbytCbWaHO4yoUxz/W+dqcjfFBK3z8k/Rumc3KCG
	NYYme+ctmQxB6txRt3y2R7sB7LAtzNBO2tbHeZ7GZrme69v+juvY/lyaX9JPFQ==
Message-ID: <b70365a8-9812-434a-b514-4604835cf347@nabladev.com>
Date: Sat, 26 Sep 2026 01:00:51 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1377/10910]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
To: kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <202609252351.5UfBIiOJ-lkp@intel.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <202609252351.5UfBIiOJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/25/26 11:46 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> dtschema: 2026.10.dev2+g840a01d41
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609252351.5UfBIiOJ-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> --
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
>     	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
+CC krzk, I just cannot reproduce this locally. Do you know what I might 
be missing here ? Thank you !
