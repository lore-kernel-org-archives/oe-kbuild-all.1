Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2D3D75
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675693802; x=1707229802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtEA8cM0f6Q/ayS9kW9nugncOMA9EPPg+YML/PRBHRM=;
  b=a42ZRXKI9wamdXE2t7i4XHamKRnS42SoxGNfotrBeQa7SUJZUmtCndXP
   n0PLkq8oZurpq06wzQe8AGJRxvb3NNWsdbnAaBITi1LwhZyjxBCcJWFIB
   i8Ql0GLHSoCTKDPpTHwh7vXkvrLIsrKtWZe9mmmsupKeWDJj2zeCdgpuw
   a6fJxITW8sWbePdqMRRkpGMqvZ6n3jNixznZxQiTGHtx5q2xJZS98vakP
   /0v0ZaxgF4QPWOLwOK4xQaKOuxWg8Ypr8ZtG0hvKO//k9NAiI4w3wp+Jm
   8VlkAOXsiV3cQn0gQjzkK9C0LC87wOu90F4Aa5OP+AO0S8M4uXISQOBiP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308859440"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="308859440"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 06:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="735145845"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="735145845"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 06:30:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP2VL-0002ay-32;
	Mon, 06 Feb 2023 14:29:59 +0000
Date: Mon, 6 Feb 2023 22:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [linux-next:master 6635/10565] samples/ftrace/ftrace-ops.c:15:14:
 sparse: sparse: symbol 'nr_function_calls' was not declared. Should it be
 static?
Message-ID: <202302062223.7F7gv80M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   129af770823407ee115a56c69a04b440fd2fbe61
commit: b56c68f705cad0cff61fbe132c66ced2c737c65c [6635/10565] ftrace: Add sample with custom ops
config: x86_64-randconfig-s043-20230206 (https://download.01.org/0day-ci/archive/20230206/202302062223.7F7gv80M-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b56c68f705cad0cff61fbe132c66ced2c737c65c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b56c68f705cad0cff61fbe132c66ced2c737c65c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash samples/ftrace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> samples/ftrace/ftrace-ops.c:15:14: sparse: sparse: symbol 'nr_function_calls' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:24:14: sparse: sparse: symbol 'nr_ops_relevant' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:33:14: sparse: sparse: symbol 'nr_ops_irrelevant' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:45:6: sparse: sparse: symbol 'assist_recursion' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:49:6: sparse: sparse: symbol 'assist_rcu' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:117:19: sparse: sparse: symbol 'ops_relevant' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:118:19: sparse: sparse: symbol 'ops_irrelevant' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:166:15: sparse: sparse: symbol 'tracer_relevant' was not declared. Should it be static?
>> samples/ftrace/ftrace-ops.c:167:15: sparse: sparse: symbol 'tracer_irrelevant' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
