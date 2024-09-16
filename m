Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36EC14F11E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496954; cv=none; b=MYdTFYZAvYBqPsGuUZnOiGQkK/0I7AupWrJVHa/FvJT/psDszZQ8ZPdX9HhkKaLip3m9xQ+2ycWmYJxFVzMPC01wmawo9M3+U2zg7wnINt00RJ6xTkKHrooPHO5OEpY1hLEq13rMTyZi5USjhC7i/rwB+9e3tdatgwq7rxTPqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496954; c=relaxed/simple;
	bh=B4NXKmcaMIyEubwj9J1IWr8wKPCTrTYVeFgouaCBvbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jzxdGalkaGrBCxxvcfWSJ2kvmZ8x9/zuS/NjeKH5X36TOZw4O8uXfPekSgZSb1WwxWbkMVaKKhUMJD/vvUn+johof1uY4mP7D5h5o4yGByrP/9jLCbzVZUgXAzkBgDRFGO6aVJEk07DZ4WcunIpq3C+znh38pXMGLPIiDZkZmog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDgfrYeg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDgfrYeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726496952; x=1758032952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4NXKmcaMIyEubwj9J1IWr8wKPCTrTYVeFgouaCBvbA=;
  b=EDgfrYegf40c0AhLGCnKUO+2UhjasbucnkfwiJkBVCo5Qgwwd02s6Q+7
   vIoaylSYa8Phe02jdk48y0nZ9WP2oH02OfgUTPBzyF8vMTkn6h4jZlC4+
   LQftbVxY5WZlQyNQFIXjIZbanN3lfmQ10tJmX5PMBH9uFYn+qyuTE77Vd
   rJdSmuZCKQtbJRygUxiLXgWphXIjGObRJRgnipgEpKph9q2irnQMFfyoM
   BzenYGe5eNq/asSyKA+GZpyuKsnRqNqUFlT9rkHbx1Z5QVdvUn7FHYB7P
   RwQQcL9+jrP2UXxtvjCyvL7Q0T1NpRvAY1JkQOP9cF+AQV3QgXW51Gx8z
   A==;
X-CSE-ConnectionGUID: VpyuFIq/SleBLCxhYHh9sg==
X-CSE-MsgGUID: 8kXxcXCdQCqh5la0fa7ypQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="35903954"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="35903954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 07:29:11 -0700
X-CSE-ConnectionGUID: SOqYdJruTo6KqkwZAj1eQA==
X-CSE-MsgGUID: DWEJqnKaRkKQ0avWY+fv9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73713207"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2024 07:29:10 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqCix-000AAI-30;
	Mon, 16 Sep 2024 14:29:07 +0000
Date: Mon, 16 Sep 2024 22:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9570/23714]
 drivers/scsi/scsi_logging.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202409162223.ddty3va3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 63b053c4efdb2e27f350bc9c1db4fed08a30801d [9570/23714] scsi: core: Reduce memory required for SCSI logging
config: x86_64-buildonly-randconfig-002-20240915 (https://download.01.org/0day-ci/archive/20240916/202409162223.ddty3va3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409162223.ddty3va3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409162223.ddty3va3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_logging.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
