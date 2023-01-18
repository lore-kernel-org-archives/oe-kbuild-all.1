Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DDA53A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674072435; x=1705608435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rl/bTkHdW9zTyqrjGASl5hEfl4MD80Xs2cf/+5SXFmM=;
  b=U37IuYOxDkrypJUbRqYq9SjbAaSH9wgcjroV3yGNSDHNPZSFOovM3DW9
   gPaIfeh/i7TxX4MCe/xOaJ8bvxmwUDMc0JfMKt0CqQ+QL+bS8Tfcymk5t
   CnwkdXZOyRB3NUA5xQFRQczfGBr7GgHWfbGRNQ1dteVYgxtvsxKh604T/
   OXxnDGlFn6mwPCuA8NaE+IDS5964BT8Sx3GtUCRCgp5QjsMRMYKRZ7VJG
   smL3SP/krzO+b7ywmhaG/P69QXBuNZ3B3wAg/5Z3IZ0nCbOmo9WXcyFEL
   sVNPb2qUHNLflz3RSc6MDbH5Prk9pY2qL91g1y8kCPoD/HmQYpHw64DsH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325138631"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325138631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 12:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748601966"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="748601966"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 12:07:13 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIEiF-0000fq-2v;
	Wed, 18 Jan 2023 20:07:11 +0000
Date: Thu, 19 Jan 2023 04:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: arch/arm64/kvm/arm.c:52:1: sparse: sparse: symbol
 '__pcpu_scope_kvm_arm_hyp_stack_page' was not declared. Should it be static?
Message-ID: <202301190323.czPbD4jL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: db129d486ebdf4e3168282236f9d9008b42cac7e KVM: arm64: Implement non-protected nVHE hyp stack unwinder
date:   6 months ago
config: arm64-randconfig-s053-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190323.czPbD4jL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=db129d486ebdf4e3168282236f9d9008b42cac7e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db129d486ebdf4e3168282236f9d9008b42cac7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:52:1: sparse: sparse: symbol '__pcpu_scope_kvm_arm_hyp_stack_page' was not declared. Should it be static?

vim +/__pcpu_scope_kvm_arm_hyp_stack_page +52 arch/arm64/kvm/arm.c

  > 52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
