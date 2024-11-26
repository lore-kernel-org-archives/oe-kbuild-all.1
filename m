Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787E42A80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 04:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732595569; cv=none; b=KnIn+HmZa0ugiM67E9ApTYai7IRzUuOnA/ixWmQAj3+xW4BrtE0ImIc9OggPtjqn4mZxgTjWh0FjTwchtcBahNi8cp2AJ3nkuG6J6tgmJBci8MH07o5qGR6RTcRZwfhFaXAxgNLu31mVSdcdYwbkv/JsVqD4SoFN/TXEMgFdzaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732595569; c=relaxed/simple;
	bh=Ft1cG9dvrvU+Pe7YR54TUJakNm2rw+7RUPRCDK43MjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTTiU1w3XFCR2Ai/0iM+hLbjQEIxUh/1eotV0oQr9YgDEBFtzOn3kwfLP5rAb9jsFmVAp3CTQc3FKf8BtfgvRu1PzdWYXqnrEZS2J/JBF2io8AuvUHZyjiBupsTFjARy5XTpKwvOLGiLk8OkRF/vaNJ0tqcSS/0JMixdYKWP9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKmB0RkD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKmB0RkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732595568; x=1764131568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ft1cG9dvrvU+Pe7YR54TUJakNm2rw+7RUPRCDK43MjY=;
  b=VKmB0RkDmJB37CsUKrywPpe1bZpl1dNb20s/AcGNh6/4f3iiuuC4+wdH
   qytMbqtdUBPi04aCWfDb7br8hS6uM03zHsaCU57zHglPGlMv7pqzrfVjw
   LRj5f2jVrdtCrARzAw/VNWwl1BpcE2DR/k1DC4r7q8IfnedJN513G0dse
   fVg9+g8wE1fp0eg2M+ZgniMZmRIZSnWxzPKs4KGsS1dFgcwJY88wzA0ri
   FrqLgDLiLRzkRPUWmWcOTV5rA7kFtUWoN2POy/wOqOEIA/zJYbfFmMNG4
   HrrLmLYfAo7lzy1lEUdKLGEk+3JAscpjogZ05rqvyX2TwA80wGRHKGe1A
   A==;
X-CSE-ConnectionGUID: FaqqTxOgQuanBix1GCyYPw==
X-CSE-MsgGUID: UQOKz8Z+RRqsFcjiB1wcww==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32792982"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32792982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 20:32:45 -0800
X-CSE-ConnectionGUID: 9jZBbiItRHq1cMgVKRIkuw==
X-CSE-MsgGUID: Zlv5uU2zSeCQZ6HMjrAZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="92300196"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 20:32:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFnFi-00074B-04;
	Tue, 26 Nov 2024 04:32:42 +0000
Date: Tue, 26 Nov 2024 12:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 7/7] drivers/clk/clk-gpio.o: warning:
 objtool: __jump_table+0x8: can't find key sym
Message-ID: <202411261250.8COKa9gz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-noinstr
head:   e876185909a78808ab603ad2dcc7e2e09a67bc25
commit: e876185909a78808ab603ad2dcc7e2e09a67bc25 [7/7] objtool: Add noinstr validation for static branches/calls
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20241126/202411261250.8COKa9gz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261250.8COKa9gz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261250.8COKa9gz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-gpio.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_domain.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_table.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_matcher.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_rule.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_ste.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_send.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_action.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/dr_definer.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_matcher.o: warning: objtool: __jump_table+0x8: can't find key sym
--
>> drivers/net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_send.o: warning: objtool: __jump_table+0x8: can't find key sym
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
