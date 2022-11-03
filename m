Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618963A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 17:30:24 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1oqe2j-00054Z-DI; Thu, 03 Nov 2022 18:30:17 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1oqe2j-0003XJ-05; Thu, 03 Nov 2022 18:30:17 +0100
Date: Thu, 3 Nov 2022 18:30:16 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [sailus-media-tree:master 43/47] drivers/clk/clk.c:1022:5:
 error: redefinition of 'clk_prepare'
Message-ID: <20221103173016.a2stvc6jtprs3nzh@pengutronix.de>
References: <202211031915.GxCDfpg5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211031915.GxCDfpg5-lkp@intel.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild-all@lists.linux.dev

Hi,

On 22-11-03, kernel test robot wrote:
> tree:   git://linuxtv.org/sailus/media_tree.git master
> head:   7336c54a562b479866d2de2abc61487a4e07b0b9
> commit: 80a21da360516fa602f3a50eb9792f9dfbfb5fdb [43/47] media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver
> config: sh-allmodconfig
> compiler: sh4-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
>         git fetch --no-tags sailus-media-tree master
>         git checkout 80a21da360516fa602f3a50eb9792f9dfbfb5fdb
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/clk.c:941:6: error: redefinition of 'clk_unprepare'
>      941 | void clk_unprepare(struct clk *clk)
>          |      ^~~~~~~~~~~~~
>    In file included from drivers/clk/clk.c:9:
>    include/linux/clk.h:303:20: note: previous definition of 'clk_unprepare' with type 'void(struct clk *)'
>      303 | static inline void clk_unprepare(struct clk *clk)
>          |                    ^~~~~~~~~~~~~
> >> drivers/clk/clk.c:1022:5: error: redefinition of 'clk_prepare'
>     1022 | int clk_prepare(struct clk *clk)
>          |     ^~~~~~~~~~~
>    include/linux/clk.h:271:19: note: previous definition of 'clk_prepare' with type 'int(struct clk *)'
>      271 | static inline int clk_prepare(struct clk *clk)
>          |                   ^~~~~~~~~~~
> >> drivers/clk/clk.c:1268:6: error: redefinition of 'clk_is_enabled_when_prepared'
>     1268 | bool clk_is_enabled_when_prepared(struct clk *clk)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/clk.h:284:20: note: previous definition of 'clk_is_enabled_when_prepared' with type 'bool(struct clk *)' {aka '_Bool(struct clk *)'}
>      284 | static inline bool clk_is_enabled_when_prepared(struct clk *clk)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for COMMON_CLK
>    Depends on [n]: !HAVE_LEGACY_CLK [=y]
>    Selected by [m]:
>    - VIDEO_TC358746 [=m] && MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && PM [=y] && I2C [=m]

Hm.. this is strange but my relate to the unmet dependency. I could add
a depends on COMMON_CLK but this no i2c driver is doing that, just a few
platform drivers.

Regards,
  Marco
