Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57FAD513
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhT8Jp0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699620229; x=1731156229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JncjdJ/eR09r3XL5LR9N5IynpfK1MAJkG6FB7X7cdkA=;
  b=GhT8Jp0s1fx9IhAq/zyIwf1DHGa6uzV6SFyzyr/POvMuOXNwMgyshXit
   n0L74eRIKf2dvdo6QcZXf6cMGofsWrokIoBuGtX2a0a+XWosis+51ZXXq
   eLjUxuObu8HYomG6QVaeK6s5dTqvt47a0hTAinS4EDBPE9bSyJUUl18p7
   8XMAoOEE8ZsUKZhOkS/xL72I136uP8uPPXOb+bv8qANy7FsxfnT7e3Gyg
   be68eX6poVcftNOWZl09luA1J3uXuUbxU7g38cWZl3xa7k/Yhfpdncsia
   SHjpi3L6Hu8gzR1D576kGjF5EGUpYngGhitfSotqoREFP4XaxbItcznk9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11727046"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="11727046"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 04:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829644286"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="829644286"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2023 04:43:45 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1QrP-0009bO-2Z;
	Fri, 10 Nov 2023 12:43:43 +0000
Date: Fri, 10 Nov 2023 20:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Zhang <pei.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	"He, Min" <min.he@intel.com>, "Jiang, Fei" <fei.jiang@intel.com>,
	"Dong, Eddie" <eddie.dong@intel.com>
Subject: [intel-lts:4.19/android_t 3677/30000]
 drivers/gpu/drm/i915/intel_lrc.c:528:54: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202311102017.t9PT8ViJ-lkp@intel.com>
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
config: x86_64-randconfig-121-20230910 (https://download.01.org/0day-ci/archive/20231110/202311102017.t9PT8ViJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102017.t9PT8ViJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102017.t9PT8ViJ-lkp@intel.com/

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
