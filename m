Received: from zeeaster.vergenet.net (zeeaster.vergenet.net [206.189.110.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAD76BFDD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.110.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707386519; cv=none; b=NtDPVc8Wau5z9HqO95Wx0Bmy8VYm7DlDa1xXXqJo9Fhcf2ofZ2wMxo0E0hE8y5VH7iSoKDgWOzg1hxh/I5RdXpMc12lbXXO257dGmsJOP3fT7QI30k6PyR47DSkz30Pj7cRRAeLWs/u2/3nyFRjURex9GFdk3rurY5LmwiXLnUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707386519; c=relaxed/simple;
	bh=gZ9DUt5ZTJDILBwMsCZ6wMbdwMkU+sMKxvXh+ZFwvkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3E6wQfyhBwgR9XB57QMvO9ZYp5VRFLgIWvAYfL0E5hQ65a01gZKwqMjjt0e9K76tkqkpu8wxIrLLSA+nAs5qNbt4sNlBp3atD9Gk/96oEIY833U2QDMLTRHpV4lPtwptRtbikg4RKC48a5xmuUDXf7OzUUR7qYnP2U5kup7yfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horms.net; spf=pass smtp.mailfrom=vergenet.net; arc=none smtp.client-ip=206.189.110.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=horms.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vergenet.net
Received: from madeliefje.horms.nl (madeliefje.horms.nl [IPv6:2001:470:6ae6:703:627d:9ff:fe45:2ad6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by zeeaster.vergenet.net (Postfix) with ESMTPSA id 0AE56200CD;
	Thu,  8 Feb 2024 09:55:02 +0000 (UTC)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
	id 7621F1A0B; Thu,  8 Feb 2024 09:55:02 +0000 (GMT)
Date: Thu, 8 Feb 2024 09:55:02 +0000
From: Simon Horman <simon@horms.net>
To: kernel test robot <lkp@intel.com>
Cc: Furong Xu <0x1207@gmail.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3159/4898]
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:836:20: error:
 initializer element is not constant
Message-ID: <20240208095502.GB1435458@vergenet.net>
References: <202402081135.lAxxBXHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402081135.lAxxBXHk-lkp@intel.com>
X-Virus-Scanned: clamav-milter 0.103.10 at zeeaster
X-Virus-Status: Clean

On Thu, Feb 08, 2024 at 11:23:25AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
> commit: 46eba193d04f8bd717e525eb4110f3c46c12aec3 [3159/4898] net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
> config: x86_64-randconfig-121-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081135.lAxxBXHk-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081135.lAxxBXHk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402081135.lAxxBXHk-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:836:20: error: initializer element is not constant
>      { true, "TDPES0", dpp_tx_err },
>                        ^~~~~~~~~~
>    drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:836:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[0].detailed_desc')
>    drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:837:20: error: initializer element is not constant
>      { true, "TDPES1", dpp_tx_err },
>                        ^~~~~~~~~~

...

I have posted a patch to address this problem.

- [PATCH net] net: stmmac: xgmac: use #define for string constants
  https://lore.kernel.org/netdev/20240208-xgmac-const-v1-1-e69a1eeabfc8@kernel.org/

