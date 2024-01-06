Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295283C15
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADjL1ZlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704523163; x=1736059163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EeeHdSCONi7rchxtHMuA7ss7eHL0O6ciydjvZhZn/Ak=;
  b=ADjL1ZlCD96hs8TawkwD2dMCKZyk8aZxFJNyHzZrxCAsg6va/btndb5S
   5FIMUk8hLLvrbH6+2ukYcE6SSp3AxgI1vXGmQ9F2yW/m3iqT0NpbsAQRo
   UbARCpxeBU1aEIYrR+uE1FE9LlirP/ApHqby8UE7nvxhvzpiU+xG+wyMa
   qGw2bqh/CpcBedT2isVgqBIyV2uxtXRldG73HMKqYFwGCMcVXfvpAt6yO
   hnQBKvclo35QFwNOR9mHt41/4pNwsj6L6pABosmyswlJqLtIsoBgHiUn3
   /ARkiE+ragYvMg+jadhBz2iGKWEWkDrpPnfzB2SlbF2fwrF4M4QzMFkt2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="377788784"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="377788784"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 22:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="780944402"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="780944402"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Jan 2024 22:39:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM0L0-00027c-2e;
	Sat, 06 Jan 2024 06:39:18 +0000
Date: Sat, 6 Jan 2024 14:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 12569/12662] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:
  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35
  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
Message-ID: <202401061458.1ymPozGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: 8b99c14dc078149cb2708b03c28ce668ec33b8e1 [12569/12662] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
reproduce: (https://download.01.org/0day-ci/archive/20240106/202401061458.1ymPozGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061458.1ymPozGI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
>> Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65
>> Warning: /sys/devices/.../hwmon/hwmon<i>/in0_input is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:46  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:0
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:22  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:39
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_rated_max is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:14  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:22

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
