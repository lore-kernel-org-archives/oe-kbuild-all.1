Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD5306B21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 06:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771050186; cv=none; b=QyUomJCQDjdF6PYWTRFp0mcKbh3k9lv1mT5RTwWp4s3Az8Ac08ySfUKQi0am9VJzXS6MqS6c7mM1EH1G7fp4fo4sQb78nCRKYDOL34U8uK1IsOxEGLMHXWx41f/5pWdlqlbVQU9Dxj4QW3NdM0BorIgwPA9WC7JBi5xFL+GKG5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771050186; c=relaxed/simple;
	bh=WttpaZT/hMxYcPqLbG3IUsf/OsBsT637KVlD0E1kSqw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=txOsspNLqvoxzAt7KOlUvOCPTT7FLTbUCZhbP0WuQTPP7EiBxiacw1NpEzGMsN/lSjf9/jyKzuZND97VUBZtrhUpsEcgwEiIjb4xZGZ1yMufob8+upt5dOMJ9JAHrnrt3lHrjE03PHfFOLnbWbDmHJNb9f2EmE6L8y48yVne+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE/8Yi5E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE/8Yi5E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771050178; x=1802586178;
  h=date:from:to:cc:subject:message-id;
  bh=WttpaZT/hMxYcPqLbG3IUsf/OsBsT637KVlD0E1kSqw=;
  b=TE/8Yi5EqkqU6An2K/HpdBO0giMnLIoLGAiib6vHHfSaS4DGCf37/dcV
   1IFtlwBlNjmwJxt7835CrmNySQUBOMoCU0LU6WwtvxHzpPoT8ba5BdSTt
   D1ZQAjacmsziPH3TlvxYskGN8pyi6ZK0WmYuPGsaqmTggvCUYPpiLXsag
   bG9TDu0lbtLXNcS12cAleA9wrMpluojj/uiMjI/4NG1QlWjEoz5oYrTDg
   RFznzoupm8cRovIL74DNiU/QnQEFnFdWS9n4R7ZKaaLzGss2k8ayA2hhu
   qhIZmor9QNMM3FZ5gXClR0KRc52nD3zJwontWq/F/J1SGHxseW/fIuHF4
   A==;
X-CSE-ConnectionGUID: rTAdkpo4QUKm+UeJJAOq0g==
X-CSE-MsgGUID: FJbPPdHWS9KpiK+CqnqivQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="82860707"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="82860707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 22:22:57 -0800
X-CSE-ConnectionGUID: vzi52I7lT+yxXPL0nqrmlg==
X-CSE-MsgGUID: tdaqreM+T36wDM4Snk603A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="213220066"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2026 22:22:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr93N-000000001mz-2V3S;
	Sat, 14 Feb 2026 06:22:53 +0000
Date: Sat, 14 Feb 2026 07:22:38 +0100
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:qp-trie 4/8] kernel/bpf/qp_trie.c:35:12: error:
 flexible array member in a struct with no named members
Message-ID: <202602140708.ZIW7rgWv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git qp-trie
head:   85dca79aa9199152741f7429b86cf4cb78f21124
commit: 8e2c1f634e226c78b9fe6fcf77a0e1d2769d7143 [4/8] bpf: Add QP-trie map type
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260214/202602140708.ZIW7rgWv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140708.ZIW7rgWv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140708.ZIW7rgWv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/qp_trie.c:35:12: error: flexible array member in a struct with no named members
      35 |         u8 data[];      /* key[key_size] followed by value[value_size] */
         |            ^~~~


vim +35 kernel/bpf/qp_trie.c

    33	
    34	struct qp_trie_leaf {
  > 35		u8 data[];	/* key[key_size] followed by value[value_size] */
    36	};
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
