Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425A19F115
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332050; cv=none; b=iQnKc5pCUj4ccRpnY7cTS9mPWDo0yqZ4H6meFGIGjKR+gBn2MxjbmX+RB6TBPAeC7ae0ji9BL3FwgOMncc1gzfxrt1vQSOkrssmiM2R2B6qcciO69k6Bz3Hi+/Ap4D2vWPlw9N//9ym1AOY0Ojo2Vt4WTr1Ma1Xcf/OiFB5jLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332050; c=relaxed/simple;
	bh=uVQ5+dqcqam4ZhbzMsHoqVblO4WaufJU4sDCbuCHyXA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b+fbHyrjJGu+Wl1vCYp2pCmfTGIHo8k5H3piaqhNnJMD5Ou4ZZaItZcnzPqdknWfPLgWAKj9VtkdbhEULiGMHyjLykc5g3JaeyFXiYTkKR56pHCfDRHJ0ruez/g0KlyiKDaQ6qKqVQ1pIvaNHXvwTkvUCFE5DIeFiqU/MR/IBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C66zzj9U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C66zzj9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778332048; x=1809868048;
  h=date:from:to:cc:subject:message-id;
  bh=uVQ5+dqcqam4ZhbzMsHoqVblO4WaufJU4sDCbuCHyXA=;
  b=C66zzj9UB5rEfZymcXxN+zL7KnUyXSYBpWf7gZMffKWLz3YgXOpPjWD0
   tTrLTYDDq9amvkJXXDN13CuBDTtGSA7RSIAEDLyM5wX551rtN0JWdD6/7
   gKTPnLrh5dPqfeNuHHhl0K3JvVHKD1Hy0KANlQUbgCWjzlHmbN55fsHTN
   qC01e4w6CV4OqKLev4SQo5cqMiR8oJuto45LB6DWHByH3+l4yTcjkYd0d
   QG0Y/czvYFLUA7gvVLSqchclXUnJt9SUzOAf3ZKRypLUQG1imcd+w0Hq5
   y7zbW8TC2dT51pt6JQWZb8qGzA/RA4GmwoeOaYWcHZiOEX7ZORkkhsrq5
   w==;
X-CSE-ConnectionGUID: JL62cFWPTiy9vymU0YIf7w==
X-CSE-MsgGUID: c2E2XfVKQqewfEyy0HRa4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="81857921"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="81857921"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 06:07:28 -0700
X-CSE-ConnectionGUID: J3HJQ+78S12TCH370Lx4ig==
X-CSE-MsgGUID: 6CjPiLtNRiuUQU5l187E+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234351556"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 06:07:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLhOu-000000007Sd-2uRn;
	Sat, 09 May 2026 13:07:24 +0000
Date: Sat, 09 May 2026 15:06:28 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 5/19] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202605091533.0FCfXan9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: 6704b32996c13a63b2e0b5eec75c6517e67313f8 [5/19] HID: apple: Bind Apple silicon SPI devices
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091533.0FCfXan9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#30: FILE: drivers/hid/hid-apple.c:482:
+			switch (hid->product) {
+				case SPI_DEVICE_ID_APPLE_MACBOOK_PRO13_2020:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
