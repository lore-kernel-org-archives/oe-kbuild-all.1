Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A05185B4C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734865735; cv=none; b=DvX5CMX3lumR1GuR2afMfdVwRrdQ6zVyN3kjrS2snR4WHz5a76Tk01gqaqO5gbLW2t/9gDxliOiFfoYNNhc3H5hlWP40JI8SKHZjdFsT9EGHCqr2wmjA2bOP2AwxNmdGX0ZRHD94zDrkANTtCHNXygawwkCThHQJi0a7VxzTXYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734865735; c=relaxed/simple;
	bh=n8048NRyn7PBLZ23hELMaaElC9AGDKGK/evqdpOUWBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tc7obqJqQrdq1Tw2ZtGBjOXziF0tE/QbDIEVDbtxABS/sX02a4NtArt3HGpNIxnfpePzoYSDja+6EEyygzGr+y/GA5ZR+qy+JKJ6vkTsuCA1jjKwreba3yu7lwLmDlqQ55sOMCfn0opfqRgJvNbZI2OdDEQV8oBUvG1ISyZLmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQNQnXaq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQNQnXaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734865733; x=1766401733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n8048NRyn7PBLZ23hELMaaElC9AGDKGK/evqdpOUWBM=;
  b=BQNQnXaqSAIzcdJVsmGcFMkUTyooiX7OXLtzjoobM7kSpObQuwXYnR+p
   5IUfI9Krm9D61MfYPiGhGnF4UT3NT/95G6550fmyKqEZe5Rs4ulS5rcu3
   GjZ54h8MeoT4gKwLt5EkJqRHa6uXG+PPsEXlcIOxEm8TIZPBnMwmjph3C
   DO8ovT+tMJ/uD98F7dzoYBWSMuI858uLVr66WkBLULPADdsnFmbeq9wPV
   /gWiqfElBtsFKOQWVeLxcYgklq1+QTJTvLen1A/AkNJ5dqTboSLQlAqCd
   I72tU+tDmqMyCxFziRNEoFWxmUxtyixRc/KhnuQFgBge6d7axalWNPBxX
   g==;
X-CSE-ConnectionGUID: WvdsHznHRCqpbFvH3cRVmA==
X-CSE-MsgGUID: 5lh1VXxmTleH1AXOI0BG8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="46773188"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="46773188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 03:08:53 -0800
X-CSE-ConnectionGUID: yOlhpQe8RRqkLbU+Ajv9Ug==
X-CSE-MsgGUID: A23OSwsLT3SvwoIvvBs6ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103570788"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Dec 2024 03:08:51 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPJpJ-0002sR-27;
	Sun, 22 Dec 2024 11:08:49 +0000
Date: Sun, 22 Dec 2024 19:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Kooran Paul, Princy" <princy.kooran.paul@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [intel-lts:6.12/linux 827/1030]
 drivers/gpu/drm/i915/gt/iov/selftests/selftest_live_iov_relay.c:351:12:
 warning: stack frame size (2104) exceeds limit (2048) in
 'pf_full_loopback_to_vf'
Message-ID: <202412221917.l2B2l0EI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   b4412bb81319acf5aa9334b91c917b1899ffd570
commit: d1d592bf75f7753518169d36bcc2dd9d196e27e3 [827/1030] drm/i915: SR-IOV Enabling and Support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241222/202412221917.l2B2l0EI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221917.l2B2l0EI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221917.l2B2l0EI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_relay.c:12:
   In file included from drivers/gpu/drm/i915/gt/intel_gt.h:9:
   In file included from drivers/gpu/drm/i915/gt/intel_engine_types.h:21:
   In file included from drivers/gpu/drm/i915/i915_pmu.h:11:
   In file included from include/linux/perf_event.h:18:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/x86/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_relay.c:723:
>> drivers/gpu/drm/i915/gt/iov/selftests/selftest_live_iov_relay.c:351:12: warning: stack frame size (2104) exceeds limit (2048) in 'pf_full_loopback_to_vf' [-Wframe-larger-than]
     351 | static int pf_full_loopback_to_vf(void *arg)
         |            ^
>> drivers/gpu/drm/i915/gt/iov/selftests/selftest_live_iov_relay.c:441:12: warning: stack frame size (2088) exceeds limit (2048) in 'relay_request_to_pf' [-Wframe-larger-than]
     441 | static int relay_request_to_pf(struct intel_iov *iov)
         |            ^
   6 warnings generated.


vim +/pf_full_loopback_to_vf +351 drivers/gpu/drm/i915/gt/iov/selftests/selftest_live_iov_relay.c

   350	
 > 351	static int pf_full_loopback_to_vf(void *arg)
   352	{
   353		struct intel_iov *iov = arg;
   354		u32 msg[PF2GUC_RELAY_TO_VF_REQUEST_MSG_NUM_RELAY_DATA] = {
   355			MSG_IOV_SELFTEST_RELAY(SELFTEST_RELAY_OPCODE_NOP),
   356			FIELD_PREP(GUC_HXG_REQUEST_MSG_n_DATAn, SELFTEST_RELAY_DATA),
   357			/* ... */
   358		};
   359		u32 buf[PF2GUC_RELAY_TO_VF_REQUEST_MSG_NUM_RELAY_DATA];
   360		unsigned int n;
   361		int ret = 0;
   362	
   363		iov->relay.selftest.enable_loopback = 1;
   364	
   365		for (n = GUC_HXG_MSG_MIN_LEN; n <= ARRAY_SIZE(msg); n++) {
   366	
   367			ret = intel_iov_relay_send_to_vf(&iov->relay, PFID, msg, n,
   368							 buf, ARRAY_SIZE(buf));
   369	
   370			if (ret < 0) {
   371				IOV_SELFTEST_ERROR(iov, "failed to send msg len=%u, %d\n", n, ret);
   372				break;
   373			}
   374	
   375			if (ret != GUC_HXG_MSG_MIN_LEN) {
   376				IOV_SELFTEST_ERROR(iov, "unexpected nop reply len=%u, %d\n", n, ret);
   377				ret = -ENODATA;
   378				break;
   379			}
   380	
   381			ret = 0;
   382		}
   383	
   384		iov->relay.selftest.enable_loopback = 0;
   385	
   386		return ret;
   387	}
   388	
   389	static int pf_loopback_one_way_to_pf(void *arg)
   390	{
   391		struct intel_iov *iov = arg;
   392		u32 msg[VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA] = {
   393			MSG_IOV_SELFTEST_RELAY_EVENT(SELFTEST_RELAY_OPCODE_NOP),
   394			FIELD_PREP(GUC_HXG_REQUEST_MSG_n_DATAn, SELFTEST_RELAY_DATA),
   395			/* ... */
   396		};
   397		struct payload_params params;
   398		unsigned int n;
   399		int ret = 0;
   400	
   401		iov->relay.selftest.disable_strict = 1;
   402	
   403		for (n = GUC_HXG_MSG_MIN_LEN; n <= ARRAY_SIZE(msg); n++) {
   404	
   405			params.vfid = PFID;
   406			params.relayid = SELFTEST_RELAY_ID + n;
   407			params.data = msg;
   408			params.len = n;
   409	
   410			WRITE_ONCE(iov->relay.selftest.data, &params);
   411			WRITE_ONCE(iov->relay.selftest.guc2pf, guc2pf_payload_checker);
   412	
   413			/* can't use intel_iov_relay_send_to_pf() as we need our relayid */
   414			ret = relay_send(&iov->relay, 0, params.relayid, msg, n);
   415	
   416			if (ret) {
   417				IOV_SELFTEST_ERROR(iov, "len=%u, %d\n", n, ret);
   418				break;
   419			}
   420	
   421			ret = wait_for(IS_ERR_OR_NULL(READ_ONCE(iov->relay.selftest.guc2pf)), 200);
   422			if (ret) {
   423				IOV_SELFTEST_ERROR(iov, "message not received len=%u, %d\n", n, ret);
   424				break;
   425			}
   426	
   427			ret = PTR_ERR_OR_ZERO(iov->relay.selftest.guc2pf);
   428			if (ret) {
   429				IOV_SELFTEST_ERROR(iov, "corrupted message len=%u, %d\n", n, ret);
   430				break;
   431			}
   432		}
   433	
   434		iov->relay.selftest.disable_strict = 0;
   435		WRITE_ONCE(iov->relay.selftest.guc2pf, NULL);
   436		WRITE_ONCE(iov->relay.selftest.data, NULL);
   437	
   438		return ret;
   439	}
   440	
 > 441	static int relay_request_to_pf(struct intel_iov *iov)
   442	{
   443		u32 msg[VF2GUC_RELAY_TO_PF_REQUEST_MSG_NUM_RELAY_DATA] = {
   444			MSG_IOV_SELFTEST_RELAY(SELFTEST_RELAY_OPCODE_NOP),
   445			FIELD_PREP(GUC_HXG_REQUEST_MSG_n_DATAn, SELFTEST_RELAY_DATA),
   446			/* ... */
   447		};
   448		u32 buf[PF2GUC_RELAY_TO_VF_REQUEST_MSG_NUM_RELAY_DATA];
   449		unsigned int n;
   450		int ret = 0;
   451	
   452		for (n = GUC_HXG_MSG_MIN_LEN; n <= ARRAY_SIZE(msg); n++) {
   453	
   454			ret = intel_iov_relay_send_to_pf(&iov->relay, msg, n,
   455							 buf, ARRAY_SIZE(buf));
   456	
   457			if (ret < 0) {
   458				IOV_SELFTEST_ERROR(iov, "failed to send len=%u, %d\n", n, ret);
   459				break;
   460			}
   461	
   462			if (ret != GUC_HXG_MSG_MIN_LEN) {
   463				IOV_SELFTEST_ERROR(iov, "unexpected nop reply len=%u, %d\n", n, ret);
   464				ret = -ENODATA;
   465				break;
   466			}
   467	
   468			ret = 0;
   469		}
   470	
   471		return ret;
   472	}
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
