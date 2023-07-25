Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E81C882F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 06:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A95FC433C8;
	Tue, 25 Jul 2023 06:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690266177;
	bh=arIverP8/2Zd1vWKBsCptuh6oatXpTOHZEIMUW3W4xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZi8hO9V2rpdVcttoFStHCOcPSbtSGrimn/2OyVFvS5/oHB2ZCHAWSoy1NSqtOx48
	 VBrVxMNw1eGSCMDAhF2q+HkRSQhxj+DJXnhKqW39vYmtf+rNdHo1E28Re2Amd2Be5q
	 CaFC39jJ1AKDXWAOOfvUFU6GUeW+r7LDuQMvi86fe4KxWp6n5TWlyRwvGPDhP2Rvfc
	 vuS27Zy/xgj87tu53/pj0ThE5atgXNW678AJFLua0kwhoLmw8uaN081r+dRcjq1/3N
	 y3JHHvfsVq3vBZArGNIAEBWTAjKV00UExXtr43UF4Vq0B5AOOwenqtliUB2fP4rZXb
	 mZ8IgRN0yfKxA==
Date: Tue, 25 Jul 2023 11:52:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	oe-kbuild-all@lists.linux.dev, Kishon <kishon@ti.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: Re: [phy:next 50/55] ERROR: modpost:
 "devm_platform_ioremap_resource"
 [drivers/phy/starfive/phy-jh7110-dphy-rx.ko] undefined!
Message-ID: <ZL9qPZkF+m6ZrnAk@matsya>
References: <202307250509.oeudxG28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307250509.oeudxG28-lkp@intel.com>

On 25-07-23, 05:51, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
> head:   486392f44dd96aeb34bbbc1b119bc5d332f1164f
> commit: f8aa660841bca12aed51c967ed9bdaf1d97996ed [50/55] phy: starfive: Add mipi dphy rx support
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230725/202307250509.oeudxG28-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250509.oeudxG28-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307250509.oeudxG28-lkp@intel.com/

This would be resolved by HAS_IOMEM dependency, sent a patch as well

-- 
~Vinod
