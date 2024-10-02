Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85FC745F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727903042; cv=none; b=rPAiABcFtBmIJa4YetbvRiAvhzhkv+q0Ez+Ya956QCTn2kZfktNy1+uT2Mo+Z27tlnhtHgXyOTUw83TDMJ0uH1Wuo527l11UJFC2uMqY7mwZ4nJLpkyXtNSGucbyPHGQYfiQzsQxW+JrfYCU204V6WlT5HsYjNbtZd52shs5VkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727903042; c=relaxed/simple;
	bh=8/+Yy5n0J3ZQOK+/10sN89WyPV3LTIuebryehikQpvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWCxmm3Qvfa1Ay/S8TTcibIsTFzvPajOHpjXI8TaYclC4A/n86mEjvmoaxFh+KsCtr5L+Q5yW5nyR/FMrP2UTrJZzq49Gt6r7VjydqxBCynpIw7IXG/79xq90Vg/YNMHMxNstE3PLYFe0unySE4DKovfSXHZkNj2s9gnNJj1OnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=lQb4zefO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UALK7UfS; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="lQb4zefO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UALK7UfS"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id EA9B213805FF;
	Wed,  2 Oct 2024 17:03:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 02 Oct 2024 17:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1727903038; x=1727989438; bh=k+E1LgsciW
	zorUnIQuvBqz9S0STDoZ28oLs/EdlMJkk=; b=lQb4zefO3G28Mjn/mQ75+5aiPo
	2X3yXdtZZLoKzk5cspRoSq4EJldoMYd6vdDnn9Bx3FzaRdVYiA81v0Ovj3USj91H
	KRz7vCwLJd0+4YBJdkJtvQsDwJKYur+1TKl2mhh9ssO5UDblL4PC1UIl3bbka6uq
	whFY+DbzSl+eJ2R0haARZSF5OebPJJeK+7r3n2tYDoSTLTDPE/++jSFAt9yOf8m9
	TBTpQyz8BbddV9yq5ufKxy4uAiEuJ+/IMhjhUGECY6yIHaP/YE1bqnk1bcrrepBD
	Xz4+WyW4nEWVpRMJdada5f3WwIkRMBS6nPPNh0QonumQtja4Ars6B8Hb7gJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727903038; x=1727989438; bh=k+E1LgsciWzorUnIQuvBqz9S0STD
	oZ28oLs/EdlMJkk=; b=UALK7UfSoPBg3FRDiUyGm7HEQLO1JT7bmfau72EdJHjS
	g6ZBwC3K8L7Ib2MQkyk/meVCpDY/rNCjmHR6SSx5LX390zFzp3ZAir9NdCDq1xW2
	bUbvoh7izZqGz5PT7wmWo9sIJO1od8LSVlhBCyMldJRXvpqu7NhIqvgWO20bBN5m
	RQJsHJOBkEg2gGYrMpO3WIhZky6kaAElUpt5XgeD2iHDlUmkRkxWODzJRiIqbD+Y
	bfA5eD7AHPoz0P3EBVy0YR+PCAi9arxqbZ9xVQIlkP0gN+X21CxMrApokNN5Y0nt
	keLMvMAK1AdXL8lyC6TCf7r6C6J3FcoyQbEHiymDcw==
X-ME-Sender: <xms:PrX9ZlfTqYHPt9Loi8WRBmnKvJ0rnoFFT6_qDwU9wS-4hdrj6YQjDQ>
    <xme:PrX9ZjNCWVfcW58rTCd6EQWNBgbBHnptq0XviwZR_oUUOJyMKy9UTKfpV6IglS9U6
    SsOZAPJCjAtlse1IrE>
X-ME-Received: <xmr:PrX9ZuhZ35pYzZ0cGnnygRGAN1V-iDrugOg0C_irE9Caexf2_bvlWLBOWUp89qWmcWfo-iA4HDpMy_5vv25umloU1FKJtHeOttQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgeevffeltefhteeuvdefjeelvdetjeetteehheeiiefhheeh
    hffgtedvffeujeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptddurdhorhhgpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepfedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhhulhhirgdrlhgrfigrlhhlsehinhhrihgr
    rdhfrhdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtth
    hopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:PrX9Zu8jo_KcdElHmu0ZfmVRnMevEjbsGMwvHLNdwbqClJ-cWrqbkg>
    <xmx:PrX9ZhvLVoB5vG2h0KcTJPElHG3ZZRSo9PvVSXCtQZztJtPtbVzbRA>
    <xmx:PrX9ZtFYOccCrNuwBIoONUV--dra0uxSRQVRN7hCoqWMm_mmyu8wWA>
    <xmx:PrX9ZoMogOqlgHcYaPxa39E29OyN5eRCeWUTt2Ac2_eHNjk3yubLxg>
    <xmx:PrX9ZpKna9fD6O7hGt7rlTDJGNh88sP-FlarLX9DQcUz7AhsFuuHia1W>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 17:03:58 -0400 (EDT)
Date: Wed, 2 Oct 2024 23:03:57 +0200
From: Janne Grunau <j@jannau.net>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Sven Peter <sven@svenpeter.dev>, oe-kbuild-all@lists.linux.dev
Subject: Re: [asahilinux:bits/170-atcphy 4/16]
 drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1578 (fwd)
Message-ID: <Zv21PWncbEaXQhBj@robin>
References: <d7cd43ec-ba4d-193d-aa8a-50172f633ea1@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d7cd43ec-ba4d-193d-aa8a-50172f633ea1@inria.fr>

On Wed, Oct 02, 2024 at 01:17:12PM +0200, Julia Lawall wrote:
> Please check whether an unlock is needed on line 1589.

it is. This seems to be an error case we seldomly or never hit. Sven is
rewriting the driver and using guard(mutex)s making this kind of error
less likely. Fixed with an explicit mutex_unlock() before the return.

Thanks for the report,

Janne
> 
> ---------- Forwarded message ----------
> Date: Wed, 2 Oct 2024 19:08:09 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [asahilinux:bits/170-atcphy 4/16] drivers/phy/apple/atc.c:1589:2-8:
>     preceding lock on line 1578
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Sven Peter <sven@svenpeter.dev>
> CC: Janne Grunau <j@jannau.net>
> 
> tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
> head:   819ac8ed6c5777d4b18f0c88fc4a5e55a9ab9fdd
> commit: 4f5b8aa35e68a33a1d20b6ce62014794768af7ad [4/16] WIP: phy: apple: Add Apple Type-C PHY
> :::::: branch date: 8 days ago
> :::::: commit date: 2 weeks ago
> config: arc-randconfig-r052-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021851.sGmBSrDd-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202410021851.sGmBSrDd-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1578
>    drivers/phy/apple/atc.c:1589:2-8: preceding lock on line 1584
> 
> vim +1589 drivers/phy/apple/atc.c
> 
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1566
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1568  {
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1571  	int ret = 0;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1572
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1573  	/*
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1577  	 */
> 4f5b8aa35e68a3 Sven Peter 2022-11-30 @1578  	mutex_lock(&atcphy->lock);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1585  	}
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1586
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
> 4f5b8aa35e68a3 Sven Peter 2022-11-30 @1589  		return -EINVAL;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1590  	}
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1591
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1594  	switch (state) {
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1598  		break;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1599
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1601  	default:
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1603  			 state);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1604  		ret = -EINVAL;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1605  	}
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1606
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1608
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1609  	return 0;
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1610  }
> 4f5b8aa35e68a3 Sven Peter 2022-11-30  1611
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
