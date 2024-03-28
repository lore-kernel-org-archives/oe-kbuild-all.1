Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E08D13B5B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 19:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655724; cv=none; b=rpj+cjWcUmsUDQcncGXZncQqm5xt40L8HARZ+rk47k+OrDkFEJsxwtTdXWbWKYQZT9Oqosf5stfiy3Kl2OJSME9WhZjO84GVuXMzclmRVkvDYULjzVkAOAfIY7Uc0SUAtWhRqbIYwGn3dmVv7WTt0wuDOHykM23U+kMX3F4lHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655724; c=relaxed/simple;
	bh=/y6zY225/fUzqMS0RLCUns6OQV0Ai7mEftmPYTDHtY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivIOcNB1JogzJqTQU0YQvELpqPOF108wNOSyWcXfa1Jk0jWPM68VxTrs1JAtVuZwkm06WHMjYY8UZNrXw5p4Z7dwejyxhDJ/XB6Gm6zbhBn4CLXjOmIdheDb63AYgaTNJqDe0Ypj4D/sJUogs8Z1UGQjMQsDsfsHCj04vF0tsc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Khl7bfgv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Khl7bfgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711655722; x=1743191722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/y6zY225/fUzqMS0RLCUns6OQV0Ai7mEftmPYTDHtY4=;
  b=Khl7bfgvr71Tr+9dkLRGP1QelHumU9rSrysjJgdqz5VSpNQNdlIpA2wM
   bGjY5Es5mL9TmySfe5uDl7N5LaLZu3wiacbrSe8efFu9ponfoHyc2jnqy
   0eHO3+cGzRNFKrp/k5VaD1HoTrYLoqqbYcqBmB8xMgSeOB98xfFgvLvxX
   Yp8m5b57oolVlRwY3ews7UlU3mVmrXmiWr5cISn58/ba9qLvEdxGRjusp
   JvMVaRsCihV7ijI3pbD5xOjQuCw82sORJL1S2wKyVAVMXzHHViKJZv2qF
   +wOgT8y95w08Fbahpj2yl4DRHmC1thB3uHOq29aTcPUUkPv6L1pOZZQMh
   w==;
X-CSE-ConnectionGUID: ghI9i+08T6GptGd92zjUNg==
X-CSE-MsgGUID: 5PRRfmBsS7S7jU2ax6u1Bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="9791189"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="9791189"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 12:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21263353"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Mar 2024 12:55:20 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpvqI-0002UC-2l;
	Thu, 28 Mar 2024 19:55:18 +0000
Date: Fri, 29 Mar 2024 03:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 437/441] ld.lld: error: duplicate symbol:
 __cfi_set_slave_host_enable
Message-ID: <202403290335.CYelvdrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: 3b469ecc9cb354fc42003ee184d2dafdd8eab1da [437/441] !5280  Add Huawei Intelligent Network Card Driver: hinic3
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240329/202403290335.CYelvdrv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290335.CYelvdrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290335.CYelvdrv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __cfi_set_slave_host_enable
   >>> defined at hinic_multi_host_mgmt.c
   >>>            drivers/net/ethernet/huawei/hinic/hinic_multi_host_mgmt.o:(__cfi_set_slave_host_enable) in archive vmlinux.a
   >>> defined at hinic3_hwdev.c
   >>>            drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwdev.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_nic_ioctl
   >>> defined at hinic_nictool.c
   >>>            drivers/net/ethernet/huawei/hinic/hinic_nictool.o:(__cfi_nic_ioctl) in archive vmlinux.a
   >>> defined at hinic3_dbg.c
   >>>            drivers/net/ethernet/huawei/hinic3/hinic3_dbg.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
