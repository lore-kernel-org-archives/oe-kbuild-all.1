Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9695E8F4E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 23:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678748942; x=1710284942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KshWSejkFbkeVBwakT7QiRHIr/W7baLNEGoxZeDhpeo=;
  b=ig2oumfdi+ZIh1tWuzcG6KXRZWuxyyT0tDennWaj6ER+AP4XrfH7TOZA
   MZZ1uIJNKQ37+BbntxDvgpkQwQbf4UXv3Mk7s/LKYyHqRCe82hQiUi8Rj
   1hj3GXchbMmFHryI8Rel9I4h0zeyES7MLDHn2OdWO+veBsrUq/CViPwMt
   9wX+fieLQFZ9UKEjZvHbGzsasn4I79WRaFbvI5A93vkfBr8E4hdGMQQVG
   UzOkchnga858SiZjp0Pn+tLekPsraL0qGVj8h17QFWtpPEastx3ehZfAr
   17WgvI/2M6yfCtMLZfwAQM+igTgbIQfTA9GGAzALmpM5ApCl80xbud7u2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399871315"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="399871315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 16:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628806685"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; 
   d="scan'208";a="628806685"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Mar 2023 16:08:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbrHe-0006EC-0e;
	Mon, 13 Mar 2023 23:08:50 +0000
Date: Tue, 14 Mar 2023 07:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Christian Brauner (Microsoft)" <brauner@kernel.org>
Subject: Re: [PATCH] nfs: use vfs setgid helper
Message-ID: <202303140652.dN7XrtM4-lkp@intel.com>
References: <20230313-fs-nfs-setgid-v1-1-5b1fa599f186@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313-fs-nfs-setgid-v1-1-5b1fa599f186@kernel.org>

Hi Christian,

I love your patch! Yet something to improve:

[auto build test ERROR on eeac8ede17557680855031c6f305ece2378af326]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/nfs-use-vfs-setgid-helper/20230313-212725
base:   eeac8ede17557680855031c6f305ece2378af326
patch link:    https://lore.kernel.org/r/20230313-fs-nfs-setgid-v1-1-5b1fa599f186%40kernel.org
patch subject: [PATCH] nfs: use vfs setgid helper
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230314/202303140652.dN7XrtM4-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/503d040be490a519b2e483672702dcca530443ce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Brauner/nfs-use-vfs-setgid-helper/20230313-212725
        git checkout 503d040be490a519b2e483672702dcca530443ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303140652.dN7XrtM4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "setattr_should_drop_sgid" [fs/nfs/nfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
