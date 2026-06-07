Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F41C3F0C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jun 2026 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780851774; cv=none; b=Vls2jEkJZfAx8NBElsqUz1MQin1/AgjK+VDFYDjgFi7c7rE3GQgaXDk7NSM4AuEeTpYnokAMAt+dWlOmWfkQlER7hH1J9O4w9260ipTcu9igsw+t7OJlQFQFdkzWVzl9/1+7lr1aNLCGSF8KudtYQ4d50T3zMnyjmTUA7Q0N6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780851774; c=relaxed/simple;
	bh=bpKK9UxFK9PGXLvFYFdtW7zRIDlLupmIyZnBtKjY9+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pake493t3DEwz1OhPKRMKFgQtHWvGw+RLcfRl71Fmlitse6BkH36/Yvf1j48Oia2XnrAU2omBtRA6JYwkoWa7QzYm/fcAsXYskcxqBiC9xo2UnWL1+U9AaZMlVwueIoO2JoIYfk++Lfz4rzTGXa77jNNm6MJkPhdD7rgwQGuiNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkRnWvGw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkRnWvGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780851773; x=1812387773;
  h=date:from:to:cc:subject:message-id;
  bh=bpKK9UxFK9PGXLvFYFdtW7zRIDlLupmIyZnBtKjY9+o=;
  b=fkRnWvGw/j4cHj5hSAyRLUHDxMRwoKsFfm5iZk2W4h2O/8YsQCCsYAgq
   v+0CatDsY9WmJd1ikhbyfHLiNV9GW7P6rWSMLpOBaWWZ5RxQBIDGxKp7J
   WCMKXQ9zyLlc6/dkQ+iMdo6JqAfdYj7bati8uhZOlNb6EylEqQbiXt3r/
   po47xRqr0CWoH1T9MS3aAEZ8bDgvSpIgkdJB8CI9Blvk4LllaLPRVS17C
   l20p4i3CvnWODLE5XRf0SlpOWhUXKw0CZWHUp1gerdIGuxBD4WOXd0avm
   5vjN4fuVKkYp/MKxmKzgThDX+58ds8OG9Qjgpjs61it//xwuY2txuH65g
   w==;
X-CSE-ConnectionGUID: mGPnI6ULQq6uXPvW9FgzQQ==
X-CSE-MsgGUID: 1XgDAcvyS8Ga6XbPajW6ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81599320"
X-IronPort-AV: E=Sophos;i="6.24,192,1774335600"; 
   d="scan'208";a="81599320"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 10:02:53 -0700
X-CSE-ConnectionGUID: k47Hh8x3QJeRMUOaREd2ag==
X-CSE-MsgGUID: /hlXrveoQpeOnrGnzyPD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="250427593"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2026 10:02:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWGtc-0000000034H-0HSD;
	Sun, 07 Jun 2026 17:02:48 +0000
Date: Sun, 07 Jun 2026 19:02:24 +0200
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: oe-kbuild-all@lists.linux.dev,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-doc@vger.kernel.org
Subject: [netfilter-nf-next:for-netdev-nf-next-26-06-07 1/15]
 htmldocs: Documentation/networking/ipvs-sysctl.rst:76: WARNING: Block quote
 ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202606071851.Dc1H7hOO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git for-netdev-nf-next-26-06-07
head:   d3bf9eae486490832bd08fd62ab0ac601f346bd4
commit: 4a15044a2b06748c99a8c8c3c6b3ee0a01f8004d [1/15] ipvs: add conn_max sysctl to limit connections
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260607/202606071851.Dc1H7hOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606071851.Dc1H7hOO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Checksumming on output with GSO
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>> Documentation/networking/ipvs-sysctl.rst:76: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/networking/ipvs-sysctl.rst:76: ERROR: Unexpected section title or transition.


vim +76 Documentation/networking/ipvs-sysctl.rst

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
    39	
    40			2^conn_lfactor = nodes / buckets
    41	
    42		As result, the table grows if load increases and shrinks when
    43		load decreases in the range of 2^8 - 2^conn_tab_bits (module
    44		parameter).
    45		The value is a shift count where negative values select
    46		buckets = (connection hash nodes << -value) while positive
    47		values select buckets = (connection hash nodes >> value). The
    48		negative values reduce the collisions and reduce the time for
    49		lookups but increase the table size. Positive values will
    50		tolerate load above 100% when using smaller table is
    51		preferred with the cost of more collisions. If using NAT
    52		connections consider decreasing the value with one because
    53		they add two nodes in the hash table.
    54	
    55		Example:
    56		-4: grow if load goes above 6% (buckets = nodes * 16)
    57		2: grow if load goes above 400% (buckets = nodes / 4)
    58	
    59	conn_max - INTEGER
    60		Limit for number of connections, per netns.
    61	
    62		Controls the soft and hard limit for number of connections.
    63		Initially, the platform specific limit is assigned for init_net.
    64		The value can be changed and later the soft limit propagated
    65		to other networking namespaces.
    66	
    67		Privileged admin can change both limits up to the value of the
    68		platform limit while the unprivileged admin can change only the
    69		soft limit up to the value of the hard limit.
    70	
    71		For setups using conntrack=1 (CONFIG_IP_VS_NFCT for
    72		Netfilter connection tracking) the connections can be
    73		limited also by nf_conntrack_max.
    74	
    75					soft limit	hard limit
  > 76		=====================================================
    77		init_net:
    78		create netns		platform	platform
    79		priv admin		0 .. platform	0 .. platform
    80		=====================================================
    81		new netns:
    82		create netns		init_net:soft	init_net:soft
    83		priv admin		0 .. platform	0 .. platform
    84		unpriv admin		0 .. hard	N/A
    85	
    86		Limits per platform:
    87		1,073,741,824 (2^30 for 64-bit)
    88		   16,777,216 (2^24 for 32-bit)
    89	
    90		Possible values: 0 .. platform limit
    91	
    92		Default: platform limit
    93	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
