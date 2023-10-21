Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546563C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 22:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WF75q6vO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697927430; x=1729463430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=djejmMFC3O0wM8gMlGV7yHwjbMvqe1uwT0DwjkNsLLw=;
  b=WF75q6vOeBeTw8qslox0Lr4cLekuomQe0IrIyQKZ0HDTcQSdznCQPadG
   cySMzl9f8etxy1/ne5ZeX+Jq4qGTeuPz31ruffceBbRQCfnQWnOBSZZtI
   HNlwVfx8weUcFQIXrTLQl8iqk4TEWkJB/6VLaqjzOHyLrGNAGxsMpSd8e
   wjaY2Wm3/41cJNDH6jNFxLmcPYzr4HYr/CfA0wwOaDrb+ScVYEjiwAu75
   evWi2Y+2u6yGHIQP4+H/JyQ6CtDAxXiIUrI+2Dh7k4hzedj5cxSHAQxym
   APaB7aEL16Hf+C6W427EclWGQR0tBOjACnJVcjeICgun91W7nIKgr51IE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8224075"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8224075"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 15:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="881385640"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="881385640"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 15:30:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quKUC-0005Hy-0o;
	Sat, 21 Oct 2023 22:30:24 +0000
Date: Sun, 22 Oct 2023 06:29:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Ekansh Gupta <quic_ekangupt@quicinc.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] misc: fastrpc: Add fastrpc multimode invoke
 request support
Message-ID: <202310220610.KdxUvBUu-lkp@intel.com>
References: <1697612560-9726-2-git-send-email-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1697612560-9726-2-git-send-email-quic_ekangupt@quicinc.com>

Hi Ekansh,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next linus/master v6.6-rc6]
[cannot apply to char-misc/char-misc-linus next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Add-fastrpc-multimode-invoke-request-support/20231018-150423
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/1697612560-9726-2-git-send-email-quic_ekangupt%40quicinc.com
patch subject: [PATCH v5 1/5] misc: fastrpc: Add fastrpc multimode invoke request support
config: i386-randconfig-011-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220610.KdxUvBUu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220610.KdxUvBUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220610.KdxUvBUu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/misc/fastrpc.h:89:33: error: C++ style comments are not allowed in ISO C90
      89 |         __u32 reserved[8];      // keeping reserved bits for new requirements
         |                                 ^
   ./usr/include/misc/fastrpc.h:89:33: note: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
