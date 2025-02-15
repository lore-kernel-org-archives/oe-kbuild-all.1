Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7C227541E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577636; cv=none; b=TSQvG8RAlIYG61a6BYEWJ1o5LJvaKucP5gECqipVklo1WCcWRCx0rQK4iafPGpGkq2d/QPVABFnacbGusIIcyXrJdMJxxDghKZBBTRNUuUbYnz8s4LrFt0SfYHwp0NlTNRj80KOZrmPczgznAT8BWjT7DN7LHXHE9+Nh75q7mpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577636; c=relaxed/simple;
	bh=AJDqPkPSrSHHTmoH/o66ZFH3ChybS86xhKtz4XvzB3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJoHM5DBPhKF8vs5TVx/A38LFu1DTtTc9AQXAiHbjj/d6T4DLf3kzeqVvoEMXGKTuEs7pxvjqBbSXlJuv8sUad7t2E9xB/7BS4f4oGeYXUOzJ9iD6kAsAtEK87++c8/X3zSgjdOd99IQuLI63INtHDCUseVFIfCiPNNQmK17fVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLAKAU+v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLAKAU+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739577635; x=1771113635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AJDqPkPSrSHHTmoH/o66ZFH3ChybS86xhKtz4XvzB3o=;
  b=VLAKAU+vlWGYF836P2rjL69K50gVB0jtRx0ffdso2/yl5wZ/5EypTfvJ
   91oe9JdZ6n5bncFXZGt3jOkN1liFDl6H8cfJtPGUiK6G8aJ7kqr4+qo8N
   sWkupXy28s3a8bNNnpoo1OBI1yrAd/6HTixvDT8T7WbUZNNy1oWLR+6ig
   KdC4Emx3hUF+aR/xh9UE9CZmllB5lk2rIBQDk2bzSTIvWWwsvImgfiTEa
   eyE9iZjECGOGT1fZxnCHc1eyWYJVp06rU6wsNQPKEYzUpTecURRQ6bUH8
   oczGnhOY6rFo+lPXleFKJ7UUsINQ3qUDNEOIrWcxgOF5GEmEo6A+5Jn5N
   Q==;
X-CSE-ConnectionGUID: kc1/jupkRWqaqdEmno8sfw==
X-CSE-MsgGUID: NA6mfAfTQaa5Y/9vZv8gSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40047285"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="40047285"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 16:00:34 -0800
X-CSE-ConnectionGUID: lqWNlYU8RDSVBKQDstAbeA==
X-CSE-MsgGUID: 4iFvAooOQR2hrNpJmTPlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118511808"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 16:00:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj5bi-001AIt-17;
	Sat, 15 Feb 2025 00:00:30 +0000
Date: Sat, 15 Feb 2025 08:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1/1]
 drivers/misc/mediatek/slbc/slbc_ipi.c:773:6: error: redefinition of
 'slbc_register_ipi_ops'
Message-ID: <202502150712.mMU8uAK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0879c1ab94ac470303ea991cd23a1cec7190d27f
commit: 506f6613f2e6836fd59eeab2456dcfb0a000954d [1/1] CHROMIUM: misc: mediatek: slc: Porting SLBC driver
config: arm64-randconfig-002-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150712.mMU8uAK4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150712.mMU8uAK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150712.mMU8uAK4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   cc1: warning: drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm/v3: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/misc/mediatek/slbc/slbc_mt8196.c:24:
>> drivers/misc/mediatek/slbc/slbc_ipi.h:141:12: warning: no previous prototype for 'slbc_get_sspm_ver' [-Wmissing-prototypes]
     141 | __weak int slbc_get_sspm_ver(u32 *major_ver, u32 *minor_ver, u32 *patch_ver) { return 0; }
         |            ^~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:142:12: warning: no previous prototype for 'slbc_suspend_resume_notify' [-Wmissing-prototypes]
     142 | __weak int slbc_suspend_resume_notify(int suspend) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:143:12: warning: no previous prototype for 'slbc_scmi_init' [-Wmissing-prototypes]
     143 | __weak int slbc_scmi_init(void) { return 0; }
         |            ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:144:12: warning: no previous prototype for 'slbc_sspm_slb_disable' [-Wmissing-prototypes]
     144 | __weak int slbc_sspm_slb_disable(int disable) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:145:12: warning: no previous prototype for 'slbc_sspm_slc_disable' [-Wmissing-prototypes]
     145 | __weak int slbc_sspm_slc_disable(int disable) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:146:12: warning: no previous prototype for 'slbc_sspm_enable' [-Wmissing-prototypes]
     146 | __weak int slbc_sspm_enable(int enable) { return 0; }
         |            ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:147:12: warning: no previous prototype for 'slbc_force_scmi_cmd' [-Wmissing-prototypes]
     147 | __weak int slbc_force_scmi_cmd(unsigned int force) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:148:12: warning: no previous prototype for 'slbc_mic_num_cmd' [-Wmissing-prototypes]
     148 | __weak int slbc_mic_num_cmd(unsigned int num) { return 0; }
         |            ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:149:12: warning: no previous prototype for 'slbc_inner_cmd' [-Wmissing-prototypes]
     149 | __weak int slbc_inner_cmd(unsigned int inner) { return 0; }
         |            ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:150:12: warning: no previous prototype for 'slbc_outer_cmd' [-Wmissing-prototypes]
     150 | __weak int slbc_outer_cmd(unsigned int outer) { return 0; }
         |            ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:151:12: warning: no previous prototype for 'slbc_ctrl_scmi_info' [-Wmissing-prototypes]
     151 | __weak int slbc_ctrl_scmi_info(unsigned int cmd, unsigned int arg1,
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:156:12: warning: no previous prototype for 'slbc_get_cache_user_pmu' [-Wmissing-prototypes]
     156 | __weak int slbc_get_cache_user_pmu(int uid, void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:157:12: warning: no previous prototype for 'slbc_get_cache_user_status' [-Wmissing-prototypes]
     157 | __weak int slbc_get_cache_user_status(int uid, void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:158:12: warning: no previous prototype for '_slbc_request_cache_scmi' [-Wmissing-prototypes]
     158 | __weak int _slbc_request_cache_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:159:12: warning: no previous prototype for '_slbc_release_cache_scmi' [-Wmissing-prototypes]
     159 | __weak int _slbc_release_cache_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:160:12: warning: no previous prototype for '_slbc_buffer_status_scmi' [-Wmissing-prototypes]
     160 | __weak int _slbc_buffer_status_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:161:12: warning: no previous prototype for '_slbc_request_buffer_scmi' [-Wmissing-prototypes]
     161 | __weak int _slbc_request_buffer_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:162:12: warning: no previous prototype for '_slbc_release_buffer_scmi' [-Wmissing-prototypes]
     162 | __weak int _slbc_release_buffer_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:163:13: warning: no previous prototype for 'slbc_register_ipi_ops' [-Wmissing-prototypes]
     163 | __weak void slbc_register_ipi_ops(struct slbc_ipi_ops *ops) {}
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:164:13: warning: no previous prototype for 'slbc_unregister_ipi_ops' [-Wmissing-prototypes]
     164 | __weak void slbc_unregister_ipi_ops(struct slbc_ipi_ops *ops) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:165:12: warning: no previous prototype for 'slbc_sspm_sram_update' [-Wmissing-prototypes]
     165 | __weak int slbc_sspm_sram_update(void) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:166:12: warning: no previous prototype for 'slbc_table_gid_set' [-Wmissing-prototypes]
     166 | __weak int slbc_table_gid_set(int gid, int quota, int pri) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:167:12: warning: no previous prototype for 'slbc_table_gid_release' [-Wmissing-prototypes]
     167 | __weak int slbc_table_gid_release(int gid) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:168:12: warning: no previous prototype for 'slbc_table_gid_get' [-Wmissing-prototypes]
     168 | __weak int slbc_table_gid_get(int gid) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:169:12: warning: no previous prototype for 'slbc_table_idt_set' [-Wmissing-prototypes]
     169 | __weak int slbc_table_idt_set(int index, int arid, int idt) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:170:12: warning: no previous prototype for 'slbc_table_idt_release' [-Wmissing-prototypes]
     170 | __weak int slbc_table_idt_release(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:171:12: warning: no previous prototype for 'slbc_table_idt_get' [-Wmissing-prototypes]
     171 | __weak int slbc_table_idt_get(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:172:12: warning: no previous prototype for 'slbc_table_gid_axi_set' [-Wmissing-prototypes]
     172 | __weak int slbc_table_gid_axi_set(int index, int axiid, int pg) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:173:12: warning: no previous prototype for 'slbc_table_gid_axi_release' [-Wmissing-prototypes]
     173 | __weak int slbc_table_gid_axi_release(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:174:12: warning: no previous prototype for 'slbc_table_gid_axi_get' [-Wmissing-prototypes]
     174 | __weak int slbc_table_gid_axi_get(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:175:12: warning: no previous prototype for 'emi_slb_select' [-Wmissing-prototypes]
     175 | __weak int emi_slb_select(int argv1, int argv2, int argv3) { return 0; }
         |            ^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:176:12: warning: no previous prototype for 'emi_pmu_counter' [-Wmissing-prototypes]
     176 | __weak int emi_pmu_counter(int argv1, int argv2, int argv3) { return 0; }
         |            ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:177:12: warning: no previous prototype for 'emi_pmu_set_ctrl' [-Wmissing-prototypes]
     177 | __weak int emi_pmu_set_ctrl(int argv1, int argv2, int argv3) { return 0; }
         |            ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:178:12: warning: no previous prototype for 'emi_gid_pmu_counter' [-Wmissing-prototypes]
     178 | __weak int emi_gid_pmu_counter(int argv1, int argv2) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:179:12: warning: no previous prototype for 'emi_pmu_read_counter' [-Wmissing-prototypes]
     179 | __weak int emi_pmu_read_counter(int idx) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:180:12: warning: no previous prototype for 'emi_gid_pmu_read_counter' [-Wmissing-prototypes]
     180 | __weak int emi_gid_pmu_read_counter(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:181:12: warning: no previous prototype for 'emi_slc_test_result' [-Wmissing-prototypes]
     181 | __weak int emi_slc_test_result(void) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:182:12: warning: no previous prototype for '_slbc_ach_scmi' [-Wmissing-prototypes]
     182 | __weak int _slbc_ach_scmi(unsigned int cmd, enum slc_ach_uid uid, int gid,
         |            ^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:186:6: warning: no previous prototype for 'slbc_sram_init' [-Wmissing-prototypes]
     186 | void slbc_sram_init(struct mtk_slbc *slbc)
         |      ^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:251:6: warning: no previous prototype for '_slbc_force_cmd' [-Wmissing-prototypes]
     251 | void _slbc_force_cmd(unsigned int force)
         |      ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:377:6: warning: no previous prototype for 'slbc_buffer_cb_notify' [-Wmissing-prototypes]
     377 | void slbc_buffer_cb_notify(u32 res, u32 sid, u32 sid_list)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c: In function 'slbc_suspend_cb':
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1610:40: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1610 |                         } else if (sid == UID_AOV |
         |                                    ~~~~^~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1612:45: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1612 |                                         sid == UID_AOV_APU) {
         |                                         ~~~~^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c: In function 'slbc_resume_cb':
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1637:40: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1637 |                         } else if (sid == UID_AOV |
         |                                    ~~~~^~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_mt8196.c:1639:45: warning: suggest parentheses around comparison in operand of '|' [-Wparentheses]
    1639 |                                         sid == UID_AOV_APU) {
         |                                         ~~~~^~~~~~~~~~~~~~
--
   cc1: warning: drivers/misc/mediatek/include: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/include/mt-plat: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: drivers/misc/mediatek/sspm/v3: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/misc/mediatek/slbc/slbc_ipi.c:18:
>> drivers/misc/mediatek/slbc/slbc_ipi.h:141:12: warning: no previous prototype for 'slbc_get_sspm_ver' [-Wmissing-prototypes]
     141 | __weak int slbc_get_sspm_ver(u32 *major_ver, u32 *minor_ver, u32 *patch_ver) { return 0; }
         |            ^~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:142:12: warning: no previous prototype for 'slbc_suspend_resume_notify' [-Wmissing-prototypes]
     142 | __weak int slbc_suspend_resume_notify(int suspend) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:143:12: warning: no previous prototype for 'slbc_scmi_init' [-Wmissing-prototypes]
     143 | __weak int slbc_scmi_init(void) { return 0; }
         |            ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:144:12: warning: no previous prototype for 'slbc_sspm_slb_disable' [-Wmissing-prototypes]
     144 | __weak int slbc_sspm_slb_disable(int disable) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:145:12: warning: no previous prototype for 'slbc_sspm_slc_disable' [-Wmissing-prototypes]
     145 | __weak int slbc_sspm_slc_disable(int disable) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:146:12: warning: no previous prototype for 'slbc_sspm_enable' [-Wmissing-prototypes]
     146 | __weak int slbc_sspm_enable(int enable) { return 0; }
         |            ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:147:12: warning: no previous prototype for 'slbc_force_scmi_cmd' [-Wmissing-prototypes]
     147 | __weak int slbc_force_scmi_cmd(unsigned int force) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:148:12: warning: no previous prototype for 'slbc_mic_num_cmd' [-Wmissing-prototypes]
     148 | __weak int slbc_mic_num_cmd(unsigned int num) { return 0; }
         |            ^~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:149:12: warning: no previous prototype for 'slbc_inner_cmd' [-Wmissing-prototypes]
     149 | __weak int slbc_inner_cmd(unsigned int inner) { return 0; }
         |            ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:150:12: warning: no previous prototype for 'slbc_outer_cmd' [-Wmissing-prototypes]
     150 | __weak int slbc_outer_cmd(unsigned int outer) { return 0; }
         |            ^~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:151:12: warning: no previous prototype for 'slbc_ctrl_scmi_info' [-Wmissing-prototypes]
     151 | __weak int slbc_ctrl_scmi_info(unsigned int cmd, unsigned int arg1,
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:156:12: warning: no previous prototype for 'slbc_get_cache_user_pmu' [-Wmissing-prototypes]
     156 | __weak int slbc_get_cache_user_pmu(int uid, void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:157:12: warning: no previous prototype for 'slbc_get_cache_user_status' [-Wmissing-prototypes]
     157 | __weak int slbc_get_cache_user_status(int uid, void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:158:12: warning: no previous prototype for '_slbc_request_cache_scmi' [-Wmissing-prototypes]
     158 | __weak int _slbc_request_cache_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:159:12: warning: no previous prototype for '_slbc_release_cache_scmi' [-Wmissing-prototypes]
     159 | __weak int _slbc_release_cache_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:160:12: warning: no previous prototype for '_slbc_buffer_status_scmi' [-Wmissing-prototypes]
     160 | __weak int _slbc_buffer_status_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:161:12: warning: no previous prototype for '_slbc_request_buffer_scmi' [-Wmissing-prototypes]
     161 | __weak int _slbc_request_buffer_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:162:12: warning: no previous prototype for '_slbc_release_buffer_scmi' [-Wmissing-prototypes]
     162 | __weak int _slbc_release_buffer_scmi(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:163:13: warning: no previous prototype for 'slbc_register_ipi_ops' [-Wmissing-prototypes]
     163 | __weak void slbc_register_ipi_ops(struct slbc_ipi_ops *ops) {}
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/misc/mediatek/slbc/slbc_ipi.h:164:13: warning: no previous prototype for 'slbc_unregister_ipi_ops' [-Wmissing-prototypes]
     164 | __weak void slbc_unregister_ipi_ops(struct slbc_ipi_ops *ops) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:165:12: warning: no previous prototype for 'slbc_sspm_sram_update' [-Wmissing-prototypes]
     165 | __weak int slbc_sspm_sram_update(void) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:166:12: warning: no previous prototype for 'slbc_table_gid_set' [-Wmissing-prototypes]
     166 | __weak int slbc_table_gid_set(int gid, int quota, int pri) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:167:12: warning: no previous prototype for 'slbc_table_gid_release' [-Wmissing-prototypes]
     167 | __weak int slbc_table_gid_release(int gid) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:168:12: warning: no previous prototype for 'slbc_table_gid_get' [-Wmissing-prototypes]
     168 | __weak int slbc_table_gid_get(int gid) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:169:12: warning: no previous prototype for 'slbc_table_idt_set' [-Wmissing-prototypes]
     169 | __weak int slbc_table_idt_set(int index, int arid, int idt) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:170:12: warning: no previous prototype for 'slbc_table_idt_release' [-Wmissing-prototypes]
     170 | __weak int slbc_table_idt_release(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:171:12: warning: no previous prototype for 'slbc_table_idt_get' [-Wmissing-prototypes]
     171 | __weak int slbc_table_idt_get(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:172:12: warning: no previous prototype for 'slbc_table_gid_axi_set' [-Wmissing-prototypes]
     172 | __weak int slbc_table_gid_axi_set(int index, int axiid, int pg) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:173:12: warning: no previous prototype for 'slbc_table_gid_axi_release' [-Wmissing-prototypes]
     173 | __weak int slbc_table_gid_axi_release(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:174:12: warning: no previous prototype for 'slbc_table_gid_axi_get' [-Wmissing-prototypes]
     174 | __weak int slbc_table_gid_axi_get(int index) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:175:12: warning: no previous prototype for 'emi_slb_select' [-Wmissing-prototypes]
     175 | __weak int emi_slb_select(int argv1, int argv2, int argv3) { return 0; }
         |            ^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:176:12: warning: no previous prototype for 'emi_pmu_counter' [-Wmissing-prototypes]
     176 | __weak int emi_pmu_counter(int argv1, int argv2, int argv3) { return 0; }
         |            ^~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:177:12: warning: no previous prototype for 'emi_pmu_set_ctrl' [-Wmissing-prototypes]
     177 | __weak int emi_pmu_set_ctrl(int argv1, int argv2, int argv3) { return 0; }
         |            ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:178:12: warning: no previous prototype for 'emi_gid_pmu_counter' [-Wmissing-prototypes]
     178 | __weak int emi_gid_pmu_counter(int argv1, int argv2) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:179:12: warning: no previous prototype for 'emi_pmu_read_counter' [-Wmissing-prototypes]
     179 | __weak int emi_pmu_read_counter(int idx) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:180:12: warning: no previous prototype for 'emi_gid_pmu_read_counter' [-Wmissing-prototypes]
     180 | __weak int emi_gid_pmu_read_counter(void *ptr) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:181:12: warning: no previous prototype for 'emi_slc_test_result' [-Wmissing-prototypes]
     181 | __weak int emi_slc_test_result(void) { return 0; }
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:182:12: warning: no previous prototype for '_slbc_ach_scmi' [-Wmissing-prototypes]
     182 | __weak int _slbc_ach_scmi(unsigned int cmd, enum slc_ach_uid uid, int gid,
         |            ^~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.c:773:6: error: redefinition of 'slbc_register_ipi_ops'
     773 | void slbc_register_ipi_ops(struct slbc_ipi_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:163:13: note: previous definition of 'slbc_register_ipi_ops' with type 'void(struct slbc_ipi_ops *)'
     163 | __weak void slbc_register_ipi_ops(struct slbc_ipi_ops *ops) {}
         |             ^~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.c:779:6: error: redefinition of 'slbc_unregister_ipi_ops'
     779 | void slbc_unregister_ipi_ops(struct slbc_ipi_ops *ops)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/slbc/slbc_ipi.h:164:13: note: previous definition of 'slbc_unregister_ipi_ops' with type 'void(struct slbc_ipi_ops *)'
     164 | __weak void slbc_unregister_ipi_ops(struct slbc_ipi_ops *ops) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI_MTK [=m] && HAS_IOMEM [=y] && ARM64 [=y] && !MALI [=n] && MALI [=n]!=m [=m] && MTK_GPU_SUPPORT [=y]


vim +/slbc_register_ipi_ops +773 drivers/misc/mediatek/slbc/slbc_ipi.c

   772	
 > 773	void slbc_register_ipi_ops(struct slbc_ipi_ops *ops)
   774	{
   775		ipi_ops = ops;
   776	}
   777	EXPORT_SYMBOL_GPL(slbc_register_ipi_ops);
   778	
 > 779	void slbc_unregister_ipi_ops(struct slbc_ipi_ops *ops)
   780	{
   781		ipi_ops = NULL;
   782	}
   783	EXPORT_SYMBOL_GPL(slbc_unregister_ipi_ops);
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
