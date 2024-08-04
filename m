Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33218E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Aug 2024 00:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722730252; cv=none; b=PRc6WJvCtJH8rhBxI9LmpEyQozd6OFVNKJvD90MylDzCQFLc+gQ1azN/Th8xcE6B1pIigCXi7uzc/Mo7T0qWGW7vBnKY0Qd4N07CU18GlKf11qA/xQQKnPYswza/eJQsb/OeKGwFgFkoqu4dbtdW+/+nAXRARSXsvkUgUHmxr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722730252; c=relaxed/simple;
	bh=Y3GDOgSi1wy5B3mmfocPcEhVHqZybspZ6+yMlzVOZRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LXb8RRnBHnw9ktT3oGoirBn/oNl7tgTqAgJWDdT6jfrR5aS+EpALh2qc+sfI4bqd0QhwSsAyoSO6/SXxJ3cqFgc6qXDOlPviKKQOr7JmROUL9RowTxxXwWkA+xvXxPnQdI+eIKnhOrwR3pUrjSdojpXAvZKq/Fsb2m8ut/TzNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWqKC7Ku; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWqKC7Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722730250; x=1754266250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3GDOgSi1wy5B3mmfocPcEhVHqZybspZ6+yMlzVOZRU=;
  b=jWqKC7KuRX4e5UjMMkKK+VeFiwOo1COO9B12JeG82RFuvVuHk0ZN81rZ
   jQJc8R8WQoB08Bv9C2tEW+Kv8kb6ptRHSwOwxEeX+EyKCYkY/Q/jo3UBn
   KfmwiUTmEgo/estLEub5P/4drMUD16/c8CQN3m5IgO+9lBqC7IjYtLyGb
   R+sQJfZ9PH28wB8gtX2kjl0E2PWHO533eI3xdq+IyTht5BrHkBTbT6z0J
   Ng0T/uhqdt1qJH4hviyt6hqwdjDLsmCJ3o3SWPcl5SewwS6UUoHNDOpcr
   4p7q+7WZ+eivS4iH0oP1Rq/2tKM7ehHIe7EZ4v4FE6mACNn2RmW7b+A4S
   g==;
X-CSE-ConnectionGUID: 2cXzFeWsTz+n98MxPfBhgg==
X-CSE-MsgGUID: ZkOoQ6bdQZawhNPrhEdhAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20600629"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20600629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 17:10:37 -0700
X-CSE-ConnectionGUID: n+fX4kjbRZWUo9daB53BRQ==
X-CSE-MsgGUID: najhjhXmTWmW1e1vzqsDmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="86732604"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2024 17:10:37 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saOpW-00011m-2C;
	Sun, 04 Aug 2024 00:10:34 +0000
Date: Sun, 4 Aug 2024 08:10:09 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 8/36] ld: include/trace/events/page_pool.h:68:
 undefined reference to `__tracepoint_page_pool_state_hold'
Message-ID: <202408040838.38xAcPrc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   c5e494e528ec5659c10faca8a4a9227e0aa7fe5a
commit: 8306bf316a4d3928d670f98e9e6a3b3218e8c73a [8/36] memory-provider: dmabuf devmem memory provider
config: x86_64-randconfig-076-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040838.38xAcPrc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040838.38xAcPrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040838.38xAcPrc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `trace_page_pool_state_hold':
   include/trace/events/page_pool.h:68: undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: include/trace/events/page_pool.h:68: undefined reference to `__tracepoint_page_pool_state_hold'
   ld: include/trace/events/page_pool.h:68: undefined reference to `__SCT__tp_func_page_pool_state_hold'
>> ld: include/trace/events/page_pool.h:68: undefined reference to `__tracepoint_page_pool_state_hold'
   ld: vmlinux.o:(__jump_table+0x2bee8): undefined reference to `__tracepoint_page_pool_state_hold'
   ld: vmlinux.o:(.static_call_sites+0xc0a4): undefined reference to `__SCK__tp_func_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
