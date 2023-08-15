Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF82D440A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Aug 2023 06:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id E016180E0;
	Tue, 15 Aug 2023 06:23:06 +0000 (UTC)
Date: Tue, 15 Aug 2023 09:23:05 +0300
From: Tony Lindgren <tony@atomide.com>
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Andreas Kemnade <andreas@kemnade.info>, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [soc:omap/maintainers 1/1] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/ti/omap.yaml
Message-ID: <20230815062305.GS11676@atomide.com>
References: <202308142025.Bua4jLjW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308142025.Bua4jLjW-lkp@intel.com>

Hi,

Adding Arnd as these branches are now in the arm-soc tree.

* kernel test robot <lkp@intel.com> [230814 13:06]:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/maintainers
> head:   fda31904ffbc7231898198333804fa551b681387
> commit: fda31904ffbc7231898198333804fa551b681387 [1/1] MAINTAINERS: add board bindings list to OMAP2+ files
> reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142025.Bua4jLjW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308142025.Bua4jLjW-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/ti/omap.yaml

Looks like this is caused by pull request branch for "Devicetree binding
changes for omaps for v6.6" not being merged into pull request
branch "Maintainer file list update for omaps for v6.6".

Regards,

Tony
