Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD13859D7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jun 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745923; cv=none; b=rna2u04QWgJIwG21A2bV22j+A/zRNjuA/NUyoCqTJjUOhUBARzHFLKAWkxH4TFO1g6/N2//KYXa0fqBmcQxe2QuXDuD+sSN17iKHlfiUjkWp+BSfU/W3BDqnFWDwFvoQNdKtIFX0nyPW1kgrIS0iuvoTp5bRZidLIMcYWcn63Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745923; c=relaxed/simple;
	bh=HQawruqw3md/EMoNEhYHS6IG6w48Ul5qzHj3VBz2Kvw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JevLI1Ri3TALIl5nLAt+/lmRaWWz7b7ju5qi/daKanX9vob6CegWeh8l/hSBkS2O6wT35CVuoHPMtC1LPIalfAYlmOjULTvzIDxE1wdb3nytT5Fy29kF5V/i9+XRIGyI1Co72I6YVTB3TwINNFdRI9l9XOY6Wh+WNe7SxyxeF4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncKxgFz5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncKxgFz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780745919; x=1812281919;
  h=date:from:to:cc:subject:message-id;
  bh=HQawruqw3md/EMoNEhYHS6IG6w48Ul5qzHj3VBz2Kvw=;
  b=ncKxgFz59j2GRVd8UT1PiOuESwfzism9BTMTcgZfmjuCBdXfdrRJ2uqr
   FMbR04D0Qzcee+6Xhm46mJJveshKrmwxG6wMbJzJxRc4HVuSONfCLjB0r
   S+v/mD+4Ua/2xpDEUFvfI9LQNFvJ9r8l7u4YdbP2cFxShY2dQ6pjbJeyT
   q5L/88x93UUKv/12qqfBmeQIKrU2aga+VZl9Mh8zGKG5ncNS9OepRmgcY
   /vzB/p8vbcWxarMpeTZW1OAIZyzgWI+/8bfHF3+tLQ1dua3ZGfCwPCRfG
   d/9BBdQDGoRjHLaIITfQRglMXe2TQuAoZf7I3D4su/HYSAl8SGkRNqGsP
   w==;
X-CSE-ConnectionGUID: OiaNIzqVSyKXzV5ZVNzCxg==
X-CSE-MsgGUID: QzdTpwppTUScQ2Xpl2U4Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="85413350"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="85413350"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 04:38:39 -0700
X-CSE-ConnectionGUID: UrzadlqUTLyX6YByQkY7MQ==
X-CSE-MsgGUID: v/g2SRKnTwO+RGaZW+fc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="244223190"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jun 2026 04:38:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVpMH-00000000GxC-3vmE;
	Sat, 06 Jun 2026 11:38:33 +0000
Date: Sat, 06 Jun 2026 19:37:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 6/68] Warning: lib/rhashtable.c:736
 function parameter 'ht' not described in 'rhashtable_next_key'
Message-ID: <202606061925.WI4bYI8k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   8ddce416797b7454ba1df855821b02c6e43b5a0e
commit: 8f4fa9f89b72845fa8ac956bff2e1d2ba5722f2e [6/68] rhashtable: Add rhashtable_next_key() API
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260606/202606061925.WI4bYI8k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606061925.WI4bYI8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606061925.WI4bYI8k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/rhashtable.c:736 function parameter 'ht' not described in 'rhashtable_next_key'
>> Warning: lib/rhashtable.c:736 function parameter 'prev_key' not described in 'rhashtable_next_key'
>> Warning: lib/rhashtable.c:736 function parameter 'ht' not described in 'rhashtable_next_key'
>> Warning: lib/rhashtable.c:736 function parameter 'prev_key' not described in 'rhashtable_next_key'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
