Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA90136A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 00:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727395672; cv=none; b=QYhqPLQgKvgTT+L0z0DzyD28PFomjSdPd/VjhX9uuxex4ZxLNQ1ApfSWmNToL5Xd+RI0cub4daOnkLM2/ahgJTbzQETLM6xIIBJuUj3VKOoNlv2N6T0bTyonvZQZNgQcI6w4MVlPiZ3JDjhiLDW35G7y2RqvFvIf9nm2k45Y7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727395672; c=relaxed/simple;
	bh=QApanHwDHIXwdP0q4yiJXoW38DVaOixQ7oZRWrs8Hr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5aMlpFGM9HnRi296K5gEdtuqN7Mz97/0nXZbbHuSCXNmJEyUwL+h8Pote3AD78uEhgPaukutTrDwsI+u0Bk0wos3iXYGFzn0XnP705RNKaAhKGWYSsHEKN1WPeyH2ORmXQWqhx89SpQ49f/FblARyHs2xrJm/NwLOJKBygb91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIZ9W5TW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIZ9W5TW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727395671; x=1758931671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QApanHwDHIXwdP0q4yiJXoW38DVaOixQ7oZRWrs8Hr8=;
  b=OIZ9W5TWq06BF2xnc82JWh+qCKT2s91dkwQVwCm9gcw2PWjrksT3eMuR
   VFlTq6kv4XLw1fI8A6e9qAAT4yAyWeKEezt3M6wDHE5Ygi3iYw3Qnx7qr
   KxaFgzuMIvgJ2HmxIg1qWo9lk55o3XzM50wxI8EsLjQBFmwy49wvlxUlb
   21JEKvJ/WvbqEOZsy5euyIZuUx7IcMFmtDEjcbVHafvS6rhBFx5r8BBCO
   ji246YtdSyQi5ZA9t3gEHiEeg3do/7XNKLw2FbEk0++owJKzqO/bvZOLX
   +Y18ZzgkWzdvT6HOMH6I1ptY29/DVEm1bPtrlCnORbx80LN5xyxgFfIq7
   Q==;
X-CSE-ConnectionGUID: dcBsQPVLSrunTXIzA8m8gA==
X-CSE-MsgGUID: juIl0MSsQ4eN9p9Nwse8rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49058331"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="49058331"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 17:07:51 -0700
X-CSE-ConnectionGUID: icGsGTdwRvq3KoZYp5Hbyw==
X-CSE-MsgGUID: Ab1lQi5jTWWmseJYJJIJyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="103127669"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 17:07:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1styWQ-000LJj-3C;
	Fri, 27 Sep 2024 00:07:46 +0000
Date: Fri, 27 Sep 2024 08:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 22/25] ./usr/include/fwctl/cxl.h:29:9: error:
 unknown type name 'uuid_t'
Message-ID: <202409270848.CvZOWsul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: a35b1a880d87c874f47a8acd68bad9e251a342fd [22/25] fwctl/cxl: Add support for fwctl RPC command to enable CXL feature commands
config: i386-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270848.CvZOWsul-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270848.CvZOWsul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270848.CvZOWsul-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./usr/include/fwctl/cxl.h:22:9: error: unknown type name '__u32'
      22 |         __u32 uctx_caps;
         |         ^~~~~
>> ./usr/include/fwctl/cxl.h:29:9: error: unknown type name 'uuid_t'
      29 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/fwctl/cxl.h:30:9: error: unknown type name '__u32'
      30 |         __u32 flags;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:31:9: error: unknown type name '__u16'
      31 |         __u16 offset;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:32:9: error: unknown type name '__u8'
      32 |         __u8 version;
         |         ^~~~
   ./usr/include/fwctl/cxl.h:33:9: error: unknown type name '__u8'
      33 |         __u8 reserved[9];
         |         ^~~~
   ./usr/include/fwctl/cxl.h:34:9: error: unknown type name '__u8'
      34 |         __u8 data[];
         |         ^~~~
   ./usr/include/fwctl/cxl.h:51:9: error: unknown type name '__u32'
      51 |         __u32 id;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:52:9: error: unknown type name '__u32'
      52 |         __u32 flags;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:53:9: error: unknown type name '__u16'
      53 |         __u16 opcode;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:54:9: error: unknown type name '__u16'
      54 |         __u16 rsvd;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:55:9: error: unknown type name '__u32'
      55 |         __u32 size;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:56:9: error: unknown type name '__u32'
      56 |         __u32 rsvd1;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:57:9: error: unknown type name '__u64'
      57 |         __u64 payload;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:64:9: error: unknown type name '__u32'
      64 |         __u32 rpc_cmd;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:65:9: error: unknown type name '__u32'
      65 |         __u32 payload_size;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:66:9: error: unknown type name '__u32'
      66 |         __u32 version;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:67:9: error: unknown type name '__u32'
      67 |         __u32 rsvd;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:72:9: error: unknown type name '__u32'
      72 |         __u32 retval;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:73:9: error: unknown type name '__u32'
      73 |         __u32 size;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:74:9: error: unknown type name '__aligned_u64'
      74 |         __aligned_u64 payload[];
         |         ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
