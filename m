Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631A1107
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675507783; x=1707043783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvQR9MK8UT3Qf1rs9oFQGhAwpHe8P0sljYmj+VEyIHY=;
  b=GIAZ58uT2K9d0k3rgK/uBPbcMFUU8OgSlbpizCApzRnmYQQydC1B3OG0
   9xTZc3uPUnLkxLFJyunaU9n/es7NYgor2SadWMszYaih+NbCbfOQKzbBz
   69ziQpzcx96WlvV+n5LTZn80JACqXWJgzxy6DE3a3yR9ZdXiN+jWVp1i3
   CELK9a+1rYVUT/LhvZKefnZh50o7GHRpMA427Z+UcGYFdHaX+qeLcWpKS
   /uNS9/SDvp/3np7+aM8TjMMrT9lTfrSRDG9/11F/yepKEd3JMCgSNTNcE
   MfUxtPSFiGmbaqiZ1U85NrKgRtGJcOviPakyXIxukcCjzf4Jbw+lEHPOf
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="415149390"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="415149390"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 02:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="615977140"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="615977140"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Feb 2023 02:49:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOG72-0001FL-1z;
	Sat, 04 Feb 2023 10:49:40 +0000
Date: Sat, 4 Feb 2023 18:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <keith.busch@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Rajat Jain <rajatja@google.com>,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 7573/9999]
 drivers/nvme/host/pci.c:2705:25: sparse: sparse: symbol 'nvme_dev_pm_ops'
 was not declared. Should it be static?
Message-ID: <202302041816.01TYjFuu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: bc7304877066a781782a7b43ea0ed2edcc767637 [7573/9999] BACKPORT: FROMGIT: nvme-pci: Use host managed power state for suspend
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230204/202302041816.01TYjFuu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/bc7304877066a781782a7b43ea0ed2edcc767637
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout bc7304877066a781782a7b43ea0ed2edcc767637
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/pci.c:2705:25: sparse: sparse: symbol 'nvme_dev_pm_ops' was not declared. Should it be static?
   drivers/nvme/host/pci.c:1263: warning: Function parameter or member 'nvmeq' not described in 'nvme_suspend_queue'

vim +/nvme_dev_pm_ops +2705 drivers/nvme/host/pci.c

  2704	
> 2705	const struct dev_pm_ops nvme_dev_pm_ops = {
  2706		.suspend = nvme_suspend,
  2707		.resume = nvme_resume,
  2708		.freeze = nvme_simple_suspend,
  2709		.thaw = nvme_simple_resume,
  2710		.poweroff = nvme_simple_suspend,
  2711		.restore = nvme_simple_resume,
  2712	};
  2713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
