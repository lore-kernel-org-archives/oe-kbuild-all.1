Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F81EF1D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185808; cv=none; b=YD4RWUimnxMPo5bZHgRI9cYRise/so0diqJjid1n8XOZaENo96DvAUAayKUZqOoMgENL0i3dyFjVUtbGdT7AzXLdSbL8S+BcbfqhsB7GS5i8zd5RvNqhqitxczKrR60GnYkTi58YefFwKhV1QgctMnecwaWizY/HqkDEreTkOyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185808; c=relaxed/simple;
	bh=wXg4EjyKCHs+69gdcFbAm0GDo3m6bk9JX9htIK75szk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4EBfP8/grZ2kwmcFuPNtwthEdSDpusYqP+sDshpN3AexzIFl8vvRUu2SJqzhgSj1BqdjZ0EnM2CRu7EysioOAeRRxdfroZ3i2+OTkxAgKDxXD4N55JyrHUkZ6Vcs/z4lJ47Y/RNFEPzeqdxYyXL692lUeuAErqrCKkVU25vHrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzNiVt5q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzNiVt5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739185807; x=1770721807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXg4EjyKCHs+69gdcFbAm0GDo3m6bk9JX9htIK75szk=;
  b=ZzNiVt5qXlj9k1shUSBVxJkb0g/izznDNxKDP4YWf1yN8uJenHdz1+Ck
   3JjKYnHNbtmepyNAs+8pRNtAljkIhN51+PoPmaydwPmGHefDAN+4dd1hz
   2wLs3JfGAIAiyerbRfS/o0jdC8p11DzLZOWqXt5zlgIkYVNEY24lKO5CB
   Pm1E4kTHhcQvmxryshbOygwygHF5uCMJfg0szV/l8PdhHiAa0G0OtH2/4
   oKVlCIunKR30U+KqS/w8YZxw199Qsoe4PlG/fUGKZWp7bkYtbCjG2by3t
   8KqDwCBd9LoY/ROubJUIpHtsKQQGTFBP4kdY6qjDUlgIN4Y9bzT5Ypjad
   w==;
X-CSE-ConnectionGUID: UBfZJ7hpSmS4FeHH8idJRQ==
X-CSE-MsgGUID: yr7JzsgQRGKDncwjPnJGsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57176266"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="57176266"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 03:10:06 -0800
X-CSE-ConnectionGUID: 8McHO1ICSGCd6yvG+i29Pg==
X-CSE-MsgGUID: WADk/KibT72zcWi3vmenAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143058265"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 03:10:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thRfu-0012fb-1D;
	Mon, 10 Feb 2025 11:10:02 +0000
Date: Mon, 10 Feb 2025 19:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 101/112] warning: comparing with null is
 better expressed by the `.is_null()` method
Message-ID: <202502101942.fQbu6R2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fd3792ec2053672fb9359a570552a51ae48f4035
commit: 6303e0f5115807296306000e29cc91ac57587573 [101/112] rust: device: Add Device::parent()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250210/202502101942.fQbu6R2C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101942.fQbu6R2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101942.fQbu6R2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: comparing with null is better expressed by the `.is_null()` method
   --> rust/kernel/device.rs:71:12
   |
   71 |         if pdev == ptr::null_mut() {
   |            ^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cmp_null
   = note: `-W clippy::cmp-null` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::cmp_null)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
