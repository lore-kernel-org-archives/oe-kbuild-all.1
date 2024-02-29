Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20174C1B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709241842; cv=none; b=OzTWIJyaJaM5WM++618p1bwGNlwWeY9kFTvkdzhPSHlAav7UMjtJn+tvjLDQENEfqztDLjNXKPBMumc9SmXuCtj4TNH0gZo4/vwTegZPYQzV6tR1aqJkdNB0Wl/xWybIDF2F50jtzbGY2na/1aEM5krlPesUVxkZFuD8PG/jQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709241842; c=relaxed/simple;
	bh=Kg1zK5x0zfXqjxN9uM+sr0RL5dUiq3ZH20GfQp2PUOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TuFiyHLVETV5wvlHbN9xahmO7cFBMyPpUxBl0bvxKlXxDCXObIvgsDYCnRrDaDRM3T5OJT7IpDewysqdaPgmWsfKDAfKwr01KZjjTzZGjJyKa/HnFtQWlbwck8dxJ0QEzqwzJraKLmdmAhwX9AVTKdwETMpO3k1/pSpAgNiCHk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWna1nJf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWna1nJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709241840; x=1740777840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kg1zK5x0zfXqjxN9uM+sr0RL5dUiq3ZH20GfQp2PUOk=;
  b=jWna1nJfQcO9g6/Y2cz3FRoQrz8a2qWzEJ0eV2kyVcKCzX3ZHGteqXpX
   t1uDmS8qeirrS3+fNWbQsRq//pVzYIPf605SsEU2wL1Ofd8HE//gerB3v
   wWrifM/NYBh5bhy1KV12Z4zdiorQWYcJHH+efT8/7dFAhIwfcfg/WYsAk
   eDtXezHrf56YrFDnK3vp3lmUHFE9xGLmvGd6S2iq/3NQwxs5KeG0Aw+Yq
   r1xKy1/QHHTjNLIQy+vmjhEiaeATD/OYdoo7HCkw9QN4ZcXb71l65TuCO
   UzuioS1zlpzcV0hrf3CR2id4IFW2SNq8X3SeD38m2qt4ePGSQlCxv2KTh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3635283"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3635283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 13:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="38806501"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Feb 2024 13:23:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfnsh-000DIZ-2r;
	Thu, 29 Feb 2024 21:23:55 +0000
Date: Fri, 1 Mar 2024 05:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-testing 5/6] include/ras/ras_event.h:494: undefined
 reference to `__tracepoint_cper_cxl_gen_event'
Message-ID: <202403010527.QVTDAyL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   6c540a23cb1194d67a9dcfefb702774a99afc3b1
commit: 2b9557834645e8bef6b602691c392c898d45afa2 [5/6] ras/events: Trace CXL CPER events even without the CXL stack loaded
config: x86_64-randconfig-011-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010527.QVTDAyL7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010527.QVTDAyL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010527.QVTDAyL7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `trace_cper_cxl_gen_event':
>> include/ras/ras_event.h:494: undefined reference to `__tracepoint_cper_cxl_gen_event'
>> ld: include/ras/ras_event.h:494: undefined reference to `__tracepoint_cper_cxl_gen_event'
>> ld: include/ras/ras_event.h:494: undefined reference to `__SCT__tp_func_cper_cxl_gen_event'
>> ld: include/ras/ras_event.h:494: undefined reference to `__tracepoint_cper_cxl_gen_event'
>> ld: vmlinux.o:(__jump_table+0x17ae8): undefined reference to `__tracepoint_cper_cxl_gen_event'
>> ld: vmlinux.o:(.static_call_sites+0x3d7c): undefined reference to `__SCK__tp_func_cper_cxl_gen_event'


vim +494 include/ras/ras_event.h

   443	
   444	/*
   445	 * Define macros for the common header of each CPER CXL event.
   446	 *
   447	 * Tracepoints using these macros must do 3 things:
   448	 *
   449	 *	1) Add CPER_CXL_EVT_TP_entry to TP_STRUCT__entry
   450	 *	2) Use CPER_CXL_EVT_TP_fast_assign within TP_fast_assign;
   451	 *	   pass the serial number and CXL event header
   452	 *	3) Use CPER_CXL_EVT_TP_printk() instead of TP_printk()
   453	 *
   454	 * See the generic_event tracepoint as an example.
   455	 */
   456	#define CPER_CXL_EVT_TP_entry					\
   457		__field(u16, segment)					\
   458		__field(u8, bus)					\
   459		__field(u8, device)					\
   460		__field(u8, func)					\
   461		__field(u64, serial)					\
   462		__field(u32, hdr_flags)					\
   463		__field(u16, hdr_handle)				\
   464		__field(u16, hdr_related_handle)			\
   465		__field(u64, hdr_timestamp)				\
   466		__field(u8, hdr_length)					\
   467		__field(u8, hdr_maint_op_class)
   468	
   469	#define CPER_CXL_EVT_TP_fast_assign(cper_rec, evt_hdr)				\
   470		__entry->segment = cper_rec->hdr.device_id.segment_num;			\
   471		__entry->bus = cper_rec->hdr.device_id.bus_num;				\
   472		__entry->device = cper_rec->hdr.device_id.device_num;			\
   473		__entry->func = cper_rec->hdr.device_id.func_num;			\
   474		__entry->serial = (((u64)cper_rec->hdr.dev_serial_num.upper_dw) << 32) |\
   475				 cper_rec->hdr.dev_serial_num.lower_dw;			\
   476		__entry->hdr_length = (evt_hdr).length;					\
   477		__entry->hdr_flags = get_unaligned_le24((evt_hdr).flags);		\
   478		__entry->hdr_handle = le16_to_cpu((evt_hdr).handle);			\
   479		__entry->hdr_related_handle = le16_to_cpu((evt_hdr).related_handle);	\
   480		__entry->hdr_timestamp = le64_to_cpu((evt_hdr).timestamp);		\
   481		__entry->hdr_maint_op_class = (evt_hdr).maint_op_class
   482	
   483	#define CPER_CXL_EVT_TP_printk(fmt, ...) 					\
   484		TP_printk("PCIe=%04x:%02x:%02x.%02x serial=%lld : time=%llu "		\
   485			"len=%d flags='%s' handle=%x related_handle=%x "		\
   486			"maint_op_class=%u : " fmt,					\
   487			__entry->segment, __entry->bus, __entry->device, __entry->func,	\
   488			__entry->serial,						\
   489			__entry->hdr_timestamp, __entry->hdr_length,			\
   490			show_hdr_flags(__entry->hdr_flags), __entry->hdr_handle,	\
   491			__entry->hdr_related_handle, __entry->hdr_maint_op_class,	\
   492			##__VA_ARGS__)
   493	
 > 494	TRACE_EVENT(cper_cxl_gen_event,
   495	
   496		TP_PROTO(struct cxl_cper_event_rec *cper_rec,
   497			 struct cxl_event_generic *gen_rec),
   498	
   499		TP_ARGS(cper_rec, gen_rec),
   500	
   501		TP_STRUCT__entry(
   502			CPER_CXL_EVT_TP_entry
   503			__array(u8, data, CXL_EVENT_RECORD_DATA_LENGTH)
   504		),
   505	
   506		TP_fast_assign(
   507			CPER_CXL_EVT_TP_fast_assign(cper_rec, gen_rec->hdr);
   508			memcpy(__entry->data, gen_rec->data, CXL_EVENT_RECORD_DATA_LENGTH);
   509		),
   510	
   511		CPER_CXL_EVT_TP_printk("%s",
   512			__print_hex(__entry->data, CXL_EVENT_RECORD_DATA_LENGTH))
   513	);
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
