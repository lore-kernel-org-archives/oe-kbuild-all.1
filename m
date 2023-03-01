Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BBA2F3E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677711224; x=1709247224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TbdI4Y4Wwsm9UOJ+PB3HFSYFJE1MwNlUpSEMRYtwwsg=;
  b=LEaDAHTR6/bCPtCAMCrR9/pGgxyH5EP5Oz0GlX1ZzewkNFRNJLzmvzdM
   /z16Kbcl5WsOrxbwd4RgedX3a6NwHsnA/WlebgQihevqx9KQ9Iiudimrl
   4YeHnvccKlVrvCNnseVJHEi4kZFA3LJ2ssqbVT/8Vq4DPo9Ip6r1v3Az7
   itGpAnHnDPygSQcWcN3T+CxEoUPufr/oxHlgJmtCpHK+TQtaP23Hex5xY
   jHXZ61E8h+R+J8ZRrAuDMuf2ZrkusJwpfqGtjccIXhI0AZ+lzL9/UbkRz
   dAKI6XfKDPt2MF90JQZWmWxXAfasdFP3qdfhDYjlqtUO5GvRnXNg/DyYR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="362129296"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="362129296"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 14:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674730270"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="674730270"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2023 14:53:38 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXVKL-0006Th-0z;
	Wed, 01 Mar 2023 22:53:37 +0000
Date: Thu, 2 Mar 2023 06:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?B?WmHFpW92acSN?= <m.zatovic1@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
	airlied@redhat.com, dipenp@nvidia.com, treding@nvidia.com,
	mwen@igalia.com, fmdefrancesco@gmail.com, arnd@arndb.de,
	bvanassche@acm.org, ogabbay@kernel.org, axboe@kernel.dk,
	mathieu.poirier@linaro.org, linux@zary.sk, masahiroy@kernel.org,
	yangyicong@hisilicon.com, dan.j.williams@intel.com,
	jacek.lawrynowicz@linux.intel.com, benjamin.tissoires@redhat.com,
	devicetree@vger.kernel.org, furong.zhou@linux.intel.com,
	andriy.shevchenko@intel.com, linus.walleij@linaro.org,
	Martin =?utf-8?B?WmHFpW92acSN?= <m.zatovic1@gmail.com>
Subject: Re: [PATCHv3 2/4] wiegand: add Wiegand bus driver
Message-ID: <202303020615.0F00suDa-lkp@intel.com>
References: <20230301142835.19614-3-m.zatovic1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301142835.19614-3-m.zatovic1@gmail.com>

Hi Martin,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.2 next-20230301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Za-ovi/dt-bindings-wiegand-add-Wiegand-controller-common-properties/20230301-223030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230301142835.19614-3-m.zatovic1%40gmail.com
patch subject: [PATCHv3 2/4] wiegand: add Wiegand bus driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230302/202303020615.0F00suDa-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c62b833f42989e355d82cd20b7803e0228e33792
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Martin-Za-ovi/dt-bindings-wiegand-add-Wiegand-controller-common-properties/20230301-223030
        git checkout c62b833f42989e355d82cd20b7803e0228e33792
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/wiegand/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303020615.0F00suDa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/wiegand/wiegand.c:441:27: error: initialization of 'void (*)(struct device *)' from incompatible pointer type 'int (*)(struct device *)' [-Werror=incompatible-pointer-types]
     441 |         .remove         = wiegand_remove,
         |                           ^~~~~~~~~~~~~~
   drivers/wiegand/wiegand.c:441:27: note: (near initialization for 'wiegand_bus_type.remove')
   cc1: some warnings being treated as errors


vim +441 drivers/wiegand/wiegand.c

   436	
   437	static struct bus_type wiegand_bus_type = {
   438		.name		= "wiegand",
   439		.match		= wiegand_match_device,
   440		.probe		= wiegand_probe,
 > 441		.remove		= wiegand_remove,
   442	};
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
