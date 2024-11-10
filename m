Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8218E1F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731270131; cv=none; b=NMer8Gf2HDCcjYGaLvc7KYKSkGnQL9qrOTILrqJXHFHm3lsrF4BT24RRG+zflOhnkIKpSG7uFrcmdd/49LstGKO+VgH+uIk4D1ESlrd1dFuHd+Tlr4d7IruqQlSCLa8tGYcO4JzOaUywFeFyZx+lVBHQwZAlgD0huMZ4jCRtTsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731270131; c=relaxed/simple;
	bh=R9yTDrxST4ET4wrKWuYfvcg2/WdvffwRcYMlutrPtac=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oQQu7G0yau7WdfJt8mOMXq737AbtR4WsflGOOiR9wJBperkLisoe8TjRWpmssI3e6e6r6CB4u8ub3W2U/+R9TIXTXevCLFcEjN2ZNY1KYZazA6meLS4rCD8cl0UxK1J+nz5y15iUNrDd/kIuGA9mE/IV3CcYBgtrUfInFFFExss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LfKohP61; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cf59Uy9B; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LfKohP61";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cf59Uy9B"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id E920F114013A;
	Sun, 10 Nov 2024 15:22:06 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 10 Nov 2024 15:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1731270126;
	 x=1731356526; bh=BwUNf1yUscqYVhQDcb8MsnLrYZ5TFpYoEIR4rZXbico=; b=
	LfKohP61XkOurLEezGA9UaqfTO6X/j8SxuUPcgZops0h0eMa4RRqh8Q4lEZ0ltW3
	uhXbzzQBZubrnszUSUH9WlEcPb+lkovgHTbkVGQCudf3W8x2TYuiUEIZwvGcrtPk
	QxTr4z5OQPP3eqoqJdwdbXwJjaASnhMmcMAc/DSCahg68yr6J1II7LPlIWvkSWUH
	DYGI0S3ljLJ1K7Mzz+EnOQeE82AfbEPDNbtlvkbKBDcenDY3cAL84OzjE7P9Y8uP
	isyevvD8Y7GgxPx8AeXwtTVafbzKChJ1Bp+Tu7h/of0qfJKbll3Z4d7AxWbP8J6M
	gcjjKWvojdnsP3DGX4cmaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731270126; x=
	1731356526; bh=BwUNf1yUscqYVhQDcb8MsnLrYZ5TFpYoEIR4rZXbico=; b=c
	f59Uy9BuMgGgRmD6vJoYin9pjzmSJdZwh3enhJFtOdjaL79dWVLNMr0kEEGSOLTc
	iy+QrjKi1USkVa6ZYV2d3RV/Lt+z6W5fDWdNKcNlk+5snYqgJezCI6UVgwxGpWV9
	5vg7+o6l45iAPQHgDttECuxv5m1nC+Y3kaahAFDe1SDQeRsWTVcBz22I/WWnY7KU
	5V02L4d9xhWM79kbqqLJxLFKMRhfYwEryOWcAxTdqHcJ/q+tsgzZ+YQY5Bc0OT2I
	w2ee6xDUw68k1Pgfd44Riz8ICjOATAGxYhT7AmXKjkdIOaAquEyZybx9UZDi0tIs
	ayPsvg4RE7ZfOQzu+U/EA==
X-ME-Sender: <xms:7hUxZzTYv_kd-U85p4PnKROuB-n9rnRcMm67b5kH0Z6iRQ3zxkfOHw>
    <xme:7hUxZ0zi02LQBYWWjfxJ8poq04ggalB6fss7gA6vtXRenDtQsEuAntJikdrENg2-5
    sRXNRxL9CgRqpTZho8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepheektdeuteeugfevuddvtdeikefftdevkeetudel
    jeffffeikeevfeefieefhfegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurd
    horhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhope
    dutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhi
    nhgrshesrghrmhdrtghomhdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtg
    hpthhtohepjhhvvghtthgvrheskhgrlhhrrgihihhntgdrtghomhdprhgtphhtthhopeih
    shhiohhnnhgvrghusehkrghlrhgrhihinhgtrdgtohhmpdhrtghpthhtoheprghnuggvrh
    hsshhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggsvghlrdhvvghsrgeslhhi
    nhgrrhhordhorhhgpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehlih
    hnrghrohdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtohepqhhuihgtpghrmhgrihhnrgesqhhuihgtih
    hntgdrtghomh
X-ME-Proxy: <xmx:7hUxZ4369-4ThQL4hZtROl6o4kDvG09xA0ux3j-kmjTyUJRjfl802w>
    <xmx:7hUxZzDIjw_1kNGpy887kLC2MCZQZlYwELhuLGem9xG0Yfq0DKLnEA>
    <xmx:7hUxZ8gglzZr3VH7GBehgGeKRQorABF6qylnaxK9bsphJxdT_Ixp_A>
    <xmx:7hUxZ3pBEy9u_lWhd6bKVxk2FbveUdld7Jcs6pYne8mU-kFPAoouNw>
    <xmx:7hUxZ_NU5-WDX9en9CS-6W6nkZ94UdaJ8luWEkUYCd5bb1DTyJTlmOwA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2FFE22220071; Sun, 10 Nov 2024 15:22:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 10 Nov 2024 21:21:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Julian Vetter" <jvetter@kalrayinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Yann Sionneau" <ysionneau@kalrayinc.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Richard Maina" <quic_rmaina@quicinc.com>,
 "Sibi Sankar" <quic_sibis@quicinc.com>,
 "Bjorn Andersson" <andersson@kernel.org>, "Abel Vesa" <abel.vesa@linaro.org>
Message-Id: <2b7c9ca1-3fc4-4804-8d9e-ee503569b4fd@app.fastmail.com>
In-Reply-To: <202411102342.H8WZP17i-lkp@intel.com>
References: <202411102342.H8WZP17i-lkp@intel.com>
Subject: Re: [linux-next:master 6632/10559] drivers/remoteproc/qcom_q6v5_pas.c:137:46:
 sparse: sparse: incorrect type in argument 2 (different address spaces)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 10, 2024, at 16:11, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   929beafbe7acce3267c06115e13e03ff6e50548a
> commit: 0110feaaf6d0610d0089ae4897387df9a963b5f0 [6632/10559] arm64: 
> Use new fallback IO memcpy/memset
> config: arm64-randconfig-r111-20241110 
> (https://download.01.org/0day-ci/archive/20241110/202411102342.H8WZP17i-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.2.0
> reproduce: 
> (https://download.01.org/0day-ci/archive/20241110/202411102342.H8WZP17i-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202411102342.H8WZP17i-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void * @@

Thanks for the report. This is clearly a preexisting bug, and
the patch I committed only added a few extra warnings on top of
the earlier ones.

I've added a few people to Cc that touched the driver recently,
hopefully one of them can find a way to address this properly
by consistently using the correct types.

       Arnd

>    drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse:     expected void 
> const volatile [noderef] __iomem *src
>    drivers/remoteproc/qcom_q6v5_pas.c:137:46: sparse:     got void *
>    drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse: sparse: incorrect 
> type in assignment (different address spaces) @@     expected void 
> *mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse:     expected void 
> *mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:575:26: sparse:     got void 
> [noderef] __iomem *
>    drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse: sparse: incorrect 
> type in assignment (different address spaces) @@     expected void 
> *dtb_mem_region @@     got void [noderef] __iomem * @@
>    drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse:     expected void 
> *dtb_mem_region
>    drivers/remoteproc/qcom_q6v5_pas.c:600:30: sparse:     got void 
> [noderef] __iomem *
>    drivers/remoteproc/qcom_q6v5_pas.c: note: in included file (through 
> include/linux/mmzone.h, include/linux/gfp.h, include/linux/firmware.h):
>    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison 
> always evaluates to false
>    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison 
> always evaluates to false
>
> vim +137 drivers/remoteproc/qcom_q6v5_pas.c
>
> b9e718e950c3df drivers/remoteproc/qcom_adsp_pil.c Bjorn Andersson     
> 2016-08-22  121  
> 181da4bcc3d4bb drivers/remoteproc/qcom_q6v5_pas.c Krzysztof Kozlowski 
> 2023-05-07  122  static void adsp_segment_dump(struct rproc *rproc, 
> struct rproc_dump_segment *segment,
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  123  		       void *dest, size_t offset, size_t size)
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  124  {
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  125  	struct qcom_adsp *adsp = rproc->priv;
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  126  	int total_offset;
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  127  
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  128  	total_offset = segment->da + segment->offset + offset 
> - adsp->mem_phys;
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  129  	if (total_offset < 0 || total_offset + size > 
> adsp->mem_size) {
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  130  		dev_err(adsp->dev,
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  131  			"invalid copy request for segment %pad with offset 
> %zu and size %zu)\n",
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  132  			&segment->da, offset, size);
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  133  		memset(dest, 0xff, size);
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  134  		return;
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  135  	}
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  136  
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02 @137  	memcpy_fromio(dest, adsp->mem_region + total_offset, 
> size);
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  138  }
> a376c10d45a8e6 drivers/remoteproc/qcom_q6v5_pas.c Yogesh Lal          
> 2022-11-02  139  
>
> :::::: The code at line 137 was first introduced by commit
> :::::: a376c10d45a8e6ee5ea55791193f90625b35e156 remoteproc: qcom: pas: 
> Adjust the phys addr wrt the mem region
>
> :::::: TO: Yogesh Lal <quic_ylal@quicinc.com>
> :::::: CC: Bjorn Andersson <andersson@kernel.org>
>
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
