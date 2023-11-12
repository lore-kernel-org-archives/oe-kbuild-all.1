Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D3613A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbNAU6rI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699782610; x=1731318610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f4hzUxDzFLz/n7lPq4VbXO4bUfehwyvtVT1JILgid8U=;
  b=XbNAU6rI/RGdYGIjH1/6H//TmXM/X9w8wYicaqnyxTOqicE8XJxmylbV
   zeO8ZJBkAhp0TkwlLhv3GazBdJMlR7+1vks3cnXebxO0bUzf0h9cUx+kt
   iqNb0FuaNk+21RB5Ngzi+KgGTvXhu59GOU2BMg0Ai7rBfZZuhpaMRIHRB
   GW8JQHAwzpoL41qK0oAl6PQplCkE7nTARA+LH/IfQSge+VJWzhXMRAHml
   eVN/YuZHwHJwrr4IeRDzOf4PJFiXwnO7JMyoKXQ6Y3TF52KVZNX8JF8gO
   hGpT1+uQnuix6LOAsu/AgdH4gq0f/hrQ2BURDvWGLocRTFK35uh7+dX9y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="380707388"
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="380707388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 01:50:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,297,1694761200"; 
   d="scan'208";a="5414157"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2023 01:50:07 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r276T-000B34-2M;
	Sun, 12 Nov 2023 09:50:05 +0000
Date: Sun, 12 Nov 2023 17:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>,
	linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1891/1931] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30
Message-ID: <202311121713.Ysdi8bJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   edeb8b8fa330a62d4a07b37d08145d86114bc151
commit: 76bba03c4f90371e7b2da536b966a49c68d589b0 [1891/1931] drm/xe/hwmon: Expose power1_max_interval
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311121713.Ysdi8bJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121713.Ysdi8bJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
