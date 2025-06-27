Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C235957
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048673; cv=none; b=D93ty+t2zD3qGYOXpfBVKFxhKlEV/KyDpOTGHLhgE+rhoNDoCtACvVYshMzus89R4VSyrIXvOYU6TQLMMckCTl/1u+JS0uFlcwz66bjI4r/Aaqsun4jl6RzOONiboD9SrED+Ahpr1GFc6kaPjBlsWwDsCBhPoqQBvwbcELvHGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048673; c=relaxed/simple;
	bh=7zk6sxv+64s0R5z9SB8dF9vE0VCGISeV+jnSKtwmvDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiNYexPWH+DHx8d8aXITt8430ZMxCRsHhpDFKDiOIAz/CUh4No+gYfmDDjKEJXyqqgbAufw4LBPkLIV7pOaXqwZDfRC5+RwLnfx2GJgVMo04RC0lyP1/ypVWrlOQOTFAPVsrgEqAj+6F1flW6KHQtftRp0iC42lpltAcJyaJlpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RS4sEfKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RS4sEfKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE08C4CEE3;
	Fri, 27 Jun 2025 18:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751048673;
	bh=7zk6sxv+64s0R5z9SB8dF9vE0VCGISeV+jnSKtwmvDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RS4sEfKza5itHIvj+AKCkz2yTlmkWfycLAX2z9c0iyNKVVnZyYsW6nS7HUTtxvlcp
	 Otsa9qhe2mOniHIywwH7Eu+3T0Z3Rb7x2fXDHfNcBEYLoTzuxe+KOjfTILP7pl45Tk
	 5HAOk5WnNAE+OozDs2/pznHUQZFkAA+f51lJ2+LNkKkE/cf1S2dcwEA214n4gO4ymf
	 o34G3j3T7jHUGVB7cik0SSFieEyme8IADdzci4Wt0IbfjdXqCkw0IHan6Tpq+wmWzJ
	 Pcqc5A4HtbgA9fCR+HHYNzmB3FY+8Aez3dY4JF64SD+OV16T0Dci+wShhK3f8JZ83X
	 n2RVJM6XZvNxw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uVDkY-000000001ee-24ib;
	Fri, 27 Jun 2025 20:24:34 +0200
Date: Fri, 27 Jun 2025 20:24:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Georgi Djakov <djakov@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Gabor Juhos <j4g8y7@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [djakov-icc:icc-fixes 5/5]
 include/linux/interconnect-provider.h:156:12: warning: 'icc_node_set_name'
 defined but not used
Message-ID: <aF7h4v3powZzxQbL@hovoldconsulting.com>
References: <202506280134.bxPIYES0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506280134.bxPIYES0-lkp@intel.com>

On Sat, Jun 28, 2025 at 01:56:21AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc.git icc-fixes
> head:   65fceba30d6f1e7849048d0b292d3541695403f3
> commit: 65fceba30d6f1e7849048d0b292d3541695403f3 [5/5] interconnect: avoid memory allocation when 'icc_bw_lock' is held
> config: i386-buildonly-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280134.bxPIYES0-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506280134.bxPIYES0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506280134.bxPIYES0-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/soc/tegra/mc.h:12,
>                     from drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c:10:
> >> include/linux/interconnect-provider.h:156:12: warning: 'icc_node_set_name' defined but not used [-Wunused-function]
>      156 | static int icc_node_set_name(struct icc_node *node, const struct icc_provider *provider, const char *name)
>          |            ^~~~~~~~~~~~~~~~~
> 
> 
> vim +/icc_node_set_name +156 include/linux/interconnect-provider.h
> 
>    155	
>  > 156	static int icc_node_set_name(struct icc_node *node, const struct icc_provider *provider, const char *name)

Bah, I forgot the inline keyword.

Georgi, can you fix up this commit in your branch, or do you want me to
send an incremental fix for this?

Johan
