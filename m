Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8013EA62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706184518; cv=none; b=MoEEbEzlosrybFxtxGmH7114plRn/m4Du/FNC0HouovEkX+h2h4Fa6T3IBDFo9a62KUqyfL501obudwMhU/i/IliEsS5apR19w/dPOR2bkgaqVMPI4jDysjP11mRWX/doJeyt3hCipTMao6RLn+pMkE21ChngUmM8/Wowopw344=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706184518; c=relaxed/simple;
	bh=Q8iZ0qcu2zhzWsR/6hyOzjSOzCSqben9kHEohqrZTWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgL01UGbsmAjpKBomullTeykES+PnvfVhaW0fDRFI8DzB/o8rnwje5yEWGA9XIh13qDFoZwRvEtuaTOMyP1xsyK+9fvKk6pxtJpvKLvTk6hjI7q50cSQBqygWKmt2mtxS0g6jUHxrD1sRyKbOP0ARb4iJtB6znaiQO7IgdJTqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mb6JGitv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mb6JGitv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706184518; x=1737720518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q8iZ0qcu2zhzWsR/6hyOzjSOzCSqben9kHEohqrZTWs=;
  b=mb6JGitvMmbJIY32FZhqTrJf6DZiOOoQSxn5QtYAdfmAzoFctnLljrk8
   zDqML3d9uYQpNO14iYD9l/zYYRwq6FHZvV2ismZwKsf4BaUrcbrEdT5V3
   0sXIOd7La7B5SEAHUYLo/IAeYLDs+Ehh2YI+Y29CgIS+0oQavavetwWuA
   hROIKrSeAl4ul8gl5G01LNhukT6UKHQZl3AWhTuigiQsDksIXPzDmQIeR
   stJWDIPBkCnMYxZ5Ef4JaRPwyknyi3jIfXb9Jepzi5rGi7B8b73d93g7X
   XVwKNM5cEXRMgGrGK+Y8WYEmHzfS1BEKgyIERPVcFvgDaiaROm7VpkG4G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8799206"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8799206"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="877034336"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="877034336"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2024 04:08:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSyX2-0008xj-0M;
	Thu, 25 Jan 2024 12:08:32 +0000
Date: Thu, 25 Jan 2024 20:08:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pic 5/5] ld: Unexpected GOT entries detected!
Message-ID: <202401251935.p9E49jTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pic
head:   019a7844cc2a63d08a2b5f396f68e2c547224ae7
commit: 019a7844cc2a63d08a2b5f396f68e2c547224ae7 [5/5] x86: Build the core kernel with position independent codegen
config: x86_64-buildonly-randconfig-003-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251935.p9E49jTf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251935.p9E49jTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251935.p9E49jTf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/usb/storage/usb.o: warning: objtool: usb_stor_adjust_quirks+0x3b8: can't find switch jump table
--
>> drivers/power/supply/bq256xx_charger.o: warning: objtool: bq256xx_set_charger_property+0x4f: can't find switch jump table
--
>> drivers/power/supply/max17040_battery.o: warning: objtool: max17040_get_property+0x9d: can't find switch jump table
--
>> lib/test_rhashtable.o: warning: objtool: jhash+0x1f0: can't find switch jump table
--
>> kernel/kcmp.o: warning: objtool: __do_sys_kcmp+0x2c4: can't find switch jump table
--
>> arch/x86/lib/insn.o: warning: objtool: insn_get_immediate+0x145: can't find switch jump table
--
>> mm/kasan/report_generic.o: warning: objtool: get_bug_type+0x99: can't find switch jump table
--
>> block/ioctl.o: warning: objtool: blkdev_common_ioctl+0xd8: can't find switch jump table
--
>> arch/x86/events/utils.o: warning: objtool: decode_branch_type+0x8b: can't find switch jump table
--
>> arch/x86/kernel/i8237.o: warning: objtool: i8237A_resume+0x53: can't find switch jump table
--
>> lib/zstd/common/fse_decompress.o: warning: objtool: BIT_initDStream+0x264: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
