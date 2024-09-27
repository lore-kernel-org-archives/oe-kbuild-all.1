Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C66B658
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 03:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727409357; cv=none; b=iyBE7SHI8yrPHMfXLxl/zVHErIZQhIiHpk8/DGgqM8ciZLO3IE9eUrpFZvSp9rqBufyeLmGD2aLw70vw0dRXtli9thvCcBTp1nx1+ZIF6i4eWKeSLeCCsX6t55CgW1oFruEv49qUb8MF9OZqo8AonbWFNu1x+fT5diJV+kMpStc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727409357; c=relaxed/simple;
	bh=t5b/snR0lPuWFFGCjCMwk8aXn7AlRY2TZFzukLSNLYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNjHSR4koJoIVZKP+z4SjLP3OQlFfLRr8faroC90x1Ff4GaJP72zGFnidCVTSr2NUrMdjWoM5ncZHnTCSi6uFvJ8GvHQClC3a31dzzgFC4XJanoflSxVoOauPipceXPSserkJmK7kHesPojRern5B3B3AG769D7hQHOlQMVAa7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAo4uLa6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAo4uLa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727409355; x=1758945355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5b/snR0lPuWFFGCjCMwk8aXn7AlRY2TZFzukLSNLYw=;
  b=EAo4uLa6jhSwemB+tyKo65C2/+ZbhIp39U0uKIp9J7oTcE6/K6U/fijh
   fEiQa5pxnhkGsQ6NyefrhEtc67AOwvjN+VUr2JGK2lVuJY+LrTTq/2777
   dk13QDqcA8hXKKz1fK4XpZDa5vp9uVuWnUz4+B5K4ZMELtInPjMVngBWg
   TfXrKg9HAwYKm29vNWiRpVeeIeO9QHQPHSIMDFyPrC3/tV7sB7T6G/+uA
   1MkgZ6rqVaGFWjA6DwAcmpsMa2FNvz3ZN2PIX8zxNBa5spScEuw4lzV9Z
   J36ax1fsofIFxnRS6j255/Y8ENPQsj/16FJuxkniQ0RQQmVdNtgr++E+L
   Q==;
X-CSE-ConnectionGUID: 3MuqBX9eSqCQU6PudfZEPQ==
X-CSE-MsgGUID: 2XOyzttfTSO9mLsF1Ek9yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26051514"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26051514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 20:55:54 -0700
X-CSE-ConnectionGUID: OC0e+peBSs6raWL+koKZ6Q==
X-CSE-MsgGUID: gawR0oKbQ5ye344tc+ckDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="95731275"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2024 20:55:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su259-000LQt-1A;
	Fri, 27 Sep 2024 03:55:51 +0000
Date: Fri, 27 Sep 2024 11:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13350/23779] ld.lld: error: undefined
 symbol: kfree_skb
Message-ID: <202409271130.zkdDo9UH-lkp@intel.com>
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
head:   f9510969035e796a27375a80d9d6489440e17a1a
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [13350/23779] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271130.zkdDo9UH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271130.zkdDo9UH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271130.zkdDo9UH-lkp@intel.com/

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
