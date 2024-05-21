Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A61113D29F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716302442; cv=none; b=c3uJtET0rj+nSC+qss+fUOac9Le8QJRDeI3Urr5IWSYd1HMKQwBB8rbkYSu38I9dJl7fkI86SoaeqeDE9xW59iy1q2XVAWJRiWOEYkTK1/bq3ofj1yfUCcy6fzSxU+aYyfROpk/yneAYJdVtvwJ/I193j/aK11V7ICLjknbAK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716302442; c=relaxed/simple;
	bh=/oMa4YQLz4xBg+aIPYZB2MREAQr5+j1JjbMQaLrxuxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pd98MqqPQP5wfPaK9CKCT+doOyeRSEuqh3SzT+lH7GbDsq3GA6aP+LBgILeNHgx3mtrpfscH22/K9HdQvLUKkIJniUyfw8/IBavVxMeaCR/o/9DpwDys0zIRL3LrvRKKDmkODdWUlfabIJxspF2c4Sw+HCD53oqJrh0OPxfJd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4C2i8i0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4C2i8i0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716302441; x=1747838441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/oMa4YQLz4xBg+aIPYZB2MREAQr5+j1JjbMQaLrxuxo=;
  b=A4C2i8i0662mRYOdCY1NPcHSEUNJ1enySjecNZ5Zb/mx2bq89rLjOlAv
   /13L9z0OkMEoHzfB8ez51Ae8lPuBo+gAomgbrx6B40SeSfS4MG3nfdHk5
   j7f7UZRUbzLdbmFB4DK8qvzZBdMv/wjfsS2zawBdCsk0jQfGTWgWs3fou
   yeNVBqgNn3/VRUB8mWTIjw8JoiLClBsQSYo7R/AQszuLGM9RQQS3madXc
   Ey1+R/Ac1AnVLtgDYCcCA2wYbkAxS6BL0oHoGbCOGxcmtKuHggCq2JF+N
   sUeIZxPZE6cNwoL7BrcI5MaffVZzSo+TeQ08IFAJ6qNlH/uyfUEXfjX6+
   Q==;
X-CSE-ConnectionGUID: LcUoIX0IRn+b/ltos4LieQ==
X-CSE-MsgGUID: lvKhnczMSlSYWigAOpiQIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16288952"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="16288952"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 07:40:40 -0700
X-CSE-ConnectionGUID: qtALT4MiSU2FhqgtXgNYEg==
X-CSE-MsgGUID: SjjzsiPRSr29HwoA9eO28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="32996927"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2024 07:40:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9QfL-0000RV-2X;
	Tue, 21 May 2024 14:40:35 +0000
Date: Tue, 21 May 2024 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Iago Toral Quiroga <itoral@igalia.com>
Subject: [drm-misc:drm-misc-next 1/6]
 drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: error:
 'v3d_v42_performance_counters' defined but not used
Message-ID: <202405212244.ANdkqVFN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   a2ab7cb169da38757323929f7b3b4cf396ec53b5
commit: 3cbcbe016c31ad4fe1b7a53b325c1a36be6191f4 [1/6] drm/v3d: Add Performance Counters descriptions for V3D 4.2 and 7.1
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240521/202405212244.ANdkqVFN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405212244.ANdkqVFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405212244.ANdkqVFN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/v3d/v3d_drv.h:14,
                    from drivers/gpu/drm/v3d/v3d_bo.c:25:
>> drivers/gpu/drm/v3d/v3d_performance_counters.h:118:43: error: 'v3d_v42_performance_counters' defined but not used [-Werror=unused-const-variable=]
     118 | static const struct v3d_perf_counter_desc v3d_v42_performance_counters[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/v3d/v3d_performance_counters.h:22:43: error: 'v3d_v71_performance_counters' defined but not used [-Werror=unused-const-variable=]
      22 | static const struct v3d_perf_counter_desc v3d_v71_performance_counters[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/v3d_v42_performance_counters +118 drivers/gpu/drm/v3d/v3d_performance_counters.h

   117	
 > 118	static const struct v3d_perf_counter_desc v3d_v42_performance_counters[] = {
   119		{"FEP", "FEP-valid-primitives-no-rendered-pixels", "[FEP] Valid primitives that result in no rendered pixels, for all rendered tiles"},
   120		{"FEP", "FEP-valid-primitives-rendered-pixels", "[FEP] Valid primitives for all rendered tiles (primitives may be counted in more than one tile)"},
   121		{"FEP", "FEP-clipped-quads", "[FEP] Early-Z/Near/Far clipped quads"},
   122		{"FEP", "FEP-valid-quads", "[FEP] Valid quads"},
   123		{"TLB", "TLB-quads-not-passing-stencil-test", "[TLB] Quads with no pixels passing the stencil test"},
   124		{"TLB", "TLB-quads-not-passing-z-and-stencil-test", "[TLB] Quads with no pixels passing the Z and stencil tests"},
   125		{"TLB", "TLB-quads-passing-z-and-stencil-test", "[TLB] Quads with any pixels passing the Z and stencil tests"},
   126		{"TLB", "TLB-quads-with-zero-coverage", "[TLB] Quads with all pixels having zero coverage"},
   127		{"TLB", "TLB-quads-with-non-zero-coverage", "[TLB] Quads with any pixels having non-zero coverage"},
   128		{"TLB", "TLB-quads-written-to-color-buffer", "[TLB] Quads with valid pixels written to colour buffer"},
   129		{"PTB", "PTB-primitives-discarded-outside-viewport", "[PTB] Primitives discarded by being outside the viewport"},
   130		{"PTB", "PTB-primitives-need-clipping", "[PTB] Primitives that need clipping"},
   131		{"PTB", "PTB-primitives-discarded-reversed", "[PTB] Primitives that are discarded because they are reversed"},
   132		{"QPU", "QPU-total-idle-clk-cycles", "[QPU] Total idle clock cycles for all QPUs"},
   133		{"QPU", "QPU-total-active-clk-cycles-vertex-coord-shading", "[QPU] Total active clock cycles for all QPUs doing vertex/coordinate/user shading (counts only when QPU is not stalled)"},
   134		{"QPU", "QPU-total-active-clk-cycles-fragment-shading", "[QPU] Total active clock cycles for all QPUs doing fragment shading (counts only when QPU is not stalled)"},
   135		{"QPU", "QPU-total-clk-cycles-executing-valid-instr", "[QPU] Total clock cycles for all QPUs executing valid instructions"},
   136		{"QPU", "QPU-total-clk-cycles-waiting-TMU", "[QPU] Total clock cycles for all QPUs stalled waiting for TMUs only (counter won't increment if QPU also stalling for another reason)"},
   137		{"QPU", "QPU-total-clk-cycles-waiting-scoreboard", "[QPU] Total clock cycles for all QPUs stalled waiting for Scoreboard only (counter won't increment if QPU also stalling for another reason)"},
   138		{"QPU", "QPU-total-clk-cycles-waiting-varyings", "[QPU] Total clock cycles for all QPUs stalled waiting for Varyings only (counter won't increment if QPU also stalling for another reason)"},
   139		{"QPU", "QPU-total-instr-cache-hit", "[QPU] Total instruction cache hits for all slices"},
   140		{"QPU", "QPU-total-instr-cache-miss", "[QPU] Total instruction cache misses for all slices"},
   141		{"QPU", "QPU-total-uniform-cache-hit", "[QPU] Total uniforms cache hits for all slices"},
   142		{"QPU", "QPU-total-uniform-cache-miss", "[QPU] Total uniforms cache misses for all slices"},
   143		{"TMU", "TMU-total-text-quads-access", "[TMU] Total texture cache accesses"},
   144		{"TMU", "TMU-total-text-cache-miss", "[TMU] Total texture cache misses (number of fetches from memory/L2cache)"},
   145		{"VPM", "VPM-total-clk-cycles-VDW-stalled", "[VPM] Total clock cycles VDW is stalled waiting for VPM access"},
   146		{"VPM", "VPM-total-clk-cycles-VCD-stalled", "[VPM] Total clock cycles VCD is stalled waiting for VPM access"},
   147		{"CLE", "CLE-bin-thread-active-cycles", "[CLE] Bin thread active cycles"},
   148		{"CLE", "CLE-render-thread-active-cycles", "[CLE] Render thread active cycles"},
   149		{"L2T", "L2T-total-cache-hit", "[L2T] Total Level 2 cache hits"},
   150		{"L2T", "L2T-total-cache-miss", "[L2T] Total Level 2 cache misses"},
   151		{"CORE", "cycle-count", "[CORE] Cycle counter"},
   152		{"QPU", "QPU-total-clk-cycles-waiting-vertex-coord-shading", "[QPU] Total stalled clock cycles for all QPUs doing vertex/coordinate/user shading"},
   153		{"QPU", "QPU-total-clk-cycles-waiting-fragment-shading", "[QPU] Total stalled clock cycles for all QPUs doing fragment shading"},
   154		{"PTB", "PTB-primitives-binned", "[PTB] Total primitives binned"},
   155		{"AXI", "AXI-writes-seen-watch-0", "[AXI] Writes seen by watch 0"},
   156		{"AXI", "AXI-reads-seen-watch-0", "[AXI] Reads seen by watch 0"},
   157		{"AXI", "AXI-writes-stalled-seen-watch-0", "[AXI] Write stalls seen by watch 0"},
   158		{"AXI", "AXI-reads-stalled-seen-watch-0", "[AXI] Read stalls seen by watch 0"},
   159		{"AXI", "AXI-write-bytes-seen-watch-0", "[AXI] Total bytes written seen by watch 0"},
   160		{"AXI", "AXI-read-bytes-seen-watch-0", "[AXI] Total bytes read seen by watch 0"},
   161		{"AXI", "AXI-writes-seen-watch-1", "[AXI] Writes seen by watch 1"},
   162		{"AXI", "AXI-reads-seen-watch-1", "[AXI] Reads seen by watch 1"},
   163		{"AXI", "AXI-writes-stalled-seen-watch-1", "[AXI] Write stalls seen by watch 1"},
   164		{"AXI", "AXI-reads-stalled-seen-watch-1", "[AXI] Read stalls seen by watch 1"},
   165		{"AXI", "AXI-write-bytes-seen-watch-1", "[AXI] Total bytes written seen by watch 1"},
   166		{"AXI", "AXI-read-bytes-seen-watch-1", "[AXI] Total bytes read seen by watch 1"},
   167		{"TLB", "TLB-partial-quads-written-to-color-buffer", "[TLB] Partial quads written to the colour buffer"},
   168		{"TMU", "TMU-total-config-access", "[TMU] Total config accesses"},
   169		{"L2T", "L2T-no-id-stalled", "[L2T] No ID stall"},
   170		{"L2T", "L2T-command-queue-stalled", "[L2T] Command queue full stall"},
   171		{"L2T", "L2T-TMU-writes", "[L2T] TMU write accesses"},
   172		{"TMU", "TMU-active-cycles", "[TMU] Active cycles"},
   173		{"TMU", "TMU-stalled-cycles", "[TMU] Stalled cycles"},
   174		{"CLE", "CLE-thread-active-cycles", "[CLE] Bin or render thread active cycles"},
   175		{"L2T", "L2T-TMU-reads", "[L2T] TMU read accesses"},
   176		{"L2T", "L2T-CLE-reads", "[L2T] CLE read accesses"},
   177		{"L2T", "L2T-VCD-reads", "[L2T] VCD read accesses"},
   178		{"L2T", "L2T-TMU-config-reads", "[L2T] TMU CFG read accesses"},
   179		{"L2T", "L2T-SLC0-reads", "[L2T] SLC0 read accesses"},
   180		{"L2T", "L2T-SLC1-reads", "[L2T] SLC1 read accesses"},
   181		{"L2T", "L2T-SLC2-reads", "[L2T] SLC2 read accesses"},
   182		{"L2T", "L2T-TMU-write-miss", "[L2T] TMU write misses"},
   183		{"L2T", "L2T-TMU-read-miss", "[L2T] TMU read misses"},
   184		{"L2T", "L2T-CLE-read-miss", "[L2T] CLE read misses"},
   185		{"L2T", "L2T-VCD-read-miss", "[L2T] VCD read misses"},
   186		{"L2T", "L2T-TMU-config-read-miss", "[L2T] TMU CFG read misses"},
   187		{"L2T", "L2T-SLC0-read-miss", "[L2T] SLC0 read misses"},
   188		{"L2T", "L2T-SLC1-read-miss", "[L2T] SLC1 read misses"},
   189		{"L2T", "L2T-SLC2-read-miss", "[L2T] SLC2 read misses"},
   190		{"CORE", "core-memory-writes", "[CORE] Total memory writes"},
   191		{"L2T", "L2T-memory-writes", "[L2T] Total memory writes"},
   192		{"PTB", "PTB-memory-writes", "[PTB] Total memory writes"},
   193		{"TLB", "TLB-memory-writes", "[TLB] Total memory writes"},
   194		{"CORE", "core-memory-reads", "[CORE] Total memory reads"},
   195		{"L2T", "L2T-memory-reads", "[L2T] Total memory reads"},
   196		{"PTB", "PTB-memory-reads", "[PTB] Total memory reads"},
   197		{"PSE", "PSE-memory-reads", "[PSE] Total memory reads"},
   198		{"TLB", "TLB-memory-reads", "[TLB] Total memory reads"},
   199		{"GMP", "GMP-memory-reads", "[GMP] Total memory reads"},
   200		{"PTB", "PTB-memory-words-writes", "[PTB] Total memory words written"},
   201		{"TLB", "TLB-memory-words-writes", "[TLB] Total memory words written"},
   202		{"PSE", "PSE-memory-words-reads", "[PSE] Total memory words read"},
   203		{"TLB", "TLB-memory-words-reads", "[TLB] Total memory words read"},
   204		{"TMU", "TMU-MRU-hits", "[TMU] Total MRU hits"},
   205		{"CORE", "compute-active-cycles", "[CORE] Compute active cycles"},
   206	};
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
