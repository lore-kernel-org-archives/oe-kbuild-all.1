Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51622750ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497148; cv=none; b=ibHz8VKaXGPynBCxghaQ57Ayb2ppF7qSeEFsvwmLX3Ltz0TLl7Pq4MRZwQBpdR8bdEGPxk4fM21zAh+WIWJP2XHyBmVSspZdC/ePRl19OpzzubBAR3l/YUv2LM1d6Ihv85jZw38gu10OlYZEN4z1pvJZfU0OydeWAyUFkVWfVgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497148; c=relaxed/simple;
	bh=x/eIzLLXpaI8DSRHWDzRJDR2wBDAqIy+IK0ssQnmEr8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=amC32FK4A9+KHac9fAgkJUOblM3eBzzvdf1hCV8FuyB1FpIt1RlcfTGmwlvjr+sH/qxitRzuMZ6WPPo3vyxrldOmxBCvlpTn1lalsD2Ab9XxbQgSlvDlqWle1lGW28OLe4IN617lwTYUt/Zl9CaK8mazgzcZHc3XoxLvKoem6L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dsV063fr2zJ46Dv;
	Fri, 16 Jan 2026 01:12:06 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A7F440539;
	Fri, 16 Jan 2026 01:12:23 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 15 Jan
 2026 17:12:22 +0000
Date: Thu, 15 Jan 2026 17:12:20 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, <andriy.shevchenko@intel.com>,
	<carlos.song@nxp.com>, <fluturel.adrian@gmail.com>,
	<linux-i3c@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 1/1] i3c: Add stub functions when I3C support is
 disabled
Message-ID: <20260115171220.000001b7@huawei.com>
In-Reply-To: <176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
References: <20251230145718.4088694-1-Frank.Li@nxp.com>
	<176840281753.1259180.16475027635174872850.b4-ty@bootlin.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)

On Wed, 14 Jan 2026 16:02:06 +0100
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> On Tue, 30 Dec 2025 09:57:18 -0500, Frank Li wrote:
> > When I3C is disabled, unused functions are removed by the linker because
> > the driver relies on regmap and no I3C devices are registered, so normal
> > I3C paths are never called.
> > 
> > However, some drivers may still call low-level I3C transfer helpers.
> > Provide stub implementations to avoid adding conditional ifdefs everywhere.
> > 
> > [...]  
> 
> Applied, thanks!
> 
> [1/1] i3c: Add stub functions when I3C support is disabled
>       https://git.kernel.org/i3c/c/8564f88df202
> 
> Best regards,
> 

Hi Alexandre,

This is going to make for an 'interesting' merge window as I'm getting
build failures without that patch.  I don't suppose you'd mind
doing an immutable branch? 

If not, maybe best bet is some local ifdefs that we back out
next merge window. I don't really want to kick the driver back
a cycle just for this.

Thanks,

Jonathan


