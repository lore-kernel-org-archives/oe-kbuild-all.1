Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7143DEC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325941; cv=none; b=p4znt7BTF6HGdLD9dEeFs0mARtezbVKAgeRNNsV8GPe5oR0hMiHeFdpcexjiiad3rANdALOgloVBMTkSCbeZBOt3mT0AdaqkaPPeJYsHvLibJ4F0T48FAw8fIUBgMfihRIofgwpD1CxL1gJwd/AAg0/4NLgkzxF3JBvtf+AgKU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325941; c=relaxed/simple;
	bh=2YGK0HpCY7p6dz7u7ks8jtbPkSrY8kAt+WnDkehAiD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DzXv78um3de7MXSKNjGigEOTklcM4ehiCIs+BQrQKn8tWVFrLTrszG4PJsHb+vU4FvIlentUykQn4bpMAxpk+EQnUPsZnYtVwe70p+GXpTYDJolgE/bC42edZRDDdgT+hXwtTJxcn8F4SoLD/44uV/r9UUSv0Vo+tD3z/uhCFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLz8v4y7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLz8v4y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790325937; x=1821861937;
  h=date:from:to:cc:subject:message-id;
  bh=2YGK0HpCY7p6dz7u7ks8jtbPkSrY8kAt+WnDkehAiD0=;
  b=HLz8v4y7cw0KvtT8mphAMlzdV51JTAK9s3quPFM0D9pQEzTvJUIwa0wT
   8LHHdpO5lHgn2+6PwHBhhzxzU/1OWeSUA3bVNKARaCO6I5BV6Z+1zYfiT
   62+Nlqm2iGjLRCCTZQK4cnIgBHzBOa/p2l86kaxDhfvOtZIDCrsmVA0Qh
   MiZthHQzxmGYwn6Z5PJ2IyRC6EnlbPzK1MdJpbrbQE1TPIN5V/UsCrCjX
   htAkzwImpMUuhCS60yPZBhzEhsJCP7dnLJYvRHSItwL1GEHYRdQ6dAYdS
   u6yEPNoudwhqJT0u7k0BXzIfWiGHOjoS1ZOYZv5bzpizqLmeY4Tcx/WVa
   Q==;
X-CSE-ConnectionGUID: fjNWXTT+RqyX08SrnRo4nw==
X-CSE-MsgGUID: 5+KcsfC0QmqZUFP0oXsfiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90169933"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90169933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:45:30 -0700
X-CSE-ConnectionGUID: JPe/Dp5aTHC6KuN61FdWoA==
X-CSE-MsgGUID: MofPbo80Qt+wmWi11Sz9IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272854570"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2026 01:45:28 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA1Yc-000000000fK-1YJX;
	Fri, 25 Sep 2026 08:45:26 +0000
Date: Fri, 25 Sep 2026 10:44:42 +0200
From: kernel test robot <lkp@intel.com>
To: Gang Ba <Gang.Ba@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Jay Cornwall <jay.cornwall@amd.com>
Subject: [drm-amdgpu:drm-amdgpu-next 102/114]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:569
 event_interrupt_wq_v9() warn: inconsistent indenting
Message-ID: <202609251014.5XAR8u9N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/amdgpu/kernel drm-amdgpu-next
head:   76b9706e7fa1a6e374703170128b1be2f590cda7
commit: a6332b84718710f22b7392d5773675c5942faa7d [102/114] drm/amdkfd: Fix TCP XNACK scoreboard reset race
config: x86_64-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260925/202609251014.5XAR8u9N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251014.5XAR8u9N-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c:569 event_interrupt_wq_v9() warn: inconsistent indenting

vim +569 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v9.c

   379	
   380	static void event_interrupt_wq_v9(struct kfd_node *dev,
   381						const uint32_t *ih_ring_entry)
   382	{
   383		uint16_t source_id, client_id, pasid, vmid;
   384		uint32_t context_id0, context_id1;
   385		uint32_t sq_intr_err, sq_int_data, encoding;
   386	
   387		source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
   388		client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
   389		pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
   390		vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
   391		context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
   392		context_id1 = SOC15_CONTEXT_ID1_FROM_IH_ENTRY(ih_ring_entry);
   393	
   394		if (client_id == SOC15_IH_CLIENTID_GRBM_CP ||
   395		    client_id == SOC15_IH_CLIENTID_SE0SH ||
   396		    client_id == SOC15_IH_CLIENTID_SE1SH ||
   397		    client_id == SOC15_IH_CLIENTID_SE2SH ||
   398		    client_id == SOC15_IH_CLIENTID_SE3SH) {
   399			if (source_id == SOC15_INTSRC_CP_END_OF_PIPE)
   400				kfd_signal_event_interrupt(pasid, context_id0, 32, true);
   401			else if (source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG) {
   402				sq_int_data = KFD_CONTEXT_ID_GET_SQ_INT_DATA(context_id0, context_id1);
   403				encoding = REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID, ENCODING);
   404				switch (encoding) {
   405				case SQ_INTERRUPT_WORD_ENCODING_AUTO:
   406					dev_dbg_ratelimited(
   407						dev->adev->dev,
   408						"sq_intr: auto, se %d, ttrace %d, wlt %d, ttrac_buf_full %d, reg_tms %d, cmd_tms %d, host_cmd_ovf %d, host_reg_ovf %d, immed_ovf %d, ttrace_utc_err %d\n",
   409						REG_GET_FIELD(
   410							context_id0,
   411							SQ_INTERRUPT_WORD_AUTO_CTXID,
   412							SE_ID),
   413						REG_GET_FIELD(
   414							context_id0,
   415							SQ_INTERRUPT_WORD_AUTO_CTXID,
   416							THREAD_TRACE),
   417						REG_GET_FIELD(
   418							context_id0,
   419							SQ_INTERRUPT_WORD_AUTO_CTXID,
   420							WLT),
   421						REG_GET_FIELD(
   422							context_id0,
   423							SQ_INTERRUPT_WORD_AUTO_CTXID,
   424							THREAD_TRACE_BUF_FULL),
   425						REG_GET_FIELD(
   426							context_id0,
   427							SQ_INTERRUPT_WORD_AUTO_CTXID,
   428							REG_TIMESTAMP),
   429						REG_GET_FIELD(
   430							context_id0,
   431							SQ_INTERRUPT_WORD_AUTO_CTXID,
   432							CMD_TIMESTAMP),
   433						REG_GET_FIELD(
   434							context_id0,
   435							SQ_INTERRUPT_WORD_AUTO_CTXID,
   436							HOST_CMD_OVERFLOW),
   437						REG_GET_FIELD(
   438							context_id0,
   439							SQ_INTERRUPT_WORD_AUTO_CTXID,
   440							HOST_REG_OVERFLOW),
   441						REG_GET_FIELD(
   442							context_id0,
   443							SQ_INTERRUPT_WORD_AUTO_CTXID,
   444							IMMED_OVERFLOW),
   445						REG_GET_FIELD(
   446							context_id0,
   447							SQ_INTERRUPT_WORD_AUTO_CTXID,
   448							THREAD_TRACE_UTC_ERROR));
   449					break;
   450				case SQ_INTERRUPT_WORD_ENCODING_INST:
   451					dev_dbg_ratelimited(
   452						dev->adev->dev,
   453						"sq_intr: inst, se %d, data 0x%x, sh %d, priv %d, wave_id %d, simd_id %d, cu_id %d, intr_data 0x%x\n",
   454						REG_GET_FIELD(
   455							context_id0,
   456							SQ_INTERRUPT_WORD_WAVE_CTXID,
   457							SE_ID),
   458						REG_GET_FIELD(
   459							context_id0,
   460							SQ_INTERRUPT_WORD_WAVE_CTXID,
   461							DATA),
   462						REG_GET_FIELD(
   463							context_id0,
   464							SQ_INTERRUPT_WORD_WAVE_CTXID,
   465							SH_ID),
   466						REG_GET_FIELD(
   467							context_id0,
   468							SQ_INTERRUPT_WORD_WAVE_CTXID,
   469							PRIV),
   470						REG_GET_FIELD(
   471							context_id0,
   472							SQ_INTERRUPT_WORD_WAVE_CTXID,
   473							WAVE_ID),
   474						REG_GET_FIELD(
   475							context_id0,
   476							SQ_INTERRUPT_WORD_WAVE_CTXID,
   477							SIMD_ID),
   478						REG_GET_FIELD(
   479							context_id0,
   480							SQ_INTERRUPT_WORD_WAVE_CTXID,
   481							CU_ID),
   482						sq_int_data);
   483					if (context_id0 & SQ_INTERRUPT_WORD_WAVE_CTXID__PRIV_MASK) {
   484						if (kfd_set_dbg_ev_from_interrupt(dev, pasid,
   485								KFD_DEBUG_DOORBELL_ID(sq_int_data),
   486								KFD_DEBUG_TRAP_CODE(sq_int_data),
   487								NULL, 0))
   488							return;
   489					}
   490					break;
   491				case SQ_INTERRUPT_WORD_ENCODING_ERROR:
   492					sq_intr_err = REG_GET_FIELD(sq_int_data, KFD_SQ_INT_DATA, ERR_TYPE);
   493					dev_warn_ratelimited(
   494						dev->adev->dev,
   495						"sq_intr: error, se %d, data 0x%x, sh %d, priv %d, wave_id %d, simd_id %d, cu_id %d, err_type %d\n",
   496						REG_GET_FIELD(
   497							context_id0,
   498							SQ_INTERRUPT_WORD_WAVE_CTXID,
   499							SE_ID),
   500						REG_GET_FIELD(
   501							context_id0,
   502							SQ_INTERRUPT_WORD_WAVE_CTXID,
   503							DATA),
   504						REG_GET_FIELD(
   505							context_id0,
   506							SQ_INTERRUPT_WORD_WAVE_CTXID,
   507							SH_ID),
   508						REG_GET_FIELD(
   509							context_id0,
   510							SQ_INTERRUPT_WORD_WAVE_CTXID,
   511							PRIV),
   512						REG_GET_FIELD(
   513							context_id0,
   514							SQ_INTERRUPT_WORD_WAVE_CTXID,
   515							WAVE_ID),
   516						REG_GET_FIELD(
   517							context_id0,
   518							SQ_INTERRUPT_WORD_WAVE_CTXID,
   519							SIMD_ID),
   520						REG_GET_FIELD(
   521							context_id0,
   522							SQ_INTERRUPT_WORD_WAVE_CTXID,
   523							CU_ID),
   524						sq_intr_err);
   525					if (sq_intr_err != SQ_INTERRUPT_ERROR_TYPE_ILLEGAL_INST &&
   526						sq_intr_err != SQ_INTERRUPT_ERROR_TYPE_MEMVIOL) {
   527						event_interrupt_poison_consumption_v9(dev, pasid, client_id);
   528						return;
   529					}
   530					break;
   531				default:
   532					break;
   533				}
   534				kfd_signal_event_interrupt(pasid, sq_int_data, 24, true);
   535			} else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE &&
   536				   KFD_DBG_EC_TYPE_IS_PACKET(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0))) {
   537				kfd_set_dbg_ev_from_interrupt(dev, pasid,
   538					KFD_DEBUG_DOORBELL_ID(context_id0),
   539					KFD_EC_MASK(KFD_DEBUG_CP_BAD_OP_ECODE(context_id0)),
   540					NULL, 0);
   541			}
   542		} else if (client_id == SOC15_IH_CLIENTID_SDMA0 ||
   543			   client_id == SOC15_IH_CLIENTID_SDMA1 ||
   544			   client_id == SOC15_IH_CLIENTID_SDMA2 ||
   545			   client_id == SOC15_IH_CLIENTID_SDMA3 ||
   546			   client_id == SOC15_IH_CLIENTID_SDMA4 ||
   547			   client_id == SOC15_IH_CLIENTID_SDMA5 ||
   548			   client_id == SOC15_IH_CLIENTID_SDMA6 ||
   549			   client_id == SOC15_IH_CLIENTID_SDMA7) {
   550			if (source_id == SOC15_INTSRC_SDMA_TRAP) {
   551				kfd_signal_event_interrupt(pasid, context_id0 & 0xfffffff, 28, true);
   552			} else if (source_id == SOC15_INTSRC_SDMA_ECC) {
   553				event_interrupt_poison_consumption_v9(dev, pasid, client_id);
   554				return;
   555			}
   556		} else if (client_id == SOC15_IH_CLIENTID_VMC ||
   557			   client_id == SOC15_IH_CLIENTID_VMC1 ||
   558			   client_id == SOC15_IH_CLIENTID_UTCL2) {
   559			struct kfd_vm_fault_info info = {0};
   560			uint16_t ring_id = SOC15_RING_ID_FROM_IH_ENTRY(ih_ring_entry);
   561			struct kfd_hsa_memory_exception_data exception_data;
   562	
   563			if (source_id == SOC15_INTSRC_VMC_UTCL2_POISON) {
   564				event_interrupt_poison_consumption_v9(dev, pasid, client_id);
   565				return;
   566			}
   567	
   568				/* GPR cleaner shader for MI2XX */
 > 569				if (KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2))
   570					gfx942_clean_fault(pasid);
   571	
   572	
   573			info.vmid = vmid;
   574			info.mc_id = client_id;
   575			info.page_addr = ih_ring_entry[4] |
   576				(uint64_t)(ih_ring_entry[5] & 0xf) << 32;
   577			info.prot_valid = ring_id & 0x08;
   578			info.prot_read  = ring_id & 0x10;
   579			info.prot_write = ring_id & 0x20;
   580	
   581			memset(&exception_data, 0, sizeof(exception_data));
   582			exception_data.gpu_id = dev->id;
   583			exception_data.va = (info.page_addr) << PAGE_SHIFT;
   584			exception_data.failure.NotPresent = info.prot_valid ? 1 : 0;
   585			exception_data.failure.NoExecute = info.prot_exec ? 1 : 0;
   586			exception_data.failure.ReadOnly = info.prot_write ? 1 : 0;
   587			exception_data.failure.imprecise = 0;
   588	
   589			kfd_set_dbg_ev_from_interrupt(dev,
   590							pasid,
   591							-1,
   592							KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION),
   593							&exception_data,
   594							sizeof(exception_data));
   595			kfd_smi_event_update_vmfault(dev, pasid);
   596		} else if (KFD_IRQ_IS_FENCE(client_id, source_id)) {
   597			kfd_process_close_interrupt_drain(pasid);
   598		}
   599	}
   600	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
