Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787B41A85
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jan 2024 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J14avLce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704755234; x=1736291234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdZaaapAQB5k0DxEZLJICyCT46sbrzeiuTN8udRLK8Q=;
  b=J14avLcezThKPqWD61j+suBucbCCaKubM6PW03hJBeUJFzHquGO9ULG1
   vKP2ESKipHNNSl8KWrSCNrzBxKCalxpYJyDGjZSiJXN9f23Bp8O5tgz9s
   fQdOJIlW6VhgA80/SgbViEWN90fMaWIQ4Kn20bhYJ/0iE12l0971BN8h/
   liKkT8g/tNykbcon9FTIGywyRVLSy9TYCtT3QWOyXLEC+S7JokwuLd2Do
   jaff2ucE7j4HII67IEgDo7I5bTZxx9rD25KKOkKgm67GYA9QFnJ4xIB6W
   1SRcHe+qvJ83tNFRl0CzK9lfgmIbJohAIagEPnNf4IyPEFVTYY5MFxsDV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388467284"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="388467284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 15:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781575428"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="781575428"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Jan 2024 15:07:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMyi6-0005DG-24;
	Mon, 08 Jan 2024 23:07:10 +0000
Date: Tue, 9 Jan 2024 07:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [linux-next:master 12569/12662] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:
  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52
  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35
Message-ID: <202401090705.Qv0jlX5x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bffdfd2e7e63175ae261131a620f809d946cf9a7
commit: 8b99c14dc078149cb2708b03c28ce668ec33b8e1 [12569/12662] Merge branch 'drm-next' of git://git.freedesktop.org/git/drm/drm.git
reproduce: (https://download.01.org/0day-ci/archive/20240109/202401090705.Qv0jlX5x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090705.Qv0jlX5x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/curr1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:52  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:35
>> Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54
>> Warning: /sys/devices/.../hwmon/hwmon<i>/in0_input is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:0  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:46
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_crit is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:39  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:22
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:8  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:0
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62
>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_rated_max is defined 2 times:  Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:22  Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:14

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
