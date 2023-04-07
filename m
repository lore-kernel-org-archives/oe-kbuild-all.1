Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56169A47
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 01:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680829342; x=1712365342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpL9CV1CzxjP67ZZ9XLYXPuATVI8MY8L1PqK6WSmZYE=;
  b=idlzqY6PiPEvXocyGsgPOkYFrVFQyLIMqtSidTTuFAVypwhN5RD2ho1W
   CfVHYso99vnlXln0I45TUqo7il0WEY4LQF00jtft5mkK2JENfU0+9iDic
   13CLa/VRUiMfp7kIH+b4W336ENEMl4uiPlV1xvoH3Jp9tn1tpCFdAOp+w
   PSy4PMb1zHPi3P9h2NPuvXjEG52A5OcbjrzQFzjpPhiSerkw2IKhQra11
   Ye/jOREa3K2wh5dVJtwqNOfY5wBidvDXTUbWsRDkhR7ht8F2zwEbbtst3
   0AMOccncNMeLJjSRAdWVIzy2r9EDICPT9MkqqDib3acuaN9E069T+HTrt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="370716529"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="370716529"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 18:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="830985359"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="830985359"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2023 18:02:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkaUd-000RxK-23;
	Fri, 07 Apr 2023 01:02:19 +0000
Date: Fri, 7 Apr 2023 09:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [intel-tdx:kvm-upstream-workaround 1/335] <stdin>:1565:2: warning:
 #warning syscall memfd_restricted not implemented
Message-ID: <202304070928.XvPSrWkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   9b1b005c63f21cbc8dc4f1691b05964c90240385
commit: eda1fd32a67be9ef4d32a4c9928b43db0ef1cde3 [1/335] mm: Introduce memfd_restricted system call to create restricted user memory
config: s390-randconfig-r044-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070928.XvPSrWkA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/eda1fd32a67be9ef4d32a4c9928b43db0ef1cde3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout eda1fd32a67be9ef4d32a4c9928b43db0ef1cde3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070928.XvPSrWkA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1565:2: warning: #warning syscall memfd_restricted not implemented [-Wcpp]
--
>> <stdin>:1565:2: warning: #warning syscall memfd_restricted not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
