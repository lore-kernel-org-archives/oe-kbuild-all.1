Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB6377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 02:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695348415; x=1726884415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ju7O2NNqsSlJ/POKIvt+cPzUwWqbbX2JWFoYE336euo=;
  b=hybrxl4MB5jzMg2/HUO9DgGuzYj0mCWFssp9cv5cAV4Nqw1KNDhfYaaB
   WI2s8OJpuoRBSN1B2iI/2s/4BI7XF+6CRSo3FGJCIhVmBEiRFml/6QjBB
   AsB01RtFKpHWFh6vxrdB2pzdKQZV1056rS26UUSAQp2wUiiFkfTs21E0c
   JFq4jybrxgYd/FTpE5jDzWd82Fdjy71pnwgeBNN+pTKlicK5+Jm9GAhlx
   p8Yatu8DyU3cUeoPkXcQXnozG9BbKeqvTxboh5pNGVlI4EUeZOyoi2Z/Z
   /z1jjgblNU7AkKcxjJwgil7wEtXohJpUispH50tmygeN2Jm+pH2/BxBKi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365778920"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="365778920"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 19:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="724002422"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="724002422"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Sep 2023 19:06:54 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjVZE-0000el-0d;
	Fri, 22 Sep 2023 02:06:52 +0000
Date: Fri, 22 Sep 2023 10:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6541/11339] aarch64-linux-ld:
 Unexpected GOT/PLT entries detected!
Message-ID: <202309220901.BbJrhS0m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a3cb85bffea164b19b0f650226207200a8439c54
commit: 022b2198fc73b7b95231730eb944d74c7f1b253c [6541/11339] ANDROID: KVM: arm64: Add clock support in the nVHE hyp
config: arm64-randconfig-003-20230922 (https://download.01.org/0day-ci/archive/20230922/202309220901.BbJrhS0m-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220901.BbJrhS0m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220901.BbJrhS0m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__kvm_nvhe_trace_clock':
>> (.hyp.text+0x129d4): undefined reference to `__kvm_nvhe___lshrti3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
