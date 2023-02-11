Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA807E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 00:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676074744; x=1707610744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ehQzxX6L4ASmLk3JlrAJ2eAIDW9XFTC5kS3bmmGg88=;
  b=Qxk3JEGJuBkFxqdeTCNPx3SQGbcGLaJQ09l8zz1q73RZx2SUpds5BB9o
   QNa6dIT+bg1Wn8IYi8O/RsVClQmPH3rmehpgjaEYJWQflj2oJLqWgdYjC
   B7gTbqdUg8sJckH+UXEVI4Pv2iUeHZq7WGle09lvoWWKzCWpBhrWO22I1
   Ub3jiXR2CDH5XV8A4a4wcGvG0vXiaNxNmbC9psmb6EU6Uz3uPZu2HF4n8
   uQUTBGnktfrJS7WclC9WOvhjbhaMsUMNTt50M4YBwzTZqX7o0EAyCiccm
   DOxm1P1Rv7GLyQIE0lQjrnL8BS4IIwF2S5DspEw3uOKsZRPf1y+CrDX0O
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416785803"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416785803"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 16:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756959080"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756959080"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 16:18:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQdbO-00068L-2R;
	Sat, 11 Feb 2023 00:18:50 +0000
Date: Sat, 11 Feb 2023 08:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Wentong Wu <wentong.wu@intel.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@intel.com,
	pierre-louis.bossart@linux.intel.com, zhifeng.wang@intel.com,
	xiang.ye@intel.com, tian.shu.qiu@intel.com, bingbu.cao@intel.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v1 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <202302110756.bGB3JLgP-lkp@intel.com>
References: <20230210010221.2466486-2-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210010221.2466486-2-wentong.wu@intel.com>

Hi Wentong,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams linus/master v6.2-rc7 next-20230210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230210-090202
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230210010221.2466486-2-wentong.wu%40intel.com
patch subject: [PATCH v1 1/3] media: pci: intel: ivsc: Add CSI submodule
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230211/202302110756.bGB3JLgP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/bb45f3cb357165838a3c90d4bddfad40ad2d8ce7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230210-090202
        git checkout bb45f3cb357165838a3c90d4bddfad40ad2d8ce7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110756.bGB3JLgP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/media/pci/intel/ivsc/mei_csi.o: in function `csi_set_link_cfg':
>> mei_csi.c:(.text+0x1a6): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
