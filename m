Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A9445AD1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366456; cv=none; b=Hd6dNjMIgLFoAR/rvCn9RS6lB3OyacFoYyxYTzaI0Kw6XGHNNRoq/EVkr3LAzbTmdcNef2Nyyfmi24QapycCU2uPgt9DU4n2aEm2SMN5XpALUaceZlQML1udzSGJ2x/J4ZVs23pR0BM4H9QhnkvU3jEuIqwFDlam6TM+P8bQhpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366456; c=relaxed/simple;
	bh=c+uRWBmBUhnFlDGbWRs//cw7GCEee21bBPVrIv6Vwos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCgYThaC2vpDaFm437EgEHbgvxvR3sWYrCpjziUdPOtjPFlbTt/iRE+/xHc8fzxeKOH3ojavuqkdWe/IfKWogLxMUaEWrwWKdX0DZVBqQvPqlO94OOdducngLrxhcSs0EEEdZHSmyz7nmBI7+Q+0QuyJ8EFu4Rc2cYkCea5ti6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZb7sKKp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZb7sKKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A76C1F0089C;
	Wed,  7 Oct 2026 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366447;
	bh=2G3vvEFawUFPer0lTxaZBUoMVZP9/+jkzrCWsCwQQyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jZb7sKKp0sPkjI9N9l4XwnzGHBCl36D2f+IthLYQeTT5ektEH43Ot04FtHdxCfqC1
	 YD9OWi3qNHmseCthhHAICufOtlC9h6bb61aMovMZvRGKJGPaQ6ExVPSqxDJxLQF6U0
	 MfIHSfWgqrht4QMTTCjrvufKDzC2FQNPGU6f0PzC7BJRs4F/BR3j/97GdtdAMpx7N4
	 eaJmMbdAlozidxslye8kdz5/NYEeujdmrdOv/KmYYrRtwmKCLIHAyj9rgAYm19isQ1
	 0IlBe0afayer1lovELLF3EfTND+GHOg4sL3Wgrmb0pNoKH8optmwv8PMrijRXKLZ2b
	 jx4o2zkf8oVDA==
Date: Wed, 7 Oct 2026 10:47:24 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
Message-ID: <20261007-abiding-pronghorn-of-politeness-9bbebd@sudeepholla>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <20261007-predictable-interesting-mole-e02db7@sudeepholla>
 <yq5a5wzd4zow.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a5wzd4zow.fsf@kernel.org>

On Wed, Oct 07, 2026 at 03:09:27PM +0530, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 

[...]

> 
> However, we used the seven-argument form here because we do not know
> which input registers a particular SMCCC function may use.
> 

Agreed, but as Catalin mentioned, it raises question on how generic can
this call be by passing all other arguments as 0s. I did mention some
alternative there.

-- 
Regards,
Sudeep
