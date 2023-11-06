Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C8818AEB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSEMZMdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699281536; x=1730817536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Ot3WdSD2mkHdTPn3QIAbdK31967nIHgi9zTSCewLSM=;
  b=KSEMZMdRBqLixS7RCEdh7tkEGTxmXcLYkVVkZOYRtLxBNLtpTIPTyTrT
   RyQPIazQZiHNAj23B/qRXs+VC30BTNdsoK2LGE7Nz0CTYaMze0qbWgzdQ
   4Sn/n2GBUf0pkaebmNBUfmI85jQFSAMFLJP7COjoKTtrDrVJTSA05jvwa
   MziPKL7iI0C/8Ax44WG19MosRsUsOwhE8o63WKPx/sjgYPqr6Q4fdVau8
   wcKZF4XB6KELVupgOlrmzY8kYgdyCs4P5JyCgrT9dgIAaY2oxfYjfqXMq
   yXBvW+IQMugGrp+n2EjddP3HOz1oMisTcu9BsF2FByWjB11cuFhvHNFig
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420398412"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="420398412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 06:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791481559"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="791481559"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Nov 2023 06:38:52 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r00kc-0006TY-1l;
	Mon, 06 Nov 2023 14:38:50 +0000
Date: Mon, 6 Nov 2023 22:38:35 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>,
	linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1891/1906] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62
Message-ID: <202311062247.EgHSZqD3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   fc457bcc18109467961edc92c80b238009f6a9fb
commit: 76bba03c4f90371e7b2da536b966a49c68d589b0 [1891/1906] drm/xe/hwmon: Expose power1_max_interval
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311062247.EgHSZqD3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311062247.EgHSZqD3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/power1_max_interval is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:30  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:62

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
