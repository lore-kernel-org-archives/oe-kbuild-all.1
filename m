Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6614F9E1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 17:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724259837; cv=none; b=OJiL70USpV96zdDVHVflPKdpSnlgvVHP1NDJhMNQyg6IJVBVRZHJhYe/Jj92fU2vzdZ7PhZ3dN/HrNDmoMDW0/O326XSWVOzhOHfSJLsO9B1ZZ2iMBVHeN+e8j8ptSimHwWlNInUd2tz8CnqRGpuqf8cdt49NGU3zISgR0hLqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724259837; c=relaxed/simple;
	bh=zVb7N7teN50UCGvp9J4epP4tHglFDwbmszo0DeKaocY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJPZojlIoKgvp6e9lfTXPtu5RvAsm4RCXxtpbiBSgbcVzhSW/tBARYitGJN5gcUCAxcYUpL90+Fzjch+YtY8mpyGHX2RMEfC47FIfERC9y3AGwjNokjoqKXHSTcMIytaNzuaruSsyyG6fP7FICbVoeE+bybtj0jeKkmK1P27jIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=espkxAvK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="espkxAvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724259835; x=1755795835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zVb7N7teN50UCGvp9J4epP4tHglFDwbmszo0DeKaocY=;
  b=espkxAvKf09uZQXBkYr04ZSDMU9CJJkKUOgy0aDqZ78R43tPxYOhk21K
   IT1a/K5rOXTmmJmckovE/YYHImxHV4bGa+kdF1CpbPvygxpTTDQBG5PYR
   JKLcjvz7SxnG1D/fZJMGXG0DHTSE9ByJ8GVJhfOIx8VNjo7IbZCSI587G
   0O5BFfAmB13aKkmDsADFeFmGGNNdMA2dnRmPxsB7UfIlURMSBOwUGKHfJ
   lecigU4L+s2pErxI07UetYLCFmnKlfRpp4FfH3YdDXSNEmh0od2Wz4loD
   e+JkwNdpS2c7N9BMCEDadaPnDhRNjV3u/3+gd803rKhYGxB3Pk+9NMSpj
   w==;
X-CSE-ConnectionGUID: 7oHJ8GWFTCqX/oera+Q9hw==
X-CSE-MsgGUID: ELM5AqnrTKuPXhX1DymXZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22801601"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22801601"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 10:03:52 -0700
X-CSE-ConnectionGUID: BItUzTpYSCy0e4ZRFuhUaw==
X-CSE-MsgGUID: 9CDopL3pSCeqLuECMbQeTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="91938471"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2024 10:03:51 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgokO-000BjM-2G;
	Wed, 21 Aug 2024 17:03:48 +0000
Date: Thu, 22 Aug 2024 01:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/20] ./usr/include/fwctl/cxl.h:22:9: error:
 unknown type name '__u32'
Message-ID: <202408220152.b4IxxRxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   49296e2e608f31151e3b5644cf88a65b7f7b56e5
commit: e6537a248fe6241de233cf02c499dfd48ce73fce [17/20] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: x86_64-buildonly-randconfig-003-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220152.b4IxxRxr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220152.b4IxxRxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220152.b4IxxRxr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/fwctl/cxl.h:22:9: error: unknown type name '__u32'
      22 |         __u32 uctx_caps;
         |         ^~~~~
>> ./usr/include/fwctl/cxl.h:29:9: error: unknown type name 'uuid_t'
      29 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/fwctl/cxl.h:30:9: error: unknown type name '__u32'
      30 |         __u32 flags;
         |         ^~~~~
>> ./usr/include/fwctl/cxl.h:31:9: error: unknown type name '__u16'
      31 |         __u16 offset;
         |         ^~~~~
>> ./usr/include/fwctl/cxl.h:32:9: error: unknown type name '__u8'
      32 |         __u8 version;
         |         ^~~~
   ./usr/include/fwctl/cxl.h:33:9: error: unknown type name '__u8'
      33 |         __u8 reserved[9];
         |         ^~~~
   ./usr/include/fwctl/cxl.h:34:9: error: unknown type name '__u8'
      34 |         __u8 data[];
         |         ^~~~
   ./usr/include/fwctl/cxl.h:55:9: error: unknown type name '__u32'
      55 |         __u32 id;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:56:9: error: unknown type name '__u32'
      56 |         __u32 flags;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:59:25: error: unknown type name '__u16'
      59 |                         __u16 opcode;
         |                         ^~~~~
   ./usr/include/fwctl/cxl.h:60:25: error: unknown type name '__u16'
      60 |                         __u16 rsvd;
         |                         ^~~~~
   ./usr/include/fwctl/cxl.h:62:17: error: unknown type name '__u32'
      62 |                 __u32 rsvd;
         |                 ^~~~~
   ./usr/include/fwctl/cxl.h:66:17: error: unknown type name '__u32'
      66 |                 __u32 size;
         |                 ^~~~~
   ./usr/include/fwctl/cxl.h:67:17: error: unknown type name '__u32'
      67 |                 __u32 rsvd;
         |                 ^~~~~
>> ./usr/include/fwctl/cxl.h:68:17: error: unknown type name '__u64'
      68 |                 __u64 payload;
         |                 ^~~~~
   ./usr/include/fwctl/cxl.h:76:9: error: unknown type name '__u32'
      76 |         __u32 rpc_cmd;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:77:9: error: unknown type name '__u32'
      77 |         __u32 payload_size;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:78:9: error: unknown type name '__u32'
      78 |         __u32 version;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:79:9: error: unknown type name '__u32'
      79 |         __u32 rsvd;
         |         ^~~~~
>> ./usr/include/fwctl/cxl.h:81:47: error: field 'query' has incomplete type
      81 |                 struct cxl_mem_query_commands query;
         |                                               ^~~~~
   ./usr/include/fwctl/cxl.h:87:9: error: unknown type name '__u32'
      87 |         __u32 retval;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:88:9: error: unknown type name '__u32'
      88 |         __u32 rsvd;
         |         ^~~~~
   ./usr/include/fwctl/cxl.h:89:9: error: unknown type name '__u8'
      89 |         __u8 payload[];
         |         ^~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
