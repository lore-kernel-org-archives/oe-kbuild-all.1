Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D72770A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 00:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311017; cv=none; b=M6b1UYfHi9OwxcxBY9zTbifxwh571Blu615bZBhJLvpDVJgNxyf76AEZnLadJVZU6vesQfCjYcqJ0JRxWQtRB3YLVnvoO+B612f6g0Jg9yo55cymIYYanrmrSJw2xuJ3mXEtp6ohZlt8/LrFm2skdKUs2hOFpCmwkUfpWC/YiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311017; c=relaxed/simple;
	bh=SKDiXHePuAyeXNzknJSyiwJw2797eaphjpfFtoS3Lu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=e+pqWaj6IQcz9nM3Qr/Jc6ec/CxlFEHG5tw7JsIzlrUHKDGK2SJLUl3nidu1jEk73e59njxFyTL8NlmV2pgl5nVXb1zQyNerfLc0hakxvXoyTUGUL5mGCPqZRBOzU1oY0CJQ3sOCxo4P8d3PnFWrUVIiAVHwWnrI8C3Onskqjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvOiEycl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvOiEycl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774311014; x=1805847014;
  h=date:from:to:cc:subject:message-id;
  bh=SKDiXHePuAyeXNzknJSyiwJw2797eaphjpfFtoS3Lu4=;
  b=JvOiEycl/NR4ESoQKIx0k0qVZ7xQnWhyiGhTHWn0TErA4L5flztsJDwd
   c0uQPA44ofmOSeIDYg9PpMnmUo+fSRXv1DjkB4BWXds6xXR+p9o7/j0cA
   k1D6ifx3TPMGPFiv5GzHFfpdcuUQxqCX4kkMRe5JA/UQhkDfOKdc0BLNw
   sMLyOM+X1WJVR1R6r2MS4bP29kKV8MHOP55eC/tms/pAv+hYsHWi/VWeU
   orWQBwiQusrfVA4onpQP7zcYSF6xWBYkNiB1sgLQHOEF6XKkSHBQHHTHu
   qlb6EzrCUNOOrrfhtHI14J+zz/H+E+7MxElBvcbA5JU5oFnsiv+68X8E6
   g==;
X-CSE-ConnectionGUID: mysED1d4RF+iAfdnxHPE7Q==
X-CSE-MsgGUID: OJSupkW5QX+CbYfGDUzI9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97940761"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="97940761"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:10:14 -0700
X-CSE-ConnectionGUID: n1IRWXl0TZ+sXEuta0c07w==
X-CSE-MsgGUID: VmmvGAwhSRGsPu2qLteYVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224403081"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Mar 2026 17:10:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4pLW-000000006l3-1l7N;
	Tue, 24 Mar 2026 00:10:10 +0000
Date: Tue, 24 Mar 2026 01:09:51 +0100
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: oe-kbuild-all@lists.linux.dev, Florian Westphal <fw@strlen.de>,
 linux-doc@vger.kernel.org
Subject: [netfilter-nf-next:testing 14/14] htmldocs:
 Documentation/networking/ipvs-sysctl.rst:40: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202603240111.Z3ZKbxGg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   93cd433f9f3d3ef04f6c03a201f5d91ca2965dd9
commit: 93cd433f9f3d3ef04f6c03a201f5d91ca2965dd9 [14/14] ipvs: add conn_lfactor and svc_lfactor sysctl vars
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260324/202603240111.Z3ZKbxGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240111.Z3ZKbxGg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Non-Preserved Properties
   ======================== [docutils]
   Documentation/networking/ipvs-sysctl.rst:39: ERROR: Unexpected indentation. [docutils]
>> Documentation/networking/ipvs-sysctl.rst:40: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/networking/skbuff:36: ./include/linux/skbuff.h:48: ERROR: Unexpected section title.


vim +40 Documentation/networking/ipvs-sysctl.rst

     9	
    10	am_droprate - INTEGER
    11		default 10
    12	
    13		It sets the always mode drop rate, which is used in the mode 3
    14		of the drop_rate defense.
    15	
    16	amemthresh - INTEGER
    17		default 1024
    18	
    19		It sets the available memory threshold (in pages), which is
    20		used in the automatic modes of defense. When there is no
    21		enough available memory, the respective strategy will be
    22		enabled and the variable is automatically set to 2, otherwise
    23		the strategy is disabled and the variable is  set  to 1.
    24	
    25	backup_only - BOOLEAN
    26		- 0 - disabled (default)
    27		- not 0 - enabled
    28	
    29		If set, disable the director function while the server is
    30		in backup mode to avoid packet loops for DR/TUN methods.
    31	
    32	conn_lfactor - INTEGER
    33		Possible values: -8 (larger table) .. 8 (smaller table)
    34	
    35		Default: -4
    36	
    37		Controls the sizing of the connection hash table based on the
    38		load factor (number of connections per table buckets):
  > 39			2^conn_lfactor = nodes / buckets
  > 40		As result, the table grows if load increases and shrinks when
    41		load decreases in the range of 2^8 - 2^conn_tab_bits (module
    42		parameter).
    43		The value is a shift count where negative values select
    44		buckets = (connection hash nodes << -value) while positive
    45		values select buckets = (connection hash nodes >> value). The
    46		negative values reduce the collisions and reduce the time for
    47		lookups but increase the table size. Positive values will
    48		tolerate load above 100% when using smaller table is
    49		preferred with the cost of more collisions. If using NAT
    50		connections consider decreasing the value with one because
    51		they add two nodes in the hash table.
    52	
    53		Example:
    54		-4: grow if load goes above 6% (buckets = nodes * 16)
    55		2: grow if load goes above 400% (buckets = nodes / 4)
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
