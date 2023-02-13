Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825433EC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 12:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676290399; x=1707826399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+cYlxdOn+Owc6eMvLKv4UVZ8FIneUY+Q///CYhch2I=;
  b=OGaZBb28k5PjdUlOQp8V8TnQpB/HvxULIAUli2y3oBYV6wfc6fBjPpt3
   Wpf/EvvhOwBYoZ6PgflymzaryxYRcMZowAUTP4fx06LquOQQocjuk7mUD
   Fn2OUxEgRjvEQK6XFxgjcVE6EPVDLlEsLoSNcao3GRydwCL8axJzVpwUC
   uP9b3S4gML2F9H7/73lkVY/EadbyCVzGW4R9jxRx1nl6RkuJNa0uIOxZm
   MQO9qpkmnDo6czt6QJ+Zjhs/x5mNqMqSPURlLeq0PXwVLELkRbJz/7cY1
   uvcm/Xlr5ASSjGDN3i77vQyvohaWNIgczjh0z/nqvfwX6xRopVqpLJnl9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="329505629"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329505629"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="699165188"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="699165188"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Feb 2023 04:13:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRXhs-0007jB-1G;
	Mon, 13 Feb 2023 12:13:16 +0000
Date: Mon, 13 Feb 2023 20:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [pinchartl-media:muxed/2022.2/base 330/740] htmldocs: Warning:
 arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that
 doesn't exist: Documentation/hwmon/pmbus
Message-ID: <202302132059.8WPN05ke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: b7bab5d0244b4621df07ce2102cc305644e298e1 [330/740] arm64: zynqmp: Add all missing dt files for Xilinx boards
reproduce:
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2022.2/base
        git checkout b7bab5d0244b4621df07ce2102cc305644e298e1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132059.8WPN05ke-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
