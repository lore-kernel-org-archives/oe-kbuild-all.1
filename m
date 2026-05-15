Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA333FDC14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 18:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778869158; cv=none; b=lk/DsrkcNL8naV388oHKTZwDDOoK6wIJkjtyL7WC6zVmPqsJ1yBLLFS7BQy5RO8Z2KZlC2Fi5NRHb+10BThXDGRbLVoh7Ky9VsMczKa8bZiBST2R6AGWPxiKH08xI2qoNfY7q1dlJ1O4j1kGFpB/T95PR0eS88dliJ8O8Ork2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778869158; c=relaxed/simple;
	bh=UYr/I6qjn4wSH0n1COVWBH6/TMZqwbY9NtoG0+z0hIk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SSeBvaosmpch12Q5DdKIYTjId2wWIxM/oVVpkubpMTUFcDa/67qkmw6LYYh8P8JgccKj47ZyXq77q1g3wECPgbf6gCol83sFIWdJVmvNIuTIhxISA0tusiuTlUpw5HRy250altypFULrHJRSF6/N0+baaI3svIBkHLz/JGRnyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqobJYan; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqobJYan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778869156; x=1810405156;
  h=date:from:to:cc:subject:message-id;
  bh=UYr/I6qjn4wSH0n1COVWBH6/TMZqwbY9NtoG0+z0hIk=;
  b=GqobJYani40ElTX55IYqIimY7CTSl/HXzlr8zXLltAdahmB6hJKQ420d
   g0EuDCIUxV0NjpJwZxQJBwjqhKUQNVA3+77qgEh+O+hy3Y7pEfw5Zmurt
   0+/ELVd4vW6oDRZIAUuP9r8I8wR6TLFakjX9g617oYyA/DP6+JOIROxkw
   EzUnxFuqK6YTQB2BAO4w+NGsL81IfMh+XxrYIvb6gEc1FCeb4yB8A/gmO
   Tv/osyM8S61GjryxVdi4xyNl9rjA/InOyZ8oyr3pWThAEXtQGZe9mGsP2
   v6j+81TuJCWVqWTX9AIwcpp2gnBKtQXYP6ySQLu5DQL7CwDusB+ltoBnD
   g==;
X-CSE-ConnectionGUID: FRO1M6V0RL22+BBEcu0A4g==
X-CSE-MsgGUID: aL5OjEoAT1SqgjEDtGQYcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83445020"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="83445020"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:19:16 -0700
X-CSE-ConnectionGUID: iz3xfg3LTFSfDGy9aJn4CA==
X-CSE-MsgGUID: q7ad3C2KQyq1igP43CHPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="262520381"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2026 11:19:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNx7w-0000000094n-2V0g;
	Fri, 15 May 2026 18:19:12 +0000
Date: Fri, 15 May 2026 20:18:41 +0200
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/admin-guide/mm/pghot.rst:25:
 WARNING: Block quote ends without a blank line; unexpected unindent.
 [docutils]
Message-ID: <202605152034.dMAW8M0F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA/20260515-143252
head:   1d6b2275629c24d5b061e08617e75603cb245c50
commit: 973f77abc41ebd632577220150f11b8f803f8987 mm: Hot page tracking and promotion - pghot
date:   12 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260515/202605152034.dMAW8M0F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152034.dMAW8M0F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
   Documentation/admin-guide/mm/pghot.rst:23: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/mm/pghot.rst:25: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/mm/pghot.rst:32: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/mm/pghot.rst:34: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/mm/pghot.rst:43: ERROR: Unexpected indentation. [docutils]
   Documentation/admin-guide/mm/pghot.rst:77: ERROR: Unexpected indentation. [docutils]
   Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]


vim +25 Documentation/admin-guide/mm/pghot.rst

    19	
    20	1. **enabled_sources**
    21	   - Bitmask to enable/disable hotness sources.
    22	   - Bits:
    23	     - 0: Hint faults (value 0x1)
    24	     - 1: Hardware hints (value 0x2)
  > 25	   - Default: 0 (disabled)
    26	   - Example:
    27	     # echo 0x3 > /sys/kernel/debug/pghot/enabled_sources
    28	     Enables all sources.
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
