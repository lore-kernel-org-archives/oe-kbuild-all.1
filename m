Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B0370D4D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Sep 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682139; cv=none; b=IeGRWj51/iU/7mrH+cuTABoG7BQskCbbvhBHTHiKQ5Pe4iEHPupjri7wyh8Z0QymRqy9HxG8kN9GzyB4W13U79kIgOnsuhjOGp95r1Wf9F7B1vTF4qcbJwwev9U6l7K5ZBBHaxp9PjN6HzxWXWixPRn2h2lt6zkjcJDVTiO/noU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682139; c=relaxed/simple;
	bh=stxezfK4hQxcUjmb5y03NzZtLyEnK3IlvysTsC78w0Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YyfM4/5KIiIHLLTbIVjk18nnbGfLmomezsq3KwSwfPkwIUpauYGcLxifKFfaLYda88dq//5InfzopSz7kWAUUinVX4FWCiAlN9cE6MGW/x4qtQxSAEknB/NCnwcDTpeKRl9YCZTrIvyg1q4iHZ/03V0YKhMv703zXmOxbVZm3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=hXNQxAi1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=x4mGzt3L; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="hXNQxAi1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="x4mGzt3L"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 70FBBEC0094;
	Sun,  6 Sep 2026 04:08:56 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-10.internal (MEProxy); Sun, 06 Sep 2026 04:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1788682136; x=1788768536; bh=k51FiXWroliSHU3Z3YDFF44God8laCcZ
	eniZ68sLMn8=; b=hXNQxAi1bnthBorYOoBrNeC+IG8AxY6XWgUtkItBERVQFFFD
	WAaU2UVkFN6b2nHpG4JM/5CrbYtl7mbDuuXrPt7hSktnTRmgjyJ5eU18Bx4/sLtp
	Gf6Kp3BzWl9WLLZnOv/9b0QsAgfMikhBnKop7hrW56xWZI15woGQEqQ15HGVzICs
	Xtw6Io5y3M+DJDrnZ1ea7dVJNA6KKHD6GasIym4EpMUxm0c3TszWy0VtaCHZfHXW
	I+qvTyOhBViz63AepWVEl8lMLyraDmAbUyPzvEJGR5FehJIHfFyNnu0hzsX436Tf
	2oEJ/5Ct8tIQQEGIWBKyrLOdlb7HzTHlsBFHKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788682136; x=
	1788768536; bh=k51FiXWroliSHU3Z3YDFF44God8laCcZeniZ68sLMn8=; b=x
	4mGzt3LNa97dATxIfHAo7Ev+H+jJlQNzoBsHemP9IDXq/2B8ZbGZbWjaopmD0Uo7
	QyTQASAIk1HqQjNfp61oNIpverGbft4GkcmxIEPl1lIQtWL/DdJI+dsxjhZQCAo7
	GbjHgjw7Bkzg1nKLhNFzxFxsACU97H1gIrSyL4JIfdAdiKkYLGO2U7/H45KgNnjv
	EnEw1Pzl/Q9MOVXnvHdzFqrIt7gJd/nLsGmzFcRWq7z4QzijNoIFqwJ9I7iHAhib
	Q5sL9zyejhCwo7miA9KiJ22DWN807+yrKFLexS8OYMTTWpgw62DD80HOaB6ZbDsk
	zzn20C1Sh5VSElt5N/mFg==
X-ME-Sender: <xms:mB-damL3zOF1B3lgNQWhuAbjwnESRvnZr3z4kP3azym_KMUGzGW85Q>
    <xme:mB-dao80bjCgOcnxc3a6DTiPIw8dxNLZTHVTIalAvutj01kp8n6zpnwch1qRaWSRa
    qai3Wwoxp6TcKEM0zeJ1sryzgF-Mz7ElRYatXZ2DJoidm5hTrNbWxcD>
X-ME-Proxy-Cause: dmFkZTE7s/FPZNoj7JDKKd/wVdYegmWDwuizShtHY6nbQYuJAw/uI0XhQfjV3xpLjEDFAt
    yQXvtSB7Rcz1Hg3YC1zTN89ACICkP1LuCfFwA+ER6/1oUmHzQA2XM3V+82oyYWMmtxcp2B
    gC4+NGZa9vsG8WR5bExKfHTzGVrsBuAcYeF4UKZA0sYtOy7lm+z2DmWrL7CkXU3YwXOxck
    AVqwuqM4dAKWu2n5Zbl+e8eLb9oiRw/NgvGheWkpLH/MhSbblh86gon9apAfEllJIKmrbk
    b9BNExrudPfWklXv0bUq6nmkN350rWQvWyCorc5SdncDJ1/L5rSbfr8AoFHblLTCi7qxT5
    djBOH/68FJ5dOd0VBAkQ9susTcdIsGJC7DFWcqs0eqgavgvZkyyQir5GjjDAdl5wLbSVzc
    /cpfbz6kS1ie96hcQ5RFCPuLxEenf6ma5WBqAMVstICMBo368kOpg4ZKSw222hO274iZZs
    o4UU33dIpnBG+FYmdQ9dp1sHWz3q44/zt9sovABmTSpNw/lTinX+QcTQst2bPObDOW/riJ
    OpTRLOtfunkiJCS+5AQyg625p5q7cKxLwnotWlrzJEb7opXYEqlfvADcnBU5AC9P0e6Cqj
    eFZaDOuVT+BDBO4gWze89/CuBKB1gVSQThiBQJnOxVnhOplHvI6BYZwXF94Q
X-ME-Proxy: <xmx:mB-dag37q8ItI2ZQ2SGwP6I5aqr8cm8r57IlkUzfL75BA6cdAQBlGw>
    <xmx:mB-dapDbnUQ4C1CzrFtpUtYTThm0yWpcGAsE3IMBlBUSm-OqPVacyg>
    <xmx:mB-dagdaAD2UubniSi5qdCvCVAqNvQO7sml2vUpFrp1T3lA9sbhjwQ>
    <xmx:mB-damiKFPjnhPeRwZuBykr2gSNtDijO97usuA-_GxXhZYYml1jg7g>
    <xmx:mB-dalYYoEOc6PMrUHL5IkfSVDBb78l-lAhQfj9xQuUb85KfAZ9CaIYQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4F9612400098; Sun,  6 Sep 2026 04:08:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: At1zAwNTBdhg
Date: Sun, 06 Sep 2026 17:08:35 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "kbuild test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Message-Id: <6824e159-c0b2-4ddb-bb37-24fc3ef6d698@app.fastmail.com>
In-Reply-To: <202609060630.rC0Zz88P-lkp@intel.com>
References: <202609060630.rC0Zz88P-lkp@intel.com>
Subject: Re: [linux-next:master 3205/4370]
 drivers/firewire/config-rom-generator-test.c:13:9: sparse: sparse: incorrect
 type in initializer (different base types)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, Sep 6, 2026, at 07:26, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> commit: ee9a8c9afb579630fec599a7736a5ee677301a27 [3205/4370] firewire: 
> core: add test for root directory generation in config ROM generator
> config: csky-randconfig-r113-20260905 
> (https://download.01.org/0day-ci/archive/20260906/202609060630.rC0Zz88P-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): 
> (https://download.01.org/0day-ci/archive/20260906/202609060630.rC0Zz88P-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202609060630.rC0Zz88P-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    drivers/firewire/core-card.c: note: in included file:
>>> drivers/firewire/config-rom-generator-test.c:13:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int @@     got restricted __be32 [usertype] @@
>    drivers/firewire/config-rom-generator-test.c:13:9: sparse:     
> expected unsigned int
>    drivers/firewire/config-rom-generator-test.c:13:9: sparse:     got 
> restricted __be32 [usertype]

>     12	static const u32 config_rom_bare[] = {

These config rom images should be typed as __be32 array. I'll fix it later.


Thanks

Takashi Sakamoto
