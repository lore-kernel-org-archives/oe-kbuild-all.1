Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324C2F3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677080246; x=1708616246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GjHMCPdnc/DQBIYCfxd4PyPZOUVK7PxFHa2aAc4wkSI=;
  b=XDS7a7t3sv3BPTyUBH8xEvh0JYxqJ55Db+ybN21QiYF3cczO1noHL0uT
   C3/QlfbwZN+MRJgqWiHPPNWsdJgUfjoK8aJlo6oDjO7QyMAuj6DE5MaFg
   3ZFK4+X0GpAaX8rkCbn2iG0hqbJcyphPSmaPIX/Wxt2N3cVqAUnntC7Ig
   GPstV9JpflY3SXhIAWswzftvlkF4pP7Uctcmvnh2xiY+0exJxlk/QAQV5
   atL69pVdZovss5gWpFhJXjkW3SaGn747doxO4w7K8APGaRvNnxONr5o2T
   lzpMp2f4Io/FOUwjJ8lkyUUo6X8M/e+d0W69LpfEqfKMoO7bXxtKz37Nu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="360438035"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="360438035"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 07:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="846182182"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="846182182"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Feb 2023 07:37:21 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUrBI-0000VJ-0y;
	Wed, 22 Feb 2023 15:37:20 +0000
Date: Wed, 22 Feb 2023 23:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org,
	alistair@popple.id.au, joel@jms.id.au, jk@ozlabs.org,
	andrew@aj.id.au, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, eajames@linux.ibm.com
Subject: Re: [PATCH v5 4/6] fsi: Add I2C Responder SCOM driver
Message-ID: <202302222352.9rPqJxAV-lkp@intel.com>
References: <20230221212622.3897097-5-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221212622.3897097-5-eajames@linux.ibm.com>

Hi Eddie,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.2 next-20230222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/fsi-Move-fsi_slave-structure-definition-to-header/20230222-052904
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230221212622.3897097-5-eajames%40linux.ibm.com
patch subject: [PATCH v5 4/6] fsi: Add I2C Responder SCOM driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230222/202302222352.9rPqJxAV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/210010944ddca8e974ec4f5141a00c38eddf5b8e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eddie-James/fsi-Move-fsi_slave-structure-definition-to-header/20230222-052904
        git checkout 210010944ddca8e974ec4f5141a00c38eddf5b8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302222352.9rPqJxAV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fsi_master_i2cr_write" [drivers/fsi/i2cr-scom.ko] undefined!
>> ERROR: modpost: "fsi_master_i2cr_read" [drivers/fsi/i2cr-scom.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
