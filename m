Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F43D547
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709325834; cv=none; b=BkHBJZd8uuJKBWranEBt210PhKKkIZpc/mFzixaZRqo++dL841gF+a1nTiWtjyWQ5BKPWll1O9aURmONMh/3SFW9HB4yRqv9rREMyCLYZtq/rPRXdT9J5lPoDt8IB98Rnk9hh96cg/duwP4hIEfHAGYZHiCW+iurqtuDzcaMgNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709325834; c=relaxed/simple;
	bh=sMwS1pRUwLlZ/u0/ZOBgAXSDUBOpSCR2E2o/5ksE3Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6vTnCqvsi7lfY0rhyWa/R06gp5Ic1WbEuEOZ7wz1SAJtUoqySBCDyDkVipLuue0hOfkCLEIO3EeXyg6XJ+QHtCauor31OiGKd4n/cLyOWbaJ1mmPhSakfxRlQbZ/RnnuNER/0Oms7mSZqelavSWFx0du3TS8RKPJ+9OV3oRfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8bK77ga; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8bK77ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709325833; x=1740861833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMwS1pRUwLlZ/u0/ZOBgAXSDUBOpSCR2E2o/5ksE3Y8=;
  b=M8bK77gaPsV2yrLssWnHgsZZ8srsDvMsrfTM2fP6zYBXJ58ht5cLy8YC
   AmStCeNjFEmA39gauxIsy3bqJRH3UeDFnCb7qZewzCf9PqcbX9TavnDUn
   fqn3Xc91MY5Q0jvVVwH4QtNujS3/M5bobzufbSPdddbDTUxO+0zUxdPYG
   cfgytJ6jYPqHzBSpfYAt73QCB4yimgb9VLmkeo7gtzCl3ImzrzEr/hdx9
   LkZXDjyUwZUqyF1KHpzr31QoLAiDSL8uNXJBCPdwRtC8XhNdS+mlsy1jR
   1w7D/kioC5QM1XIFMezLjFV+F6hnI7VE6QbB63VGz1IquqM6eFf+uO4Ek
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3808102"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3808102"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 12:43:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8374170"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Mar 2024 12:43:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rg9jH-000E5F-2s;
	Fri, 01 Mar 2024 20:43:41 +0000
Date: Sat, 2 Mar 2024 04:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning: Documentation/bpf/ringbuf.rst references a file
 that doesn't exist: Documentation/litmus_tests/bpf-rb/_
Message-ID: <202403020445.u6LIJUqj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 676f55be3767bf96579418df1ed999b50a9e7d46 docs/bpf: Add BPF ring buffer design notes
date:   1 year, 6 months ago
reproduce: (https://download.01.org/0day-ci/archive/20240302/202403020445.u6LIJUqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020445.u6LIJUqj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/bpf/ringbuf.rst references a file that doesn't exist: Documentation/litmus_tests/bpf-rb/_
   Warning: Documentation/devicetree/bindings/cpu/cpu-topology.txt references a file that doesn't exist: Documentation/devicetree/bindings/riscv/cpus.txt
   Warning: Documentation/devicetree/bindings/timer/ingenic,tcu.txt references a file that doesn't exist: Documentation/mips/ingenic-tcu.txt
   Warning: Documentation/driver-api/gpio/driver.rst references a file that doesn't exist: Documentation/driver-model/design-patterns.txt
   Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
