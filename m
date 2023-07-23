Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143933C1C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 22:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690152003; x=1721688003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MmdmQUeW5aVVhqStuLPCo+WZJdoOUU4XQzcNFFx6Csg=;
  b=IIY4O65otTzbynRwDBGS+2vPFtRkXdiKGYlda4o7pDmnc3aDnn6pu9pD
   XRSXShnCF5LuYk4XNRyxITH/j8t5X7Yt+/jTcNpLONNzU2bOfq1fMBz7h
   T2RmdxR/g0OyUHBq1ElN5rK9yAw9FRGArnICDKR7xF07u1vW0xDLmfmbn
   pS/VVoLNQI1sFRsWAL93CyPuZnAkCZk6jV6QYn9iLk1Tp6V3gMn8scaPL
   JmVAGbtU8GV9nXc7tDPoaOj8cUP561fSZ09M1pOxkGvgxF7jmtXR7Tkl0
   NnreRLzBz4svNVQL4hP/0y78sVAABONP9PIm23bOEdjNJ56HME/ZADQJb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="366201781"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="366201781"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 15:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="725496538"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="725496538"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 23 Jul 2023 15:40:00 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNhk7-0009JP-1h;
	Sun, 23 Jul 2023 22:39:59 +0000
Date: Mon, 24 Jul 2023 06:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 116/178] /usr/bin/ld: warning:
 .tmp_vmlinux.kallsyms3 has a LOAD segment with RWX permissions
Message-ID: <202307240658.SxxnUx54-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   b0baca6cec9c27d53e027e3128a0b3837eb5df60
commit: f812ace859f4171152199883e3dc5b8d67e93ff6 [116/178] kallsyms: Improve the performance of kallsyms_lookup_name()
config: um-randconfig-r023-20230724 (https://download.01.org/0day-ci/archive/20230724/202307240658.SxxnUx54-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240658.SxxnUx54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240658.SxxnUx54-lkp@intel.com/

All warnings (new ones prefixed by >>):

   /usr/bin/ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
>> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms3 has a LOAD segment with RWX permissions
>> /usr/bin/ld: warning: .tmp_vmlinux.kallsyms3.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
