Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE9396B77
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776338564; cv=none; b=nj21CczBKU+Bj5IFDU0Sq1KFJCRO5+6RgAdERB/EEC4YW3NGRCpQugDffvulUpXW8JM8fD65yjqxGis6cSbop7xUbVJyTr+VXWpuUfuFgzzFmHcNpdPiT/s6pvlK97nDBN8okLdqJ7Mj0PqgFf2i/yiii/bmEXrbZh6L1ff5IlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776338564; c=relaxed/simple;
	bh=qGMAGZEb7nw8ioDqrDV2RlJjOdmLD+zs3N2UGGPrvW4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=olme0vzp8KQxiwfo8qUZUBLTpsBHyC2OXxYBAnUdFTYP/sLS564ljVqyIiop0Ks5qpY9i3xFgvqOCMrMnJvSMb3is4IEywgO8MQ7tZzrjaoARUIswzZgsIJ2iH/fkNM4VYC0uB62z7JD1pU+Pt23NTdygPw0enHgt4MjMtwnsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObiwzbEO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObiwzbEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776338560; x=1807874560;
  h=date:from:to:cc:subject:message-id;
  bh=qGMAGZEb7nw8ioDqrDV2RlJjOdmLD+zs3N2UGGPrvW4=;
  b=ObiwzbEOYQSDLe5K/JPeYrkR45/CXcZHIWS+/ggyQtiPop6mFNgPTa85
   DRcPQTTWxad3Z/zGuHaBI6oibGzO00yrGdApdqfxB23k39qvcV1kh93DF
   wde1jnaN0peYc9V2N5SP67cRL/T0XOQ4b57v80n9DldpneDuGfISUf0DC
   PU7SV2dfZ3b6l/gh/rMX460jCRANEJwEUJEBy0MswIOfZdW5coyFi3bxd
   Oj94rde/UXAOymxWMCdnE7Qb57Fbux/KiPxZKpPWUEQmu7P1VJGl7megG
   PbW7OcWpI14zBSxhvL13fPetRsmhkVqsPpIoSn2af9N08N9qk6ii7b+LC
   Q==;
X-CSE-ConnectionGUID: 5N+tgVNMSrWcfjxyTVG3mw==
X-CSE-MsgGUID: y//oKxPHQhubprOqaYcYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77241819"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77241819"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:22:39 -0700
X-CSE-ConnectionGUID: ZxWA4k8LTUCHDONtOGLgiw==
X-CSE-MsgGUID: yRa/LnV8SD6WjxCwfsrWow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="254162461"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2026 04:22:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDKnr-0000000012D-1IZX;
	Thu, 16 Apr 2026 11:22:35 +0000
Date: Thu, 16 Apr 2026 13:22:03 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Ertman <david.m.ertman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_main.c:2307:22: error:
 'ICE_SHUTTING_DOWN' undeclared
Message-ID: <202604161354.ldoCwlZP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aleksandr-Loktionov/ice-fix-mirroring-to-VSI-list/20260413-202208
head:   22573fa472835040cfaa6e142693f725a323fe34
commit: 49829521bd70acc1d6d3b9fbba65b35642922ed4 ice: disallow service task to run while driver is unloading
date:   3 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260416/202604161354.ldoCwlZP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161354.ldoCwlZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161354.ldoCwlZP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/log2.h:12,
                    from include/asm-generic/getorder.h:8,
                    from arch/x86/include/asm/page.h:84,
                    from arch/x86/include/asm/user_64.h:6,
                    from arch/x86/include/asm/user.h:8,
                    from include/linux/user.h:1,
                    from include/linux/elfcore.h:5,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
   drivers/net/ethernet/intel/ice/ice_main.c: In function 'ice_service_task':
>> drivers/net/ethernet/intel/ice/ice_main.c:2307:22: error: 'ICE_SHUTTING_DOWN' undeclared (first use in this function)
    2307 |             test_bit(ICE_SHUTTING_DOWN, pf->state) ||
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   drivers/net/ethernet/intel/ice/ice_main.c:2307:13: note: in expansion of macro 'test_bit'
    2307 |             test_bit(ICE_SHUTTING_DOWN, pf->state) ||
         |             ^~~~~~~~
   drivers/net/ethernet/intel/ice/ice_main.c:2307:22: note: each undeclared identifier is reported only once for each function it appears in
    2307 |             test_bit(ICE_SHUTTING_DOWN, pf->state) ||
         |                      ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   drivers/net/ethernet/intel/ice/ice_main.c:2307:13: note: in expansion of macro 'test_bit'
    2307 |             test_bit(ICE_SHUTTING_DOWN, pf->state) ||
         |             ^~~~~~~~


vim +/ICE_SHUTTING_DOWN +2307 drivers/net/ethernet/intel/ice/ice_main.c

  2287	
  2288	/**
  2289	 * ice_service_task - manage and run subtasks
  2290	 * @work: pointer to work_struct contained by the PF struct
  2291	 */
  2292	static void ice_service_task(struct work_struct *work)
  2293	{
  2294		struct ice_pf *pf = container_of(work, struct ice_pf, serv_task);
  2295		unsigned long start_time = jiffies;
  2296	
  2297		if (pf->health_reporters.tx_hang_buf.tx_ring) {
  2298			ice_report_tx_hang(pf);
  2299			pf->health_reporters.tx_hang_buf.tx_ring = NULL;
  2300		}
  2301	
  2302		ice_reset_subtask(pf);
  2303	
  2304		/* bail if a reset/recovery cycle is pending or rebuild failed */
  2305		if (ice_is_reset_in_progress(pf->state) ||
  2306		    test_bit(ICE_SUSPENDED, pf->state) ||
> 2307		    test_bit(ICE_SHUTTING_DOWN, pf->state) ||
  2308		    test_bit(ICE_NEEDS_RESTART, pf->state)) {
  2309			ice_service_task_complete(pf);
  2310			return;
  2311		}
  2312	
  2313		if (test_and_clear_bit(ICE_AUX_ERR_PENDING, pf->state)) {
  2314			struct iidc_rdma_event *event;
  2315	
  2316			event = kzalloc_obj(*event);
  2317			if (event) {
  2318				set_bit(IIDC_RDMA_EVENT_CRIT_ERR, event->type);
  2319				/* report the entire OICR value to AUX driver */
  2320				swap(event->reg, pf->oicr_err_reg);
  2321				ice_send_event_to_aux(pf, event);
  2322				kfree(event);
  2323			}
  2324		}
  2325	
  2326		/* unplug aux dev per request, if an unplug request came in
  2327		 * while processing a plug request, this will handle it
  2328		 */
  2329		if (test_and_clear_bit(ICE_FLAG_UNPLUG_AUX_DEV, pf->flags))
  2330			ice_unplug_aux_dev(pf);
  2331	
  2332		/* Plug aux device per request */
  2333		if (test_and_clear_bit(ICE_FLAG_PLUG_AUX_DEV, pf->flags))
  2334			ice_plug_aux_dev(pf);
  2335	
  2336		if (test_and_clear_bit(ICE_FLAG_MTU_CHANGED, pf->flags)) {
  2337			struct iidc_rdma_event *event;
  2338	
  2339			event = kzalloc_obj(*event);
  2340			if (event) {
  2341				set_bit(IIDC_RDMA_EVENT_AFTER_MTU_CHANGE, event->type);
  2342				ice_send_event_to_aux(pf, event);
  2343				kfree(event);
  2344			}
  2345		}
  2346	
  2347		ice_clean_adminq_subtask(pf);
  2348		ice_check_media_subtask(pf);
  2349		ice_check_for_hang_subtask(pf);
  2350		ice_sync_fltr_subtask(pf);
  2351		ice_handle_mdd_event(pf);
  2352		ice_watchdog_subtask(pf);
  2353	
  2354		if (ice_is_safe_mode(pf)) {
  2355			ice_service_task_complete(pf);
  2356			return;
  2357		}
  2358	
  2359		ice_process_vflr_event(pf);
  2360		ice_clean_mailboxq_subtask(pf);
  2361		ice_clean_sbq_subtask(pf);
  2362		ice_sync_arfs_fltrs(pf);
  2363		ice_flush_fdir_ctx(pf);
  2364	
  2365		/* Clear ICE_SERVICE_SCHED flag to allow scheduling next event */
  2366		ice_service_task_complete(pf);
  2367	
  2368		/* If the tasks have taken longer than one service timer period
  2369		 * or there is more work to be done, reset the service timer to
  2370		 * schedule the service task now.
  2371		 */
  2372		if (time_after(jiffies, (start_time + pf->serv_tmr_period)) ||
  2373		    test_bit(ICE_MDD_EVENT_PENDING, pf->state) ||
  2374		    test_bit(ICE_VFLR_EVENT_PENDING, pf->state) ||
  2375		    test_bit(ICE_MAILBOXQ_EVENT_PENDING, pf->state) ||
  2376		    test_bit(ICE_FD_VF_FLUSH_CTX, pf->state) ||
  2377		    test_bit(ICE_SIDEBANDQ_EVENT_PENDING, pf->state) ||
  2378		    test_bit(ICE_ADMINQ_EVENT_PENDING, pf->state))
  2379			mod_timer(&pf->serv_tmr, jiffies);
  2380	}
  2381	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
