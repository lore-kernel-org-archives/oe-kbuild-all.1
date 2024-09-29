Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008BB3C30
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 04:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727584515; cv=none; b=Shr6FD9QFrMkZfsNNer/pQSjEc1fwVGrS1hg8m01+uQT6OjISxGQkTvkuq/uyqTzBZm0MYDSOR4cCP7pRPw6x6MS0WDL+MZ+iO6VGdGOXdENQpJJwafhNtoEB16c4MxlC2Di0tqC/VcCDosbb4n/oHGjlEOQjbzb3osRhjlGMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727584515; c=relaxed/simple;
	bh=pAPd6sj9dEDMjevPRSMiPLCD4y7JryNdDxpmQ2Z1kFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzGg4DmsdnwqJvNfcZCQQETYFMzPTTdkpt1ye5IlqH2qthcYWgZVDyh2MPLHAvQT1Vr2cw8D3BabC8Y93WI2GBUUdLmt/thdVzzai0hIc9tw3IGq2AIOj5/coLtSsFMQi+1gXkzphCVpva32zrEfoUmCH2PFuTOoc8KdwI3y8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5Nu1dI5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5Nu1dI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727584513; x=1759120513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pAPd6sj9dEDMjevPRSMiPLCD4y7JryNdDxpmQ2Z1kFU=;
  b=g5Nu1dI5ZrLRdke1dkfmmd42gSMe4pGNwLYIgICabrDNalfO94xzvGvW
   zjFIJLMnrZhA90VJy6WmM9Wfud4d6RWJFYyJiP87cnatF0ssLU71Ge6+f
   L8l4NxX3V8BlKEGxMYZo/PIc2ZSPR7K+o9BYN0poWuVeEiIV1qhHXlmeJ
   VyzX0wgh4M2OBumeLrv7IjwpZnFa0jDtpK7+ggWfkSQFnBPihixFFuMf5
   S/341kMdgUjSg9tXGM5zDdbaYasbW4kI79uGcBWP6xjr0Lv1Jh8Q0DWQU
   1t0MR0xnmoHJq0PG9T2WKO92kq1dBMCiEogsIi0mtMC+FICRRbluxojRp
   g==;
X-CSE-ConnectionGUID: yVIQeyN+QDSBPIKH2jqYxA==
X-CSE-MsgGUID: cUs25RtCT2e/n/6Pyo91+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38051042"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="38051042"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 21:35:12 -0700
X-CSE-ConnectionGUID: KCvBqg5rTky7N5LIq45h+Q==
X-CSE-MsgGUID: fSYcJSv7Q7a2OsTFDUc5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="96267191"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Sep 2024 21:35:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suleH-000Ntj-1c;
	Sun, 29 Sep 2024 04:35:09 +0000
Date: Sun, 29 Sep 2024 12:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20368/23799]
 drivers/android/binder_alloc_selftest.c:109:19: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202409291234.x2jnAFD9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a5093f2913b14c22e19e60b6bf7a4d8ec2e5c69
commit: d549e609b8685eb101a4653249ef7e3fe8bb3e99 [20368/23799] binder: use userspace pointer as base of buffer space
config: arm64-randconfig-r133-20240926 (https://download.01.org/0day-ci/archive/20240929/202409291234.x2jnAFD9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409291234.x2jnAFD9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291234.x2jnAFD9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder_alloc_selftest.c:109:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *page_addr @@     got void [noderef] <asn:1> *user_data @@
   drivers/android/binder_alloc_selftest.c:109:19: sparse:     expected void *page_addr
   drivers/android/binder_alloc_selftest.c:109:19: sparse:     got void [noderef] <asn:1> *user_data
>> drivers/android/binder_alloc_selftest.c:111:41: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/android/binder_alloc_selftest.c:85: warning: Enum value 'LOOP_END' not described in enum 'buf_end_align_type'

vim +109 drivers/android/binder_alloc_selftest.c

   100	
   101	static bool check_buffer_pages_allocated(struct binder_alloc *alloc,
   102						 struct binder_buffer *buffer,
   103						 size_t size)
   104	{
   105		void *page_addr, *end;
   106		int page_index;
   107	
   108		end = (void *)PAGE_ALIGN((uintptr_t)buffer->user_data + size);
 > 109		page_addr = buffer->user_data;
   110		for (; page_addr < end; page_addr += PAGE_SIZE) {
 > 111			page_index = (page_addr - alloc->buffer) / PAGE_SIZE;
   112			if (!alloc->pages[page_index].page_ptr ||
   113			    !list_empty(&alloc->pages[page_index].lru)) {
   114				pr_err("expect alloc but is %s at page index %d\n",
   115				       alloc->pages[page_index].page_ptr ?
   116				       "lru" : "free", page_index);
   117				return false;
   118			}
   119		}
   120		return true;
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
