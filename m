Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57279442D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 13:24:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8B37268AFE; Mon,  4 Sep 2023 15:23:58 +0200 (CEST)
Date: Mon, 4 Sep 2023 15:23:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: kernel test robot <lkp@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: db1000.c:undefined reference to `mmc_detect_change'
Message-ID: <20230904132358.GA4741@lst.de>
References: <202309031319.FjILvr3H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309031319.FjILvr3H-lkp@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Ok, looks like the problem is that the mips arch code is still built
without the au1mmc driver.  I think the code just needs to become
conditional, I'll look into it.

On Sun, Sep 03, 2023 at 01:47:19PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   92901222f83d988617aee37680cb29e1a743b5e4
> commit: d4a5c59a955bba96b273ec1a5885bada24c56979 mmc: au1xmmc: force non-modular build and remove symbol_get usage
> date:   4 weeks ago
> config: mips-randconfig-r003-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031319.FjILvr3H-lkp@intel.com/config)
> compiler: mipsel-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031319.FjILvr3H-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309031319.FjILvr3H-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mipsel-linux-ld: arch/mips/alchemy/devboards/db1000.o: in function `db1100_mmc_cd':
> >> db1000.c:(.text+0x1f0): undefined reference to `mmc_detect_change'
>    mipsel-linux-ld: arch/mips/alchemy/devboards/db1200.o: in function `pb1200_mmc1_cdfn':
> >> db1200.c:(.text+0x3b0): undefined reference to `mmc_detect_change'
>    mipsel-linux-ld: arch/mips/alchemy/devboards/db1200.o: in function `db1200_mmc_cdfn':
>    db1200.c:(.text+0x428): undefined reference to `mmc_detect_change'
>    mipsel-linux-ld: arch/mips/alchemy/devboards/db1300.o: in function `db1300_mmc_cdfn':
> >> db1300.c:(.text+0x240): undefined reference to `mmc_detect_change'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
---end quoted text---
