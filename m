Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD655255
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685092527; x=1716628527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=94iIUMDJHSt/fNrEPt9CUfI9OJj6tpysYfR5v5/3GyE=;
  b=XBUfiUysXujiC6xL7H8+rF2e/hEt1ANbEYMZi7fZn9d55+vnxo9wmExc
   mCeTQbcl5dFcNbnBY9e6Te3wpchVBhKWcYydtEK8GznCd3SkPtERZ+V7o
   0HuaOKgO9J+rYCKB84perJGM1wBM3EQid8ShZD90PXL4iWpc2TknVz2Wk
   t+H6LgzHZNHry1t5+hAqXBaRryMffdzRpFqO8GoRwvtgUEZyGBeVlAZM3
   t5jN2A7kdaVvlc9nH2xRqxOZf2fv9sg+vmRzD22dHbGRO5k6OicUcXxG4
   wBfAuMmmgw6qRW/aP7LIsFXTvRbKzYnWcttVS/2GH+s2Bpqdm8PhMozEH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="354176896"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="354176896"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="655574734"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="655574734"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2023 02:15:25 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2TXg-000JD3-0u;
	Fri, 26 May 2023 09:15:24 +0000
Date: Fri, 26 May 2023 17:15:03 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [svarbanov-media-tree:venus-for-next-v6.5 2/15]
 drivers/media/platform/qcom/venus/hfi_venus.c:843:16: error: too few
 arguments to function 'venus_iface_cmdq_write'
Message-ID: <202305261710.LATF7SyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/svarbanov/media_tree venus-for-next-v6.5
head:   deb41a0dfc76f12c81de0f4c721d02f45c776ef2
commit: ac42b3241bba706b577c25708bcc377e7d2b072b [2/15] media: venus: simplify the return expression of venus_sys_set_* function
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230526/202305261710.LATF7SyM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add svarbanov-media-tree git://linuxtv.org/svarbanov/media_tree
        git fetch --no-tags svarbanov-media-tree venus-for-next-v6.5
        git checkout ac42b3241bba706b577c25708bcc377e7d2b072b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/platform/qcom/venus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261710.LATF7SyM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/venus/hfi_venus.c: In function 'venus_sys_set_debug':
>> drivers/media/platform/qcom/venus/hfi_venus.c:843:16: error: too few arguments to function 'venus_iface_cmdq_write'
     843 |         return venus_iface_cmdq_write(hdev, pkt);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c:412:12: note: declared here
     412 | static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt, bool sync)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c: In function 'venus_sys_set_coverage':
   drivers/media/platform/qcom/venus/hfi_venus.c:855:16: error: too few arguments to function 'venus_iface_cmdq_write'
     855 |         return venus_iface_cmdq_write(hdev, pkt);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c:412:12: note: declared here
     412 | static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt, bool sync)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c: In function 'venus_sys_set_idle_message':
   drivers/media/platform/qcom/venus/hfi_venus.c:871:16: error: too few arguments to function 'venus_iface_cmdq_write'
     871 |         return venus_iface_cmdq_write(hdev, pkt);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c:412:12: note: declared here
     412 | static int venus_iface_cmdq_write(struct venus_hfi_device *hdev, void *pkt, bool sync)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/venus/hfi_venus.c: In function 'venus_sys_set_debug':
   drivers/media/platform/qcom/venus/hfi_venus.c:844:1: error: control reaches end of non-void function [-Werror=return-type]
     844 | }
         | ^
   drivers/media/platform/qcom/venus/hfi_venus.c: In function 'venus_sys_set_idle_message':
   drivers/media/platform/qcom/venus/hfi_venus.c:872:1: error: control reaches end of non-void function [-Werror=return-type]
     872 | }
         | ^
   drivers/media/platform/qcom/venus/hfi_venus.c: In function 'venus_sys_set_coverage':
   drivers/media/platform/qcom/venus/hfi_venus.c:856:1: error: control reaches end of non-void function [-Werror=return-type]
     856 | }
         | ^
   cc1: some warnings being treated as errors


vim +/venus_iface_cmdq_write +843 drivers/media/platform/qcom/venus/hfi_venus.c

   833	
   834	static int venus_sys_set_debug(struct venus_hfi_device *hdev, u32 debug)
   835	{
   836		struct hfi_sys_set_property_pkt *pkt;
   837		u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
   838	
   839		pkt = (struct hfi_sys_set_property_pkt *)packet;
   840	
   841		pkt_sys_debug_config(pkt, HFI_DEBUG_MODE_QUEUE, debug);
   842	
 > 843		return venus_iface_cmdq_write(hdev, pkt);
   844	}
   845	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
