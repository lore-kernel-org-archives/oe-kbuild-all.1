Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6C370803
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733095447; cv=none; b=UBQmNuT3dqkkjYw3vgw3/AO+2bBZPScro37/E18A6nJi7eLb8gY4yPeA9PLy8gJeoBLJJVOXHVTPx08oh28Ce6IRIBbwj29zHk2nCWNd0NnMyGi3D8SKek83Sjc5994wkAH+6xVPHpQGCdU2KdD8+PukSp883taDcQCs63pv2xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733095447; c=relaxed/simple;
	bh=/zaRjSkQ+654sdnziIsUrGtMlibkV+bFnMJKIsyWOyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Udue20Zm0tbQZ4fkMg0mxAAJDvaNJHHN949DrotLwvW6u2jJVq4wE3Bc5JNfx71W1L5Wt7AwOpHP8kUd5vL1V+waFWKjjrSiXtMyaEaUgABVGvE0Ebx2DV5/eeSdNdxwo6Y9y1GUwvERi6U4e0ExNrMEYC90DrqWTZGp08G3VEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GP+R9gge; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GP+R9gge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733095445; x=1764631445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zaRjSkQ+654sdnziIsUrGtMlibkV+bFnMJKIsyWOyg=;
  b=GP+R9ggep3uZka1tw7uaQ/lUro36QxApwLkbSfQCcm8lceOyis4MPMp6
   9qicgb0X5qpJLj/vKNZlhEwfPNkDaoMDw159EkbUnrCKkVfhGhgIuoZah
   XcqGUD7/3z0Ss5ZjNAvnOAyVxCggU5fBbO6kWgjoAOaNizcFYfWQiDtP+
   lPXj0RIg0cOUQs9FEAOAzqZrVCgH9W/HFZI/fepeuV6yK2EAADHfPp+dn
   BoIgFaPtLWVivk83bXONZtdGXFgIBFch2aypjao/2Le9m9DycRHDhKvIF
   vz85aeSZe9tG0Bi0itEEa8/nVBOID1KkFdV647K1kmAz8ZhPMjrPLAhyH
   g==;
X-CSE-ConnectionGUID: fVNKdrq5Sny0y5UlDUfq0g==
X-CSE-MsgGUID: WQnySVGdS2eT24WDU4404w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33385415"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33385415"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 15:24:04 -0800
X-CSE-ConnectionGUID: xoWdyeOTStWk1VIlRx6Oyg==
X-CSE-MsgGUID: AQD88dKPQfat4QzuM0Irgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92841327"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2024 15:24:04 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHtIH-0001vJ-1X;
	Sun, 01 Dec 2024 23:24:01 +0000
Date: Mon, 2 Dec 2024 07:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298]
 drivers/i2c/busses/i2c-hisi.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202412020711.t5t9e2xh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yicong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: f4c6df89b7d391c38011a39858a84e3d8fbc7ada [1298/1298] i2c: add support for HiSilicon I2C controller
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020711.t5t9e2xh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020711.t5t9e2xh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020711.t5t9e2xh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-hisi.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
