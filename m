Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF04270540
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 05:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784353239; cv=none; b=scp9/qfTg4c0zkxwZaR5cAPfodT3Ay7v1qSmwKQOcgmiRyaSutk/+EJoNvv+C6tGGu6FLrgr8qRIjOd3bkb1av5/QKQMLLFgShRnd4jrqN4F6k8HTI7hO2vwY7nsXPPLZLl71AIfLoJG9dOk9UQfTlUPWk8f6XaYV2J41BdlrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784353239; c=relaxed/simple;
	bh=Gj1Lyj6SMlG9gRIJRAwbkmA3TiT8lDcJX8eIk7hM7zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KA7AFdhyw+mzszFWSWlrf3vDMLTYhpseB1NOJO+Kv8bwMEcD7cI9suzKb2X2xCzz0HHyJxGa29xEkClGX1ApCtge83Al9VmLpmBFs5T0L5eAOVXLwdJTFrHh6beE3LC3oahPg6TA8oMdMc80wfPJ9f9EuotPvcoiVRjhVwfA5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AD6+NzQa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AD6+NzQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784353238; x=1815889238;
  h=date:from:to:cc:subject:message-id;
  bh=Gj1Lyj6SMlG9gRIJRAwbkmA3TiT8lDcJX8eIk7hM7zw=;
  b=AD6+NzQaMuTPqFDqkWKzGJ36zWMDn6kYxj+JK++Av8qQfwCIAUfFeIC3
   gQu64+ch/GqRWdRgflXvi85C/4BK7dprdg4QpLSwlR1/ca1yRE0btM2iw
   b1ewKKzVo0fy+ciTrGOxXV2loRce/aeE/Xwb/dUsnH2Mr7GPFOqcv7tMW
   sWV7IwoeeFgWS0GuaifOTiYq0YYX6v+TO1KS2RRUI5WUkgvhOjnBr9Pbe
   RpCtjV5sA7vDz6NmjrQY5rj7SSRONbBOVfqgBWjCATa4Uoh8ByETtccoP
   FU8IEzs6jszG0ksP7dYBtfU9oAj505eDcP5BmeqsNN9fGomFowapjpDt/
   g==;
X-CSE-ConnectionGUID: njtMuY7+QaGHRc5qSnP/4A==
X-CSE-MsgGUID: tTL91MiuRs2WB7Z4TR1weQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="88836216"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="88836216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 22:40:37 -0700
X-CSE-ConnectionGUID: Jzu+AJXEQDKcHe0CGgHRew==
X-CSE-MsgGUID: b6yulisfSvCOmQBsCuhLVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="252995515"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jul 2026 22:40:36 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkxmr-000000005jN-3f1s;
	Sat, 18 Jul 2026 05:40:33 +0000
Date: Sat, 18 Jul 2026 07:39:35 +0200
From: kernel test robot <lkp@intel.com>
To: Weiming Shi <bestswngs@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Tung Nguyen <tung.quang.nguyen@est.tech>
Subject: Warning: net/tipc/node.c:149 struct member 'work' not
 described in 'tipc_node'
Message-ID: <202607180730.TwVgASDI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Weiming-Shi/tipc-fix-NULL-deref-in-tipc_named_node_up-on-empty-publication-list/20260718-030322
head:   e94537041399c865695c83dbb9c1e7df6f8c0e5e
commit: 94540b49437176024eb3fef1947e64f96994b340 tipc: fix NULL deref in tipc_named_node_up() on empty publication list
date:   10 hours ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260718/202607180730.TwVgASDI-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180730.TwVgASDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180730.TwVgASDI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/tipc/node.c:149 struct member 'work' not described in 'tipc_node'
>> Warning: net/tipc/node.c:149 struct member 'work' not described in 'tipc_node'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
