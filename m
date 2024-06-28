Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA81C230C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586269; cv=none; b=XCIyQfJ7U0A04ooy5oxk0tVKVpFNNYm+Rgmh+l0u3xMqiPNi2heiIpJ5LbXMrM/Pp0nwjBLHNJNN02AmfUMvUc5S5SQlil+mUFBKh9qaAozemQKZ9x4vePQwiu2Pfaa1Hng5lBhngCO9EAsmJAZL650dYyNeFKTHZSJwka2tu60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586269; c=relaxed/simple;
	bh=yADbLrSSLmXevkXmOnu7/ArO92mC12fWwc3TeZ9QSnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=unLVGF+Tc/RRPIRjV5/D/0mFi0F5cF1o8wMmgJGD9SVam5xAqurTg3/3TdU9K86hYCctsrBZ93hpW7arAJlkIIKhoSc9fJjm2LE78AY2AFVMUYJYSSYwWE8VM7NK3fhRHofbchi0YRH8xyC4yJKOGXI3rU0lZwctkerSBQVW1m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZ5BWwsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZ5BWwsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A842C2BBFC;
	Fri, 28 Jun 2024 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719586268;
	bh=yADbLrSSLmXevkXmOnu7/ArO92mC12fWwc3TeZ9QSnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZ5BWwsPslu1h7WlBc5zcWG6qwlls6QImN4lLFthy7+tjzelvSTt7LJpkHQR6GRiJ
	 ujJhHFF2jx0SJYDaETr5sLRt68IO8L1jfG/FhDQpnTObPT48p5kX9O6/bBbY+h2oYB
	 RoJL+DVWeTmESh1eUfecU+cfLHZGmBIgwdzbukIsHQUJikcUdNJ+oJwBxkk6OC7y2b
	 wSz2el/weMC/UgGdwK5ALW6zoDSYOra9mgyp4aHuTWaHClwqrpzQ6OiIUglahMnfxU
	 Dt+uX6WVfU3XociXsRRVGLEZOtWRVLyAdvvhVFa2ajseJ8jfxjz6heV7ciVGGZsU/U
	 7mkBBALEAiLCA==
Date: Fri, 28 Jun 2024 16:51:04 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [linux-next:master 8329/9027]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /pcie-ep@fe150000:
 failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
Message-ID: <Zn7N2Ak3_72qbJyo@ryzen.lan>
References: <202406280710.UM3PNqsz-lkp@intel.com>
 <4126102.zXnORWrf4K@diego>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4126102.zXnORWrf4K@diego>

On Fri, Jun 28, 2024 at 01:27:35AM +0200, Heiko Stübner wrote:
> Hi,
> 
> Am Freitag, 28. Juni 2024, 01:16:09 CEST schrieb kernel test robot:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   642a16ca7994a50d7de85715996a8ce171a5bdfb
> > commit: 2fe9fe4e54f5763b8b681478dda9ac61fd42ecaf [8329/9027] arm64: dts: rockchip: Add PCIe endpoint mode support
> > config: arm64-randconfig-051-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280710.UM3PNqsz-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > dtschema version: 2024.6.dev2+g3b69bad
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280710.UM3PNqsz-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406280710.UM3PNqsz-lkp@intel.com/
> > 
> > dtcheck warnings: (new ones prefixed by >>)
> > >> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
> 
> the compatible is part of the binding that was applied to the pci
> tree in [0], so this should resolve itself in next shortly, I hope.

I think so too.

The pci/next branch hasn't been updated for 9 days:
commit f117d19a8dc6e765092d674d36c5cbc2cc00102c (pci/next)
Merge: d745ced0b5fa 3dadb4871578
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Wed Jun 19 13:44:38 2024 -0500

even though the topic branches have queued up newer stuff (including the
dt-bindings), so hopefully they will update their for-next branch soon.


Kind regards,
Niklas
