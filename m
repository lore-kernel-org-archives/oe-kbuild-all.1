Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2646DD06
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbcFCGcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701807592; x=1733343592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qhZbtP+3qPhRMJWXOLcAYqsF2u004cK5/va3Lrnp/Rk=;
  b=NbcFCGcSUega3W8EsKWcxZ98QAtjIxnntPBNpE8sChrfSR7upGmWV7j5
   bokqW/0X+hcWR26BiYsh9RGGq5l2puC+sPeHr0+S/mPFH0A5IPpzgD3jI
   A5diIZ1d2kILQ+HOcGWSa5p3EkysEMcP8ydJPHRv5V5OdNlTGY5zTAJgs
   uZcnj7y2e2vDoIu9+RnHNuJ7ETxS1LoW3YmPvfKGLjcRVULs/xK7HWw7Y
   SHghNn34A7kanxQno4OSd3Ty42St2cROzGKfB5TSl1B9PoGVOxOSQoHTz
   QogrnesBo62n9BCT1Ql7XCr1A7I+vBvGMJodCOXulY9Wc6HHLtvGL9d9C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="849872"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="849872"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 12:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="841594338"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="841594338"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Dec 2023 12:19:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAbtR-0009fP-1N;
	Tue, 05 Dec 2023 20:19:45 +0000
Date: Wed, 6 Dec 2023 04:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey
 to json-schema
Message-ID: <202312060431.fHDo1Yk9-lkp@intel.com>
References: <20231202192536.266885-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202192536.266885-4-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on robh/for-next rafael-pm/thermal groeck-staging/hwmon-next linus/master v6.7-rc4 next-20231205]
[cannot apply to dtor-input/next dtor-input/for-linus lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-watchdog-dlg-da9062-watchdog-Document-DA9063-watchdog/20231203-042557
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20231202192536.266885-4-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v2 03/11] dt-bindings: input: Convert da906{1,2,3} onkey to json-schema
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060431.fHDo1Yk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060431.fHDo1Yk9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/da90??-onkey.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
