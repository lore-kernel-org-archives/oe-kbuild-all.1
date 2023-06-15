Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3694312B94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686841811; x=1718377811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hytARiu28BKP+6jh/To/QBgr6B1OGNq8gj96WPcgnKU=;
  b=mkUhAGd6jteMbX5JRAgECl3xZZgD9hLhmVTXz84+LVXVLg3AcErTLQ8/
   +H61kyGTl+g3b6oQmFR/ssL21hf+nbxyThtGE/wQHaQTfOprmrTZhtOsk
   UrjWwhQmktAcGK6l+ZF0UKhj373O9oMwan389VD85mBQ6UkRtGZTVecld
   HRXZCBexjenmK0XthqSLTY/Shr4JWQPx0qMveySktCE8t3k5BaQqJqAsX
   0JOmGmO4m4KfeGxJxw638cuu1jblYXuYk1PCC2L8McJ3fUVyFEXAqAQsN
   Y5wBI0o24SciRVo/v0m5pFOEjafwNtUJSAiD5gMKHO9cJz90pJP+QJvvn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338565480"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="338565480"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 08:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="662826626"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="662826626"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Jun 2023 08:07:35 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9oZT-00004z-0Z;
	Thu, 15 Jun 2023 15:07:35 +0000
Date: Thu, 15 Jun 2023 23:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Moeller <jon.moeller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_t 4808/30000]
 drivers/platform/x86/sepdk/sep/pebs.c:978:13: warning: variable 'cur_grp'
 set but not used
Message-ID: <202306152301.bnrFR3pB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jon,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   73bac264a173617a7d813635c0731ba6ceb345e8
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [4808/30000] platform/x86: add sep and socwatch drivers without socperf.
config: i386-randconfig-r023-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152301.bnrFR3pB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/fadb19e08fbf603c6b11d9c45dbf33accdd58016
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout fadb19e08fbf603c6b11d9c45dbf33accdd58016
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152301.bnrFR3pB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/sepdk/pax/pax.c:82:11: warning: 'nmi_watchdog_restore' defined but not used [-Wunused-variable]
      82 | static S8 nmi_watchdog_restore = '0';
         |           ^~~~~~~~~~~~~~~~~~~~
--
   drivers/platform/x86/sepdk/sep/sys_info.c: In function 'sys_info_Fill_CPUID':
>> drivers/platform/x86/sepdk/sep/sys_info.c:321:13: warning: variable 'model' set but not used [-Wunused-but-set-variable]
     321 |         U32 model = 0;
         |             ^~~~~
--
   drivers/platform/x86/sepdk/sep/pebs.c: In function 'PEBS_Flush_Buffer':
>> drivers/platform/x86/sepdk/sep/pebs.c:978:13: warning: variable 'cur_grp' set but not used [-Wunused-but-set-variable]
     978 |         U32 cur_grp;
         |             ^~~~~~~


vim +/cur_grp +978 drivers/platform/x86/sepdk/sep/pebs.c

   945	
   946	/* ------------------------------------------------------------------------- */
   947	/*!
   948	 * @fn          VOID PEBS_Flush_Buffer (VOID * param)
   949	 *
   950	 * @brief       generate sampling records from PEBS records in PEBS buffer
   951	 *
   952	 * @param       param        -- not used
   953	 *
   954	 * @return      NONE
   955	 *
   956	 * <I>Special Notes:</I>
   957	 */
   958	VOID PEBS_Flush_Buffer(VOID *param)
   959	{
   960		U32 i, this_cpu, index, desc_id;
   961		U64 pebs_overflow_status = 0;
   962		U64 lbr_tos_from_ip = 0ULL;
   963		DRV_BOOL counter_overflowed = FALSE;
   964		// ECB pecb;
   965		CPU_STATE pcpu;
   966		EVENT_DESC evt_desc;
   967		BUFFER_DESC bd;
   968		SampleRecordPC *psamp_pebs;
   969		U32 is_64bit_addr = FALSE;
   970		U32 u32PebsRecordNumFilled;
   971	#if defined(DRV_IA32)
   972		U32 seg_cs;
   973		U32 csdlo;
   974		U32 csdhi;
   975	#endif
   976		U32 dev_idx;
   977		DEV_CONFIG pcfg;
 > 978		U32 cur_grp;
   979		DRV_BOOL multi_pebs_enabled;
   980	
   981		SEP_DRV_LOG_TRACE_IN("Param: %p.", param);
   982	
   983		this_cpu = CONTROL_THIS_CPU();
   984		pcpu = &pcb[this_cpu];
   985		bd = &cpu_buf[this_cpu];
   986		dev_idx = core_to_dev_map[this_cpu];
   987		pcfg = LWPMU_DEVICE_pcfg(&devices[dev_idx]);
   988		cur_grp = CPU_STATE_current_group(pcpu);
   989		multi_pebs_enabled =
   990			(DEV_CONFIG_pebs_mode(pcfg) &&
   991			 (DEV_CONFIG_pebs_record_num(pcfg) > 1) &&
   992			 (DRV_SETUP_INFO_page_table_isolation(&req_drv_setup_info) ==
   993			  DRV_SETUP_INFO_PTI_DISABLED));
   994	
   995		if (!multi_pebs_enabled) {
   996			SEP_DRV_LOG_TRACE_OUT("PEBS_Flush_Buffer is not supported.");
   997			return;
   998		}
   999	
  1000		u32PebsRecordNumFilled = PEBS_Get_Num_Records_Filled();
  1001		for (i = 0; i < u32PebsRecordNumFilled; i++) {
  1002			pebs_overflow_status = PEBS_Overflowed(this_cpu, 0, i);
  1003			SEP_DRV_LOG_TRACE("Pebs_overflow_status = 0x%llx, i=%d.",
  1004					  pebs_overflow_status, i);
  1005	
  1006			// pecb = LWPMU_DEVICE_PMU_register_data(
  1007			// 	&devices[dev_idx])[cur_grp];
  1008			FOR_EACH_DATA_REG(pecb, j)
  1009			{
  1010				if ((!DEV_CONFIG_enable_adaptive_pebs(pcfg) &&
  1011				     !ECB_entries_is_gp_reg_get(pecb, j)) ||
  1012				    !ECB_entries_precise_get(pecb, j)) {
  1013					continue;
  1014				}
  1015				if (ECB_entries_fixed_reg_get(pecb, j)) {
  1016					index = ECB_entries_reg_id(pecb, j) -
  1017						IA32_FIXED_CTR0;
  1018					if (pebs_overflow_status &
  1019					    ((U64)1 << (32 + index))) {
  1020						counter_overflowed = TRUE;
  1021					}
  1022				} else {
  1023					index = ECB_entries_reg_id(pecb, j) - IA32_PMC0;
  1024					if (pebs_overflow_status & (U64)1 << index) {
  1025						counter_overflowed = TRUE;
  1026					}
  1027				}
  1028				if (counter_overflowed) {
  1029					desc_id = ECB_entries_event_id_index(pecb, j);
  1030					evt_desc = desc_data[desc_id];
  1031					SEP_DRV_LOG_TRACE(
  1032						"Event_id_index=%u, desc_id=%u.",
  1033						ECB_entries_event_id_index(pecb, j),
  1034						desc_id);
  1035					psamp_pebs = (SampleRecordPC *)
  1036						OUTPUT_Reserve_Buffer_Space(
  1037							bd,
  1038							EVENT_DESC_sample_size(
  1039								evt_desc),
  1040							(NMI_mode) ? TRUE : FALSE,
  1041							!SEP_IN_NOTIFICATION,
  1042							(S32)this_cpu);
  1043					if (!psamp_pebs) {
  1044						SEP_DRV_LOG_ERROR(
  1045							"Could not generate samples from PEBS records.");
  1046						continue;
  1047					}
  1048	
  1049					lbr_tos_from_ip = 0ULL;
  1050					CPU_STATE_num_samples(&pcb[this_cpu]) += 1;
  1051					SAMPLE_RECORD_descriptor_id(psamp_pebs) =
  1052						desc_id;
  1053					SAMPLE_RECORD_event_index(psamp_pebs) =
  1054						ECB_entries_event_id_index(pecb, j);
  1055					SAMPLE_RECORD_pid_rec_index(psamp_pebs) =
  1056						(U32)-1;
  1057					SAMPLE_RECORD_pid_rec_index_raw(psamp_pebs) = 1;
  1058					SAMPLE_RECORD_tid(psamp_pebs) = (U32)-1;
  1059					SAMPLE_RECORD_cpu_num(psamp_pebs) =
  1060						(U16)this_cpu;
  1061					SAMPLE_RECORD_osid(psamp_pebs) = 0;
  1062	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
