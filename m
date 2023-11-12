Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C51840
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 03:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLFgGHTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699758385; x=1731294385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/GZmiUQZLT7N6gdo7RPtuMbqt26CGD1zlfcqvoI/V8=;
  b=kLFgGHTSizr12v84F5yLi1hxSI+Xrl55gtBYySeI3BhTKzcLy0fGoeFf
   nv7yTk2rAb9sefmrhE7cPdtwMjRTtWiX/xPzOO7VnNtLpXBP9sUcqxTJk
   uRfGV9I8jqG79oCR3784QYJrnWUn22IyQtcGDHarlbl4PAQWsubc8x6W/
   DgZX+5DAtUe4JAiwEeJ+cTrFoJMsgG2Iu0NHyHZfoob2jY83c2DkAD6Zx
   j+iPipdbFz0D0BnEImcKCAylIhn7Eu8pX+jDHdlUJiASvmHxIxatR1sk2
   rX0ApZO2citPHIUPF4gUlD8jQO9a7pshW4h7MfR/Th0yifExBdfupBgTY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="421404217"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="421404217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 19:06:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="793144761"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="793144761"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Nov 2023 19:06:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r20nj-000AuT-1i;
	Sun, 12 Nov 2023 03:06:19 +0000
Date: Sun, 12 Nov 2023 11:06:16 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1711/1931] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65
Message-ID: <202311121142.MtDMs0cZ-lkp@intel.com>
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
commit: 0cad162e5ce80387307564245d60722d97d9eaa5 [1711/1931] drm/xe/hwmon: Expose hwmon energy attribute
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311121142.MtDMs0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121142.MtDMs0cZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/energy1_input is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:54  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:65

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
