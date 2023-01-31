Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F7373
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 01:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675127548; x=1706663548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VlNAMiZ21EJGEkaNHVF3aHXOSiRjUop66burlfmSlQk=;
  b=Ns8QL4rs4romAMQIc8R4fxkPLYbVpM817+SBtdV7LCeYpLz0VIRgF1MN
   bJ8wZzFnRD5fspML28MVQpZRCDWlSKJ3TkImsL7HSyDHta8XaJlCadyq0
   2+aLL8/fXGsBwvgcBQh2If+42y/I9oZOQWRDDXF/WVGSzESWEJ38pQAqh
   t+BkefIKGg0O6snpaLnlH0QhGzUI2bV7P2zWO8QzaREYPg7BX/DxOCeCR
   FtxgL6lw/qxppgQkgolJKpDieOcLSwzD90OfS35ccpytjLZRxmq5AMccT
   1Fo8agn+m/SDOanupsUSBpawlGtzhXgNK2vsa+GVXn1HmSyBf4WxMGbo3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392270812"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="392270812"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 17:12:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664293489"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664293489"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 17:12:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMfCE-00041q-0c;
	Tue, 31 Jan 2023 01:12:26 +0000
Date: Tue, 31 Jan 2023 09:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [linux-next:master 7027/9183] ftrace-ops.c:undefined reference to
 `__udivdi3'
Message-ID: <202301310939.TAgCOEZb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae0c77e1bc6963c67c6c09e8c72959fcb1ed8d5f
commit: b56c68f705cad0cff61fbe132c66ced2c737c65c [7027/9183] ftrace: Add sample with custom ops
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230131/202301310939.TAgCOEZb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b56c68f705cad0cff61fbe132c66ced2c737c65c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b56c68f705cad0cff61fbe132c66ced2c737c65c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: samples/ftrace/ftrace-ops.o: in function `ftrace_ops_sample_init':
>> ftrace-ops.c:(.init.text+0x368): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
