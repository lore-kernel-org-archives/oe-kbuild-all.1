Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1642807
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 01:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696383494; x=1727919494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B90ozn8yeoAuIAIuWBDmHt/lo/Dvx92vS9EvWBDmcN0=;
  b=Asmu1NSiO8HtMsBAwMK9nFfdI25CpkILdF0nkvaQKPhDe0IOLxWTqTfD
   b2JLBCn/wG3SFWkrdetEKQHJWcvhEYhQTmEm+TehDqwTl9Zq+139PII4G
   +uqCedOLx5cccF9a5E8xtsRUppJ3vT0yrHCDksWiLZFI6xffQlBVSmNQM
   AmKlwoo09s7RjoA/i6ihY6276B/2xmLPvT/gxGluYV2mINEDNjoLUeLNy
   vKNrCJtaJq80inrl1+NtISmW+6tz/ih7BMmzoxRtCQq40aqsYjYFueaVw
   9Y/pxLwEYe3qjXiOiIoeAsSSfr1Piy0k36/Arie6x/35vHsiYrIU0eXNh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="382929347"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="382929347"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 18:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="751098919"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="751098919"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Oct 2023 18:38:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnqq0-000AF8-2o;
	Wed, 04 Oct 2023 01:38:08 +0000
Date: Wed, 4 Oct 2023 09:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 794/1370] htmldocs: Warning:
 arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that
 doesn't exist: Documentation/hwmon/pmbus
Message-ID: <202310040946.Xf69lzGv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: a89bdb9e6f1f7448e200b4d04d5e567c8eb87d86 [794/1370] arm64: zynqmp: Add/Update/Sync DTs for xilinx platforms
reproduce: (https://download.01.org/0day-ci/archive/20231004/202310040946.Xf69lzGv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040946.Xf69lzGv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/boot/dts/xilinx/zynqmp-p-a2197-00-revA.dts references a file that doesn't exist: Documentation/hwmon/pmbus

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
