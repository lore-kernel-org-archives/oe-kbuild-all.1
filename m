Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60162B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 01:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693965546; x=1725501546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fVDgQhkb2WhLhyH/xw4I3sutewUsbZlxUY73aEfjGm0=;
  b=mGP2T5VVNYPn9TtQgs0KSR8iI58WaChyQ8oGONQ5N80UA4deE47+Q+W/
   m9mQPwBkNWcEuHN2koVYRFEZf8VpxDpue2jp+acEYf/lbizVIFeW2VdBQ
   W2oIkVUL+84g+1j0TD1jjhEixKb9Z+Ypaa6byVGzTwB62NRGyqJn/jbGq
   gJ+fB9TJ8HufJmHl26/eiYiF3p+E3pQ0ulTX1psypmbk8G8/jd/P/ojX6
   qOBq6zT1L6nD+b4npkn+2bA8vJQfvJy0Gqpyv2Dt84NekubvEM2AuXeuB
   wZ1RubpzT+8BFtNBEVBETtYkj22o2xE6/ieXvmPzzl+F2dq7qhRLoMsNK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="361977125"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="361977125"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 18:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770555185"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="770555185"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2023 18:58:58 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdhod-0002Kt-2Q;
	Wed, 06 Sep 2023 01:58:51 +0000
Date: Wed, 6 Sep 2023 09:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, peter.yin@quantatw.com,
	Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v8 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Message-ID: <202309060936.2lEsdiub-lkp@intel.com>
References: <20230905062223.774871-2-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905062223.774871-2-peteryin.openbmc@gmail.com>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230905]
[also build test ERROR on linus/master v6.5]
[cannot apply to robh/for-next v6.5 v6.5-rc7 v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Yin/ARM-dts-aspeed-Minerva-Add-Facebook-Minerva-AST2600-BMC/20230906-005659
base:   next-20230905
patch link:    https://lore.kernel.org/r/20230905062223.774871-2-peteryin.openbmc%40gmail.com
patch subject: [PATCH v8 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva (AST2600) BMC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230906/202309060936.2lEsdiub-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060936.2lEsdiub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060936.2lEsdiub-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts:261.1-7 Label or path jtag1 not found
   FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
