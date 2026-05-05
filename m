Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CF41DE894
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 22:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778020870; cv=none; b=NsL7UYPjctQp8cucp/Z3KM8vm4XaGpdRcjZOBBtaNEX6wSHASQRbMeyG3GPadHYJDz1+He/1ltDDhh0rNLORoOWF0RtBZtdCp3wqp5SOs7sqCD0BzgKBQoVgKqOU7uAhpV4QinmYsKRZ+mIrKpGI/tpPdv9iY04Mz6LIWx1K5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778020870; c=relaxed/simple;
	bh=QCOI9huLcgmWmAQmSGKtea1oPMMW7VGtGTbf1NqsGOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mKyedWsXHpfjbNmvaXdHLlnHuVEI4bZxvmB+hgG3VKzVlV6n7uLZ4f4HBzZNNZ9Z6veeC09umVa1ctTkEmx8scyRxH3uwAGie9C5qVvBZb1HVY0EUbyddxfOX4djI0V1EWXHwcaSORsz+xA7EGUb4s6zY5i8LP+vZEKLwZvlwss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FONnCNlf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FONnCNlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778020869; x=1809556869;
  h=date:from:to:cc:subject:message-id;
  bh=QCOI9huLcgmWmAQmSGKtea1oPMMW7VGtGTbf1NqsGOg=;
  b=FONnCNlfX0evOH46D6Pzin8WDGwvVpBQpVDqo7IVfdLEFl9U2GOZqd7o
   STTqg2V0bekufVIl6B5TvuZyPGJNUNlDVjLAmvKCL327sRWi5M7PQ3G0j
   l50G0DybfE04siqMQNHxYx0JGAQItOWVkRRkU8YbLSH3xBTklYlv8xUpT
   QrPqSX5BEmkyuZzv73DtAWhAc0h82m99RIy7D8dFY+GDz4phscQ570k6h
   0NK0ypSrgMgVT5wKCZI7X+uUkFf18b8TPMP2h5uSoBQvFpPtr8Nd6G3su
   9wwnHBOxOwQbR40QmcErtcomx4jUv/GSQgIiugs0w2GkmlVc/38ReIkEZ
   w==;
X-CSE-ConnectionGUID: fej6I1qVQh6eEnXukxP6uQ==
X-CSE-MsgGUID: ga1hbC4vSzqiwtL0sBTmpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90364475"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="90364475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 15:41:08 -0700
X-CSE-ConnectionGUID: 3CaFITo8S+K1S8JLke+maw==
X-CSE-MsgGUID: GawKRbVaTrWDSQA//p9Byw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="236191375"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 May 2026 15:41:06 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKORs-000000006Mb-1bIn;
	Tue, 05 May 2026 22:41:04 +0000
Date: Wed, 06 May 2026 00:40:44 +0200
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 linux-doc@vger.kernel.org
Subject: [frank-li:for-next 1/53] htmldocs:
 Documentation/driver-api/firmware/other_interfaces.rst:116: WARNING: Blank
 line required after table. [docutils]
Message-ID: <202605060054.EQwFXknk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git for-next
head:   2dfb59f50bc1e1600fa1be5a97a21185306f5f78
commit: 3b4531c6e0f4c8874f0266853a410438eda1fc24 [1/53] Documentation/firmware: add imx/se to other_interfaces
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260506/202605060054.EQwFXknk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060054.EQwFXknk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/firmware/other_interfaces.rst:60: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/firmware/other_interfaces.rst:103: ERROR: Unexpected indentation. [docutils]
   Documentation/driver-api/firmware/other_interfaces.rst:115: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/firmware/other_interfaces.rst:116: WARNING: Blank line required after table. [docutils]
>> Documentation/driver-api/firmware/other_interfaces.rst:140: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./drivers/firmware/imx/se_ctrl.c
   ERROR: Cannot find file ./drivers/firmware/imx/se_ctrl.c
   WARNING: No kernel-doc for file ./drivers/firmware/imx/se_ctrl.c
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.


vim +116 Documentation/driver-api/firmware/other_interfaces.rst

    94	
    95	::
    96	   +--------------------------------------------+
    97	   |            Character Device(C_DEV)         |
    98	   |                                            |
    99	   |   +---------+ +---------+     +---------+  |
   100	   |   | misc #1 | | misc #2 | ... | misc #n |  |
   101	   |   |  dev    | |  dev    |     | dev     |  |
   102	   |   +---------+ +---------+     +---------+  |
   103	   |        +-------------------------+         |
   104	   |        | Misc. Dev Synchr. Logic |         |
   105	   |        +-------------------------+         |
   106	   |                                            |
   107	   +--------------------------------------------+
   108	
   109	   +--------------------------------------------+
   110	   |               Service Layer                |
   111	   |                                            |
   112	   |      +-----------------------------+       |
   113	   |      | Message Serialization Logic |       |
   114	   |      +-----------------------------+       |
   115	   |          +---------------+                 |
 > 116	   |          |  imx-mailbox  |                 |
   117	   |          |   mailbox.c   |                 |
   118	   |          +---------------+                 |
   119	   |                                            |
   120	   +--------------------------------------------+
   121	
   122	- service layer:
   123	  This layer is responsible for ensuring the communication protocol that is defined
   124	  for communication with firmware.
   125	
   126	  FW Communication protocol ensures two things:
   127	  - Serializing the messages to be sent over an MU.
   128	
   129	  - FW can handle one command message at a time.
   130	
   131	- c_dev:
   132	  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
   133	  Using these multiple device contexts that are getting multiplexed over a single MU,
   134	  userspace application(s) can call fops like write/read to send the command message,
   135	  and read back the command response message to/from Firmware.
   136	  fops like read & write use the above defined service layer API(s) to communicate with
   137	  Firmware.
   138	
   139	  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
 > 140	::
   141	
   142	                                Non-Secure               +   Secure
   143	                                                         |
   144	                                                         |
   145	                +-----------+      +-------------+       |
   146	                | se_ctrl.c +<---->+imx-mailbox.c|       |
   147	                |           |      |  mailbox.c  +<-->+------+    +------+
   148	                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
   149	                      |                               +------+    +------+
   150	                      +----------------+                 |
   151	                      |                |                 |
   152	                      v                v                 |
   153	                  logical           logical              |
   154	                  receiver          waiter               |
   155	                     +                 +                 |
   156	                     |                 |                 |
   157	                     |                 |                 |
   158	                     |            +----+------+          |
   159	                     |            |           |          |
   160	                     |            |           |          |
   161	              device_ctx     device_ctx     device_ctx   |
   162	                                                         |
   163	                User 0        User 1       User Y        |
   164	                +------+      +------+     +------+      |
   165	                |misc.c|      |misc.c|     |misc.c|      |
   166	 kernel space   +------+      +------+     +------+      |
   167	                                                         |
   168	 +------------------------------------------------------ |
   169	                    |             |           |          |
   170	 userspace     /dev/ele_muXch0    |           |          |
   171	                          /dev/ele_muXch1     |          |
   172	                                        /dev/ele_muXchY  |
   173	                                                         |
   174	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
