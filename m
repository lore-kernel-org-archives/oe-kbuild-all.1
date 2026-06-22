Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79D33BBD7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147774; cv=none; b=Ut68MDUJ4+1L3Y9cr0anwzF4s33LtYMRnZr0Fu8IjKTzI0L6VL+I9dacszbtLgt1eAm4Ii1LxfFCBA7DhKJSrEu4QlArtfPcfdlhHBQYk1B8YxO4KPzg1xl5lHQWCT3bSsg0lnSFRHxg8Wr24CCR/zFVr0bA8LsRpMhiwqeLP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147774; c=relaxed/simple;
	bh=zDItVZ4xShOKo7SqT5Ikvd0IiA4o/TLMyioxCFBGnIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QojL8g6o1ZWCKMVgnWv5HkHd1N4LaVI3TYKuLMgMtrPrfPoLNidks52rV423H+gmBhx+ijlfNGlTVIVKs1hfwYHvJo3fN2yI3NpyW6a/mCWxdvRCeto2zYAClC86gvmyrvazuE8UWOBshQmXWCznBC0tQCFcR9AA53/U5i1p9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrOFOR3T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrOFOR3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782147772; x=1813683772;
  h=date:from:to:cc:subject:message-id;
  bh=zDItVZ4xShOKo7SqT5Ikvd0IiA4o/TLMyioxCFBGnIw=;
  b=BrOFOR3TzV1pp1OJlOsbJdC9UyhD3dWyvz6oJXC90ZvF8GEqEoCKOlvL
   EU7TJKjksGyX4+M44yJOUunBSIDhIlfa4MhCT5+ptXAxaJjMgJbP9Llyj
   1BdFl0NYWXztl0alOMC3ret0RWEHETEBeY//Fbat1rudAevVYJsItOTCx
   QFFzyR+6GCfGueRlDYTxGEurq4jiC77LGFFauaMjq0lBmWxJPMLNRGlN/
   qtAFyqHKceSbOCEtmFN1efjVAMlY6HUd5hQti3EwqrU1C52XAGTkniL2y
   3WL8Cn80RCxN9KHXK+DsX71LHtRcVwAhnfZmFAVKu25RksJBvQwQlTzU6
   Q==;
X-CSE-ConnectionGUID: O46rzlD0R96C5QMG0CWyjA==
X-CSE-MsgGUID: gWqhQNn/Tfulh7HiSTfAIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108426529"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="108426529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:02:52 -0700
X-CSE-ConnectionGUID: EoEcyRueRAyexzk4kiuOFA==
X-CSE-MsgGUID: DB0DxvrcQwuOuW//NTrzag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="244926687"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jun 2026 10:02:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbi2p-000000001aI-19Wd;
	Mon, 22 Jun 2026 17:02:47 +0000
Date: Tue, 23 Jun 2026 01:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>
Subject: kernel/bpf/liveness.c:1273 arg_track_log() warn:
 inconsistent indenting
Message-ID: <202606230027.3jJdEt4k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: bf0c571f7feb6fa05a512e2a5e50702501849d61 bpf: introduce forward arg-tracking dataflow analysis
date:   2 months ago
config: um-randconfig-r072-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230027.3jJdEt4k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bf0c571f7feb ("bpf: introduce forward arg-tracking dataflow analysis")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230027.3jJdEt4k-lkp@intel.com/

smatch warnings:
kernel/bpf/liveness.c:1273 arg_track_log() warn: inconsistent indenting

vim +1273 kernel/bpf/liveness.c

  1253	
  1254	static void arg_track_log(struct bpf_verifier_env *env, struct bpf_insn *insn, int idx,
  1255				  struct arg_track *at_in, struct arg_track *at_stack_in,
  1256				  struct arg_track *at_out, struct arg_track *at_stack_out)
  1257	{
  1258		bool printed = false;
  1259		int i;
  1260	
  1261		if (!(env->log.level & BPF_LOG_LEVEL2))
  1262			return;
  1263		for (i = 0; i < MAX_BPF_REG; i++) {
  1264			if (arg_track_eq(&at_out[i], &at_in[i]))
  1265				continue;
  1266			if (!printed) {
  1267				verbose(env, "%3d: ", idx);
  1268				bpf_verbose_insn(env, insn);
  1269				bpf_vlog_reset(&env->log, env->log.end_pos - 1);
  1270				printed = true;
  1271			}
  1272			verbose(env, "\tr%d: ", i); verbose_arg_track(env, &at_in[i]);
> 1273			verbose(env, " -> "); verbose_arg_track(env, &at_out[i]);
  1274		}
  1275		for (i = 0; i < MAX_ARG_SPILL_SLOTS; i++) {
  1276			if (arg_track_eq(&at_stack_out[i], &at_stack_in[i]))
  1277				continue;
  1278			if (!printed) {
  1279				verbose(env, "%3d: ", idx);
  1280				bpf_verbose_insn(env, insn);
  1281				bpf_vlog_reset(&env->log, env->log.end_pos - 1);
  1282				printed = true;
  1283			}
  1284			verbose(env, "\tfp%+d: ", -(i + 1) * 8); verbose_arg_track(env, &at_stack_in[i]);
  1285			verbose(env, " -> "); verbose_arg_track(env, &at_stack_out[i]);
  1286		}
  1287		if (printed)
  1288			verbose(env, "\n");
  1289	}
  1290	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
