Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B97E20F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 12:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676723281; x=1708259281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vF+iSUg4i0V0lalwq2ShcZnMguoPI6O+3gV7mIb1FYc=;
  b=DxM/KrNbRG23+Az5abOoBz6g5SAYBUe8rmV6ZQMOAHx923AZezNrnVbF
   5tTio6tAgm0cn/h6lakkmSYGtfGrnRyna3Mbgswie+HT64Emh6c1g6lfz
   PHEVRT/fuYmp87UljAUytkL36jYD+lZaRRiDYfVA1T/qLukJ1IdsYR5jY
   8B4hmeMHlcOXto2geeOuF1cHyAYKjCo/4gM3Q01r0csDPf7n7/uh7Cicg
   zwy1djlCBhcqhgtIsjGx5KLTpFogmwpsDb5/SDwQ1F2eJb+no6i2FXaZ0
   wq7i+iB22AD2unw+hpvwKG3R9NvRRj9LhyiDUE5FMXXWh9ZukEMHuB+uS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396844965"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="396844965"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 04:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="794714412"
X-IronPort-AV: E=Sophos;i="5.97,307,1669104000"; 
   d="scan'208";a="794714412"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Feb 2023 04:27:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTMJq-000CMv-24;
	Sat, 18 Feb 2023 12:27:58 +0000
Date: Sat, 18 Feb 2023 20:27:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 25291/25551]
 drivers/firmware/tegra/bpmp-debugfs.c:86:4-10: ERROR: application of sizeof
 to pointer
Message-ID: <202302182002.p8bDchjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   38cd7554b37ddf226692c904b69dded84cf10c02
commit: 80cad525155e2abdf832e95d8635c22e5f844857 [25291/25551] UPSTREAM: firmware: tegra: Reduce stack usage
config: arm64-randconfig-c043-20230217 (https://download.01.org/0day-ci/archive/20230218/202302182002.p8bDchjX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302182002.p8bDchjX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/tegra/bpmp-debugfs.c:86:4-10: ERROR: application of sizeof to pointer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
