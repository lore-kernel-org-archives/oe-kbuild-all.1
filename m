Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE41FA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677830945; x=1709366945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mE27vZH9mFiIKwQrN3jSxJA3PKkbvBa/FV53hW4kDxo=;
  b=nT6HMuwXGb3q6/Fv/w+kR3cy8eLueRIYELoPsdZT6gElYgTFLw3j2Ki4
   o1ridj5RQh4QJyWZpnclS5AMqFbFMy6XfPCgcC1bY6EEE7sZmJ/eT+QWu
   mk2GXQBgF6WwHYEbiqnEsaDHeT7IjuWM30JjennVmtGcoeR7VRh6qUYli
   tRsiCApqT0QASS8Xl6Xrz+RoezC6B4GreHzyiRBjC919KsiTL+nO5d7jS
   hBs7bjC9tdAmcSOBYmrpfy7dw73xwJ//uHoy87sTYpwpDYSJd9AMeFNu3
   LYSGsvUtSMzuQa/YjeRDv4W7OXQ5NC9PT970bBezGxWIVPlrMkFWopqjx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314645113"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="314645113"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 00:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739419261"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="739419261"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2023 00:09:04 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY0TP-0001K6-2Q;
	Fri, 03 Mar 2023 08:09:03 +0000
Date: Fri, 3 Mar 2023 16:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:ftrace/histogram-modulus 4/4]
 trace_events_hist.c:(.text.hist_fn_call+0xe60): undefined reference to
 `__umoddi3'
Message-ID: <202303031653.YAC1QcS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git ftrace/histogram-modulus
head:   015392a98dd571647a79d205bfaaae7e97947aa1
commit: 015392a98dd571647a79d205bfaaae7e97947aa1 [4/4] tracing/hist: add modulus operator
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230303/202303031653.YAC1QcS3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=015392a98dd571647a79d205bfaaae7e97947aa1
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark ftrace/histogram-modulus
        git checkout 015392a98dd571647a79d205bfaaae7e97947aa1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031653.YAC1QcS3-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/trace/trace_events_hist.o: in function `hist_fn_call':
>> trace_events_hist.c:(.text.hist_fn_call+0xe60): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
