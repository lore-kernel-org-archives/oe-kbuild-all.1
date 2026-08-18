Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934872C1594
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036214; cv=none; b=hZOsYzLFSdy5TT+MObumOshE2IN/LOQf3YhRe+qVb8/0ptB0aiErLEcXz8aLinKBcWM+nfrFY+9I/66bg8Y7U7ifwmHr+mGCQmKLT63bKbBCd8aDOSJIsMrIs3C/eQtktBOZJyhr7/t9sEc4Hc54eZTardm+jNUvA1eaNsLPCSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036214; c=relaxed/simple;
	bh=d5Df7B9X2AbuCZTETP5SZcfiVsbAEWM3jOxO6CMAVJE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jzeo+ebMFOhMiPADHNIVx720MR65EftofS/RWWwxEw4c6zFlzn2v+0ffR0jmaoMd9f+k9F3QEA7s2J/bpd6o635nTWTOsL3wrTCcHYZHs5sE/jgB/6l4CTh+bShZbItlXI94/n6MUeE/myEnJZJ8jGRs3DQlfAtLs3cgPCrAXJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AL5vLBgK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AL5vLBgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787036213; x=1818572213;
  h=date:from:to:cc:subject:message-id;
  bh=d5Df7B9X2AbuCZTETP5SZcfiVsbAEWM3jOxO6CMAVJE=;
  b=AL5vLBgKTo7uWOv2aEJDuDGB/uidiXrG/WhqaTzev1G61qARkaCK78kc
   /22b8K9DyagQG5BFA6GDFFVYQHxxq+zloZ1JGBZLpcQ6MD/NORvCzyBwK
   u4WwQLYTLOy+TwWnNSNy7gJhZk+gz6K2LlBngUJNB4bNCgUKpyL/UF6H3
   R9yHaPX6Ze4S20hdXxDTXrcS2NcQUYjLsivg9gjUfHQ25cfQKpOaZPRgA
   JrHvGY9vkzJn3YdmXmjWHtMHGorrlwalHC5sxPNKU/KG0YyZX1K25Ki/z
   xWF5PFV8mjTlqV1FAo7jaxdn5LVk0gcxUhHtm93alI/2tqYe9Ls8D64ZE
   Q==;
X-CSE-ConnectionGUID: zRWPOiglTPqdTjzKp7q4mQ==
X-CSE-MsgGUID: UkiX2vi3SFyIyT080oMcpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="104901969"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="104901969"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 23:56:52 -0700
X-CSE-ConnectionGUID: BSuAuey7Tm+Vazuj1uXlqg==
X-CSE-MsgGUID: iLxbV1MESY+br1X2JziAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265751009"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2026 23:56:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwDke-00000000eAM-12WV;
	Tue, 18 Aug 2026 06:56:48 +0000
Date: Tue, 18 Aug 2026 14:55:58 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-sdev-printk 1/2]
 drivers/scsi/scsi_logging_test.c:36:11: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 3, 0)' attribute to the declaration of
 'test_capture_dev_printk'
Message-ID: <202608181453.gR1dacPX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-sdev-printk
head:   a31bd03242fd8e9fc6f3b0b5f48ca64bbb6c8f4c
commit: 3046a51bbd1826503f7037dd728fa56f87b73c23 [1/2] scsi: core: Add KUnit tests for scsi_logging.c
config: arm-randconfig-r072-20260818 (https://download.01.org/0day-ci/archive/20260818/202608181453.gR1dacPX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181453.gR1dacPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181453.gR1dacPX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/scsi_logging.c:467:
>> drivers/scsi/scsi_logging_test.c:36:11: warning: diagnostic behavior may be improved by adding the 'format(printf, 3, 0)' attribute to the declaration of 'test_capture_dev_printk' [-Wmissing-format-attribute]
      28 | static void test_capture_dev_printk(const char *level, const struct device *dev,
         | __attribute__((format(printf, 3, 0))) 
      29 |                                     const char *fmt, va_list args)
      30 | {
      31 |         if (captured_count < MAX_CAPTURED_LINES) {
      32 |                 captured_logs[captured_count].level = level;
      33 |                 captured_logs[captured_count].dev = dev;
      34 |                 vscnprintf(captured_logs[captured_count].msg,
      35 |                            sizeof(captured_logs[captured_count].msg), fmt,
      36 |                            args);
         |                                ^
   drivers/scsi/scsi_logging_test.c:28:13: note: 'test_capture_dev_printk' declared here
      28 | static void test_capture_dev_printk(const char *level, const struct device *dev,
         |             ^
   1 warning generated.


vim +36 drivers/scsi/scsi_logging_test.c

    27	
    28	static void test_capture_dev_printk(const char *level, const struct device *dev,
    29					    const char *fmt, va_list args)
    30	{
    31		if (captured_count < MAX_CAPTURED_LINES) {
    32			captured_logs[captured_count].level = level;
    33			captured_logs[captured_count].dev = dev;
    34			vscnprintf(captured_logs[captured_count].msg,
    35				   sizeof(captured_logs[captured_count].msg), fmt,
  > 36				   args);
    37			captured_count++;
    38		}
    39	}
    40	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
