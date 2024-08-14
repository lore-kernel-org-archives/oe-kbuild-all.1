Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3AD1B86EF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723654350; cv=none; b=gITHJJnJ3CHRYVbW7VAT0bc/WgIQIyaTKyGOq5MxpEucD/+fIYTuvBNzI6DNN0zWmsIZSm/dkLMJmf2Kkr9Wf0OuQ44BV5omguu8ao5EMaQpwXqdUo57gWdl3P9foN7IHiWh3OJKDI5ogQhiiQeG8EHTMh2PSfpMXLlvDuqCUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723654350; c=relaxed/simple;
	bh=o4cRt1yinYpmPr1nhFmT28ycTOee1hrIMiR1SOB8pis=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=gB7J1wedomBcJJzrfaaKLAChM6cZCxRv2vMU5DOo9XhH9m6VJ/CD9jpzZiIcIWmQSrMcESdiALjASuBNQnwfymS2zIqShfgcE5qH9LDVwzy1C//dcxdPHGpwqLBhcDqp92SklL5Ikb32KLLDxTL23Ve7/BAFrkotQ6aIf2u730s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=twfK/7Ph; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="twfK/7Ph"
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BC93B87B1A;
	Wed, 14 Aug 2024 18:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1723654341;
	bh=jhn4Aqmmx8Hx/NT6InUCF6GEhiGWdIQQJLimrQkyVc4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=twfK/7PhqelaHkkP28BZUUsTjW8UJr/9p0edNeeVvOOxjJjKKX7vAFWP2uXdeh3pB
	 9SgJmkOVlfAAjMepcGC2+upZIeHN+QMqhilg25l4+2nkWGi8dLB8mStu+8aNRPkTow
	 zm04maO8kQPykwt2hwxY+b6qBKhS5N0UKLAh0Uwe7h5sbwRmfORpx4Qr6biMbgG0r6
	 FtVJhu4I4oqwyqsK+VL8omEIHz9ee5o4Mpdq8u1P2HEoyq/s5KqSz3xqQqnhPNPuHC
	 deMQffFkRPcFjdwS9XLNfFDEL6FaMFPRIxHBaWSkC0+9YKj2gMVRAJ9eGZw+L9gIWz
	 USqi4oGMvVFOA==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Aug 2024 13:52:20 -0300
From: Fabio Estevam <festevam@denx.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [linux-next:master 4168/4667]
 arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: dma-controller@209000: 'clock-names',
 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
In-Reply-To: <202408141718.3OlQiZ6Q-lkp@intel.com>
References: <202408141718.3OlQiZ6Q-lkp@intel.com>
Message-ID: <4af8a556109e614c0f6929209cf8b8db@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 14/08/2024 06:23, kernel test robot wrote:

> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> https://lore.kernel.org/oe-kbuild-all/202408141718.3OlQiZ6Q-lkp@intel.com/
> 
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/nxp/imx/imx1-ads.dtb:
> /aitc-interrupt-controller@223000: failed to match any schema with
> compatible: ['fsl,imx1-aitc', 'fsl,avic']

I will take a look at these warnings, but they all existed before my 
commit.
