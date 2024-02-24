Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68E818021
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708783031; cv=none; b=GcMh0QxsstsY09hidWkl/+ITryNoeFsh+xRrn7qk0Z9xBlnDhjSfNYTiKVs+NmgBXy8OyU2r503VIyEulkVfNcA+ibL5jQr/J0uywYQomlyqUXh4QArNrdJOBsBsakRhqifbspevctfC6/sZcNtJ9L4AMCcsjGifTjHY6+aJI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708783031; c=relaxed/simple;
	bh=e+0MqsQs79jMIYNEJtb7U6DtrHKXXuUv/LGpKPKv9Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YdhUcT5LXpi0Dyy33v9LlJAJ+WP3SbJ4pf5y7UtEXo/W+YTW/uedt9kArCQV41f0U8C0Z/nBirTCVUWyxAkL+fVgEa08sh5Vv6CE7mq4M5KliqNCCDjgRSSl/XPfLaps9Ys8t1DNKgQ8tfMeTVm6EL+nOzKbKSkzLtTqNg1YvQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLp6kmYx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLp6kmYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708783029; x=1740319029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+0MqsQs79jMIYNEJtb7U6DtrHKXXuUv/LGpKPKv9Hg=;
  b=fLp6kmYxaYN8gl+ZaRUEzsjpMynAHLm+BXR+qIEAhEWhMglnN5gYaFMO
   Mbk5UtUEfy9N04eOWSwHCTVAjwh3ysL9MDIzfkmSZf6r48+k+ZcgJx6W8
   dfIEcoRfrJbG2/EIqvRso0lcMYTK8QsR1z4M08SoJ7qh0FqCPxATSYWEs
   119E1h3AaYEGBXq/1Pie/Hr6nA1EfpXF4d9HWyZmTarKel2UI38o3srQq
   1u/tCnC+iNzr0yfRZ1gNMOxiIX7L2WIhC9kqIins0VTgnjqq+PQFN5ET3
   0Hrex5cAi0MsXfun5D/ci8lzAgj2Di4/KKzFRgCMpTgt9uM5v3RK2UAny
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2980777"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="2980777"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 05:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6202158"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Feb 2024 05:57:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdsWV-0008aK-2W;
	Sat, 24 Feb 2024 13:57:03 +0000
Date: Sat, 24 Feb 2024 21:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13350/21632] ld.lld: error: undefined
 symbol: kfree_skb
Message-ID: <202402242133.TAc5acto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b97b63500af297c36f80416fd1f1193d227cf51a
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [13350/21632] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-001-20240224 (https://download.01.org/0day-ci/archive/20240224/202402242133.TAc5acto-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242133.TAc5acto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242133.TAc5acto-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __alloc_skb
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_netlink_send_info) in archive built-in.a
--
>> ld.lld: error: undefined symbol: __nlmsg_put
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_netlink_send_info) in archive built-in.a
--
>> ld.lld: error: undefined symbol: kfree_skb
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_netlink_send_info) in archive built-in.a
--
>> ld.lld: error: undefined symbol: netlink_broadcast
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_netlink_send_info) in archive built-in.a
--
>> ld.lld: error: undefined symbol: init_net
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_init_fs) in archive built-in.a
--
>> ld.lld: error: undefined symbol: __netlink_kernel_create
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_init_fs) in archive built-in.a
--
>> ld.lld: error: undefined symbol: netlink_kernel_release
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_exit_fs) in archive built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
