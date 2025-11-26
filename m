Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075711FECCD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177623; cv=none; b=PzNzVP+KZoFtHTX51s3YzaWtpDBjP8b8A5c2A0kbLewUK9j63z+ooEXJykg70XtLv8LBVpS000iu8ibWxKwxD1XqZeErYhPfjnk60CV4bL2R4Oa9TLH04u4A/0WeS1btT2petZgU5/uhI53PVR5URbG2NMVSakZgyB63g+wcvMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177623; c=relaxed/simple;
	bh=26ZKTGYCo7QKckC7KhnxwwiS0BkPaCXHLva0Sr0moKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcVqlfg7jzZDmZR6ZHDKmxCU2NpnTQQpnAxr33+9MkqOxA0sCfi2YeZrQYL28tjWxauhi/Kpmem0iMYxlty7SmUzcgFNxxmobH3YggYRjuv1L7prDhikFcKh++sfUkFyU73IeNn0WBZDY8Mw5KcTyU8xkM5A/7nAqiK4rx975Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUxCXZDJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUxCXZDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764177622; x=1795713622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=26ZKTGYCo7QKckC7KhnxwwiS0BkPaCXHLva0Sr0moKo=;
  b=fUxCXZDJmJSULv1ZjxTVJl5kAXqK72bQFbAjXMhjr2UH7itk7155zq2T
   mxYlxpUVL5LwTg024Ug83vOpdv7wn5EQuhi8hewS4tMqA9W+re00sYGBt
   e886Z7l9v6tkbrnzYada/9gO7DR0OLYXnTS2UhRwQAuOKIX3cx4udFhsw
   VtNTJRndESlbVPQndC4FtHPRc6OjeoCsPH2a7H/8mW928Bj0K8MnOPBgo
   6RShlu3/2IVxaIHwDOKeYvj+71nRkXNXpA6e9fe6mGG0WIzmtNU9Hw50v
   ZMlKyDrTc9xBgAtXMOu5oNK1jQQOSm/Gs2wMMzLbOMYxVHd3/SvhavTDp
   Q==;
X-CSE-ConnectionGUID: IsNG2WN7RLmN27AUX57pOA==
X-CSE-MsgGUID: sCuBsF8WSFiDVLxFSFKUVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66262070"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66262070"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:20:22 -0800
X-CSE-ConnectionGUID: FGm2WzoYT+6P4G5RR7aJLA==
X-CSE-MsgGUID: 6GecPEmfTi2VlPu/Rf9NZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="192247334"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 09:20:20 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOJBi-000000001HR-06QB;
	Wed, 26 Nov 2025 17:20:18 +0000
Date: Wed, 26 Nov 2025 18:19:25 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3333/3333] htmldocs: Warning: mm/hugetlb.c
 references a file that doesn't exist: Documentation/mm/mmu_notifier.rst
Message-ID: <202511261802.tpTOoC8k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   18627faf2934ad96de2e45368ec4cf2444343b22
commit: 06bf7ef0de9fd581d9a66f2154dddbaddc1812da [3333/3333] hugetlb: unshare some PMDs when splitting VMAs
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261802.tpTOoC8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511261802.tpTOoC8k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
   Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/x86/resctrl.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
>> Warning: mm/hugetlb.c references a file that doesn't exist: Documentation/mm/mmu_notifier.rst
   Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/networking/hinic3.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:397  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
