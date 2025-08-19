Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6578A1A2C25
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 04:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755578379; cv=none; b=RnRgZazTMhC9cQ85L+fStf7uRloiM2Ke+GnqepUr4Aa3+2LTpmi9n8fI0N3ycXWjBvikujveKRNLwbUt+QVgoKs8aiKGgv8m16JekjXJbxaZMpdaSwZAfyrB52g7348IXMOTx86gH+p4u6HdGYmLTCP8opIkeszJShivopa+NJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755578379; c=relaxed/simple;
	bh=7NlTar4j1oSSyPHWgbrpYzRk4wpjhEu7BH5Kp6hH7tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acEnUA+I1AUJ5NxgJ21eX9HcSbhVWP3k49rouQeUcueyko7OmBaoL3jcYepDZ9wT3R+OIBurNWmo+u+HYBRDGiL/8Qw3lnSH6BwXyR878IcU186Il2gFpzc8QOrDWXb+DHGW8nRI08O1NrZSJ9A9ZsGHKeV4U7KjTWSFWIpwjPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbrpY4rd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbrpY4rd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755578378; x=1787114378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NlTar4j1oSSyPHWgbrpYzRk4wpjhEu7BH5Kp6hH7tQ=;
  b=kbrpY4rdLOKjbMzveBtlPKVjidURjv8ihYhtIpLO3MhhigaVxkAzlMQ+
   x5bySCKPdbxSVzlxE5Vp9MKcMk8uvOrXaHTVwdLLNsssQr3XJ9Mq0nOvK
   uKugmhO2VDF+b12qf5zbOKdGxhZUHjJJCdbmmJN4ABnbe30i0ex+ph9Ty
   Y/APiN+sc4WA4r/FhMEE0G2DMNYJnMXAOVeAybbpv4lFui3Vw8QkAvhQh
   H2r6bbvpuOn/jmHQwwTTHSrsP8z11nXO/HDBVplo8WxLkNGZOU/ovg3tk
   hXUBwxk8Y21jkSZEDTxD5QTqZ9YwabXheP9ifKOpS50qC9W6u9zswria8
   w==;
X-CSE-ConnectionGUID: 0aNwtIAHT1quaVrDROopvA==
X-CSE-MsgGUID: 222h/sNtQqS1yFuWTEXW7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75262843"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75262843"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 21:39:35 -0700
X-CSE-ConnectionGUID: jFvt/JwmSSy0Ko6ldU2SCA==
X-CSE-MsgGUID: AUfsQj6YSEaE1Fjgmmu32w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168142867"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2025 21:39:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoE8A-000GVr-2w;
	Tue, 19 Aug 2025 04:39:30 +0000
Date: Tue, 19 Aug 2025 12:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: [srini-nvmem:for-next 1/1] drivers/nvmem/qnap-mcu-eeprom.c:28:15:
 warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes
 pointer from integer without a cast
Message-ID: <202508191205.ROvIX7IA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   117c3f3014a929464c01622cb95b566bd27244f8
commit: 117c3f3014a929464c01622cb95b566bd27244f8 [1/1] nvmem: add driver for the eeprom in qnap-mcu controllers
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250819/202508191205.ROvIX7IA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191205.ROvIX7IA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191205.ROvIX7IA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
   include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
      13 |         u32 baud_rate;
         |         ^~~
   include/linux/mfd/qnap-mcu.h:17:9: error: unknown type name 'bool'
      17 |         bool usb_led;
         |         ^~~~
   include/linux/mfd/qnap-mcu.h:21:25: error: unknown type name 'u8'
      21 |                   const u8 *cmd_data, size_t cmd_data_size,
         |                         ^~
   include/linux/mfd/qnap-mcu.h:21:39: error: unknown type name 'size_t'
      21 |                   const u8 *cmd_data, size_t cmd_data_size,
         |                                       ^~~~~~
   include/linux/mfd/qnap-mcu.h:1:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
     +++ |+#include <stddef.h>
       1 | /* SPDX-License-Identifier: GPL-2.0+ */
   include/linux/mfd/qnap-mcu.h:22:19: error: unknown type name 'u8'
      22 |                   u8 *reply_data, size_t reply_data_size);
         |                   ^~
   include/linux/mfd/qnap-mcu.h:22:35: error: unknown type name 'size_t'
      22 |                   u8 *reply_data, size_t reply_data_size);
         |                                   ^~~~~~
   include/linux/mfd/qnap-mcu.h:22:35: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
   include/linux/mfd/qnap-mcu.h:24:34: error: unknown type name 'u8'
      24 |                            const u8 *cmd_data, size_t cmd_data_size);
         |                                  ^~
   include/linux/mfd/qnap-mcu.h:24:48: error: unknown type name 'size_t'
      24 |                            const u8 *cmd_data, size_t cmd_data_size);
         |                                                ^~~~~~
   include/linux/mfd/qnap-mcu.h:24:48: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
   drivers/nvmem/qnap-mcu-eeprom.c: In function 'qnap_mcu_eeprom_read_block':
   drivers/nvmem/qnap-mcu-eeprom.c:28:17: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
      28 |         reply = kzalloc(bytes + sizeof(cmd), GFP_KERNEL);
         |                 ^~~~~~~
>> drivers/nvmem/qnap-mcu-eeprom.c:28:15: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      28 |         reply = kzalloc(bytes + sizeof(cmd), GFP_KERNEL);
         |               ^
   drivers/nvmem/qnap-mcu-eeprom.c:32:15: error: implicit declaration of function 'qnap_mcu_exec' [-Werror=implicit-function-declaration]
      32 |         ret = qnap_mcu_exec(mcu, cmd, sizeof(cmd), reply, bytes + sizeof(cmd));
         |               ^~~~~~~~~~~~~
   drivers/nvmem/qnap-mcu-eeprom.c:45:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
      45 |         kfree(reply);
         |         ^~~~~
   cc1: some warnings being treated as errors


vim +28 drivers/nvmem/qnap-mcu-eeprom.c

    20	
    21	static int qnap_mcu_eeprom_read_block(struct qnap_mcu *mcu, unsigned int offset,
    22					      void *val, size_t bytes)
    23	{
    24		const u8 cmd[] = { 0xf7, 0xa1, offset, bytes };
    25		u8 *reply;
    26		int ret = 0;
    27	
  > 28		reply = kzalloc(bytes + sizeof(cmd), GFP_KERNEL);
    29		if (!reply)
    30			return -ENOMEM;
    31	
    32		ret = qnap_mcu_exec(mcu, cmd, sizeof(cmd), reply, bytes + sizeof(cmd));
    33		if (ret)
    34			goto out;
    35	
    36		/* First bytes must mirror the sent command */
    37		if (memcmp(cmd, reply, sizeof(cmd))) {
    38			ret = -EIO;
    39			goto out;
    40		}
    41	
    42		memcpy(val, reply + sizeof(cmd), bytes);
    43	
    44	out:
    45		kfree(reply);
    46		return ret;
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
