Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1811E306B09
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765315037; cv=none; b=S55cKIgmHwOvz5GMNBYN9gUe9J+vfnj21Otw13d8I5RsIga6cmw6nOi5riFBwXkwabxB76MUgBbaPi7/RKuBCh+bzFFIRgvhI2Xt8T9+PJniz5IyZLFwPIlX1UGn+pOJcGKFTmN1USkkGaBdjmD/6PBWrssS3Np9BIHqRWhyHY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765315037; c=relaxed/simple;
	bh=1pFyYpdNt7iCuFkdYyAVnbcX0hxh+3X4KcoC6rHtXv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=es2uIaqnvfXwY9eTUFSwpn/VRhhp25OdTkOF3k+CnSCL9KY+m70o6zxmKulb4yU/YKqZjwu0RuvAGGhmAOVD4uc80Hcbq0v/HbvLkHVu2L/mxgnvOibAVIHN+7D9Im8zqjgofFSRa9cRo7H2MYHj68CdBHYw9buZaPQLgzg2lQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3Q6IZzx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3Q6IZzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765315035; x=1796851035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1pFyYpdNt7iCuFkdYyAVnbcX0hxh+3X4KcoC6rHtXv4=;
  b=L3Q6IZzxmqR8Za6Jy7HxthRO4BMKBNhcgn4McTlK0Vj749Wf4iHKRBQQ
   NrrL7QhGOmSsVZ9h3KkIi6GQf91thXfSindTt7y897rpbCBwB3khbAVku
   TEdEFajXgJBkdIEvFVJbN+u80yDpQI8uKar8rxLN7rnvcD86FN2JyaUgy
   YjOYcf/E57dEiamJETetWc3pCnR64Uxp0TWpP90lOvMuR+Qpy6hfGXc8z
   hKcGebNy97wlQnvYuNKy8dUhsGntxJI5hKGcoEF2DOX6y3tEKfzFS6lXa
   wCLceBN8FSszHB27FTINWRskhCXHWw9dX/2+vsLbLaVgMdapShwV5q0bo
   g==;
X-CSE-ConnectionGUID: wuSMEWY6Q1+PTTVGCBORkw==
X-CSE-MsgGUID: sgoaBg9SQAiQgNCrzYjO+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78644968"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="78644968"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 13:17:13 -0800
X-CSE-ConnectionGUID: E+6EZKoYRqS8o6aXrT0CfA==
X-CSE-MsgGUID: FKslTVirSrS6nGj5wlUdtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="195580344"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Dec 2025 13:17:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT553-000000000NR-3nli;
	Tue, 09 Dec 2025 21:17:09 +0000
Date: Tue, 9 Dec 2025 22:16:43 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3398/3398] htmldocs: Warning:
 openEuler/MAINTAINERS references a file that doesn't exist:
 Documentation/networking/hinic3.rst
Message-ID: <202512092215.R7vj8ToZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: 0378ac5f333ca75e4fae5a8a8ed499ed374f3bdd [3398/3398] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092215.R7vj8ToZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092215.R7vj8ToZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst
>> Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/networking/hinic3.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
