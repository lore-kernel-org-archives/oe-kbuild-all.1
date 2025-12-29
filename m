Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE581624E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 01:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766970122; cv=none; b=DwE6ZZ59GGrvoy8k7WroIJlKDjzhfQ/tpg9c9UYI6sIBRHgQYzRmiag9v8L1pt68jcTqt7Kn9F4V5pIKxcicZOV/w3kK+vUHYvKK/vuWhqmv/D2144+pveRAEnkcXPbEvi4kI4lMIlZn7i47eP8P/19ELjDTkcV35d4nSx/DdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766970122; c=relaxed/simple;
	bh=xlwNDZh9YPSbJhl/Po7oDqkzhYnIPkcnnLBIw8WPKMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPd8kYKhFuF+RoI4pzG4ecJ19R/prn/gJwNSiti2C99IBfMNdqYZF/94bRQ3ddNjY2zdvm7ANqwJJreALbB+Cx8fdSn0MxkgsHV0ihtmlmzSH9GRdcsUfunSADpg9KZ3i/FCIvwGKCkQWHLJ6Cyvqp9ysUhDrdSz28a7qR+Bt2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvMmdynQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvMmdynQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766970121; x=1798506121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xlwNDZh9YPSbJhl/Po7oDqkzhYnIPkcnnLBIw8WPKMY=;
  b=JvMmdynQkwJDhoi3Kp/jfgP4bwwQn6mPs63eo+WzwjJPx72EqSVAzHUh
   W7KmTFgpN7vvFv+ScTg4tq8gyJxKeHl0U1Iw8HHJ+tl8dVWm97BPAGVbU
   GnoeBvNWuf7CTmpAilquax/Z7Xxoz4eWjHxd2CfIN6217Tx2q76ZafSNG
   1fLmrCD1DiV9507FB8McGhdzBon0GDJQ+UWv8oJwFqtVOmj1O/nuPf/Sm
   KCGChagKA5rxzl5BYAjCBGD6W9pgTajietTziGZJ6MK+y5ga9M6hKAbid
   L7t5SEc2hsqqwHao7pgVdM/GM/Kz6PWzAyMWQYtWfkd6Lt8yZRaCTCDTX
   Q==;
X-CSE-ConnectionGUID: mV8oA/VrTCe3z8coFTiz9g==
X-CSE-MsgGUID: xQNoOYPpRfymLmTDgSxhAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="67590768"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="67590768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 17:02:01 -0800
X-CSE-ConnectionGUID: +a8rtBL0S+WqtS/uRMtNFA==
X-CSE-MsgGUID: 2kE5IXzbTz2W1y0wP4rZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="204932224"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Dec 2025 17:02:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va1e1-000000007dW-0bgA;
	Mon, 29 Dec 2025 01:01:57 +0000
Date: Mon, 29 Dec 2025 02:01:28 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 113/131] htmldocs: Documentation/driver-api/basics:75:
 ./kernel/signal.c:5950: WARNING: Inline emphasis start-string without
 end-string. [docutils]
Message-ID: <202512290259.B1YOnFTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: dc79a5b89557449a3ad50f5a47f2f10564df7610 [113/131] kernel/api: add API specification for sys_rt_sigaction
reproduce: (https://download.01.org/0day-ci/archive/20251229/202512290259.B1YOnFTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512290259.B1YOnFTb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:75: ./kernel/signal.c:5888: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5892: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5899: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5902: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:5908: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/basics:75: ./kernel/signal.c:5950: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/driver-api/basics:75: ./kernel/signal.c:5950: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:6220: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:6221: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:6231: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:6233: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/basics:75: ./kernel/signal.c:6287: ERROR: Unexpected indentation. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
