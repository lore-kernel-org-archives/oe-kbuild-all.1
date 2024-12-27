Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C811C3BFE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735311105; cv=none; b=SVRzC14/kncxAoZuwPelr/Sq6gfGA+0yHWlJmUjdvahazgz8XmRzuCcvEk6UK4ZyWzZ8F7BkLGMOII4FBsoWIPCkVvUM3IMDkrzU77kONkffQ5nO7BjumbWNAvLCQxt2p20obWXqKSyIOLKZu2WYVvi3kTILc8GKG0zYMdcSzDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735311105; c=relaxed/simple;
	bh=7KC3TLywuSsP5uTXwY5V/hiMvn16EipiPjcYpJW3btI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EViGc06aIXqDzt3ZF94VXMDFJjyOPQlGSX9UseCFwFIHzVaf2l115GmFSY/Bk59J2d+WywWH0YLiZ9sH7fOTRauzwWoexMHntQsEQiZZDM+jMLu47CFdKcSja85IJ8M/Vx4kdjd0JxxaKesZG0pfaP2dF/X6FDDr41jKqIBVm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuGArsDG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuGArsDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735311104; x=1766847104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KC3TLywuSsP5uTXwY5V/hiMvn16EipiPjcYpJW3btI=;
  b=YuGArsDGVBwUeXdTlQ16WLUF+UaU3zvB1s89I0UEM0v88e4EK9qi0EOx
   GEgXzOU3h6QB1f5fSgXLvQgaqRL+PZXV0nkktCcgx06bB99tbquCKirHc
   IQUdZ8y+prrnc1Eh/L2bXytukYOuqBrXykVkfq8XHY8lJkJZVWla+SpGF
   vX86cLf45qqPKA/dvBXSRLueiJ6c0akVqno4zCWeyUFp8uzxHJSE22hsj
   ZJiVEQzvQ8nm9sdGS+kf12RRW3jAdtlyNUO1rceXiZ5JTdi9Q/OBZmtt+
   plJfsZm4KtJ9tNDP7yNtE+lTFmW7Ymj9xJEEgnr9c9CSx6rEHG7qSVBub
   Q==;
X-CSE-ConnectionGUID: l0HcTxAiQrir6DrBTnJD7Q==
X-CSE-MsgGUID: dZsEg2Z6Rk+ZZNPcFGOSeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35422381"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35422381"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:51:43 -0800
X-CSE-ConnectionGUID: XPiJlPWaQui6FzhpeXdsiQ==
X-CSE-MsgGUID: bssSio/bTt2Erz6ngRCgBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105027647"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Dec 2024 06:51:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRBgh-0003FM-3D;
	Fri, 27 Dec 2024 14:51:40 +0000
Date: Fri, 27 Dec 2024 22:51:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 21/21]
 drivers/iio/light/cros_ec_light_prox.c:363:9: sparse: sparse: dereference of
 noderef expression
Message-ID: <202412272215.vC09Q8KE-lkp@intel.com>
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
config: x86_64-randconfig-r113-20241227 (https://download.01.org/0day-ci/archive/20241227/202412272215.vC09Q8KE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272215.vC09Q8KE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272215.vC09Q8KE-lkp@intel.com/

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
