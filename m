Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9456225775
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742497873; cv=none; b=EwycB+9tHp4LOtx7RFWlEBDGVkeUKMlg0vRUzy5Zcwv0/N2+IEvIpUYp7j6vcJmbf/6w/OuDyvETmMFRKWnXNKwbHsGkXCetaXTzAsuLCB6n6gPhzTaI3LeT9D4alp9V2a1AQZeeoxMNnmPs8gSnMYdTbJNnIBrEySgDpueaKDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742497873; c=relaxed/simple;
	bh=YQa4bh0HeuleNOGc/oVvrcfh9YK+oqtAdbd4QYvz6Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G37rArVUd3BlM+Mgb9sQIbaZMXEfdvLVWrDl5LEwoxsFm4IVs8ss1zpmHvpQjVxIeG6KiDuIYyy42UhNBw7HFNdJJvE7U6LHqXflGnefv9jtjBufOlPWMGHnVBVSJHhN8qr5eUf6zuu54ThYcNUTfeAQ3vgi3mSptFLRkLtKAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knyZCG7D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knyZCG7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742497871; x=1774033871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQa4bh0HeuleNOGc/oVvrcfh9YK+oqtAdbd4QYvz6Yg=;
  b=knyZCG7DUvVsmRHbML/C0Ur0KM1wgUIsi+WS6D6tIPxXbCeJq6FvpDi2
   kPFlW4QiWnxNNfGD81gNEAKHI1HmrEAkpqan6LnRUtafAw6PdprXEQGyC
   MepH8aTSiMwfihZVzqgRdgi35J5WHjEyAWFc7Dk4aWS8ONR4OhFdiOZV3
   hXkfykGRXOGNvhXC6HIAU6fes/QdqLQUHr7C7T4kCifqW15i1+/laKz+1
   nsR2t/0nxpkD/u0R33YbvzEc2DoRcAtsM9R7Mzrziz+UA9cvJPBH/5WgW
   E6qxWZyEKnBjqISDw9BE2VczvXTMf1czaqilhIdhnoWQ43AIi18J/E/di
   Q==;
X-CSE-ConnectionGUID: 9H0ycZhwR4qXRA8aGex58Q==
X-CSE-MsgGUID: GbfYvox2TwGF5fClIdz9tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="53971834"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="53971834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 12:11:10 -0700
X-CSE-ConnectionGUID: kgSFGp07SYaSUQSZGxovLw==
X-CSE-MsgGUID: IUcWpIlXQRejjKXKrWoYdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="128026042"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2025 12:11:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvLII-0000hV-2q;
	Thu, 20 Mar 2025 19:11:06 +0000
Date: Fri, 21 Mar 2025 03:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 9/21] ERROR: modpost: "__swiotlb_find_pool"
 [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!
Message-ID: <202503210346.IcfZBQwL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   dd4f28ef237ef9221a468ffabacdaebb282483c4
commit: 07e6568951d1a4d23b43c1a2e4132b0bbc63895a [9/21] virtio-msg: ffa: Add reserved mem support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250321/202503210346.IcfZBQwL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210346.IcfZBQwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210346.IcfZBQwL-lkp@intel.com/

Note: the vireshk/virtio/msg-xen HEAD dd4f28ef237ef9221a468ffabacdaebb282483c4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__swiotlb_find_pool" [drivers/virtio/virtio_msg_ffa_transport.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
