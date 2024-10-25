Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38081B393A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 07:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729841333; cv=none; b=KrcIzy4oqijd0oezwRbX46mzpJMTSeuw2I2C6k8yhrsKJhTT9tUHWx4ezyVL2xSwU6tRTJXTXMRSek7+kP0JiXNYfd8QALiQPJd4ZigU6RuBKuTK+fGDcQ3Dn25P3Cc1iEaLTn2rjBm/XCYKx3evRuiAYMOYmhoiQBzeBhDXgm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729841333; c=relaxed/simple;
	bh=pg9ba1x4F6Tj7UYQVAEHxdNNlZTh4LcfKKq6vlTN4WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1Wwy0dbLojmNoGI8q+qQOYY1V9LxQ9128g2qS0WLKS/mkFaIKVIjuQ7/OoUVDSp/XY5+tHD6Hq1Dh8mBOVf8BTMmwIZUb+Foepg6LxvUtLslApWtj35a92/zNZ95O8GI8oj1xqPz6RmynkaaZz3kBFwNqogA3NDkSeVyvJ3Ww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZvcgLp0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZvcgLp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729841331; x=1761377331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pg9ba1x4F6Tj7UYQVAEHxdNNlZTh4LcfKKq6vlTN4WE=;
  b=gZvcgLp061Q26sLQr11xprgc73Uy1laP5JmAlrrA7DG9PuCfsYb4QkZZ
   LGX+Juxo/qk9cusDppmWtuUT3vW41PHnLopqDX1LEGHH40FcMU/EQj5BI
   zOEiiC1f8RnUqqZNBny9XoqFZTnaI0T+QJSJAMRHzdYZ0Xz4Oa/FqSyri
   7KsXknAhbDiWQcqqsHfzNA1VgdOPIjy6YB3Yv3fr8lqo8XKspJmbtJW4P
   X59THBFhV5d45fhXLSqEu3/V3h1YkQJbBCkXdES2aioa7xNEiGhCRoOf4
   aX925TRsdxQEHIyRtP2gfLpQdVqtjp5Df2Z1pycnlcM7P0HzDqcjx8TcS
   A==;
X-CSE-ConnectionGUID: YUbfba1kRjS3LTIvB4q05g==
X-CSE-MsgGUID: lksXVqZEQ0CHgA+fh3Hu0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29280327"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29280327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 00:28:48 -0700
X-CSE-ConnectionGUID: angqMIt2Sr+3jcsyAFygwA==
X-CSE-MsgGUID: mnXV2GSST5uxuNLjISnKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85392881"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Oct 2024 00:28:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4EkX-000Xlo-0d;
	Fri, 25 Oct 2024 07:28:45 +0000
Date: Fri, 25 Oct 2024 15:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13350/23859] ld.lld: error: undefined
 symbol: kfree_skb
Message-ID: <202410251513.0TgJ5Ukq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2a40c79ddef4b96b8a7a396bd7273121b1b4a5c
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [13350/23859] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410251513.0TgJ5Ukq-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251513.0TgJ5Ukq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251513.0TgJ5Ukq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __alloc_skb
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_netlink_send_info) in archive built-in.a
--
>> ld.lld: error: undefined symbol: kfree_skb
   >>> referenced by super.c
   >>>               fs/ext4/super.o:(ext4_netlink_send_info) in archive built-in.a
--
>> ld.lld: error: undefined symbol: __nlmsg_put
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
