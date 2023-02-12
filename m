Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A86FBC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 22:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676240343; x=1707776343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xuWcmxYgBKKWnbnyOoD40pHHzlssnKgysqbfItOOHS0=;
  b=bmglMbhhRtvr1b7xcnef6ol8ECTD5UBFP7lrIt794bPAIQjH1kVYYzFu
   tu9Q1dWvJzdtrkI/KFL+HE3X6jOPIH6vAOWBVsIhByDO17w6VZi1ZeQSa
   /QTTlitAR5arqqdhuszP46MWIS8OULRnDEDrGgOfdqJPnz3p30PDG1qx0
   uHVrnA3Db6G4wJe5HWDjCLxMsyqRPFXMJhf1O6Doo5YBJGBClVDXF9Axp
   7bd02Nu7dGC4OnbYF95KTjM3HNQ7njWwhTLTArSf740fXd7CAvOaDPXfL
   pV4qWkRyJ4AGwkzEB2l8kmaKhe9p/tPvne/B4UOaB1eSvv9QVfv8r3BoY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="328469732"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="328469732"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 14:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="914113123"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="914113123"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2023 14:18:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRKgP-0007PF-2g;
	Sun, 12 Feb 2023 22:18:53 +0000
Date: Mon, 13 Feb 2023 06:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202302130528.EBxqMZbW-lkp@intel.com>
References: <20230212153250.1099136-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212153250.1099136-2-vdonnefort@google.com>

Hi Vincent,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on rostedt-trace/for-next v6.2-rc7 next-20230210]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
patch link:    https://lore.kernel.org/r/20230212153250.1099136-2-vdonnefort%40google.com
patch subject: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping functions
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230213/202302130528.EBxqMZbW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/96cfb7d92682fb5df39febc590fec75748b47e15
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
        git checkout 96cfb7d92682fb5df39febc590fec75748b47e15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130528.EBxqMZbW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/ring_buffer.c:1140:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   kernel/trace/ring_buffer.c:1140:32: sparse:     expected restricted __poll_t
   kernel/trace/ring_buffer.c:1140:32: sparse:     got int
>> kernel/trace/ring_buffer.c:6017:6: sparse: sparse: symbol 'rb_put_mapped_buffer' was not declared. Should it be static?
   kernel/trace/ring_buffer.c:5043:9: sparse: sparse: context imbalance in 'ring_buffer_peek' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5129:9: sparse: sparse: context imbalance in 'ring_buffer_consume' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5492:17: sparse: sparse: context imbalance in 'ring_buffer_empty' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5522:9: sparse: sparse: context imbalance in 'ring_buffer_empty_cpu' - different lock contexts for basic block

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
