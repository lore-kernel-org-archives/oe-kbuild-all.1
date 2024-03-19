Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235614F1FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 06:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710830488; cv=none; b=MWuSnUsON6DqWcnQfuPG6zzKF3qNFPTxRQof1TA7wM0kcQRK4Jj0lz0cL3hL1skwjBDVE8TxuAB/Tq9kWwoPIuHzpRHuBTs2BXROz7Sd5AMEhItgkOb8tA2Y4zQtuz9PptTBFOO6XoI20NnoHVtlRscEjPKTfP70Y4n7Z18oPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710830488; c=relaxed/simple;
	bh=qNKf2x6oWGFBA0LIK8b//7//yEV1dxnnASn/9Jyf5V4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dw0kemNn0Iyb2dQk5oC/cTjEDdpXSZSO8X2RnzAm72m2X6MXssi9wlBtR+B0QX3HxLQyRZhxO8pmkh5Lnmig+DtQNPMvSG4ijXrVkCzlYy5VOVKp4SPsL5E0YxhYrPTPQeJLHT3j8W1+pkPaUGHR5gkzRKJtw+xiFK1a7tzXimo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfI95Vfe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfI95Vfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710830487; x=1742366487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qNKf2x6oWGFBA0LIK8b//7//yEV1dxnnASn/9Jyf5V4=;
  b=IfI95VfeJTSZPWzcJqYdzpRGEN11z+xurY+9YepFyV8wscYIcwv3YURL
   WPdUVWtIOd17ztmVyFyJ7vHi2keFpiLkhV9cnLPfr4D5XyWPe1kOdm0WD
   XmHqTDpIyasrElqUvHwX7vb1f8LfqrUihD0w6bz2mE8PEOpcEJr1tl73q
   YPug+XVswaClwWf2axAkqZ4w4uMUxxeaKu19TIISsExRlLAnZHhoECIFv
   ATTOwLuS9fApuuuJdnYSIyJu5vrgAU1y+L1gAmn2cFxQHhTn8OS0Plu+S
   DjY+hxwgWVxq9uxCo8MdSATp8oq1F3NFiEhZEN6pEEKhWGWp6zy0Bfaco
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16822789"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="16822789"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 23:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="14363905"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Mar 2024 23:41:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmTA1-000HXH-2n;
	Tue, 19 Mar 2024 06:41:21 +0000
Date: Tue, 19 Mar 2024 14:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 22328/30000] ld.lld:
 error: undefined symbol: __udivdi3
Message-ID: <202403191407.EmDNLgr6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   4f653d6975381f93075754c0d2b1ec8bc37b0df8
commit: 59a5abac37a269a018e81c837227bf887dbe6db1 [22328/30000] Convert nsec to usec in encoder buffer timestamps
config: i386-buildonly-randconfig-003-20240319 (https://download.01.org/0day-ci/archive/20240319/202403191407.EmDNLgr6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191407.EmDNLgr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191407.EmDNLgr6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __udivdi3
   >>> referenced by virtio_video_enc.c
   >>>               media/virtio/virtio_video_enc.o:(virtio_video_enc_buf_queue) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
