Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4C533FD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718586329; cv=none; b=G44DlLDk/qH5tIPAauqdZAuuRQe82HHLfGenvrn4ZAJInKULeB/PcdZ+HkOIwfxUqUxFYd/ySeWlpuyraKCdXOe5yMv+Y2xGGDs1E4o2DIPxZnBROycj4HErz1iqWAe+B7YkVAf3hA3HPlc7+XryG+lvwZKd3QgTjUoN6t1ukOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718586329; c=relaxed/simple;
	bh=+6qdQyl2ATNElvhmWETwyD5YgaSpfjO1cHFYCtgyL28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUh0WJuldwhc7Lf7pO6D57nKKZ8qEjmecWiu64PAvwKJKc/QGQIIKEMx5TvyKAtsD9GfrYbgY3A/Bld0PqVvaRCjSgbus3PqHmASWnFkJyuxSaECdob5I7Uia1qrTUYZ7INYs7WZgUzaVLhKWRWpENZP3TbuLZBc1bIUXmwAPNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XPQ54Fvi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XPQ54Fvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718586327; x=1750122327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+6qdQyl2ATNElvhmWETwyD5YgaSpfjO1cHFYCtgyL28=;
  b=XPQ54FviyK7uxKhlK/yCyCOGadWEPdA1YNwkByuLKt9OPRUpch4H4b4e
   DOyryl36aCvQdGE+d4QJeKOx+DTZxXxejcrztmJWQQqekAc3ap2X6gZx5
   xRsrf3OjyjxB3ru9+WObvWw5Ck6BYgTD1s3SAVCJm4cOk2uM+/27R0R4o
   vDdAMRl+t4VM7M+tln0WMxLvPt84jabrDQsI/riKGy0gv7kFFYjrftpK5
   zwPCQO8GO3bhcx2POnFoU6OgvWyyFw0Kb/zR+eW01mHHZSgwcQ2CQfIiY
   EI/pfllNGOPmQ+dbUwx3LrMTuTJETNb4W1rRAJrUlXmbAgChWBDcQhNsD
   Q==;
X-CSE-ConnectionGUID: CV5rkUgnQeingPiJHboI4A==
X-CSE-MsgGUID: cwPhwluMQv6xnzltkeungw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12100293"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="12100293"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 18:05:26 -0700
X-CSE-ConnectionGUID: cTH+TTkPTWqSF7f21q83RQ==
X-CSE-MsgGUID: upyYUvY3Rei67S36PcLhpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="41155845"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jun 2024 18:05:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ0oF-0003ZV-0b;
	Mon, 17 Jun 2024 01:05:23 +0000
Date: Mon, 17 Jun 2024 09:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 7438/22937]
 drivers/net/phy/.tmp_ax88796b.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202406170809.fyaOQ9ZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   745a3c567e1c329d131a8896642475f3916d020a
commit: 56e625aa545a24e8d3fa44b5fbcdedd88e443dcc [7438/22937] net: phy: rename Asix Electronics PHY driver
config: x86_64-buildonly-randconfig-004-20240614 (https://download.01.org/0day-ci/archive/20240617/202406170809.fyaOQ9ZM-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170809.fyaOQ9ZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170809.fyaOQ9ZM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/.tmp_ax88796b.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
