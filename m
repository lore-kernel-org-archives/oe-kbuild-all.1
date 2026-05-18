Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD1382383
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128803; cv=none; b=ZtZc5udtDeYNFDWMVArGtXH2CkaVEIcY1F6V7hk6KfoNQr0PLI5izR90uxJhYOy7fF66N37U6gB0MmqY1iAFoPqGyjq0NXpkpipqxT+GBrQot+5ma5zOBlqRlpIRIPRYVylEpJROzyqcFORv3wKtY9BCbu7mPz4z+yz8sL3/xu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128803; c=relaxed/simple;
	bh=AFRapOXaXa7HkPtG4lS5L6W7r+ox1/zKU0RRZa3RiM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=unsRGA266Ni7ON/ii4KUc6pUNKejRRn6anh6UQVEzgJKjGncncJoCkgZJBjtB4yAlACslxrvz31R2910FI9v5B1pgvs8ywr37evRdk+zscpUBH52+xa4rvqFYAH37KRfAxfglvoB85sVmqxR1oAFU8CnbnMLVQ90k+r8qzodNwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6RfpGlM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6RfpGlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779128801; x=1810664801;
  h=date:from:to:cc:subject:message-id;
  bh=AFRapOXaXa7HkPtG4lS5L6W7r+ox1/zKU0RRZa3RiM8=;
  b=j6RfpGlMuXqFlXmmYM1lz9ruGQ4w8Tkdwpp7Mylt47ClVs4GL30tBfa7
   N8T8CIsVhsxtIDCPvc+pP6RTLAUL3zgDELTSDXrrB7q+DijICKAJR0pRy
   5LwyQlUYdO1kFsXA+T6+lOkV277yrkngycsFFyC/DEBmJMsAnVpD3i1S8
   emAKh9Gs5jdouj5aP6WdEK85JxCKz1aFyYl0A8lJY9RPLxCPeNJU9SDij
   M3JF0ydj2jpyvk6MJjBG1JKEbTEuLvzDexPNdUSBm+NSluk8M/AvyMd4D
   njSV3CPBrnbT6qsEgMw1YyyEgs8LuDzWCY7KFfRdgEnD1ovpAAqabSUeH
   A==;
X-CSE-ConnectionGUID: Q3I6c4/mQzG7MnnOKFWD2g==
X-CSE-MsgGUID: nnJBAaqDRV6yQdtgpSe+/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97425421"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="97425421"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 11:26:40 -0700
X-CSE-ConnectionGUID: L5zkT9KtS92IXFepIEdJ1Q==
X-CSE-MsgGUID: +ua7D/i/Q8uWuYHYCJcEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="241339807"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 May 2026 11:26:39 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP2fk-000000003GA-1INZ;
	Mon, 18 May 2026 18:26:36 +0000
Date: Tue, 19 May 2026 02:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 43/43] timekeeping.c:undefined reference to
 `ntp_get_status'
Message-ID: <202605190256.ACygftGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   123146665ac9426e106557f5c14f8743b128a6b2
commit: 123146665ac9426e106557f5c14f8743b128a6b2 [43/43] kernel/time: Add /dev/vmclock_host miscdev
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260519/202605190256.ACygftGm-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190256.ACygftGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190256.ACygftGm-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_set_reference':
>> timekeeping.c:(.text+0x734): undefined reference to `ntp_get_status'
>> riscv64-linux-ld: timekeeping.c:(.text+0x740): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
