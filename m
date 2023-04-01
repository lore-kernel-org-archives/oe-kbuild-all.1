Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE77C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680315214; x=1711851214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eka2BumyS/dRgCVD/9HCoyWAmeSkOvL1lRg44jTlg40=;
  b=ROU87Lyxwl7alZpXfp7Y0sUTfj/FImKwgBZJVCdxFqI6fj+8T0yEU2Hr
   jmhNkeQnZHH/kG4Q4F179RNSKbm5M1iPhA7QbUksjfpANPkfXT0vNXysA
   kj1Tf45QEoA5BuIoCH3GIrQjQoImUSiirjJzfxnqOLva7IKxiXUln/8oc
   YIuQKwpC4qALgWuVVgMO0ZOppBRJXB7jhzZUT4kmX1GIj4dInRQxaZw4C
   uBG7OU3EDPcf/GHZ+Xewk+aU11zTCe5pGiXJeBJYyBFFnI/Oak//rotBG
   w9/KmzmfhwEdEYmFoF3/QUkaD4fFbqF1bWUcUwF3r7yq4twGic4261Q7T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339097604"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="339097604"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 19:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="931398666"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; 
   d="scan'208";a="931398666"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2023 19:13:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piQjr-000MMw-00;
	Sat, 01 Apr 2023 02:13:07 +0000
Date: Sat, 1 Apr 2023 10:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Zhu <jack.zhu@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Eugen Hristev <eugen.hristev@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	jack.zhu@starfivetech.com, changhuang.liang@starfivetech.com
Subject: Re: [PATCH v3 2/9] media: admin-guide: Add starfive_camss.rst for
 Starfive Camera Subsystem
Message-ID: <202304010958.qMr3POf6-lkp@intel.com>
References: <20230331121826.96973-3-jack.zhu@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331121826.96973-3-jack.zhu@starfivetech.com>

Hi Jack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Zhu/media-dt-bindings-Add-bindings-for-JH7110-Camera-Subsystem/20230331-202001
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230331121826.96973-3-jack.zhu%40starfivetech.com
patch subject: [PATCH v3 2/9] media: admin-guide: Add starfive_camss.rst for Starfive Camera Subsystem
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/2e986871a1e6e63c6915803102a6025f19781772
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jack-Zhu/media-dt-bindings-Add-bindings-for-JH7110-Camera-Subsystem/20230331-202001
        git checkout 2e986871a1e6e63c6915803102a6025f19781772
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010958.qMr3POf6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/media/v4l-drivers.rst:9: WARNING: toctree contains reference to nonexisting document 'admin-guide/media/starfive'
>> Documentation/admin-guide/media/starfive_camss.rst: WARNING: document isn't included in any toctree

vim +9 Documentation/admin-guide/media/v4l-drivers.rst

33fc918ab89bec Mauro Carvalho Chehab 2020-04-18  8  
33fc918ab89bec Mauro Carvalho Chehab 2020-04-18 @9  .. toctree::

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
