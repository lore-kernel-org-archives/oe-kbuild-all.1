Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0A2569
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676385794; x=1707921794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M615769gTPWA/NZSXaBf04s+YjWf9kY/WKFeUsmg/F4=;
  b=ZgbsQrCaiHZVshboRZMp6HIAOxS0sqS5ZG/YgxzZru/g2NIZKqnyis2M
   lJjy0gGOO5ZJTDeOOWJ6oaz1p813ydEbyP/5jysTFDCwSTao8y5XlYnGe
   hika4bxschAlq34rGZwJeSHzfIRKcijuqwWXRMagk+ecVQcrhQGvxF4VG
   WrGfqsQI+wS1D01U8NFmwSF5IxqXiozyOjKzlXK4iu9soc0xKqGDdRyf2
   UpI2qgL0cvMtC3hFCzybqMXvgh9ASXvhgw20c+NwNhMXCVQqpr1UczjZR
   +clT2EBJ+7kFqRYCTPn4XjULY2MaZe1S8ygFbgLemh+JEuReXTenxYTcj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="328885638"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="328885638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 06:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812056282"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="812056282"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2023 06:43:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRwWW-0008Zp-13;
	Tue, 14 Feb 2023 14:43:12 +0000
Date: Tue, 14 Feb 2023 22:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinh.nguyen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [dinguyen:for_next_hwmon_v2 3/3] htmldocs: Warning:
 Documentation/hwmon/socfpga-hwmon.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/hwmon/socfpga-hwmon.yaml
Message-ID: <202302142258.szK8ryCs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git for_next_hwmon_v2
head:   2566ec4d530416db5ca072d478087bde75542fd5
commit: 2566ec4d530416db5ca072d478087bde75542fd5 [3/3] hwmon: (socfpga) Add support fo hardware monitoring on SoCFPGA platforms
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git/commit/?id=2566ec4d530416db5ca072d478087bde75542fd5
        git remote add dinguyen https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
        git fetch --no-tags dinguyen for_next_hwmon_v2
        git checkout 2566ec4d530416db5ca072d478087bde75542fd5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142258.szK8ryCs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/hwmon/socfpga-hwmon.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/socfpga-hwmon.yaml
>> Documentation/hwmon/socfpga-hwmon.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
>> Documentation/hwmon/socfpga-hwmon.rst:3: WARNING: Title underline too short.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
