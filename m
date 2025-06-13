Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1184E2F4317
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 01:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779608; cv=none; b=TC7ckdnesyYgcwcglyjJxeqMfu3WeXhynkYNq95KhUQfu0mz/P7vbNupUrQl8Rk5u5pXMsPHvBElA0IHs9729O1ruxh0o6jFmdnyeCIwwPJ1tau8E8l96BMBw6hc4CPtyGOyecrbNMA4WnGttTD2yZtHMoH7zXy2i8q0uHFUwsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779608; c=relaxed/simple;
	bh=diUd+TfwJJMI8/3QlPM7PaEGXpkgF+L3ICcez61SlVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmNY1upbz8ka27ekgBQY05ceD+w4trUWaKhTSz7kb1+zCIpOsu/PnMeZ/hXAXf2A+vu/mt4HpBYiUA+vn0Zztw67NvkrAL204+bEvPTwunAW4TrHIWUNAKzsrvXd8PmH7TdPP/hekcmZ+5fFCalvc6/Sx8aN5myRMyqQDhL7VzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgdoXYRW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgdoXYRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749779606; x=1781315606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=diUd+TfwJJMI8/3QlPM7PaEGXpkgF+L3ICcez61SlVw=;
  b=kgdoXYRW7G2B6F3YLk+g5oF6A56AXehGuOyKLn7oifSxNdfZZx89gO98
   6ZchKG30WF1RE9foVAh0X05VtzG3fSOu6ipopZhzL4C5BTXmy9/1Uz/2J
   ZGF3Tfrbi3vwnHkTkrXE66YKrSMoKWQghranmErKEdCs19qt+lZ6s6wUd
   TMMbhlJw2AQxMBsQL7O+2/vdEbGGJ2jhZWdJDr7g5a0f01fBphmBQrmtL
   F6PXt1fC9tQpkF1t/tYUgWAXNo1nQPHNh8xks+COUmt67tOiBv5k2Y/aT
   cQQazmnjtjwu2QZVbSuxFrNlOQg5V1rwnotdpvvgOr5k7rKx4AOpPeOnt
   A==;
X-CSE-ConnectionGUID: lEh4pdVeSlmVf2KiJVJIPg==
X-CSE-MsgGUID: 4CpZHzHvQaWJ6HWtR3gj4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="63339380"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="63339380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 18:53:25 -0700
X-CSE-ConnectionGUID: 4T5oh2mAR3+oeY1U6spUeQ==
X-CSE-MsgGUID: yVUoJmgzTeCIk3JLG+mSSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152846492"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jun 2025 18:53:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPtbd-000C8U-39;
	Fri, 13 Jun 2025 01:53:21 +0000
Date: Fri, 13 Jun 2025 09:52:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 160/160]
 drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_hal.c:85:27: error:
 implicit declaration of function 'gpufreq_get_cur_oppidx'
Message-ID: <202506130934.hXUpfR4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   93817911b95226b78c95205943ab20fa76c00432
commit: 8df8cc2d3cc80f60a56cd1ad44ed404f4c7ac449 [160/160] CHROMIUM: gpu/mediatek: move mtk_proprietary out of mali
config: arm64-randconfig-004-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130934.hXUpfR4f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130934.hXUpfR4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130934.hXUpfR4f-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_logger.c:109:9: warning: no previous prototype for 'gpueb_log_read' [-Wmissing-prototypes]
     109 | ssize_t gpueb_log_read(char __user *data, size_t len)
         |         ^~~~~~~~~~~~~~
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_logger.c:175:14: warning: no previous prototype for 'gpueb_log_poll' [-Wmissing-prototypes]
     175 | unsigned int gpueb_log_poll(void)
         |              ^~~~~~~~~~~~~~
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_ipi.c:271:6: warning: no previous prototype for 'gpueb_mbox_setup_pin_table' [-Wmissing-prototypes]
     271 | void gpueb_mbox_setup_pin_table(unsigned int mbox)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_ipi.c: In function 'gpueb_mbox_setup_pin_table':
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_ipi.c:291:79: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     291 |                 gpueb_log_d(GPUEB_TAG, "mbox%d exceed the maximum size", mbox);
         |                                                                               ^
   drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_ipi.c: At top level:
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_ipi.c:296:6: warning: no previous prototype for 'gpueb_plat_ipi_timeout_cb' [-Wmissing-prototypes]
     296 | void gpueb_plat_ipi_timeout_cb(int ipi_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/mediatek/mtk_proprietary/gpueb/ghpm.c:33:
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/include/gpueb_debug.h:83:14: warning: 'gpueb_dram_user_name' defined but not used [-Wunused-variable]
      83 | static char *gpueb_dram_user_name[] = {
         |              ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_reserved_mem.c:35:5: warning: no previous prototype for 'gpueb_reserve_mem_of_init' [-Wmissing-prototypes]
      35 | int gpueb_reserve_mem_of_init(struct reserved_mem *rmem)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_reserved_mem.c: In function 'gpueb_reserved_mem_init':
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_reserved_mem.c:256:93: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     256 |                 gpueb_log_d(GPUEB_TAG, "Total memory in memory table is more than reserved");
         |                                                                                             ^
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_hwvoter_dbg.c:143:5: warning: no previous prototype for 'gpueb_hw_voter_create_procfs' [-Wmissing-prototypes]
     143 | int gpueb_hw_voter_create_procfs(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/ghpm_swwa.c:7: warning: Cannot understand  * @file    ghpm.c
    on line 7 - I thought it was a doc line
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/ghpm_swwa.c:12: warning: Cannot understand  * ===============================================
    on line 12 - I thought it was a doc line
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/ghpm_wrapper.c:7: warning: Cannot understand  * @file    ghpm_wrapper.c
    on line 7 - I thought it was a doc line
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/ghpm_wrapper.c:12: warning: Cannot understand  * ===============================================
    on line 12 - I thought it was a doc line
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_reserved_mem.c:7: warning: Cannot understand  * @file        gpueb_reserved_mem.c
    on line 7 - I thought it was a doc line
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_plat_service.c:7: warning: Cannot understand  * @file    gpueb_ipi.c
    on line 7 - I thought it was a doc line
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_gpumpu.c:7: warning: Cannot understand  * @file    gpueb_gpumpu.c
    on line 7 - I thought it was a doc line
--
>> drivers/gpu/mediatek/mtk_proprietary/gpueb/gpueb_logger.c:7: warning: Cannot understand  * @file    gpueb_logger.c
    on line 7 - I thought it was a doc line
..


vim +/gpufreq_get_cur_oppidx +85 drivers/gpu/mediatek/mtk_proprietary/ged/src/ged_hal.c

2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   39  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  @40  int tokenizer(char *pcSrc, int i32len, int *pi32IndexArray, int i32NumToken)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   41  {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   42  	int i = 0;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   43  	int j = 0;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   44  	int head = -1;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   45  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   46  	for ( ; i < i32len; i++) {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   47  		if (pcSrc[i] != ' ') {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   48  			if (head == -1)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   49  				head = i;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   50  		} else {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   51  			if (head != -1) {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   52  				pi32IndexArray[j] = head;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   53  				j++;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   54  				if (j == i32NumToken)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   55  					return j;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   56  				head = -1;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   57  			}
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   58  			pcSrc[i] = 0;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   59  		}
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   60  	}
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   61  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   62  	if (head != -1) {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   63  		pi32IndexArray[j] = head;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   64  		j++;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   65  		return j;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   66  	}
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   67  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   68  	return -1;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   69  }
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   70  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   71  /* MBrain */
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   72  static ssize_t opp_logs_show(struct kobject *kobj,
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   73  		struct kobj_attribute *attr, char *buf)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   74  {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   75  	int len = 0, i = 0, cur_idx = 0;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   76  	unsigned int ui32FqCount = g_real_oppfreq_num;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   77  	struct GED_DVFS_OPP_STAT *report = NULL;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   78  	u64 last_ts = 0;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   79  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   80  	if (ui32FqCount)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   81  		report = vmalloc(sizeof(struct GED_DVFS_OPP_STAT) * ui32FqCount);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   82  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   83  	if ((report != NULL) &&
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   84  		ged_dvfs_query_opp_cost(report, ui32FqCount, false, &last_ts) == 0) {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  @85  		cur_idx = gpufreq_get_cur_oppidx(TARGET_DEFAULT);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   86  		cur_idx = (cur_idx > g_real_minfreq_idx)? g_real_minfreq_idx: cur_idx;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   87  		len = sprintf(buf, "Last TS: %llu\n", last_ts);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   88  		len += sprintf(buf + len, "GPU Freq(MHz)  Time(ms)\n");
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   89  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   90  		for (i = 0; i < ui32FqCount; i++) {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   91  			if (i == cur_idx)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   92  				len += sprintf(buf + len, "*");
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   93  			else
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   94  				len += sprintf(buf + len, " ");
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   95  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   96  			len += sprintf(buf + len, "%4u    ",
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  @97  					gpufreq_get_freq_by_idx(TARGET_DEFAULT, i) / 1000);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   98  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15   99  			/* truncate to ms */
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  100  			len += sprintf(buf + len, "%llu\n", report[i].ui64Active);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  101  		}
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  102  	} else {
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  103  		len = sprintf(buf, "Not Supported.\n");
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  104  		if (len < 0)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  105  			GED_LOGE("sprintf failed to write to buffer!\n");
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  106  	}
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  107  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  108  	if (report != NULL)
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  109  		vfree(report);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  110  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  111  	return len;
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  112  }
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  113  static KOBJ_ATTR_RO(opp_logs);
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/platform/mediatek/mtk_proprietary/ged/src/ged_hal.c Alvin Liu 2025-01-15  114  

:::::: The code at line 85 was first introduced by commit
:::::: 2b0918badca3b06a0371cf4cb21785d202033004 CHROMIUM: gpu/mediatek: update gpu kernel driver(r51p0) with mtk modification

:::::: TO: Alvin Liu <alvin.liu@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
