Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D346AA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677848236; x=1709384236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+hCA0ZGd6EOnSIjmccxlc7F/OPEX61ZXvgSCXXNeoE=;
  b=FbsQb8HcSOYh3N0OEaR5/18N6SbH2wzIIKQN53+g+pmH+n1JJNMQ4wfc
   WU9B3dVTzkqPk9R5vG1J0yoPyxdt8fNK/ilfMNQ4jDlpJ+WFJ23TUpT7x
   OcgaFWjNu0/rb6u+kcDa4oj7O7Ty3gefayL+tmhXXpYcw3MZsGDRXuyDU
   TJVst9QGybL1/cA/YoIKE28MZm5Tvn7CS3SDpwKRFTpLmUu2RFRYerK/Y
   MT0dt7ph4dhMSYECb2JwqoGa3yNfpXjPz+ZgJ0BS3N6dfBndVlwpiu2UA
   amqtg4lLNmF8vg3XKCzsbi/D4fE4IGRn0wOL4TtvplkPb3jQLj+vnvDvs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="421307971"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="421307971"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 04:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004569219"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="1004569219"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2023 04:57:14 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY4yH-0001Ra-33;
	Fri, 03 Mar 2023 12:57:13 +0000
Date: Fri, 3 Mar 2023 20:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] tracing/hist: add modulus operator
Message-ID: <202303032025.sa7xWAu3-lkp@intel.com>
References: <20230302171755.1821653-3-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302171755.1821653-3-mark.rutland@arm.com>

Hi Mark,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on rostedt-trace/for-next v6.2 next-20230303]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Rutland/tracing-hist-simplify-contains_operator/20230303-012033
patch link:    https://lore.kernel.org/r/20230302171755.1821653-3-mark.rutland%40arm.com
patch subject: [PATCH 2/2] tracing/hist: add modulus operator
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303032025.sa7xWAu3-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/a2602e97de77834320fed5f928662f154f72d7ce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Rutland/tracing-hist-simplify-contains_operator/20230303-012033
        git checkout a2602e97de77834320fed5f928662f154f72d7ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303032025.sa7xWAu3-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/trace/trace_events_hist.o: in function `hist_fn_call':
>> trace_events_hist.c:(.text+0xa007): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
