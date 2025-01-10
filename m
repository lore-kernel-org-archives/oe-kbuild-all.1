Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9942066D4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497890; cv=none; b=toLM4MsadZm1Jk+mHKhWSyKw4IsMwekqek3nYetQV1a02BNjm0/13q8wQfJmXLAMRHT53EW+NCAeawtsU6oMc/oI8bcOy/hbPdGTOt0MheQRRGXJIbNQcINwYlxok+2+SaBKTvLN/57oSso0CAzAbQiCRtxQEHyFw/ORanuGVo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497890; c=relaxed/simple;
	bh=BiUnRWHBstg3E5fAXh8X+SvUmEMGVakBlCbn3kJOkzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gfG7GFW52qFTX6+fMMUoM/B7uSLvTrlmg0KWpVhn7sKshzCsw7wPev0BdMf0Umh8XAMb2KszZx+OtEap79yb1Azu0dBiIuvOgP6qzyWaZ6Zk4Fs9l636VCirE7jRvtD8m38ZES1jqVlNEE9ongO7nPS6ljxySv/YSOFsXX874sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFDE62ed; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFDE62ed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736497887; x=1768033887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BiUnRWHBstg3E5fAXh8X+SvUmEMGVakBlCbn3kJOkzA=;
  b=KFDE62ed7Fo2azAnNRrgkSnzG0N/Efd4Y9TmPT60swz96XZG51jVYjgO
   +vn4PkIFFUWiB1k1Mj+p8W3nehhFKlMpqKeg34uV9RwJC5i5Y2o4GipC7
   +QCjn2ArZbeu2DJW41s9gktd9Q9mRv3DNUT3Wj5hDNJBMUASasthfOjlw
   itdMA0KJHtgJLtVntQ7GUNL6bpRnMLwW9lv6RmoEmUDjAMcMWcOQ31R3w
   hmTQiErTTWe3qtkljVjaMhbcvyoOMlPCxFNfAQYeQML3OcdmRcDRQqmkY
   +qGJuZrnQlRpayg2uvbCj40g6LeT7ebDwcibH81vgL10ytNOpp8qhoIPg
   g==;
X-CSE-ConnectionGUID: 5Ba30BgUTlSbztLeafxf9g==
X-CSE-MsgGUID: jr8aP4GPSb+JomeDRP1TSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59262852"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="59262852"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 00:31:25 -0800
X-CSE-ConnectionGUID: uuyaWQS9REi/yxwmBAoQHw==
X-CSE-MsgGUID: kGm5Cz0FSTmZkzWkLLzAxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103623516"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 00:31:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWAQL-000IrT-3B;
	Fri, 10 Jan 2025 08:31:21 +0000
Date: Fri, 10 Jan 2025 16:30:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 drivers/scsi/spraid/spraid_main.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202501101652.3vzOXHJz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: bb9f019c483389f48183be55d92dbb21769fa55a [1359/1359] scsi:spraid: support Ramaxel's spraid driver
config: x86_64-buildonly-randconfig-003-20241231 (https://download.01.org/0day-ci/archive/20250110/202501101652.3vzOXHJz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101652.3vzOXHJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101652.3vzOXHJz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/spraid/spraid_main.c:25:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/scsi/spraid/spraid_main.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
