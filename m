Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA14763C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713428451; cv=none; b=MeMInTpxsE3eCjEpGnQO+FNR3e4Ls0qQB7S3EEMkhHByWJlqY9HPkj9H8kjmnFTHEaW/di4NUbOZS43iQQfVFaHWI01l3kKokqDC6gtvSCZmT3CyFgNKj9nfSRz3aSuPOIDXF+3LsFKalYCeRQiVtKPt6Tpdn1L/Rwj7JcDk8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713428451; c=relaxed/simple;
	bh=p12mRcKFXP8hKXy+O4tERbH6P229K22MaXEPKWmoZL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE15s2rMlvlMSlAWD/9M74jdqdjR5yfpnR+Bgoo5BCtYjgLEw3kh+J5DWfDjxHd9AVuABYSLgpIWgWvYv+TvVjgX+/t3nzTLBZQ/jelrJtvMX0Gz45GR8pUGOnZYpC6zP0LQKpVytBedXscsajCllMkxCqaCITeiT2s7JBLZFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=06bK53f5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="06bK53f5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=poeqGWAuzEib6iyERmB6iRNsS7ERoA38Bv4rmj6bMlk=; b=06bK53f5BXdv6kWHz1QPLjl2Zd
	qZ3Ca9nE6wYyXk2NJLioRh/f5n/Bp/2V7kgXSAaiWik1MOY0JxW6oDADOxdaPElXUgvew++VhPaR6
	D7+zDVirdSJQZotSCYEIPEJZdDRMYEVmiQ5u595ypwGHEsbZtS82oDvozfYFwTwhoqxKjc422SHO/
	sIBZvmHHhFF3ZkwWnJjKJyLJ+IR9LwDDENkxkqzgDno+ncnck0UNUiXpug44g/pjLqwd5TAA0naX/
	SDFjdwFnUNMAkji87LV2ydmwBrWGfw03OVp80ZCqT40XCFm2Srk4iaoiSBb3+RfLlhzR4JeMtA9NN
	PzQR+DLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50800)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rxN0d-0005O2-0k;
	Thu, 18 Apr 2024 09:20:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rxN0d-0006n0-44; Thu, 18 Apr 2024 09:20:43 +0100
Date: Thu, 18 Apr 2024 09:20:42 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>, Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm:zii 20/80] drivers/net/dsa/xrs700x/xrs700x.c:714:37:
 warning: 'xrs700x_phylink_mac_ops' defined but not used
Message-ID: <ZiDX2jEuwq8n5TTN@shell.armlinux.org.uk>
References: <202404180634.GZNTrBPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404180634.GZNTrBPU-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Apr 18, 2024 at 06:26:42AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
> >> drivers/net/dsa/xrs700x/xrs700x.c:714:37: warning: 'xrs700x_phylink_mac_ops' defined but not used [-Wunused-const-variable=]
>      714 | static const struct phylink_mac_ops xrs700x_phylink_mac_ops = {
>          |                                     ^~~~~~~~~~~~~~~~~~~~~~~

My testing did not produce this warning, so I'm guessing that by default
the kernel does not build with this warning enabled - which seems to be
completely mad. This is not the first time that this has happened... and
it will not be the last while the kernel adopts this policy.

Your follow-up email shows that there are other warnings which will be
spat out with W=1 which will make spotting one new warning difficult,
so this isn't the answer either.

I guess we are now completely reliant on the 0-day robot finding these
cases... which sucks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
