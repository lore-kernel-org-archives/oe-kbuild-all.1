Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE9212BEA9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271889; cv=none; b=lGnnWejnUaSZy8IHEF33FSHsiQBITTWAkdCwCsmultxOWDN3UlG5gPOn5sNRxDpX14UqFkWjUzzJgUnQW6W2oHQVDI06Tb/wLDFDBHSoosXtmPb9nATLpgz52ivx2/c8k5xdv1MOR1pvzwNYi07FAwlGb9f8RQvPBk1dkTGcIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271889; c=relaxed/simple;
	bh=R4kvXZxbAb9RegCPN7hb0WLSSF1EyqCMIjPkIA4XLQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGb0BFnTCHMkzSah3oHittHEbSZDo2CmxM4D46QgPHIyPy75nZ6l6qaW/9BaDeh+CLPFuQls6bQedIk/qHeukcxvw8G2LiigbiTOBfF35FfIWO9rVbZaZLLsx8sQiWrEEJj+zLhuvpM8rCK56Wr3gD50XfQpNuN6qfu5SY3c4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7PXikoF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7PXikoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713271888; x=1744807888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4kvXZxbAb9RegCPN7hb0WLSSF1EyqCMIjPkIA4XLQo=;
  b=K7PXikoFukk0B7DBLlU2EXmldIJ+jSE0q0eU+DE4Sd/sN8FzhoJEEtpu
   9u4HBR7oiK0lKLaESfQMlX30DNLBC+IICFH4YOhfySJYufJ57y5aOglcO
   gNpz19IBPYlvCoB9WVXQJB71CIM+7ze8WJl1Lu9Zh2bZ7Qcocd0HOPLCm
   KDl/+3YWIgyfcxnffwUb0mhq7O1n0iAmNaZIJNG5RBRTit5rJHEQz08ch
   l6+E8ONKI3AFDXDk9Nl3nifLOdmkkkqUe9/qvKrpN5vP7Eup0yJ/rM+w4
   PeduyyCyzEtAXO9+C8zxgV8tIaUc6m5RJzt+kd9fIQncMMqWx9lH0JxS2
   w==;
X-CSE-ConnectionGUID: /6MTc+S8SRSNp0VQkVAgJg==
X-CSE-MsgGUID: FolK7tCwS5eqGZG53cUhUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12546670"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="12546670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:51:28 -0700
X-CSE-ConnectionGUID: JCeMftdgR/CGZI/6HaH8iw==
X-CSE-MsgGUID: v44zdE19RIWbKjrPqw7tyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22732096"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Apr 2024 05:51:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwiHT-0005HE-2O;
	Tue, 16 Apr 2024 12:51:23 +0000
Date: Tue, 16 Apr 2024 20:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 455/460]
 mean_and_variance.c:(.text.unlikely.u128_div+0x0): multiple definition of
 `u128_div';
 fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.unlikely.u128_div+0x0):
 first defined here
Message-ID: <202404162023.ToibQFhz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   7c3356f2aba32597d2b4927b2e237bc980fe3a07
commit: 3332108f6e75ebd618bd1088a45ecb417375195e [455/460] mean and variance: Promote to lib/math
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240416/202404162023.ToibQFhz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162023.ToibQFhz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162023.ToibQFhz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: lib/math/mean_and_variance.o: in function `u128_div':
>> mean_and_variance.c:(.text.unlikely.u128_div+0x0): multiple definition of `u128_div'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.unlikely.u128_div+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_mean':
>> mean_and_variance.c:(.text.mean_and_variance_get_mean+0x0): multiple definition of `mean_and_variance_get_mean'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_get_mean+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_variance':
>> mean_and_variance.c:(.text.mean_and_variance_get_variance+0x0): multiple definition of `mean_and_variance_get_variance'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_get_variance+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_get_stddev':
>> mean_and_variance.c:(.text.mean_and_variance_get_stddev+0x0): multiple definition of `mean_and_variance_get_stddev'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_get_stddev+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_update':
>> mean_and_variance.c:(.text.mean_and_variance_weighted_update+0x0): multiple definition of `mean_and_variance_weighted_update'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_weighted_update+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_mean':
>> mean_and_variance.c:(.text.mean_and_variance_weighted_get_mean+0x0): multiple definition of `mean_and_variance_weighted_get_mean'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_weighted_get_mean+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_variance':
>> mean_and_variance.c:(.text.mean_and_variance_weighted_get_variance+0x0): multiple definition of `mean_and_variance_weighted_get_variance'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_weighted_get_variance+0x0): first defined here
   mips-linux-ld: lib/math/mean_and_variance.o: in function `mean_and_variance_weighted_get_stddev':
>> mean_and_variance.c:(.text.mean_and_variance_weighted_get_stddev+0x0): multiple definition of `mean_and_variance_weighted_get_stddev'; fs/bcachefs/mean_and_variance.o:mean_and_variance.c:(.text.mean_and_variance_weighted_get_stddev+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
