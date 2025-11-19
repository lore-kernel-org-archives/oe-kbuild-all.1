Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7419351FC9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763553952; cv=none; b=ADzCa2fjvI6re0mrMP9nxVoDcsS10bfhsOIoUSBJeNF1w0BaV1v1d8DAt26ituxvTkys9O6ngrT/8HmQmphSjDjHVxDkXA05HWxbD2Pxcc0gEYWCfVmhO/23Wnyo101CvwlvO4NCiKHnAgG780LKG2NVpCWBCEyeBgVwfEMkRho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763553952; c=relaxed/simple;
	bh=YQIXocJWLjE23UmwGMTTDN9vBUMzKcjTEMaqbrtGYns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaHmzYdxm6UfstxeAi5lzItG/FeNdLd5AGKGK09223cdjqkl4PMVULH2B3DrK29wStDMdo6uYSeYPZ7e/f3CtIdBxFXTSKccCIIWgwRCmoMCYIV8HgiKlWnR01y9shAXVkUddlO25j85W+vqXeJLpdGmT+bmhZRqx0YFuERce4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=E8Phpejb; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="E8Phpejb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kJLLRtLaE+q5AKVpSbDI+hx+g5sauSVCf6YEjCe8MqQ=; b=E8PhpejbjTgZ3YcqJ9E5C197aD
	jMHw+S3SvTuSzt5qiprDdr7hfUXJnvgi2ApPK9KgEbt+ZJYgL3Tj/hvQ1/AkXa5xUOGCvgYVYdPP2
	VgPB9OQJurr6cDq60MUGemrCoKDniVxgy6Ca00kZJOwastj+ScE6m0xJ87mdkAUTHv3EswvQevtOL
	FLdA6aKpe4MK7FkiYBvT5AFCdAIh+/KQehRPjhfETncMzEO/mYejBi44EMpaKv+A0MbGo6oQ40BbS
	N6TjqvVfa09C7PyNsYrjRIbFFy0HdXQIIgXKFLqMTc7TArLbi3cCj644Tf05FSck3R+C1Ns4pyviB
	aKDk22MA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40040)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLgwT-000000004fK-1uiB;
	Wed, 19 Nov 2025 12:05:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLgwR-000000003OW-1nrT;
	Wed, 19 Nov 2025 12:05:43 +0000
Date: Wed, 19 Nov 2025 12:05:43 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 14/15] net: dsa: sja1105: replace mdiobus-pcs
 with xpcs-plat driver
Message-ID: <aR2yl-ZZ-QGnnmTV@shell.armlinux.org.uk>
References: <20251118190530.580267-15-vladimir.oltean@nxp.com>
 <20251118190530.580267-15-vladimir.oltean@nxp.com>
 <202511191835.rwfD48SW-lkp@intel.com>
 <202511191835.rwfD48SW-lkp@intel.com>
 <20251119120111.voyy7rmy4mk444wo@skbuf>
 <aR2yEf04Pv-CZi1U@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR2yEf04Pv-CZi1U@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 19, 2025 at 12:03:29PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 19, 2025 at 02:01:11PM +0200, Vladimir Oltean wrote:
> > I do wonder how to print resource_size_t (typedef to phys_addr_t, which
> > is typedeffed to u64 or u32 depending on CONFIG_PHYS_ADDR_T_64BIT).
> 
> From the now hard to find Documentation/core-api/printk-formats.rst:
> 
> Physical address types phys_addr_t
> ----------------------------------
> 
> ::
> 
>         %pa[p]  0x01234567 or 0x0123456789abcdef
> 
> For printing a phys_addr_t type (and its derivatives, such as
> resource_size_t) which can vary based on build options, regardless of the
> width of the CPU data path.
> 
> Passed by reference.

Hmm, but I guess you don't want the 0x prefix. Maybe print it to a
separate buffer and then lop off the first two characters?

Another solution would be to always cast it to a u64 and use %llx as
suggested in the "Integer types" section.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
