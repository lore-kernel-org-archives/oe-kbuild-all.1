Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE3632
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727011857; cv=none; b=nt8G35Egsnv8LTgV0kOX98l3CiqaYj1F4DrUP+O7CT99JekVKfgZSDA3jJXfYNCSVAzvF1fLkv1HVvsY220Gz4SNejlJMVU55MX8rGTHdZuiDcrPZAp4Xff69LVgnK7uJqlaZ5rYqujYmgVecR/4GXpBaDER2SagqBnfMo/Nxsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727011857; c=relaxed/simple;
	bh=LNhvdnj8jFJOiHe+EBccpISOwhRX141fbYgu2BLhwDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBt8ZGiX/IPuCtmvpoyf45GDnwav+A4aeeJA5o5mICdyIeDBkuFDnOR50NVIxhO6aqPyDB6Lt8l2l/cF+QMcrwX7Ic++XdLvjj2mHUQUvbYYuh553VRwjNMuQxx4V/XKtSdlYf4JTaFxVKkH0TJR0ofk3kfaWU9aagmXYNj0FJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2iujw5y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2iujw5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727011856; x=1758547856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LNhvdnj8jFJOiHe+EBccpISOwhRX141fbYgu2BLhwDw=;
  b=N2iujw5yoOPpNv/nI2JxL3aNg0XQKRyK9vlamcjqc3Wl84IhXOqd62HX
   n9AZs1lLOK78ZqhzKmB6/Mw2mbnrwsbki7WhBEbsOCe8swyDP6ZiUGjpB
   Hnjb0nWsQVv0KpqGqOaQkVh0Husk7YQYyAm/0w+Sual0tgb5Ifzo4PMTn
   /r01frYnDC34JVSB7Hd7ZDtwjNCRH1nAEs6VwQdaXh06FBYZOAbE74DZ9
   z+0M3xYd1dDHjkHWEpWzmUeFq98zU5SvKst1samHb3FX85LgIpuGqPDtz
   P78gKbRR1mSIxEdKjZ5PcFnkwZ6KQHILKqI233dD0UrCyuuKDIzoDx30A
   w==;
X-CSE-ConnectionGUID: 3DiR+W96SI2EA7TbzjYB5Q==
X-CSE-MsgGUID: FpYyuIlQS7qsyqk/Kh8Axg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25840323"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25840323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 06:30:55 -0700
X-CSE-ConnectionGUID: AeAZc/5jSQadou8pN3RcuA==
X-CSE-MsgGUID: tSkk0r3JRyWq2id2RUrZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="71087085"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2024 06:30:54 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssMfr-000GLE-32;
	Sun, 22 Sep 2024 13:30:51 +0000
Date: Sun, 22 Sep 2024 21:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Changzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29966/30000] ld.lld: error: duplicate symbol:
 nic_ioctl
Message-ID: <202409222141.UEcNSNCf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: eed73e172d7e51f1bf012d8dde3e35022f220dba [29966/30000] gtp: pull network headers in gtp_dev_xmit()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240922/202409222141.UEcNSNCf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409222141.UEcNSNCf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409222141.UEcNSNCf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: nic_ioctl
   >>> defined at hinic_nictool.c
   >>>            net/ethernet/huawei/hinic/hinic_nictool.o:(nic_ioctl) in archive drivers/built-in.a
   >>> defined at hinic3_dbg.c
   >>>            net/ethernet/huawei/hinic3/hinic3_dbg.o:(.text+0x0) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
