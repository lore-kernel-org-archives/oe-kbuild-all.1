Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B08838E8C9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 22:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781215566; cv=none; b=LmeLh9WVMdc37hDkivja3I74ZGIXqDFSXMtk6MMHf+2tvvOYNgTX6iLmuRX4/RyfbyEKHHfS7VVHhVVlScP3zMDCHf5iWAqVoMZ7ae2ekgGiLVghPo4SG8X3GPo7CiZEckFjHhB/Zrf/EwNQ97e9RW921itFKJMFbV8T7RUmaUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781215566; c=relaxed/simple;
	bh=rjFKF53wXCTAAYOMf0zZn3gM/yzxgViegYjovTLL0iE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j8XTt9rTJrtl/6S/mL75aJ+IbHGq0uebiV4LauciSfzWAtV3VxTZO499HXwc2ThDj0JdfxK+8vNHcFQcM4WcBoxyiJftyrMF/d5TfA7Id2Dl7D18saoT035IuA8XrstOQlZRvmdefGp27pDIkSjzpKkVrSBFbeU9rp525ThTYVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muN9V31G; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muN9V31G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781215559; x=1812751559;
  h=date:from:to:cc:subject:message-id;
  bh=rjFKF53wXCTAAYOMf0zZn3gM/yzxgViegYjovTLL0iE=;
  b=muN9V31GSO6AgNRMuGJsrDbb2KSTYJBXuz3uEbyap204JJc+HCgL1LzE
   G0Lr1oVTgQ2Yy8P8MPmbmrfTiZSvW9W69LqwpSVHEIXiAbHsGFAOlegpv
   +U2fO/rTn6ZzFNMxep3Io/cyz3Hpfps1c1XBdVx0lFbhtlf9kHrz/bdxM
   3dxvAZj/0wtLBGseCsVMbs4giGS1//drZE2xs1GydEmpfdpjbhcAx6u+a
   m4oDG8eQaq3njEokBiYdbXENuFerNgFx7CsJtCRi7ACq7MjpzLX900wd2
   ZFCpLzG6Lbqo7YrGegWQZh3CfqO4eLyXDAPKEKvJy7Zti7vjKsGbKLvUW
   g==;
X-CSE-ConnectionGUID: RT1UmBzRRsGBUUAP0SEsJQ==
X-CSE-MsgGUID: ki8C9avnQ5mwch6gC0yIVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107478991"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="107478991"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 15:05:59 -0700
X-CSE-ConnectionGUID: Ql5IVJLnR7Ggd4jhQy97Ig==
X-CSE-MsgGUID: zvlORW5oTNOxWF+eXCybaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251720909"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Jun 2026 15:05:57 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXnX9-0000000046z-0Km6;
	Thu, 11 Jun 2026 22:05:55 +0000
Date: Fri, 12 Jun 2026 00:04:59 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 12/12] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202606120025.WsTz8LMF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3e1cd9728037a89d53b1973467e84cf36e811d34
commit: 3e1cd9728037a89d53b1973467e84cf36e811d34 [12/12] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260612/202606120025.WsTz8LMF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1422: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_dpm.c:78:
+        switch (strategy) {
+            case ADLAK_DPM_STRATEGY_UP:
[...]
+            case ADLAK_DPM_STRATEGY_DOWN:
[...]
+            case ADLAK_DPM_STRATEGY_MAX:
[...]
+            case ADLAK_DPM_STRATEGY_MIN:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1525: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_dpm.c:181:
+        switch (i) {
+            case 0:
[...]
+            case 1:
[...]
+            case 2:
[...]
+            case 3:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1769: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_inference.c:106:
+    switch (device_state) {
+        case ADLAK_DEVICE_INIT:
[...]
+        case ADLAK_DEVICE_ERR:
[...]
+        case ADLAK_DEVICE_IDLE:
[...]
+        case ADLAK_DEVICE_BUSY:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1915: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_inference.c:252:
+        switch (inference_state) {
+            case ADLAK_INFERENCE_STATE_INIT:
[...]
+            case ADLAK_INFERENCE_STATE_RESUME:
[...]
+            case ADLAK_INFERENCE_STATE_DEV_RESET:
[...]
+            case ADLAK_INFERENCE_STATE_WQ_RESET:
[...]
+            case ADLAK_INFERENCE_STATE_WQ_CHECK:
[...]
+            case ADLAK_INFERENCE_STATE_SLEEP_CHECK:
[...]
+            case ADLAK_INFERENCE_STATE_POST_TASK:
[...]
+            case ADLAK_INFERENCE_STATE_REPORT_TASK_PRE:
+            case ADLAK_INFERENCE_STATE_REPORT_TASK_PRE2:
[...]
+            case ADLAK_INFERENCE_STATE_SUBMIT_WAIT:
[...]
+            case ADLAK_INFERENCE_STATE_CHECK_TASK:
[...]
+            case ADLAK_INFERENCE_STATE_REPORT_TASK_CUR:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#2735: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_mm.c:362:
+        switch (pflush_desc->direction) {
+            case FLUSH_TO_DEVICE:
[...]
+            case FLUSH_FROM_DEVICE:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3343: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_queue.c:122:
+    switch (ptask->state) {
+        case ADLAK_SUBMIT_STATE_IDLE:
[...]
+        case ADLAK_SUBMIT_STATE_PENDING:
[...]
+        case ADLAK_SUBMIT_STATE_READY:
[...]
+        case ADLAK_SUBMIT_STATE_RUNNING:
[...]
+        case ADLAK_SUBMIT_STATE_FINISHED:
[...]
+        case ADLAK_SUBMIT_STATE_FAIL:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3788: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c:231:
+    switch (module) {
+        case ADLAK_PLATFORM_MODULE_PWE:
[...]
+        case ADLAK_PLATFORM_MODULE_PWX:
[...]
+        case ADLAK_PLATFORM_MODULE_RS:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3837: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c:280:
+            switch (dep->module) {
+                case ADLAK_DEPENDENCY_MODULE_PWE:
[...]
+                case ADLAK_DEPENDENCY_MODULE_PWX:
[...]
+                case ADLAK_DEPENDENCY_MODULE_RS:
[...]
+                default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#4025: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c:468:
+        switch (dep->module) {
+            case ADLAK_DEPENDENCY_MODULE_PWE:
[...]
+            case ADLAK_DEPENDENCY_MODULE_PWX:
[...]
+            case ADLAK_DEPENDENCY_MODULE_RS:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#11396: FILE: drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:146:
+    switch (mm_info->req.mem_direction) {
+        case ADLAK_ENUM_MEM_DIR_WRITE_ONLY:
[...]
+        case ADLAK_ENUM_MEM_DIR_READ_ONLY:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#11461: FILE: drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:211:
+    switch (mm_info->req.mem_direction) {
+        case ADLAK_ENUM_MEM_DIR_WRITE_ONLY:
[...]
+        case ADLAK_ENUM_MEM_DIR_READ_ONLY:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#12670: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/adlak_hw.c:597:
+    switch (offset) {
+        case REG_ADLAK_0X0:
[...]
+        case REG_ADLAK_0X4:
[...]
+        case REG_ADLAK_0X8:
[...]
+        case REG_ADLAK_0X10:
[...]
+        case REG_ADLAK_0X14:
[...]
+        case REG_ADLAK_0X18:
[...]
+        case REG_ADLAK_0X1C:
[...]
+        case REG_ADLAK_0X20:
[...]
+        case REG_ADLAK_0X24:
[...]
+        case REG_ADLAK_0X28:
[...]
+        case REG_ADLAK_0X2C:
[...]
+        case REG_ADLAK_0X30:
[...]
+        case REG_ADLAK_0X34:
[...]
+        case REG_ADLAK_0X38:
[...]
+        case REG_ADLAK_0X3C:
[...]
+        case REG_ADLAK_0X40:
[...]
+        case REG_ADLAK_0X44:
[...]
+        case REG_ADLAK_0X48:
[...]
+        case REG_ADLAK_0X4C:
[...]
+        case REG_ADLAK_0X50:
[...]
+        case REG_ADLAK_0X54:
[...]
+        case REG_ADLAK_0X58:
[...]
+        case REG_ADLAK_0X5C:
[...]
+        case REG_ADLAK_0X60:
[...]
+        case REG_ADLAK_0X64:
[...]
+        case REG_ADLAK_0X68:
[...]
+        case REG_ADLAK_0X6C:
[...]
+        case REG_ADLAK_0X70:
[...]
+        case REG_ADLAK_0X74:
[...]
+        case REG_ADLAK_0X78:
[...]
+        case REG_ADLAK_0X7C:
[...]
+        case REG_ADLAK_0X80:
[...]
+        case REG_ADLAK_0X84:
[...]
+        case REG_ADLAK_0X88:
[...]
+        case REG_ADLAK_0X8C:
[...]
+        case REG_ADLAK_0X90:
[...]
+        case REG_ADLAK_0X9C:
[...]
+        case REG_ADLAK_0XA0:
[...]
+        case REG_ADLAK_0XA4:
[...]
+        case REG_ADLAK_0XA8:
[...]
+        case REG_ADLAK_0XAC:
[...]
+        case REG_ADLAK_0XB0:
[...]
+        case REG_ADLAK_0XB4:
[...]
+        case REG_ADLAK_0XB8:
[...]
+        case REG_ADLAK_0XBC:
[...]
+        case REG_ADLAK_0XC0:
[...]
+        case REG_ADLAK_0XC4:
[...]
+        case REG_ADLAK_0XC8:
[...]
+        case REG_ADLAK_0XCC:
[...]
+        case REG_ADLAK_0XD0:
[...]
+        case REG_ADLAK_0XD4:
[...]
+        case REG_ADLAK_0XD8:
[...]
+        case REG_ADLAK_0XDC:
[...]
+        case REG_ADLAK_0XE0:
[...]
+        case REG_ADLAK_0XE4:
[...]
+        case REG_ADLAK_0XF0:
[...]
+        case REG_ADLAK_0XF4:
[...]
+        case REG_ADLAK_0XF8:
[...]
+        case REG_ADLAK_0XFC:
[...]
+        case REG_ADLAK_0X100:
[...]
+        case REG_ADLAK_0X104:
[...]
+        case REG_ADLAK_0X108:
[...]
+        case REG_ADLAK_0X110:
[...]
+        case REG_ADLAK_0X114:
[...]
+        case REG_ADLAK_0X118:
[...]
+        case REG_ADLAK_0X11C:
[...]
+        case REG_ADLAK_0X120:
[...]
+        case REG_ADLAK_0X124:
[...]
+        default:

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#13544: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/adlak_reg.h:255:
+            ab_axi_saddr : 21; /* Start address of AXI SRAM. saddr * 0x1000<= Byte Range. Unit: 4KB
+                                */

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#13943: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:255:
+    switch (cmd) {
+        case 'r':
+        case 'R':
[...]
+        case 'w':
+        case 'W':
[...]
+        case 'd':
+        case 'D':
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14153: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:465:
+    switch (hw_ver_info->rev.bitc.major) {
+        case r0p0 :
[...]
+        case r1p0 :
[...]
+        case r2p0 :
[...]
+        case r3p0 :

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14228: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:540:
+    switch (dev_hw_version) {
+        case 0x00000000 :
[...]
+        case 0x00000100 :
+        case 0x00000200 :
+        case 0x00000300 :
[...]
+        case 0x00000301 :

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14431: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:743:
+    switch (ret) {
+        case 1 :
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14476: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:788:
+    switch (ret) {
+        case 1:
[...]
+        case 2:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14531: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:843:
+    switch (ret) {
+        case 1 :
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14793: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_fops.c:93:
+    switch (ioctl_code) {
+        case ADLAK_IOCTL_QUERYCAP:
[...]
+        case ADLAK_IOCTL_REQBUF:
[...]
+        case ADLAK_IOCTL_FREEBUF:
[...]
+        case ADLAK_IOCTL_ATTACH_EXTERN_BUF:
[...]
+        case ADLAK_IOCTL_DETTACH_EXTERN_BUF:
[...]
+        case ADLAK_IOCTL_FLUSH_CACHE:
[...]
+        case ADLAK_IOCTL_REGISTER_NETWORK:
[...]
+        case ADLAK_IOCTL_DESTROY_NETWORK:
[...]
+        case ADLAK_IOCTL_INVOKE:
[...]
+        case ADLAK_IOCTL_INVOKE_CANCEL:
[...]
+        case ADLAK_IOCTL_GET_STAT:
[...]
+        case ADLAK_IOCTL_PROFILE_CFG:
[...]
+        case ADLAK_IOCTL_WAIT_UNTIL_FINISH:
[...]
+        case ADLAK_IOCTL_SET_CONTEXT_ATTRIBUTE:
[...]
+        default:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
