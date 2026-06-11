Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F3F10785
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 17:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199057; cv=none; b=gnsI0pJC2b7fafHJLFA60xtOdXWMSmTmfDknJPSvZNCdvM6rBRVXgj7y54vp7TN3D5vHNeHkU+s3VUPt/wy50cqtzmKrMVEH64nNmD/0ie8d4Er40uppdxSPLTaRj8GclJ6aSdSclPG684WJuCSEjlsx3fRa977qAtUydyABTQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199057; c=relaxed/simple;
	bh=/kAdYfEDHCB2zsOMD22DqA7RRHR+RUWjlPc4wIQ1Gcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eGTGj3GzbaizcjcY3rbSeF3Wyn0FSiPpBioPdCbEs+iJOOyIxl7H4VFPCgnxcrYvCSBXrkDWtmOrQbrx2X16S8aUsGYOktG45p6EgNUkHjByyxZzUwD77z4s6qpsTGBNGC4dLoCu+FxYHT8BkCwoyoSe3jBmzzfZNedk+ObjHLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvcOFST+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvcOFST+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781199056; x=1812735056;
  h=date:from:to:cc:subject:message-id;
  bh=/kAdYfEDHCB2zsOMD22DqA7RRHR+RUWjlPc4wIQ1Gcs=;
  b=PvcOFST+JcPCSfqO/bd04BZ1882y32Xha6JMZfT5mQq7CX7+sBy1rOQJ
   DxpM/CUyOyighVMPl7BzfaD+hNlUqc15MiW0D6Db1Wz5h9tlbrTwiwGvl
   0CGTWprBmRyzJXbkz2BlQnnO/KmW1Vdk1Udm+ep/ryKY9njCqcWZg9jTs
   UFSvkfw1ZCmljHSL1oK32NWYRb3pTAkI8TZGms29Y2RMu9Dn0LDYBarUo
   KynFInxbdwEWtKu2dSy2qZeeyla92BRkZDj90XcvnD3goiTaerx6eMz+r
   ajEk0Z1eh+RsS84ERsVp0wZxhzgiaaw51K/nUtz1VaDwKVFyAtcOsj1gi
   A==;
X-CSE-ConnectionGUID: x/Qt8aHaT5GfiWDpa/bHHA==
X-CSE-MsgGUID: DwZ350HKT/mJjVrytJYkdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81761643"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81761643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:30:56 -0700
X-CSE-ConnectionGUID: sDLr5HUlSc26e4h3AL49Ew==
X-CSE-MsgGUID: rua16qRiRsu97QNPZar2jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="240213799"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jun 2026 10:30:54 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXjEx-0000000043p-3ljA;
	Thu, 11 Jun 2026 17:30:51 +0000
Date: Thu, 11 Jun 2026 19:29:59 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 3/3] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202606111959.OtHEJ5y3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   a235b3f30d6299ee67af8059ef1bcf76d470ee29
commit: a235b3f30d6299ee67af8059ef1bcf76d470ee29 [3/3] Temporary use Adla Legacy driver
reproduce: (https://download.01.org/0day-ci/archive/20260611/202606111959.OtHEJ5y3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1423: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_dpm.c:78:
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
#1526: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_dpm.c:181:
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
#1770: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_inference.c:106:
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
#1916: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_inference.c:252:
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
#2736: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_mm.c:362:
+        switch (pflush_desc->direction) {
+            case FLUSH_TO_DEVICE:
[...]
+            case FLUSH_FROM_DEVICE:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3344: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_queue.c:122:
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
#3789: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c:231:
+    switch (module) {
+        case ADLAK_PLATFORM_MODULE_PWE:
[...]
+        case ADLAK_PLATFORM_MODULE_PWX:
[...]
+        case ADLAK_PLATFORM_MODULE_RS:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#3838: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c:280:
+            switch (dep->module) {
+                case ADLAK_DEPENDENCY_MODULE_PWE:
[...]
+                case ADLAK_DEPENDENCY_MODULE_PWX:
[...]
+                case ADLAK_DEPENDENCY_MODULE_RS:
[...]
+                default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#4026: FILE: drivers/accel/adla_legacy/kmd/drv/common/adlak_submit.c:468:
+        switch (dep->module) {
+            case ADLAK_DEPENDENCY_MODULE_PWE:
[...]
+            case ADLAK_DEPENDENCY_MODULE_PWX:
[...]
+            case ADLAK_DEPENDENCY_MODULE_RS:
[...]
+            default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#11397: FILE: drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:146:
+    switch (mm_info->req.mem_direction) {
+        case ADLAK_ENUM_MEM_DIR_WRITE_ONLY:
[...]
+        case ADLAK_ENUM_MEM_DIR_READ_ONLY:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#11462: FILE: drivers/accel/adla_legacy/kmd/drv/port/os/linux/mm/adlak_mm_os_common.c:211:
+    switch (mm_info->req.mem_direction) {
+        case ADLAK_ENUM_MEM_DIR_WRITE_ONLY:
[...]
+        case ADLAK_ENUM_MEM_DIR_READ_ONLY:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#12671: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/adlak_hw.c:597:
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
#13545: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/adlak_reg.h:255:
+            ab_axi_saddr : 21; /* Start address of AXI SRAM. saddr * 0x1000<= Byte Range. Unit: 4KB
+                                */

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#13944: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:255:
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
#14154: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:465:
+    switch (hw_ver_info->rev.bitc.major) {
+        case r0p0 :
[...]
+        case r1p0 :
[...]
+        case r2p0 :
[...]
+        case r3p0 :

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14229: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:540:
+    switch (dev_hw_version) {
+        case 0x00000000 :
[...]
+        case 0x00000100 :
+        case 0x00000200 :
+        case 0x00000300 :
[...]
+        case 0x00000301 :

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14432: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:743:
+    switch (ret) {
+        case 1 :
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14477: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:788:
+    switch (ret) {
+        case 1:
[...]
+        case 2:
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14532: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_debugfs.c:843:
+    switch (ret) {
+        case 1 :
[...]
+        default:

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#14794: FILE: drivers/accel/adla_legacy/kmd/drv/port/platform/linux/adlak_fops.c:93:
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
