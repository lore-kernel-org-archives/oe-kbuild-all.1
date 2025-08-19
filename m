Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381F4A23
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605451; cv=none; b=nuJUk4H4oqtNVY8bFCO8kG2kVQmJucTSh15kzXc7kErrdWpoEgVNfcOd17ZOHfdHmXGcqA89XruSI2ebUs1VdesH06DsUZYQZVqpIpVyvIi7wMmvUpLTSrjywmeYha+XJudj/aEKZt3qF6m4YqD2Z2Na3hkwbslFmfYCN/Uwl8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605451; c=relaxed/simple;
	bh=9lW3/dWzt5UToAodYloh3cRTdJpTq26FnPkQkeM6tgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CpuP1X/q8NBNDJpC99PKxPtUmNM2iWIHR/ErjeC8DAE0ozjes7b7tGvAeJXtgNB3tMZ19UzCl5HRWSGhyt0Gu2mQRmYQKmAYtVmklbsnOkwWG3fhYHxW59VTM9/sMIkV69fkNzg757jc0afF/yPAu6gpAyGKS0xJ9j9mQT80Xf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvMI2/bI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvMI2/bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755605449; x=1787141449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lW3/dWzt5UToAodYloh3cRTdJpTq26FnPkQkeM6tgk=;
  b=jvMI2/bIU3DVR4kHxBcvxzqMVoCRIqhPzUShyy9YBvYin3sR6LYSO6Xv
   tZcEyMvc8YRETyRXhxNL898/yvesvM6MpS7EoQnHlJL6DOPdwRL3MMdQv
   i6MuMc/e/k2h8KKmzKqpwkeuVVLrqycoHZFb/pNBAPAS2TZN43/nnsQtR
   oDk6ijF6soAjir6V0zWMe+Me+uI9teMlaeD/ecswoi2rwyTYr8G0iob99
   HaD/Gig0Xyyad9o4yWm16kkjNAex/nm1bqNlEUMWQvZS/XjbmzPvB7e6R
   TrjIbsVC38oFqIhV4Ewfe5QgC/HCqhGl8JcOWwB+PqCd39tcruPKochat
   g==;
X-CSE-ConnectionGUID: pGkKCZI9TvSyrBBKtDzlxA==
X-CSE-MsgGUID: CZVQHp6gRN6sGucu38NS5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75418631"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75418631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:10:49 -0700
X-CSE-ConnectionGUID: JnFl4hlmSiKwJ3FsjLStYg==
X-CSE-MsgGUID: tj8fLo+eSrOfLurYHPFW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167735694"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2025 05:10:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoLAl-000GqD-0S;
	Tue, 19 Aug 2025 12:10:40 +0000
Date: Tue, 19 Aug 2025 20:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: [srini-nvmem:for-next 1/1] include/linux/mfd/qnap-mcu.h:13:9: error:
 unknown type name 'u32'
Message-ID: <202508191938.W0luCEyw-lkp@intel.com>
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
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250819/202508191938.W0luCEyw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191938.W0luCEyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191938.W0luCEyw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
>> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
      13 |         u32 baud_rate;
         |         ^~~
>> include/linux/mfd/qnap-mcu.h:17:9: error: unknown type name 'bool'
      17 |         bool usb_led;
         |         ^~~~
   include/linux/mfd/qnap-mcu.h:1:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
     +++ |+#include <stdbool.h>
       1 | /* SPDX-License-Identifier: GPL-2.0+ */
>> include/linux/mfd/qnap-mcu.h:21:25: error: unknown type name 'u8'
      21 |                   const u8 *cmd_data, size_t cmd_data_size,
         |                         ^~
>> include/linux/mfd/qnap-mcu.h:21:39: error: unknown type name 'size_t'
      21 |                   const u8 *cmd_data, size_t cmd_data_size,
         |                                       ^~~~~~
   include/linux/mfd/qnap-mcu.h:1:1: note: 'size_t' is defined in header '<stddef.h>'; this is probably fixable by adding '#include <stddef.h>'
     +++ |+#include <stddef.h>
       1 | /* SPDX-License-Identifier: GPL-2.0+ */
   include/linux/mfd/qnap-mcu.h:22:19: error: unknown type name 'u8'
      22 |                   u8 *reply_data, size_t reply_data_size);
         |                   ^~
   include/linux/mfd/qnap-mcu.h:22:35: error: unknown type name 'size_t'
      22 |                   u8 *reply_data, size_t reply_data_size);
         |                                   ^~~~~~
   include/linux/mfd/qnap-mcu.h:22:35: note: 'size_t' is defined in header '<stddef.h>'; this is probably fixable by adding '#include <stddef.h>'
   include/linux/mfd/qnap-mcu.h:24:34: error: unknown type name 'u8'
      24 |                            const u8 *cmd_data, size_t cmd_data_size);
         |                                  ^~
   include/linux/mfd/qnap-mcu.h:24:48: error: unknown type name 'size_t'
      24 |                            const u8 *cmd_data, size_t cmd_data_size);
         |                                                ^~~~~~
   include/linux/mfd/qnap-mcu.h:24:48: note: 'size_t' is defined in header '<stddef.h>'; this is probably fixable by adding '#include <stddef.h>'
   drivers/nvmem/qnap-mcu-eeprom.c: In function 'qnap_mcu_eeprom_read_block':
>> drivers/nvmem/qnap-mcu-eeprom.c:28:17: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
      28 |         reply = kzalloc(bytes + sizeof(cmd), GFP_KERNEL);
         |                 ^~~~~~~
>> drivers/nvmem/qnap-mcu-eeprom.c:28:15: error: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
      28 |         reply = kzalloc(bytes + sizeof(cmd), GFP_KERNEL);
         |               ^
>> drivers/nvmem/qnap-mcu-eeprom.c:32:15: error: implicit declaration of function 'qnap_mcu_exec' [-Wimplicit-function-declaration]
      32 |         ret = qnap_mcu_exec(mcu, cmd, sizeof(cmd), reply, bytes + sizeof(cmd));
         |               ^~~~~~~~~~~~~
>> drivers/nvmem/qnap-mcu-eeprom.c:45:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
      45 |         kfree(reply);
         |         ^~~~~


vim +/u32 +13 include/linux/mfd/qnap-mcu.h

998f70d1806bb7 Heiko Stuebner 2024-11-07  11  
998f70d1806bb7 Heiko Stuebner 2024-11-07  12  struct qnap_mcu_variant {
998f70d1806bb7 Heiko Stuebner 2024-11-07 @13  	u32 baud_rate;
998f70d1806bb7 Heiko Stuebner 2024-11-07  14  	int num_drives;
998f70d1806bb7 Heiko Stuebner 2024-11-07  15  	int fan_pwm_min;
998f70d1806bb7 Heiko Stuebner 2024-11-07  16  	int fan_pwm_max;
998f70d1806bb7 Heiko Stuebner 2024-11-07 @17  	bool usb_led;
998f70d1806bb7 Heiko Stuebner 2024-11-07  18  };
998f70d1806bb7 Heiko Stuebner 2024-11-07  19  
998f70d1806bb7 Heiko Stuebner 2024-11-07  20  int qnap_mcu_exec(struct qnap_mcu *mcu,
998f70d1806bb7 Heiko Stuebner 2024-11-07 @21  		  const u8 *cmd_data, size_t cmd_data_size,
998f70d1806bb7 Heiko Stuebner 2024-11-07  22  		  u8 *reply_data, size_t reply_data_size);
998f70d1806bb7 Heiko Stuebner 2024-11-07  23  int qnap_mcu_exec_with_ack(struct qnap_mcu *mcu,
998f70d1806bb7 Heiko Stuebner 2024-11-07  24  			   const u8 *cmd_data, size_t cmd_data_size);
998f70d1806bb7 Heiko Stuebner 2024-11-07  25  

:::::: The code at line 13 was first introduced by commit
:::::: 998f70d1806bb718a7565f350283e4a79c8cbb4b mfd: Add base driver for qnap-mcu devices

:::::: TO: Heiko Stuebner <heiko@sntech.de>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
