Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1162D1F77
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792313626; cv=none; b=NvglRwFBfnHstD4RYM2JYuyEuUlP7fSzor2mB7OxIKO/29TzCDql8FXW8IBRrQCSPGdsHKTlPiVPn/zi9e+J1V97MlwLzUanOvCDtbEEfyeZDqgVnY10bFQqmsszRuDnyuXUhlpX2f/KwP9epu4jCBcRQUjYSlDZWFNLFDMBnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792313626; c=relaxed/simple;
	bh=bdpVkC6C5/L0RAhsSaIA83sH8ahrbxIk56JL80J1W2k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rqef1pi7U+cMWgxwwx3BkcDg1wL3eySS6UyiIqMsqRAea00dwSdS35/zz1pQaVCGuxLZpnyn49oYT1ffIiROKNZS3+Qj77eZRECZx/DEwnqH2+t+fa1q43KqSU+p6Xx8Vji6XmfykNsGJemZY+Ox1bBc7wOvm0wOLiLsaU5e6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Af9Xidsm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Af9Xidsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792313624; x=1823849624;
  h=date:from:to:cc:subject:message-id;
  bh=bdpVkC6C5/L0RAhsSaIA83sH8ahrbxIk56JL80J1W2k=;
  b=Af9XidsmDU5LYCR5VcxXF6FgapZjYG7sSRsbmaMpPAwjFaoFyRqgOFgS
   jixH0C/mdOWXR7yny0IqK11F3V8sUbrRJdNxKFcXU6hCAinIQQmo6yqAD
   gNywW7AXLpdMlvuKCdLsXnFJkwkLm3K2HSz5RmIwiuHlvlIl8YLsNYKfR
   QJULkzCeXAiVwZTsZkP1390jAMf+XBJ91rQd/k+NfkAgDzh7unK6Egby2
   hPlyp164mUmBS9Db5m+nMt5+Hd25cv161sXmQ2+LwjsrA+3QC4VjPLV6u
   W6bfAEVQn33AY+OlABcS1haZEhYhy9lJpJf6NSItnn7+gUqlInC6dKnxW
   Q==;
X-CSE-ConnectionGUID: Qvi82FWqRmWVUQgStEoc6g==
X-CSE-MsgGUID: s8ck4QNPQBGsETzOM1dj4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1020269"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="1020269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 01:53:44 -0700
X-CSE-ConnectionGUID: RaVh2Nu3T5GM6Ahr15mTuA==
X-CSE-MsgGUID: 5FwLqwSTTOWZDIGl3IK5zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2278629"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Oct 2026 01:53:42 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIMeC-00000000KHG-2yXO;
	Sun, 18 Oct 2026 08:53:40 +0000
Date: Sun, 18 Oct 2026 16:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 8505/9682] ERROR: modpost:
 sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: symbol 'sof_of_pm'
 undefined!
Message-ID: <202610181644.LRNlH3I0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bard,

First bad commit (maybe != root cause):

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   b29e05f38f3bb0504c83e54e674f3083a3b33211
commit: 626c94ed7156ece970ce4c8a4c9cdd1055e44417 [8505/9682] Merge branch 'sound/upstream-20260903' into merge/sound-upstream-20260903
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261018/202610181644.LRNlH3I0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181644.LRNlH3I0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181644.LRNlH3I0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: missing MODULE_DESCRIPTION()
>> ERROR: modpost: sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko: symbol 'sof_of_pm' undefined!
ERROR: modpost: sound/soc/sof/snd-sof-fw-gdb.ko: symbol 'sof_client_ipc4_find_debug_slot_offset_by_type' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
