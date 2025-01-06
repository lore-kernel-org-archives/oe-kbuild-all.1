Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907B1D47A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 06:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146352; cv=none; b=qonsrnoVm7XvaMMsDGaRpN5iH/61LAiAfHK2tRt/Kun+YrU5uu0U8jpbZDLvket+GBGGtXO8WF4kmwZC+sE2uTqCOtMvMsY2eztWcWWFXVCCpY/lbioZi5eteCo5z/8+rL01elDWZTKdQtCRDYSSXz9cAKSJdoF3tXJDyxr1aRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146352; c=relaxed/simple;
	bh=9AVPFQ/rsiNebcAThPOSZ8clEX/2ufHxvE3r01U9TeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlSHmRZrA2G1U5UdPEgmiOebIGqztOItiYQYK9XLKEd47UCBa2lvgDXPE6F7wzRY1zMl7iJXCS+9vJNFUZw1+RF7FNa9pjnG4j7daGY2CNgkwbjmJHjU0n6NURtMbnxarnfKu23O6EuV6Tlmw6L3JWsGSjsSTG6Cnf0hhNV3DrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tUgy4-0006nP-5r; Mon, 06 Jan 2025 07:52:04 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tUgy2-0077V8-05;
	Mon, 06 Jan 2025 07:52:02 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tUgy2-007Ujf-2D;
	Mon, 06 Jan 2025 07:52:02 +0100
Date: Mon, 6 Jan 2025 07:52:02 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Junzhong Pan <panjunzhong@outlook.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, gregkh@linuxfoundation.org,
	kernel@pengutronix.de, krzk@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	lkp@intel.com, matthias@kaehlcke.net, mka@chromium.org,
	oe-kbuild-all@lists.linux.dev, robh@kernel.org
Subject: Re: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev
 port features
Message-ID: <20250106065202.d2qdd7zmwk4h645h@pengutronix.de>
References: <20241028214956.gmefpvcvm3zrfout@pengutronix.de>
 <ME0P300MB055370E97AB98D221B2E0782A60A2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME0P300MB055370E97AB98D221B2E0782A60A2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild-all@lists.linux.dev

Hi,

On 24-12-31, Junzhong Pan wrote:
> Hi Marco,
> 
> On Mon, 28 Oct 2024 22:49:56 +0100 Marco Felsch wrote:
> > I found two mistakes I made in my v1. I would send a v2 if this series
> > is interesting for upstream. The remaining open question is how the
> > driver dependencies should be handled (see idea-1,2,3).
> 
> How's everything going? I wish you all good!

I'm fine, thanks for asking.

> It's a very useful series for various hubs, gentle ping on it.

Nice to hear that others find this series useful too :) I prepared a v2
but wanted to get some feedback from the maintainers first mainly
regarding the dependency handling.

> On Mon, 28 Oct 2024 22:49:56 +0100 Marco Felsch wrote:
> > > > Idea-3:
> > > > -------
> > > >
> > > > Adding a function to the hub.c usbcore which can be used by the
> > > > usb-onboard-dev driver to register this function as hook. This removes> > > the dependency from the core and the usb-onboard-dev module is only
> > > > pulled if really required. Of course this require that the hub.c usbcore> > > driver allows custom hooks.
> > >
> > > This seems like the best approach IMO, if USB maintainers are onboard with> > it.
> Use the existing onboard_hub.h header to do the hooks looks fine.
> 
> I recently encountered some kind of platforms using an existing onboard
> hub yet their HW don't utilize the USBPE port power control feature
> while the hub support it.
> Instead, we have another GPIO for controlling the vbus of those ports
> to cut the cost.

That's exactly our use-case too.

> Wonder any idea could use this driver considering the limitation of
> the usb compatible set the properties of onboard_dev_pdata hard coded?

Sorry but I don't get this.

Regards,
  Marco
