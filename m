Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0732E40C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFt+DBS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701707243; x=1733243243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJxXvOB2qN3lNpOrS8GiRtuGVsjLQpHX0slpHfIeU44=;
  b=SFt+DBS8pWnjZCc3nk52lr55vi+kABzFwTxMKAyX1dZyPYM5uYerqnwn
   Ujjtmqf9i8DFECnewu1eE9T/UeID/BOQDFnFhaLfbSJaQMDNdebQa6v+f
   ++0Cjj5hH0Xvt3JMhuIRuIRdpR5JkFH1jj2y9WkQedEGctafxEHB/yxR2
   LEPnrTCssm3DD7XirADAU3vtHyAekQHGOM2hfgYaS06LnP+loLTJiboEa
   i2On5R8lIeF2Q4YkTQ/6EE2ZC9taNYBOWVfUViLtF4qryyX6J/OlYuObY
   F7jlo3Mr2KimHWYaCGhG64cFHvCa4eps4qpqipq2JRpzP+O3Owfqp7TH/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373197363"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="373197363"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764004904"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764004904"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 08:27:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rABmu-0007uM-0s;
	Mon, 04 Dec 2023 16:27:16 +0000
Date: Tue, 5 Dec 2023 00:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Shengyang Chen <shengyang.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, vkoul@kernel.org, kishon@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	minda.chen@starfivetech.com, changhuang.liang@starfivetech.com,
	rogerq@kernel.org, geert+renesas@glider.be,
	keith.zhao@starfivetech.com, shengyang.chen@starfivetech.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
Message-ID: <202312042315.nozUINhO-lkp@intel.com>
References: <20231117130421.79261-3-shengyang.chen@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117130421.79261-3-shengyang.chen@starfivetech.com>

Hi Shengyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengyang-Chen/dt-bindings-phy-Add-starfive-jh7110-dphy-tx/20231117-210751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231117130421.79261-3-shengyang.chen%40starfivetech.com
patch subject: [PATCH v1 2/2] phy: starfive: Add mipi dphy tx support
config: csky-randconfig-r111-20231118 (https://download.01.org/0day-ci/archive/20231204/202312042315.nozUINhO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312042315.nozUINhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312042315.nozUINhO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:189:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:189:40: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:189:40: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:197:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:197:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:197:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:222:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:222:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:222:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:224:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:224:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:224:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:226:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:228:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:230:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:232:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:234:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:236:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:238:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:240:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:250:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:254:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:260:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:263:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:266:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:269:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:272:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:276:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:279:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:282:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:286:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:289:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:292:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:295:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:298:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:302:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:306:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:310:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:314:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:318:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:322:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:326:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:330:46: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:348:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:350:30: sparse:     got void [noderef] __iomem *topsys
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *io_addr @@     got void [noderef] __iomem *topsys @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse:     expected void *io_addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:353:30: sparse:     got void [noderef] __iomem *topsys
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *io_addr @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:172:15: sparse:     got void *io_addr
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:181:15: sparse:     got void *
>> drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/phy/starfive/phy-jh7110-dphy-tx.c:184:9: sparse:     got void *

vim +189 drivers/phy/starfive/phy-jh7110-dphy-tx.c

   167	
   168	static inline u32 stf_dphy_get_reg(void *io_addr, u32 addr, u32 shift, u32 mask)
   169	{
   170		u32 tmp;
   171	
 > 172		tmp = readl(io_addr);
   173		tmp = (tmp & mask) >> shift;
   174		return tmp;
   175	}
   176	
   177	static inline void stf_dphy_set_reg(void *io_addr, u32 addr, u32 data, u32 shift, u32 mask)
   178	{
   179		u32 tmp;
   180	
 > 181		tmp = readl(io_addr + addr);
   182		tmp &= ~mask;
   183		tmp |= (data << shift) & mask;
 > 184		writel(tmp, (io_addr + addr));
   185	}
   186	
   187	static int is_pll_locked(struct stf_dphy *dphy)
   188	{
 > 189		int tmp = stf_dphy_get_reg(dphy->topsys, STF_DPHY_APBIFSAIF_SYSCFG(8),
   190					  STF_DPHY_RGS_CDTX_PLL_UNLOCK_SHIFT,
   191					  STF_DPHY_RGS_CDTX_PLL_UNLOCK_MASK);
   192		return !tmp;
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
