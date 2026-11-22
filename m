Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795321830;
	b=HfhR/Rdtf8we+h3PXzSUWeG7a3TMxv4wUBWqrJZrTkV5EgxYytSttF8z3715+trgdIvi
	 iJbNgicHBsyb/SqejGqe6J8toTy+jPFyZS9Le1jaf0wDVdhJU6pVZ9coe2vt1G0Wm0Yoy
	 JAwTCaiT+woLrGWHs9ugndMC/BbMRfVbrUECHvXbqI58ZMRHzgU0QRTVbQyz5SDS5KAPT
	 0Y/M3bdvpFM8XuziWDy9P8+/Pd9ydL1z757M3Lus8DAdKknmuFlcXvNtAGCqftD1FlPTw
	 gKilppUJOjCl+4ma9E+8Z1ZEDgrXIR7qacNuEtZwdEvZ0UHdZCKMWJ0aVvYVHQHOn2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795321830;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0cWtw+V8NW+aV0oZ1iwgBKcDSyt13lGWtQ6cPfsta6w=;
	b=q80P89AS2D6dB+TKcRABqCWflajap4s93gbB5ksnffuMiUzfy3ZbalBz4QsT2CFxBWjx
	 sjTCXw64k3b006v27LPFbjO1ojzclm4rEFl7P3UP4eiBre1zZ2L33VM3QrUXSrG3t54l5
	 KLbKIdPLMNK8+jznoMPja9jrlGhquR27SfNHG1mahlGdgqoLvX5KRupyLSxU1nbYjpkpQ
	 QqYYlGEf/2YkDi8PzgxQ5/D3UX8mEVZpBC5bUNRPPm/2gNFyRyFskIdoPkFAKi0kP1bit
	 OltFZT7gfdRI2CEyHLBS0KNePageV6KVBvaExGVb+q94QASDjZX/OKbVf/UtDWqOtlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="l8m3Bi/O";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FC606A320
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 04:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 501FC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l8m3Bi/O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795321830; x=1826857830;
  h=date:from:to:cc:subject:message-id;
  bh=CkAT091W8kW6JWoCcVg4lBj2fN5IllfZ2o7bj8km7R0=;
  b=l8m3Bi/OgT7C2SkKUceTV4AKlmb7jbVifL0kx6nEmK45sV1H+LVOa8Ba
   upqB9SgoEdKZ03lYeFf7NeswixmmOrMhJcP1oyUq73WjFUn/zQ6CLXrof
   MUTYQIi4UMibF2MLOUMYejEN+aGtmObHaCbqtqoFgn4HCLOseHvKbS1yU
   DDh9IFbiwN99rGDoREGznP7lTDfRDzU3ZhQkhy4RHAu1gNnKDB2Nb4sKG
   plRtbAUPR+daL+Zr+n1B8UqCBjDzFcjsUwNZEKvdWcaD+KQqUXvCGLjdV
   6lZlkKN1jXF0gdsyL2lySlwCX5aAjsYqf6h+IE0uzctaZyVrCBBfXbk32
   w==;
X-CSE-ConnectionGUID: moLaE5P8RS2nUCe2JaVpNQ==
X-CSE-MsgGUID: eQ0E2IFyRlWyx5kNVZFW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4200459"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4200459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 20:30:30 -0800
X-CSE-ConnectionGUID: aaorvOmpSRyzi+eJt7lcVQ==
X-CSE-MsgGUID: EXAwtzYTToa0w6Mvqbw3tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11221628"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2026 20:30:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUzDe-000000004UP-0TRm;
	Sun, 22 Nov 2026 04:30:26 +0000
Date: Sun, 22 Nov 2026 05:29:26 +0100
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V16 19/31]
 drivers/firmware/arm_scmi/telemetry.c:3349:54: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <20261122051855.igErOxIv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V16
head:   2583f5d73857467989b273f5a1a2f7bee48debd9
commit: 515f136b8f25a6bc193fd3791c3545d0fd0bdd05 [19/31] firmware: arm_scmi: Add Telemetry Single/Bulk DEs reads
config: parisc-randconfig-r2303-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122051855.igErOxIv-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122051855.igErOxIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122051855.igErOxIv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/telemetry.c:2556:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct eplg *eplg @@     got struct eplg [noderef] __iomem *[assigned] _eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2556:51: sparse:     expected struct eplg *eplg
   drivers/firmware/arm_scmi/telemetry.c:2556:51: sparse:     got struct eplg [noderef] __iomem *[assigned] _eplg
   drivers/firmware/arm_scmi/telemetry.c:2855:37: sparse: sparse: Using plain integer as NULL pointer
   drivers/firmware/arm_scmi/telemetry.c:2857:37: sparse: sparse: Using plain integer as NULL pointer
>> drivers/firmware/arm_scmi/telemetry.c:3349:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct eplg *eplg @@     got struct eplg [noderef] __iomem *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:3349:54: sparse:     expected struct eplg *eplg
   drivers/firmware/arm_scmi/telemetry.c:3349:54: sparse:     got struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:3363:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct eplg *eplg @@     got struct eplg [noderef] __iomem *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:3363:62: sparse:     expected struct eplg *eplg
   drivers/firmware/arm_scmi/telemetry.c:3363:62: sparse:     got struct eplg [noderef] __iomem *eplg
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *limit @@     got struct eplg *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse:     expected void [noderef] __iomem *limit
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse:     got struct eplg *eplg
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *limit @@     got struct eplg *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse:     expected void [noderef] __iomem *limit
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse:     got struct eplg *eplg
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *limit @@     got struct eplg *eplg @@
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse:     expected void [noderef] __iomem *limit
   drivers/firmware/arm_scmi/telemetry.c:2325:31: sparse:     got struct eplg *eplg

vim +3349 drivers/firmware/arm_scmi/telemetry.c

  3313	
  3314	static int scmi_telemetry_de_snapshot(struct tdcf __iomem *tdcf,
  3315					      struct telemetry_de *tde,
  3316					      struct telemetry_de_snapshot *snap)
  3317	{
  3318		int retries = SCMI_TLM_TDCF_MAX_RETRIES;
  3319		u32 startm, endm, live;
  3320		int err = 0;
  3321	
  3322		lockdep_assert_held(&tde->mtx);
  3323	
  3324		do {
  3325			struct payload __iomem *payld, *bts_payld;
  3326	
  3327			/* A bit of exponential backoff between retries */
  3328			fsleep((SCMI_TLM_TDCF_MAX_RETRIES - retries) * SCMI_TLM_TDCF_RETRY_GAP_US);
  3329	
  3330			startm = TDCF_START_SEQ_GET(tdcf);
  3331			/* Build a default endm certainly different from startm */
  3332			endm = startm + 1;
  3333			if (IS_BAD_START_SEQ(startm)) {
  3334				trace_scmi_tlm_access(tde->de.info->id, "MSEQ_BADSTART",
  3335						      startm, 0);
  3336				continue;
  3337			}
  3338	
  3339			/*
  3340			 * In this context any anomaly detected on the payload could
  3341			 * due to a torn read, and it is worth retrying a snapshot.
  3342			 *
  3343			 * Note that TDE base/offset have been sanitized when
  3344			 * initialized and cannot have changed: accessing them here
  3345			 * is safe.
  3346			 */
  3347			payld = tde->base + tde->offset;
  3348			/* Sanitize length before snapshot */
> 3349			if (scmi_telemetry_shmti_overflow(tde->eplg, payld))
  3350				continue;
  3351			memcpy_fromio(&snap->payld, payld, LINE_LENGTH_BYTES(payld));
  3352			err = scmi_telemetry_tdcf_de_payld_check(tde, &snap->payld);
  3353			if (err)
  3354				continue;
  3355	
  3356			/*
  3357			 * Here the associated BLK_TS line, if any, has been verified
  3358			 * as sane when linked/bound: no need of further validation.
  3359			 */
  3360			if (tde->bts) {
  3361				bts_payld = tde->base + tde->bts->line.offset;
  3362				/* Sanitize length before snapshot */
  3363				if (scmi_telemetry_shmti_overflow(tde->eplg, bts_payld))
  3364					continue;
  3365				memcpy_fromio(&snap->bts_payld, bts_payld,
  3366					      LINE_LENGTH_BYTES(bts_payld));
  3367			}
  3368	
  3369			/* Assure the snapshot has been fully taken before checking seqnum */
  3370			rmb();
  3371	
  3372			/* Used to detect changes while copying */
  3373			live = TDCF_START_SEQ_GET(tdcf);
  3374	
  3375			endm = TDCF_END_SEQ_GET(tde->eplg);
  3376			if (startm != endm || startm != live)
  3377				trace_scmi_tlm_access(tde->de.info->id, "MSEQ_MISMATCH",
  3378						      startm, endm);
  3379		} while ((startm != endm || err) && --retries);
  3380	
  3381		if (startm != endm || err) {
  3382			trace_scmi_tlm_access(tde->de.info->id,
  3383					      "TDCF_SNAPSHOT_DE_FAIL", startm, endm);
  3384			return err ?: -EPROTO;
  3385		}
  3386	
  3387		/* Ensure any snapshot is visible before updating magic */
  3388		smp_store_release(&snap->magic, startm);
  3389	
  3390		trace_scmi_tlm_access(tde->de.info->id, "TDCF_SNAPSHOT_DE_OK",
  3391				      startm, endm);
  3392	
  3393		return 0;
  3394	}
  3395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
