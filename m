Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891B7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 02:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myrKPJ9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697249188; x=1728785188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xyjrz+nCGtVP4cpNDKqWDKVaYylaSAY+4OG7ML8ydcU=;
  b=myrKPJ9l/RfHuYy473NJJXvCnT/Cro+y1y2mHHVKJ1RBWJZL3OFZ7QIu
   l9gJSg48nogHnM8JnC5vb+MX2RWHMOJABOzbbVDMSvGJsbIcoY+heFctD
   FLkSYcJw4wrD0Uk/aqUvb8JugVe0+n/6p5pl3umfnhk5innrAGDe/pIWA
   lqf+r0ITwrABE6ZspGt+NJ+c6lhdYmJ1siJYtZs6vaBDuduAM9zzeM3j6
   YHNEv4wwy3m2plpaVwugGaGn3OTP7tEPBFSFTP2Zv+B+iBMx5+w7G01YA
   PgwtcRsnWWGRwexMWneyfx287bhhWgB+TbY3SYj21Rj11kYikGrehHSQO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384166985"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="384166985"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 19:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="754918435"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="754918435"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2023 19:06:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrU2m-0005bv-2y;
	Sat, 14 Oct 2023 02:06:20 +0000
Date: Sat, 14 Oct 2023 10:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be,
	mturquette@baylibre.com, sboyd@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, magnus.damm@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 4/4] clk: renesas: add minimal boot support for RZ/G3S
 SoC
Message-ID: <202310140917.e8Qm1PYJ-lkp@intel.com>
References: <20231006103959.197485-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006103959.197485-5-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on geert-renesas-drivers/renesas-clk]
[cannot apply to tty/tty-testing tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudiu/dt-bindings-serial-renesas-scif-document-r9a08g045-support/20231006-184301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
patch link:    https://lore.kernel.org/r/20231006103959.197485-5-claudiu.beznea.uj%40bp.renesas.com
patch subject: [PATCH v3 4/4] clk: renesas: add minimal boot support for RZ/G3S SoC
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140917.e8Qm1PYJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140917.e8Qm1PYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140917.e8Qm1PYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/renesas/r9a08g045-cpg.c:13:10: fatal error: dt-bindings/clock/r9a08g045-cpg.h: No such file or directory
      13 | #include <dt-bindings/clock/r9a08g045-cpg.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/renesas/r9a08g045-cpg.c

    12	
  > 13	#include <dt-bindings/clock/r9a08g045-cpg.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
