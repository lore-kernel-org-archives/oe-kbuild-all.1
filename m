Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D7C17C8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694396848; x=1725932848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5sG7Kt28vyuBh8UDGuh1NUZmN7IfDlfCUyPPsl/qqg=;
  b=S2EcIa9eu3bgI1XA6n9r42q0lQif/uGraDa4Trk+YgwRmmMuuEIau5kv
   xAqpeWQdb+CXb4Kx+uw3ahWrEJIyxqTbdCRFF41KP8ukGvNY3qhCFbb56
   IcmjaHNjWXa8bwHkdoe1PkVNjHhH1VCZ4CNftj97EQzOZmq2x0k2Vanbd
   MvgCflDeM/VY2csxjMlajtpg7nybgLJKHy1yg/iPv2aVAOctwvdBW8ZeY
   15juuvpl+aMsGDIsUmfyT9ApROFBIH3MEnnxtfwDogDenFOl+FCEeG69M
   nK/5Kca8R1+9AXRZl5cjfRTiHEvMuf67C1R2qRwNdMo98HylZ9gqmB5DB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="380671837"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="380671837"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 18:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="989910761"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="989910761"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2023 18:47:25 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfW1L-0005fU-25;
	Mon, 11 Sep 2023 01:47:23 +0000
Date: Mon, 11 Sep 2023 09:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Zhang <pei.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"He, Min" <min.he@intel.com>, "Jiang, Fei" <fei.jiang@intel.com>,
	"Dong, Eddie" <eddie.dong@intel.com>
Subject: [intel-lts:4.19/android_t 3677/30000]
 drivers/gpu/drm/i915/intel_lrc.c:528:54: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202309110959.hu3u3zum-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   247bc655e03e4ac3632b21081ca56b813a644dcf
commit: 0192bd7af2fd456ad7705f8cf6097015aa2ae2be [3677/30000] drm/i915: implement pvmmio in guest i915
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110959.hu3u3zum-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110959.hu3u3zum-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110959.hu3u3zum-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/intel_lrc.c:528:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] <asn:2> *elsp_data @@     got unsigned int * @@
   drivers/gpu/drm/i915/intel_lrc.c:528:54: sparse:     expected unsigned int [noderef] [usertype] <asn:2> *elsp_data
   drivers/gpu/drm/i915/intel_lrc.c:528:54: sparse:     got unsigned int *
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: logical_ring_setup()+0x520: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: i915_error_reset()+0x37: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: gen8_logical_ring_enable_irq()+0x145: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: execlists_submit_ports()+0x1320: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: gen8_emit_bb_start()+0x193: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: populate_lr_context()+0x224: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: lookup_priolist()+0x4e: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: live_late_preempt()+0x220: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: live_preempt_hang()+0x387: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: process_csb()+0x621: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: logical_ring_init()+0x260: sibling call from callable instruction with modified stack frame
   drivers/gpu/drm/i915/intel_lrc.o: warning: objtool: live_late_preempt.cold()+0x4a: sibling call from callable instruction with modified stack frame

vim +528 drivers/gpu/drm/i915/intel_lrc.c

   465	
   466	static void execlists_submit_ports(struct intel_engine_cs *engine)
   467	{
   468		struct intel_engine_execlists *execlists = &engine->execlists;
   469		struct execlist_port *port = execlists->port;
   470		unsigned int n;
   471		u32 descs[4];
   472		int i = 0;
   473	
   474		/*
   475		 * We can skip acquiring intel_runtime_pm_get() here as it was taken
   476		 * on our behalf by the request (see i915_gem_mark_busy()) and it will
   477		 * not be relinquished until the device is idle (see
   478		 * i915_gem_idle_work_handler()). As a precaution, we make sure
   479		 * that all ELSP are drained i.e. we have processed the CSB,
   480		 * before allowing ourselves to idle and calling intel_runtime_pm_put().
   481		 */
   482		GEM_BUG_ON(!engine->i915->gt.awake);
   483	
   484		/*
   485		 * ELSQ note: the submit queue is not cleared after being submitted
   486		 * to the HW so we need to make sure we always clean it up. This is
   487		 * currently ensured by the fact that we always write the same number
   488		 * of elsq entries, keep this in mind before changing the loop below.
   489		 */
   490		for (n = execlists_num_ports(execlists); n--; ) {
   491			struct i915_request *rq;
   492			unsigned int count;
   493			u64 desc;
   494	
   495			rq = port_unpack(&port[n], &count);
   496			if (rq) {
   497				GEM_BUG_ON(count > !n);
   498				if (!count++)
   499					execlists_context_schedule_in(rq);
   500				port_set(&port[n], port_pack(rq, count));
   501				desc = execlists_update_context(rq);
   502				GEM_DEBUG_EXEC(port[n].context_id = upper_32_bits(desc));
   503	
   504				GEM_TRACE("%s in[%d]:  ctx=%d.%d, global=%d (fence %llx:%d) (current %d), prio=%d\n",
   505					  engine->name, n,
   506					  port[n].context_id, count,
   507					  rq->global_seqno,
   508					  rq->fence.context, rq->fence.seqno,
   509					  intel_engine_get_seqno(engine),
   510					  rq_prio(rq));
   511			} else {
   512				GEM_BUG_ON(!n);
   513				desc = 0;
   514			}
   515			if (intel_vgpu_active(engine->i915) &&
   516					PVMMIO_LEVEL(engine->i915, PVMMIO_ELSP_SUBMIT)) {
   517				BUG_ON(i >= 4);
   518				descs[i] = upper_32_bits(desc);
   519				descs[i + 1] = lower_32_bits(desc);
   520				i += 2;
   521				continue;
   522			}
   523	
   524			write_desc(execlists, desc, n);
   525		}
   526		if (intel_vgpu_active(engine->i915) &&
   527				PVMMIO_LEVEL(engine->i915, PVMMIO_ELSP_SUBMIT)) {
 > 528			u32 __iomem *elsp_data = engine->i915->shared_page->elsp_data;
   529			spin_lock(&engine->i915->shared_page_lock);
   530			writel(descs[0], elsp_data);
   531			writel(descs[1], elsp_data + 1);
   532			writel(descs[2], elsp_data + 2);
   533			writel(descs[3], execlists->submit_reg);
   534			spin_unlock(&engine->i915->shared_page_lock);
   535		}
   536		/* we need to manually load the submit queue */
   537		if (execlists->ctrl_reg)
   538			writel(EL_CTRL_LOAD, execlists->ctrl_reg);
   539	
   540		execlists_clear_active(execlists, EXECLISTS_ACTIVE_HWACK);
   541	}
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
