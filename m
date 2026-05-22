Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C926B20ADF8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 02:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779417548; cv=none; b=ii55LOK9X1TFHaj83GUajpeiYPD985imocngtGhLAK6EAxHOLx8HnXedwkcRPPohesLo7iTelQZrXfzNxhFr/fE+ujSqwozDAAS+bFbvTK05H3PSzEQqmY6l7mlsyTB9Vk5z5llDrxrou1drkg4Lg5+do9lt2ykqZ5UP9T2bYOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779417548; c=relaxed/simple;
	bh=y7zqeW3VHT9Z6xVcChXcbxJr8fqdLtTp4Ty/CxDCrjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IWAbq7w60A+tMHcQG5/4QK+J95+zyJtNNAp2D4YtN7ORvnAATXtAczc1O6L9oYZJugY4VIumnN5/YoU8/15qvSKoi1vhq67Fr5UhrOkAGc59TSZza9vPgCY1u6QbIg/oM/jI5bU3DaNHdMsieX6VBcrak6ePZpjwt+eSmW47TEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZA2psDyo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZA2psDyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779417546; x=1810953546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7zqeW3VHT9Z6xVcChXcbxJr8fqdLtTp4Ty/CxDCrjs=;
  b=ZA2psDyo53OLjkXjdB3DtmCiO3q8nYLPwmThYFJ30XLEmgR08gQwbHku
   1EbkL5aFmFdwJOgGoltPzhwTKC3eknfDlbB8Lsmv99M++EHpLyOr88JcX
   FXK+LFgW5dLiQ6HLfv4UNsYWrWU3n9t5XYPzjPh4HdLGVeGMgy/c6ZEhA
   3d30owQj1iaIk3yXE9+Gln9Yl1NOmf4UkRypHUY/ESh8EofOQlYz0qj3z
   Q3Moenn33AJwUHtTpYcIDjzMl7yDZrXqhZ23ml/jo/PxMGBwfez4vVODa
   sHA3d8zgry22BDaUxLlVwbFIFirVJNWzI1oOf++HakxdLgBznQu6keZdy
   Q==;
X-CSE-ConnectionGUID: yNga8WzfTZCAgZq7Q8B87g==
X-CSE-MsgGUID: TDQYoyshQ2eewyO1j10jnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79379091"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="79379091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:39:05 -0700
X-CSE-ConnectionGUID: kllVDdk/QZibFtxXjiNq2g==
X-CSE-MsgGUID: KCI/5hOSQn6uUBcSvYywvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="242563519"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 May 2026 19:39:04 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQFmv-000000001ar-1vk3;
	Fri, 22 May 2026 02:39:01 +0000
Date: Fri, 22 May 2026 10:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Cl=C3=A9ment?= =?utf-8?Q?_L=C3=A9ger"?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_acpi_support_v1 35/65]
 drivers/perf/riscv_pmu_sbi.c:1158:52: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202605221019.hp1jhGCN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   7087f62c7333ca95c6a5c57f5ba52bd1594f22cf
commit: 8de79ad68f8faf19c34157966d448b4821d9dbe9 [35/65] perf: RISC-V: add support for SSE event
config: riscv-randconfig-r111-20260522 (https://download.01.org/0day-ci/archive/20260522/202605221019.hp1jhGCN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221019.hp1jhGCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221019.hp1jhGCN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/perf/riscv_pmu_sbi.c:1158:52: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cpu_hw_events [noderef] __percpu *hw_events @@     got void *arg @@
   drivers/perf/riscv_pmu_sbi.c:1158:52: sparse:     expected struct cpu_hw_events [noderef] __percpu *hw_events
   drivers/perf/riscv_pmu_sbi.c:1158:52: sparse:     got void *arg
>> drivers/perf/riscv_pmu_sbi.c:1173:59: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void *arg @@     got struct cpu_hw_events [noderef] __percpu *hw_events @@
   drivers/perf/riscv_pmu_sbi.c:1173:59: sparse:     expected void *arg
   drivers/perf/riscv_pmu_sbi.c:1173:59: sparse:     got struct cpu_hw_events [noderef] __percpu *hw_events

vim +1158 drivers/perf/riscv_pmu_sbi.c

  1154	
  1155	#ifdef CONFIG_RISCV_PMU_SBI_SSE
  1156	static int pmu_sbi_ovf_sse_handler(u32 evt, void *arg, struct pt_regs *regs)
  1157	{
> 1158		struct cpu_hw_events __percpu *hw_events = arg;
  1159		struct cpu_hw_events *hw_event = raw_cpu_ptr(hw_events);
  1160	
  1161		pmu_sbi_ovf_handler(hw_event, regs, true);
  1162	
  1163		return 0;
  1164	}
  1165	
  1166	static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
  1167	{
  1168		int ret;
  1169		struct sse_event *evt;
  1170		struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
  1171	
  1172		evt = sse_event_register(SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW, 0,
> 1173					 pmu_sbi_ovf_sse_handler, hw_events);
  1174		if (IS_ERR(evt))
  1175			return PTR_ERR(evt);
  1176	
  1177		ret = sse_event_enable(evt);
  1178		if (ret) {
  1179			sse_event_unregister(evt);
  1180			return ret;
  1181		}
  1182	
  1183		pr_info("using SSE for PMU event delivery\n");
  1184		pmu->sse_evt = evt;
  1185	
  1186		return ret;
  1187	}
  1188	#else
  1189	static int pmu_sbi_setup_sse(struct riscv_pmu *pmu)
  1190	{
  1191		return -EOPNOTSUPP;
  1192	}
  1193	#endif
  1194	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
