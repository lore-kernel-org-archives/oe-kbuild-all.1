Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565DE15B57F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713435696; cv=none; b=f/mFhcnTKE8AAPn7Bim29w6+4n8wRIt4kdATk78Ez/ngDVS1HpEfCsc2mmEJHYscJ8F9FHfWcobQVeAGVPgwP8ljQHsGInRF2J/OQHY1tjCytYU+UjZNGhtw91EY6fyiYIvcZV3wSMhPJvKYHdY8XCLgcfFjcM5fMSc4Wefw7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713435696; c=relaxed/simple;
	bh=TOSpUGA72OU9RJmhPDExrSo2cVL7EV0N+DAE6SBbewQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTOT27KLbMTXe8lW6J88xa1owYXyHuPfgpfhYGjwNQS0LpSgJpKnyHolLxKx9wLyRJ17qMFA04/qPyWcWKC354+beOHW9Uudtc5YRJBvnYkoRq6tmVYSyVEymnYpp2uDquKB5QbmgaDVI56jJjENXQd7BcHDGUeqRyHChdVgZuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=sjSdTXCS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="sjSdTXCS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KCi8DpwXZzWEaIft2rkA/933ktfGUG6j1vR+eFuI6qA=; b=sjSdTXCSrErUWF9PF33igrLHy2
	3fmqlR3iRTFclC2KeUGOOdgpMDs9Tu8UqIuHqR9EOGsWytlLmrG28c20cEqd5vYGvuklz48Q/AMc4
	4pISoX42vHkoFf+YIrtW2RKpAiosPM1puiQQRXgTi4IVEsmK04DxU158L9SsQ/6qMjSCrpEXXacKp
	J+C/eYicc/uH+QLi7bl425jVjGr6E1l1seO1MDjSu3p73lWLDGqUX0LLYAYryXyejzFQD0vD8zAwE
	hGNL8SFMpiF0L7ZxA179bZE0IVQSVCscSoVUW+vHWtvwMpLB/82xz2o0RzW/TTV9kx+13/ykvl0mt
	k191SQ6A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34466)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rxOtT-0005hk-1m;
	Thu, 18 Apr 2024 11:21:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rxOtT-0006rh-Hh; Thu, 18 Apr 2024 11:21:27 +0100
Date: Thu, 18 Apr 2024 11:21:27 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>, Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [arm:zii 20/80] drivers/net/dsa/xrs700x/xrs700x.c:714:37:
 warning: 'xrs700x_phylink_mac_ops' defined but not used
Message-ID: <ZiD0J+PJllZD197F@shell.armlinux.org.uk>
References: <202404180634.GZNTrBPU-lkp@intel.com>
 <ZiDX2jEuwq8n5TTN@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiDX2jEuwq8n5TTN@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Apr 18, 2024 at 09:20:42AM +0100, Russell King (Oracle) wrote:
> On Thu, Apr 18, 2024 at 06:26:42AM +0800, kernel test robot wrote:
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/net/dsa/xrs700x/xrs700x.c:714:37: warning: 'xrs700x_phylink_mac_ops' defined but not used [-Wunused-const-variable=]
> >      714 | static const struct phylink_mac_ops xrs700x_phylink_mac_ops = {
> >          |                                     ^~~~~~~~~~~~~~~~~~~~~~~
> 
> My testing did not produce this warning, so I'm guessing that by default
> the kernel does not build with this warning enabled - which seems to be
> completely mad. This is not the first time that this has happened... and
> it will not be the last while the kernel adopts this policy.
> 
> Your follow-up email shows that there are other warnings which will be
> spat out with W=1 which will make spotting one new warning difficult,
> so this isn't the answer either.
> 
> I guess we are now completely reliant on the 0-day robot finding these
> cases... which sucks.

Double-checking, yes, the build is clean and does not spit out the above
warning. However, building with W=1 spits out around 5.3k of warnings,
so needle in a haystack, especially for a subsystem maintainer who may
have to touch a lot of drivers (like I'm doing.)

I guess we just have to accept that mistakes will happen, and there's
no good way to do a build-test to pick up on this kind of issue, and
just generate fixes as and when the 0-day kernel builder finds them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
