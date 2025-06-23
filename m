Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB02EB1D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668376; cv=none; b=grcS5L96KknwANeMS9d5nr9muDp4JtZcWmDZgp1vkvVzvPUX0JuO1DtY0FuL0Ut9PlnzjL+tQuRI15fJylyuf46yffc34pTnQdPZXSWfsziUib7w6ZLLeKqHO3z9BnL/jTfJNu+r0+lu0Hju+LshH+1qmYJPL5UBB7kfVPHiH+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668376; c=relaxed/simple;
	bh=/v7O4Pcvsr35Z07I6P/++gDnRd6Ppzdb3ILLMO5hmnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGTjVYjngH4MSKIuY46FTBgSFzcOcsj6affNgcMBzy/5Y8vn7n4Tl38cEGHpD86X3qTSPOpD6qjLvUTupt4lDXyhzQMCPZhHpvjyLD6yqlnlBmBwztxc99IvoiOduJLeyjP65sCnUHTRA6yVgVWZI7y1nbiMaKEp1NEMxJn1owY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQPIqjwO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQPIqjwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668374; x=1782204374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/v7O4Pcvsr35Z07I6P/++gDnRd6Ppzdb3ILLMO5hmnY=;
  b=IQPIqjwONER4tQZq1GRlF3QDww5YWXoH/lSLED+Nn4g83jMO0vGy2HVN
   5xHlj2PqSZymnh1F79aeEtpowSZri4ThEbNhCxtk0IX58F2XBbANx7K82
   zWEakzCm+rY96LllvMTzNcOH/VmonOMUvEMRGUUPcZTvdpaPK25gnlKDj
   ln8/cW2SWvpm7CIq1AR85O/DFEh2UYCckt2IkyfPEUrfU+o4oDPDnakFl
   hFJG4ZSui7EOZoKZ/ZvBjo+2QCtPKQ3TQOMnh+x8VJaMIzwtbKo7jsnNH
   Lz50zx0nCnnpTA60IOM3+5gfGGhaBa3f8nff8fgXYjEBmC2KywJ7rhhp2
   g==;
X-CSE-ConnectionGUID: GCWq5K2bTeyRdtgHKz9JBw==
X-CSE-MsgGUID: idwhEGUwRo+B791h8TPh/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="40472377"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="40472377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:46:12 -0700
X-CSE-ConnectionGUID: /NpBUNcgQIKKQPwYckTzUw==
X-CSE-MsgGUID: retnN/2dSduYBb/yXWfqhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175145462"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2025 01:46:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTcob-000NpC-1E;
	Mon, 23 Jun 2025 08:46:09 +0000
Date: Mon, 23 Jun 2025 16:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c:203:24: error:
 incompatible function pointer types initializing 'int (*)(struct iio_dev *,
 const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction,
 int)' with an expression of type ...
Message-ID: <202506231610.oJ39OuGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e81b218c0dc1536b8e63f5111b74ebc7e8e87adf
commit: e81b218c0dc1536b8e63f5111b74ebc7e8e87adf [1/1] FROMGIT: iio: cros_ec_sensors: add cros_ec_activity driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250623/202506231610.oJ39OuGJ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231610.oJ39OuGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231610.oJ39OuGJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/common/cros_ec_sensors/cros_ec_activity.c:203:24: error: incompatible function pointer types initializing 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, int)' with an expression of type 'int (struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, bool)' (aka 'int (struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, _Bool)') [-Wincompatible-function-pointer-types]
     203 |         .write_event_config = cros_ec_activity_write_event_config,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +203 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c

   199	
   200	static const struct iio_info ec_sensors_info = {
   201		.read_raw = &cros_ec_activity_sensors_read_raw,
   202		.read_event_config = cros_ec_activity_read_event_config,
 > 203		.write_event_config = cros_ec_activity_write_event_config,
   204	};
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
