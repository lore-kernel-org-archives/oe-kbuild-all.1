Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744D4ED3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 03:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676951924; x=1708487924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FrNLG+QvfuWYkv9Cmz8YtxcFaAnsx1lXVXu7DFcfMr8=;
  b=D7Gv896PXQ7/1fAxOnTuwt1h8YWgFV7LNV0cvSPuILjXVHYF+f0IZyx3
   uZ1SK9P50OY5VHrfzmAjOq607YRc1T/jyahrpxmJW8l/+Fw8lxFh5CaZr
   l4p+J1TQ5wL0H73aOic5lJZDX/BglnBkRALm0qj44/p+FchLnies4oqVm
   ZiLdcOkfCi0rYplClaVG195yjkZA9Y2lgi8HlaL8/0O5CWUbk9wJXmm3x
   yRXA1Vf1mNgxhH/mQfB0/EMErFrqBEmrNJ1jBcuqtq2APJyRKddVIiFQc
   z05FA9SpQXbyZoKuOOyO0EInO0P3cl0kINTJQvuwa4lKFC4jYwIQ70W8a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="334733485"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="334733485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 19:58:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="740253832"
X-IronPort-AV: E=Sophos;i="5.97,314,1669104000"; 
   d="scan'208";a="740253832"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Feb 2023 19:58:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUJnd-000EQ9-14;
	Tue, 21 Feb 2023 03:58:41 +0000
Date: Tue, 21 Feb 2023 11:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] ptp: kvm: Use decrypted memory in confidential guest on
 x86
Message-ID: <202302211153.uvDZ9eZu-lkp@intel.com>
References: <20230220130235.2603366-1-jpiotrowski@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220130235.2603366-1-jpiotrowski@linux.microsoft.com>

Hi Jeremi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on horms-ipvs/master]
[also build test WARNING on mst-vhost/linux-next net/master net-next/master linus/master v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremi-Piotrowski/ptp-kvm-Use-decrypted-memory-in-confidential-guest-on-x86/20230220-210441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git master
patch link:    https://lore.kernel.org/r/20230220130235.2603366-1-jpiotrowski%40linux.microsoft.com
patch subject: [PATCH] ptp: kvm: Use decrypted memory in confidential guest on x86
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230221/202302211153.uvDZ9eZu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0dd1701fd254692af3d0ca051e092e8dcef190c4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeremi-Piotrowski/ptp-kvm-Use-decrypted-memory-in-confidential-guest-on-x86/20230220-210441
        git checkout 0dd1701fd254692af3d0ca051e092e8dcef190c4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/ptp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211153.uvDZ9eZu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_kvm_arm.c:25:6: warning: no previous prototype for 'kvm_arch_ptp_exit' [-Wmissing-prototypes]
      25 | void kvm_arch_ptp_exit(void)
         |      ^~~~~~~~~~~~~~~~~


vim +/kvm_arch_ptp_exit +25 drivers/ptp/ptp_kvm_arm.c

    24	
  > 25	void kvm_arch_ptp_exit(void)
    26	{
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
