Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C0516A956
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 00:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769388851; cv=none; b=Q6ub7smFgaSq44LxpWVdM8ypt/xM1i6SsT2npI01i5MsQ18QLbh2z1NR04tGURnc+57PVO2mlw3oBZnqLUKCj4NMOZ2+x9EFqjUXpUGfaS+qwu5TXwNlDIDNH3WB/fFrV+ULRVB+FqPz3Ex161hwYDQ6x5u/436F1S/n41pBXFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769388851; c=relaxed/simple;
	bh=CIorPiU4UXQn4bBbWmb96sFD1vKw7rhDp0FbdtzwHiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cbQAWPrKK1GTMiGme/3lnnB/v8hS3ViNRRBGWUtRjnTmzZDM9sKL/4ahWxzwG4GnPD6wAGjKWEAUiln9Nz8CFsT6ayayzOos4/LokZWR9BeWc40oQMwYVMrtMhW5s74ZZOcaTJfA5ZJrGhkm6LawtyDZUwwesLDrKeFS6ZuprlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQz6Yqqu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQz6Yqqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769388850; x=1800924850;
  h=date:from:to:cc:subject:message-id;
  bh=CIorPiU4UXQn4bBbWmb96sFD1vKw7rhDp0FbdtzwHiE=;
  b=kQz6YqquIoo+UVP3GRGNf9IZ+hFfrajOG1d1xxI2ybAwsTgUoX6W983+
   TJGv7KlSRRHtpwEgRrhcPivMBJVV/ssGjpD3FJTC7OHbuVpor7nzISdeW
   bLRb1v9A7ceIA3DBtNVzbtewkdRl5rQ8M1O2S2qbwFOljCXBTPZNKMrYP
   uiHxWslg49vYJ4quVgAJlnAcg7I2XN1DYafzPVh9EhuyD+fP06d507V6c
   TVOUaD7GGfvqqbUaLbP1CNOfyATpEBLqNjAlRb8t/BuOUuDIojt8UwYq+
   BYfuhXCh2NUaVha02l2wjy5KXKZSwUyV8lK/lW01nnE2Yjm/Dv1oEKNfQ
   g==;
X-CSE-ConnectionGUID: OHf4Zm1BQISnCpWXVDAYjg==
X-CSE-MsgGUID: wIX3w5ohTbSlN0Q2ato0dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81940453"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="81940453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 16:54:07 -0800
X-CSE-ConnectionGUID: tHJQXS2uQ5+FOyxmoOc4ug==
X-CSE-MsgGUID: 01T9E7m8QuiwwydezEsWBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212416810"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2026 16:54:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkArk-00000000Wm3-1Irq;
	Mon, 26 Jan 2026 00:54:04 +0000
Date: Mon, 26 Jan 2026 08:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 7/15] Warning:
 drivers/char/tpm/tpm2-cmd.c:252 function parameter 'chip' not described in
 'tpm2_get_random'
Message-ID: <202601260828.3pspHIVm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fbd9af022416579062d59e206c7f71890d27fc31
commit: 62914cea999a3a9ec0417d0f8d82210c84ca1974 [7/15] tpm: Change tpm_get_random() opportunistic
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601260828.3pspHIVm-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260828.3pspHIVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260828.3pspHIVm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'chip' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'dest' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'max' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'chip' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'dest' not described in 'tpm2_get_random'
>> Warning: drivers/char/tpm/tpm2-cmd.c:252 function parameter 'max' not described in 'tpm2_get_random'
--
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'chip' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'dest' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'max' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'chip' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'dest' not described in 'tpm1_get_random'
>> Warning: drivers/char/tpm/tpm1-cmd.c:526 function parameter 'max' not described in 'tpm1_get_random'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
