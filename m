Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558924C3A8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="IkfjM7mz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=anPsdOIGPW667C8MixZVaZ1jFnDK9P/HXaOJJcmcb/A=; b=IkfjM7mzCLKhlE1OW0cl8bWGB0
	7lRY4l0Yp7lN0nvGU2pVJjJ5P5lEkQ4nwy41mdEAspAJTF6BHeDNvDEA/ZWjPDo4oQremWk/FL/6N
	3gRWg+J1Um65Tb8PfI/bzwz/IZdNMo081DFTAUsGvvjBckoX8FmVfbDpLVO0G7H1XPyM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rCiYO-002dSI-DD; Mon, 11 Dec 2023 16:50:44 +0100
Date: Mon, 11 Dec 2023 16:50:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: kernel test robot <lkp@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH 2/2] net: phy: at803x: add LED support for
 qca808x
Message-ID: <800219de-583a-460b-a567-4ad82968eef7@lunn.ch>
References: <20231209014828.28194-2-ansuelsmth@gmail.com>
 <202312092051.FcBofskz-lkp@intel.com>
 <657461a4.5d0a0220.42455.0c13@mx.google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657461a4.5d0a0220.42455.0c13@mx.google.com>

> Hi,
> this error is caused by the lack of the commits for the recently added
> support for additional link speed in the netdev LED trigger.
> 
> These additional modes has been merged in Lee tree but I guess we need
> an immutable branch for net-next to actually use them?

Yes. We cannot have build failures in net-next.

     Andrew
