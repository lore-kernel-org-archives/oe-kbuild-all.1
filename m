Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76433595A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 18:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735322537; cv=none; b=ePQKnH3Em0mV+naMGtd3388kpcLIhSoAYbRirZZ9zFOkP1gJgJrVC/B/S4qgpphSW60R/tTm4V/tETS3rCzj9VfgmgVxnSAzJ7TkdBz9m724MLXQUQ97ETrgBaBb0Pc8qKVLYr5TYY4JlYr7Awz+POWcgC2FdpcKi+SLfV0mpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735322537; c=relaxed/simple;
	bh=qbLqIqKB/grXboYl4hQPq1MglQkAJ7l5hgxZPrmhghs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FMqM2uNOXxpcgm7rtRYyWu53RsWzIxIi7qeuVydCtILqDHrpd9uDwZUarBEAg5yxsyKJoQPkbSQRjCY9vDGM6Qnj2gemee5bihY9CmdzqnjLJT/89R7n5nmj9JFk9X4/WQAwFPNOeKC6WW8JiMtf1Fgevu8u+PW5wrQYwp9VXHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2Uz5bxc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2Uz5bxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735322536; x=1766858536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbLqIqKB/grXboYl4hQPq1MglQkAJ7l5hgxZPrmhghs=;
  b=b2Uz5bxcV3j4d8KmsZBfHIMzNzX/5xr0WJR5GEaf5uQt6vVTs49NlP/F
   dX/YS9ywyfku+bq9DJ/LK8KamG7/8Lkzr/p5Lhs73D/jj8kR0eD6Qg3LO
   38gPaqqMGRephbxK2dpslKcnOsXGzM/RInTvOjyJCyNjcNazw6ALMaHh9
   u3GlpyrZl7U4tJXwPDnFx9TGoKP8M81mHnaT/Z8YmNZEcwMfG6SjyxStb
   O9Mko/1m+gwEAOX+BsNxESMsHj2SfFsnYnYH4iGdK2kaEfhK17Dt//sl7
   /jnWCFuDi9J/0ju8Ytz1hqe4neNECc7P4XJMFdM9CPJfg6kijuQDpG3Qs
   w==;
X-CSE-ConnectionGUID: sOxsp5tpS/+ME7xNKabReQ==
X-CSE-MsgGUID: ZZysSXz6RmSvP0Je9c0afA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="34987742"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="34987742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 10:02:14 -0800
X-CSE-ConnectionGUID: BAFJ3KUWRnWBXCtiB5J10Q==
X-CSE-MsgGUID: 9xjQWQjDTaSHOIJzN0g53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101047325"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2024 10:02:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tREf5-0003Q0-0m;
	Fri, 27 Dec 2024 18:02:11 +0000
Date: Sat, 28 Dec 2024 02:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 21/21]
 drivers/iio/light/cros_ec_light_prox.c:363:9: sparse: sparse: dereference of
 noderef expression
Message-ID: <202412280147.SSU1D8LN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   ca8e7ba4cbf9fe4c8fe507bf6d5f91c4f6d0b173
commit: 8265d12d01cf5f4e63f8b499cd268615f74cc2b4 [21/21] CHROMIUM: iio: cros_ec_light: Add support for RGB sensor
config: x86_64-randconfig-r113-20241227 (https://download.01.org/0day-ci/archive/20241228/202412280147.SSU1D8LN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280147.SSU1D8LN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280147.SSU1D8LN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/light/cros_ec_light_prox.c:363:9: sparse: sparse: dereference of noderef expression
>> drivers/iio/light/cros_ec_light_prox.c:363:9: sparse: sparse: dereference of noderef expression
>> drivers/iio/light/cros_ec_light_prox.c:363:9: sparse: sparse: dereference of noderef expression

vim +363 drivers/iio/light/cros_ec_light_prox.c

   342	
   343	static int cros_ec_light_push_data_rgb(
   344			struct iio_dev *indio_dev,
   345			s16 *data,
   346			s64 timestamp)
   347	{
   348		struct cros_ec_sensors_core_state *st = iio_priv(indio_dev);
   349		s16 *out;
   350		s64 delta;
   351		unsigned int i = 1;
   352	
   353		if (!st || !indio_dev->active_scan_mask)
   354			return 0;
   355	
   356		/*
   357		 * Send all data needed.
   358		 */
   359		out = (s16 *)st->samples;
   360		if (test_bit(0, indio_dev->active_scan_mask))
   361			out++;
   362	
 > 363		for_each_set_bit_from(i,
   364				 indio_dev->active_scan_mask,
   365				 indio_dev->masklength) {
   366			*out = data[i - 1];
   367			out++;
   368		}
   369	
   370		if (iio_device_get_clock(indio_dev) != CLOCK_BOOTTIME)
   371			delta = iio_get_time_ns(indio_dev) - cros_ec_get_time_ns();
   372		else
   373			delta = 0;
   374	
   375		iio_push_to_buffers_with_timestamp(indio_dev, st->samples,
   376						   timestamp + delta);
   377		return 0;
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
