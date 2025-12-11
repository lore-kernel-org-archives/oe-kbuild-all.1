Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3472D221FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765488895; cv=none; b=lXZHf41ZZTQWA0SuLNtgGgeqKmrGEa0347PkgoVENmhNLeVTCATIluenprjZsrpls8vrKVPl2+q19sjvwFb6H0IFav0PQMEoAFHeJivAB7w/SeddDb7LyDR3OrPeynnadEzlgCGBkRJi7cXUlWQT+wwJTEbmWRQP81TF9qFDFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765488895; c=relaxed/simple;
	bh=ykH6R09h1P3P0wDQlJTEzLQmRfEOh77tiUtc2ocjdGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YcygAXtHmZzBGZANa26IEyQ/1t3fV/Vjdp5PJHVuxD2TYEOHQpoCFEvCe3BZCK5DzhbtCpqx37r2sPFHqOkChwPI71YXfSvSh8VInLoeC5mEzHaKwPbXPmWOQgPxIqcNimgP8555umfpk7aQzFB2+6+/WD0KnenW/JygF4kuIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNbMNzGg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNbMNzGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765488892; x=1797024892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykH6R09h1P3P0wDQlJTEzLQmRfEOh77tiUtc2ocjdGk=;
  b=eNbMNzGgg9bbedFh3PXDGjsC/d1h85VKY62f8uAo5aPELUEc177n5zzH
   r5hTNW6qVComglKj6daEBftQ/wPfoqHcGQ6aLCnWsTIWb3J+zi8SGBTGR
   szBFq9Lx2v385XuroIkHUm05ckgOIIw3qKRLiaMaEUYfNNIZ2cjI2yN7p
   QnmkPGPsg49rqEMeF/mQem4+dL4FhOB/33v8KpoW+XIIbEBPPfpHaUQeg
   v2VfLgbG2AcWdGzs4ZudFFM+V56SmIoV3DfGqyhgZ98yqtBTmFBwd7cmg
   G9nKDUxACnUA+SZMjuxz8s90P596O6Ru8WYRLD1nWXxRDz1uDohXgDpzM
   Q==;
X-CSE-ConnectionGUID: 8js9h0OqRou3db5SEeVQ3w==
X-CSE-MsgGUID: cuz5MeCKQ2WhHs0wl+o32g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55029165"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="55029165"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 13:34:51 -0800
X-CSE-ConnectionGUID: Yv04rCH2QDKWlWk282Tn1g==
X-CSE-MsgGUID: P3NE7rt0SHKpkd1qYwoEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196897890"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 13:34:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vToJD-0000000057x-25VO;
	Thu, 11 Dec 2025 21:34:47 +0000
Date: Fri, 12 Dec 2025 05:34:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/firmware/uvb/odf/odf_trans.c:119:42: error: implicit declaration of
 function 'memremap'
Message-ID: <202512120523.uRmzPGgB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi klmengkd,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: e440694adcf8b5ee8eab5914302130003d121a0e [3508/3508] uvb: change dir name
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251212/202512120523.uRmzPGgB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120523.uRmzPGgB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120523.uRmzPGgB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/firmware/uvb/odf/odf_get_fdt.c:14:5: warning: no previous prototype for 'odf_get_fdt_ubiostbl' [-Wmissing-prototypes]
      14 | int odf_get_fdt_ubiostbl(u64 *phys_addr, char *tbl)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/firmware/uvb/odf/odf_trans.c:28:6: warning: no previous prototype for 'free_cis_info' [-Wmissing-prototypes]
      28 | void free_cis_info(void)
         |      ^~~~~~~~~~~~~
   drivers/firmware/uvb/odf/odf_trans.c: In function 'create_cis_info_from_odf':
>> drivers/firmware/uvb/odf/odf_trans.c:119:42: error: implicit declaration of function 'memremap' [-Werror=implicit-function-declaration]
     119 |                                 header = memremap(ubrt_table->sub_tables[i].pointer,
         |                                          ^~~~~~~~
>> drivers/firmware/uvb/odf/odf_trans.c:120:73: error: 'MEMREMAP_WB' undeclared (first use in this function)
     120 |                                         sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                                                                         ^~~~~~~~~~~
   drivers/firmware/uvb/odf/odf_trans.c:120:73: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/firmware/uvb/odf/odf_trans.c:126:33: error: implicit declaration of function 'memunmap'; did you mean 'memcmp'? [-Werror=implicit-function-declaration]
     126 |                                 memunmap(header);
         |                                 ^~~~~~~~
         |                                 memcmp
   drivers/firmware/uvb/odf/odf_trans.c: In function 'create_uvb_info_from_odf':
   drivers/firmware/uvb/odf/odf_trans.c:304:73: error: 'MEMREMAP_WB' undeclared (first use in this function)
     304 |                                         sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                                                                         ^~~~~~~~~~~
   drivers/firmware/uvb/odf/odf_trans.c: In function 'create_odf_info':
   drivers/firmware/uvb/odf/odf_trans.c:406:72: error: 'MEMREMAP_WB' undeclared (first use in this function)
     406 |                 memremap(od_root_phys, sizeof(struct ubios_od_header), MEMREMAP_WB);
         |                                                                        ^~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/firmware/uvb/odf/odf_helper.c:28:4: warning: no previous prototype for 'odf_read8' [-Wmissing-prototypes]
      28 | u8 odf_read8(u8 *address)
         |    ^~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:33:5: warning: no previous prototype for 'odf_read16' [-Wmissing-prototypes]
      33 | u16 odf_read16(u8 *address)
         |     ^~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:41:5: warning: no previous prototype for 'odf_read32' [-Wmissing-prototypes]
      41 | u32 odf_read32(u8 *address)
         |     ^~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:49:5: warning: no previous prototype for 'odf_read64' [-Wmissing-prototypes]
      49 | u64 odf_read64(u8 *address)
         |     ^~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:57:5: warning: no previous prototype for 'odf_checksum' [-Wmissing-prototypes]
      57 | u32 odf_checksum(u8 *data, u32 size)
         |     ^~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:86:6: warning: no previous prototype for 'odf_is_checksum_ok' [-Wmissing-prototypes]
      86 | bool odf_is_checksum_ok(struct ubios_od_header *header)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:97:6: warning: no previous prototype for 'odf_update_checksum' [-Wmissing-prototypes]
      97 | void odf_update_checksum(struct ubios_od_header *header)
         |      ^~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:115:5: warning: no previous prototype for 'odf_separate_name' [-Wmissing-prototypes]
     115 | int odf_separate_name(char **path, char *name, u64 max_len, u16 *index)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:179:6: warning: no previous prototype for 'odf_get_vs_by_pointer' [-Wmissing-prototypes]
     179 | void odf_get_vs_by_pointer(u8 *data, struct ubios_od_value_struct *vs)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:222:6: warning: no previous prototype for 'is_od_root_valid' [-Wmissing-prototypes]
     222 | bool is_od_root_valid(struct ubios_od_root *root)
         |      ^~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:242:6: warning: no previous prototype for 'is_od_file_valid' [-Wmissing-prototypes]
     242 | bool is_od_file_valid(u8 *file)
         |      ^~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/odf/odf_helper.c:267:5: warning: no previous prototype for 'odf_get_od_file' [-Wmissing-prototypes]
     267 | u8 *odf_get_od_file(struct ubios_od_root *root, char *name)
         |     ^~~~~~~~~~~~~~~
--
>> drivers/firmware/uvb/cis/cis_info_process.c:26:6: warning: no previous prototype for 'ubios_prepare_output_data' [-Wmissing-prototypes]
      26 | void ubios_prepare_output_data(struct cis_message *io_param, void *output, u32 *output_size)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:45:5: warning: no previous prototype for 'get_cis_group_info' [-Wmissing-prototypes]
      45 | int get_cis_group_info(u32 call_id, u32 receiver_id,
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:87:23: warning: no previous prototype for 'search_local_cis_func_node' [-Wmissing-prototypes]
      87 | struct cis_func_node *search_local_cis_func_node(u32 call_id, u32 receiver_id)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:163:32: warning: no previous prototype for 'uvb_occupy_window' [-Wmissing-prototypes]
     163 | struct uvb_window_description *uvb_occupy_window(struct uvb *uvb, u32 sender_id, u64 *wd_obtain)
         |                                ^~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:225:6: warning: no previous prototype for 'uvb_free_wd_obtain' [-Wmissing-prototypes]
     225 | void uvb_free_wd_obtain(u64 *wd_obtain)
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:233:5: warning: no previous prototype for 'uvb_free_window' [-Wmissing-prototypes]
     233 | int uvb_free_window(struct uvb_window *window)
         |     ^~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:306:5: warning: no previous prototype for 'uvb_fill_window' [-Wmissing-prototypes]
     306 | int uvb_fill_window(struct uvb_window_description *wd, struct uvb_window *wd_addr,
         |     ^~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:331:5: warning: no previous prototype for 'uvb_poll_window_call' [-Wmissing-prototypes]
     331 | int uvb_poll_window_call(struct uvb_window *window, u32 call_id)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:353:5: warning: no previous prototype for 'uvb_poll_window_call_sync' [-Wmissing-prototypes]
     353 | int uvb_poll_window_call_sync(struct uvb_window *window, u32 call_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:370:5: warning: no previous prototype for 'uvb_get_output_data' [-Wmissing-prototypes]
     370 | int uvb_get_output_data(struct uvb_window *window,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:392:6: warning: no previous prototype for 'free_io_param_with_buffer' [-Wmissing-prototypes]
     392 | void free_io_param_with_buffer(struct cis_message *io_param)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:402:5: warning: no previous prototype for 'cis_call_uvb' [-Wmissing-prototypes]
     402 | int cis_call_uvb(u8 index, struct udfi_para *para)
         |     ^~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_info_process.c:473:5: warning: no previous prototype for 'cis_call_uvb_sync' [-Wmissing-prototypes]
     473 | int cis_call_uvb_sync(u8 index, struct udfi_para *para)
         |     ^~~~~~~~~~~~~~~~~
--
>> drivers/firmware/uvb/cis/uvb_info_process.c:129:6: warning: no previous prototype for 'search_local_receiver_id' [-Wmissing-prototypes]
     129 | bool search_local_receiver_id(u32 receiver_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/firmware/uvb/cis/cis_core.c:25:5: warning: no previous prototype for 'create_uvb_poll_window_thread' [-Wmissing-prototypes]
      25 | int create_uvb_poll_window_thread(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_core.c:38:6: warning: no previous prototype for 'uvb_poll_window_thread_stop' [-Wmissing-prototypes]
      38 | void uvb_poll_window_thread_stop(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_core.c:86:5: warning: no previous prototype for 'init_uvb' [-Wmissing-prototypes]
      86 | int init_uvb(void)
         |     ^~~~~~~~
>> drivers/firmware/uvb/cis/cis_core.c:111:5: warning: no previous prototype for 'init_global_vars' [-Wmissing-prototypes]
     111 | int init_global_vars(void)
         |     ^~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_core.c:120:5: warning: no previous prototype for 'init_cis_table' [-Wmissing-prototypes]
     120 | int init_cis_table(void)
         |     ^~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_core.c:130:6: warning: no previous prototype for 'free_global_vars' [-Wmissing-prototypes]
     130 | void free_global_vars(void)
         |      ^~~~~~~~~~~~~~~~
>> drivers/firmware/uvb/cis/cis_core.c:136:6: warning: no previous prototype for 'uninit_uvb' [-Wmissing-prototypes]
     136 | void uninit_uvb(void)
         |      ^~~~~~~~~~
--
>> drivers/firmware/uvb/cis/uvb_info_process.c:18: warning: Cannot understand Calculate checksum in 4bytes, if size not aligned with 4bytes, padding with 0.
    on line 18 - I thought it was a doc line
--
>> drivers/firmware/uvb/cis/cis_info_process.c:615: warning: expecting prototype for cis_call(). Prototype was for cis_call_by_uvb() instead
--
>> drivers/firmware/uvb/odf/odf_helper.c:84: warning: Cannot understand Only calculate the valid data region
    on line 84 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_helper.c:175: warning: Cannot understand @brief Get a name/value structrue by the data pointer
    on line 175 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_helper.c:260: warning: Cannot understand @brief Search all pointer in od root, return the specific od file matched the input name.
    on line 260 - I thought it was a doc line
--
>> drivers/firmware/uvb/odf/odf_data.c:16: warning: Cannot understand @brief Search and match one value name, return the pointer of value structrue if matched.
    on line 16 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:55: warning: Cannot understand Change value structure by index in a list, the name will not be changed,
    on line 55 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:70: warning: Cannot understand Change the value structure with index, move the pointer to the data indicated by index,
    on line 70 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:87: warning: Cannot understand Search one od file, input value path, output the value structure, contains value info
    on line 87 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:131: warning: Cannot understand Search all od file in the root, input value path, output the value structure, contains value info.
    on line 131 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:174: warning: Cannot understand @brief Get table information like row, colomn, sub types, .etc.
    on line 174 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:232: warning: Cannot understand @brief Get a value's offset in row of table, will check type first.
    on line 232 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:296: warning: Cannot understand @brief Get a value pointer from table according name and row, will check type first.
    on line 296 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:408: warning: Cannot understand @brief Get a ubios od value struct from od root according to the path
    on line 408 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:429: warning: Cannot understand @brief Get a list from od root, will return a list info structure.
    on line 429 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:473: warning: Cannot understand @brief Get a value structure from list by index.
    on line 473 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:546: warning: Cannot understand @brief Get next value of a list.
    on line 546 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:594: warning: Cannot understand Internal function, get data pointer by path and type.
    on line 594 - I thought it was a doc line
>> drivers/firmware/uvb/odf/odf_data.c:686: warning: Cannot understand Get table in the value structure.
    on line 686 - I thought it was a doc line

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/uvb/odf/odf_get_fdt.c:29:54: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 const [usertype] *p @@     got unsigned int const [usertype] * @@
   drivers/firmware/uvb/odf/odf_get_fdt.c:29:54: sparse:     expected restricted __be32 const [usertype] *p
   drivers/firmware/uvb/odf/odf_get_fdt.c:29:54: sparse:     got unsigned int const [usertype] *
--
>> drivers/firmware/uvb/cis/uvb_info_process.c:129:6: sparse: sparse: symbol 'search_local_receiver_id' was not declared. Should it be static?
--
>> drivers/firmware/uvb/cis/cis_core.c:25:5: sparse: sparse: symbol 'create_uvb_poll_window_thread' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_core.c:38:6: sparse: sparse: symbol 'uvb_poll_window_thread_stop' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_core.c:86:5: sparse: sparse: symbol 'init_uvb' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_core.c:111:5: sparse: sparse: symbol 'init_global_vars' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_core.c:120:5: sparse: sparse: symbol 'init_cis_table' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_core.c:130:6: sparse: sparse: symbol 'free_global_vars' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_core.c:136:6: sparse: sparse: symbol 'uninit_uvb' was not declared. Should it be static?
--
>> drivers/firmware/uvb/cis/cis_info_process.c:23:1: sparse: sparse: symbol 'cis_register_lock' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:26:6: sparse: sparse: symbol 'ubios_prepare_output_data' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:45:5: sparse: sparse: symbol 'get_cis_group_info' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:87:22: sparse: sparse: symbol 'search_local_cis_func_node' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:163:31: sparse: sparse: symbol 'uvb_occupy_window' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:225:6: sparse: sparse: symbol 'uvb_free_wd_obtain' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:233:5: sparse: sparse: symbol 'uvb_free_window' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:306:5: sparse: sparse: symbol 'uvb_fill_window' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:331:5: sparse: sparse: symbol 'uvb_poll_window_call' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:353:5: sparse: sparse: symbol 'uvb_poll_window_call_sync' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:370:5: sparse: sparse: symbol 'uvb_get_output_data' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:392:6: sparse: sparse: symbol 'free_io_param_with_buffer' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:402:5: sparse: sparse: symbol 'cis_call_uvb' was not declared. Should it be static?
>> drivers/firmware/uvb/cis/cis_info_process.c:473:5: sparse: sparse: symbol 'cis_call_uvb_sync' was not declared. Should it be static?

vim +/memremap +119 drivers/firmware/uvb/odf/odf_trans.c

24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   27  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  @28  void free_cis_info(void)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   29  {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   30  	u32 i;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   31  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   32  	if (!g_cis_info)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   33  		return;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   34  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   35  	for (i = 0; i < (g_cis_info)->group_count; i++) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   36  		if ((g_cis_info)->groups[i]) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   37  			kfree((g_cis_info)->groups[i]);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   38  			(g_cis_info)->groups[i] = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   39  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   40  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   41  	kfree(g_cis_info);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   42  	g_cis_info = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   43  }
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   44  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   45  static struct cis_group *create_group_from_vs(struct ubios_od_value_struct *vs)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   46  {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   47  	struct ubios_od_list_info list;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   48  	struct cis_group *group;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   49  	int status;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   50  	int i;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   51  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   52  	status = odf_get_list_from_struct(vs, ODF_NAME_CIS_CALL_ID, &list);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   53  	if (status) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04   54  		pr_err("create group: get [call id list] failed, err = %d\n", status);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   55  		return NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   56  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   57  	group = kzalloc(sizeof(struct cis_group) + (sizeof(u32) * list.count), GFP_KERNEL);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   58  	if (!group)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   59  		return NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   60  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   61  	status = odf_get_u32_from_struct(vs, ODF_NAME_CIS_OWNER, &(group->owner_user_id));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   62  	if (status) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04   63  		pr_err("create group: get [owner id] failed, err = %d\n", status);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   64  		goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   65  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   66  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   67  	status = odf_get_u8_from_struct(vs, ODF_NAME_CIS_USAGE, &(group->usage));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   68  	if (status) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04   69  		pr_err("create group: get [usage] failed, err = %d\n", status);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   70  		goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   71  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   72  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   73  	status = odf_get_u8_from_struct(vs, ODF_NAME_CIS_INDEX, &(group->index));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   74  	if (status)
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04   75  		pr_info("cis group not get [index], use default value\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   76  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   77  	status = odf_get_u32_from_struct(vs, ODF_NAME_CIS_FORWARDER_ID, &(group->forwarder_id));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   78  	if (status)
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04   79  		pr_info("cis group not get forwarder, use default value\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   80  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   81  	group->cis_count = list.count;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   82  	for (i = 0; i < list.count; i++) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   83  		status = odf_get_u32_from_list(&list, i, &(group->call_id[i]));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   84  		if (status) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04   85  			pr_err("create group: get each call id failed, err = %d\n", status);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   86  			goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   87  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   88  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   89  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   90  	return group;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   91  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   92  fail:
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   93  	kfree(group);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   94  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   95  	return NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   96  }
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   97  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   98  static int create_cis_info_from_odf(void)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31   99  {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  100  	struct ubios_od_list_info list;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  101  	struct ubios_od_value_struct vs;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  102  	struct ubios_od_value_struct ub_vs;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  103  	struct ubios_ubrt_table *ubrt_table = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  104  	struct acpi_table_header *table = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  105  	u8 *sub_table = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  106  	struct ubios_od_header *header = NULL;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  107  	acpi_status status;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  108  	int i = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  109  	int err = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  110  	u32 sub_table_size = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  111  	int ub_vs_err = 0;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  112  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  113  	status = acpi_get_table(ACPI_SIG_UBRT, 0, &table);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  114  	if (ACPI_SUCCESS(status)) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  115  		ubrt_table = (struct ubios_ubrt_table *)table;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  116  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  117  		for (i = 0; i < ubrt_table->count; i++) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  118  			if (ubrt_table->sub_tables[i].type == UBRT_CALL_ID_SERVICE) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31 @119  				header = memremap(ubrt_table->sub_tables[i].pointer,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31 @120  					sizeof(struct ubios_od_header), MEMREMAP_WB);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  121  				if (!header) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  122  					pr_err("failed to map cis table to od header in ACPI\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  123  					return -ENOMEM;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  124  				}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  125  				sub_table_size = header->total_size;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31 @126  				memunmap(header);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  127  				sub_table = (u8 *)memremap(ubrt_table->sub_tables[i].pointer,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  128  					sub_table_size, MEMREMAP_WB);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  129  				break;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  130  			}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  131  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  132  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  133  		if (!sub_table) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  134  			pr_err("failed to get cis table address in ACPI\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  135  			return -ENOMEM;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  136  		}
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  137  		pr_info("get cis sub table success\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  138  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  139  		err = odf_get_list_from_table(sub_table, ODF_NAME_CIS_GROUP, &list);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  140  		if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  141  			pr_err("create cis info from odf failed, group not found, err = %d\n",
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  142  				err);
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  143  			goto free_sub_table;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  144  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  145  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  146  		ub_vs_err = odf_get_vs_from_table(sub_table, ODF_NAME_CIS_UB, &ub_vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  147  	} else {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  148  		err = odf_get_list(od_root,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  149  				ODF_FILE_NAME_CALL_ID_SERVICE "/" ODF_NAME_CIS_GROUP, &list);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  150  		if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  151  			pr_err("create cis info from odf failed, group not found, err = %d\n",
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  152  				err);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  153  			return err;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  154  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  155  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  156  		ub_vs_err = odf_get_struct(od_root,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  157  				ODF_FILE_NAME_CALL_ID_SERVICE "/" ODF_NAME_CIS_UB, &ub_vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  158  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  159  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  160  	g_cis_info = kzalloc(sizeof(struct cis_info) + (sizeof(void *) * list.count), GFP_KERNEL);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  161  	if (!g_cis_info) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  162  		err = -ENOMEM;
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  163  		goto free_sub_table;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  164  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  165  	g_cis_info->group_count = list.count;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  166  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  167  	err = odf_get_data_from_list(&list, 0, &vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  168  	if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  169  		pr_err("create cis info from odf failed: get data from CIS group failed, err = %d\n",
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  170  			err);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  171  		goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  172  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  173  	for (i = 0; i < list.count; i++) {
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  174  		g_cis_info->groups[i] = create_group_from_vs(&vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  175  		if (!g_cis_info->groups[i]) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  176  			pr_err("create cis group from odf failed\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  177  			err = -ENODATA;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  178  			goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  179  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  180  		(void)odf_next_in_list(&list, &vs);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  181  	}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  182  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  183  	if (!ub_vs_err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  184  		pr_info("found ub struct in cis info\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  185  		err = odf_get_u8_from_struct(&ub_vs, ODF_NAME_CIS_USAGE, &(g_cis_info->ub.usage));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  186  		if (err) {
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  187  			pr_err("create group: get [usage] failed, err = %d\n", status);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  188  			goto fail;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  189  		}
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  190  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  191  		err = odf_get_u8_from_struct(&ub_vs, ODF_NAME_CIS_INDEX, &(g_cis_info->ub.index));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  192  		if (err)
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  193  			pr_warn("ub struct not get [index], use default value\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  194  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  195  		err = odf_get_u32_from_struct(&ub_vs, ODF_NAME_CIS_FORWARDER_ID,
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  196  				&(g_cis_info->ub.forwarder_id));
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  197  		if (err)
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  198  			pr_warn("ub struct not get forwarder, use default value\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  199  	} else
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  200  		pr_warn("not found ub struct in cis info\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  201  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  202  	if (sub_table)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  203  		memunmap(sub_table);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  204  
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  205  	pr_info("get cis table from odf success\n");
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  206  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  207  	return 0;
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  208  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  209  fail:
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  210  	free_cis_info();
c477b8f076e2b3 drivers/firmware/ubios_uvb/odf/odf_trans.c Anonymous_Z 2025-11-04  211  free_sub_table:
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  212  	if (sub_table)
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  213  		memunmap(sub_table);
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  214  
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  215  	return err;
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  216  }
24fa96b6e010d0 drivers/ubios_uvb/odf/odf_trans.c          Anonymous_Z 2025-10-31  217  

:::::: The code at line 119 was first introduced by commit
:::::: 24fa96b6e010d05e59d99562a415b1a64544e292 ubios_uvb: support UBIOS object description specification parse

:::::: TO: Anonymous_Z <zhangrui182@huawei.com>
:::::: CC: t30009442 <tangce1@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
