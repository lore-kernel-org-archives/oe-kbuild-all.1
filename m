Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0555E0C4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChuE9mW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701784458; x=1733320458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U6+ZEYEE65DEUZnqgjF0DfTrL06shSvTTu7ShXbuoiI=;
  b=ChuE9mW/nHqHU73Lq7S8LIRzGa/PUdHTDzH8FOJQrqG0g60K2hh0OaPL
   JvzNwm6Tqe+kfD/sPsXHI3vMxPSvNeeAsYjG+FDwCFakajPqtyCxcujlW
   x+linlejZ8tNojZIp39jrNj2EgBu61Lzk1bqBq/a9RtkfHFYUs6LvNxwg
   MJK989x/OFbiuLdfUBjM5Ucktheugmf8DoTzEiLeMGGozmWyzVACLYSlR
   jb1R/U/IStHQ3xRVwJ8Iq92ZZuFnvxTQ0ch1Jd0PHivYnDs0+W4TUXwQD
   yavz4XMjI8rpYilxh+5Ksiu4tCd53zo5390lukLCDWhYIm1VmdCfvaBSB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="15443572"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="15443572"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 05:54:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888939287"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="888939287"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 05:54:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAVsJ-00096I-1r;
	Tue, 05 Dec 2023 13:54:11 +0000
Date: Tue, 5 Dec 2023 21:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: st: add all 8 i2c nodes on stm32mp251
Message-ID: <202312052114.dqhaFgjJ-lkp@intel.com>
References: <20231129125920.1702497-6-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129125920.1702497-6-alain.volmat@foss.st.com>

Hi Alain,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on atorgue-stm32/stm32-next robh/for-next linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/i2c-stm32f7-perform-most-of-irq-job-in-threaded-handler/20231129-210806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20231129125920.1702497-6-alain.volmat%40foss.st.com
patch subject: [PATCH 5/7] arm64: dts: st: add all 8 i2c nodes on stm32mp251
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231205/202312052114.dqhaFgjJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052114.dqhaFgjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052114.dqhaFgjJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/st/stm32mp251.dtsi:134.20-21 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
