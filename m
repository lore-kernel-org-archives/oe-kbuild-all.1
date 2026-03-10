Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E33E5EF6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130200; cv=none; b=B+TB+x/D2e3MsiU/0pGWCzu8J40ZEIMloNbjyia0CeBndZplrrNrFC1GrvQKpd2wB35Xq7b6xoguCDPFs5x2E+t1fWgeOYo8l/O+7P6ppPy6C0bMoxghkdl2EwOMpLDq2pMZMXVYaCt3oARAaNnBASNUI5oswrkSmr9tAfkHoSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130200; c=relaxed/simple;
	bh=7yrqkj9fJ9B/94IUYImD8EPzhohy3UFVDRo7szX/BF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YzW1KWE8+dk38JwJb//eYn6dG3iuBibWhuhG5W7GS2wdFhGkJ2Roljt5LmErxxW5QBae77Lje2Gz6cO1sEneTf38lcBXquZmxDWVS26P2n4fGwmF5sw4VakJ62dkt+wLdDzDN7hDjxri1CcMyZjZN7Hs29WP2gJH/ec2VzW4CfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzMxQpRa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzMxQpRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773130198; x=1804666198;
  h=date:from:to:cc:subject:message-id;
  bh=7yrqkj9fJ9B/94IUYImD8EPzhohy3UFVDRo7szX/BF4=;
  b=KzMxQpRa+FnhPqePvaV+Ih33+eJiEdvyTAKSix89FTX2pb9q8YyfmRKs
   1AYxN12pR/DRaK9IyO6+oTSauIse7DTVkHAMoXN1/7hmDlpEI1ta2iCc1
   yBWC50M3+0zUpfsH6vU2UKRJMygSMovRUwOCdKUfCWieaIHEk6/pIxqcA
   GmvN4SGvrUojh44yBer+mEMhPw7Y4A8sXZ8jPw8zoEWAdCCazHv7/auVq
   U/SZzCH//yJ7LdtB3p/iFt1fw8payguXNRWzaOwfQByHI/pQEZdSHwHW5
   lm/rCGeyvPe7hU+G/lu9NC6txnqi3wVMbIioNGqlZyqELNbTkCjiw5nn2
   Q==;
X-CSE-ConnectionGUID: +O2DH++CS1yRuz3OVjZGlg==
X-CSE-MsgGUID: NsHHVYcJTMOaRVwAxZpoSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78020442"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="78020442"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 01:09:56 -0700
X-CSE-ConnectionGUID: /AcjzBdNR4y9s0LA7djDjQ==
X-CSE-MsgGUID: XVOrmWiGSFewm+xKpNnixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="250516546"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2026 01:09:55 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzsA4-000000001Z4-1IRZ;
	Tue, 10 Mar 2026 08:09:52 +0000
Date: Tue, 10 Mar 2026 16:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:stacklive 8/21] kernel/bpf/liveness.c:1294
 arg_track_log() warn: inconsistent indenting
Message-ID: <202603101612.0l9frZ28-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   e91b0f9c6173771e5fcc844122d5a005ce4e3a89
commit: 830ebe4b805c87598479362b4cdbda743cc54868 [8/21] bpf: Add per-subprog arg tracking analysis
config: x86_64-randconfig-161-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101612.0l9frZ28-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101612.0l9frZ28-lkp@intel.com/

smatch warnings:
kernel/bpf/liveness.c:1294 arg_track_log() warn: inconsistent indenting

vim +1294 kernel/bpf/liveness.c

  1275	
  1276	static void arg_track_log(struct bpf_verifier_env *env, struct bpf_insn *insn, int idx,
  1277				  struct arg_track *at_in, struct arg_track *at_stack_in,
  1278				  struct arg_track *at_out, struct arg_track *at_stack_out)
  1279	{
  1280		bool printed = false;
  1281		int i;
  1282	
  1283		if (!(env->log.level & BPF_LOG_LEVEL2))
  1284			return;
  1285		for (i = 0; i < MAX_BPF_REG; i++) {
  1286			if (memcmp(&at_out[i], &at_in[i], sizeof(*at_in)) == 0)
  1287				continue;
  1288			if (!printed) {
  1289				verbose(env, "%3d: ", idx); verbose_insn(env, insn);
  1290				bpf_vlog_reset(&env->log, env->log.end_pos - 1);
  1291				printed = true;
  1292			}
  1293			verbose(env, "\tr%d: ", i); verbose_arg_track(env, &at_in[i]);
> 1294			verbose(env, " -> "); verbose_arg_track(env, &at_out[i]);
  1295		}
  1296		for (i = 0; i < MAX_ARG_SPILL_SLOTS; i++) {
  1297			if (memcmp(&at_stack_out[i], &at_stack_in[i], sizeof(*at_stack_in)) == 0)
  1298				continue;
  1299			if (!printed) {
  1300				verbose(env, "%3d: ", idx); verbose_insn(env, insn);
  1301				bpf_vlog_reset(&env->log, env->log.end_pos - 1);
  1302				printed = true;
  1303			}
  1304			verbose(env, "\tfp%+d: ", -(i + 1) * 8); verbose_arg_track(env, &at_stack_in[i]);
  1305			verbose(env, " -> "); verbose_arg_track(env, &at_stack_out[i]);
  1306		}
  1307		if (printed)
  1308			verbose(env, "\n");
  1309	}
  1310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
