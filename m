Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9F23A2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 02:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684203772; x=1715739772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MQpQLlH1ElSgrElJe4BkOZHxK5lUMZHu4x2srBxOlak=;
  b=FhW2Riv0iHmF9Ck6XQ0PE9elgXXwiqTc27j20yV7r6GomblcBvAC43+P
   54M4CANEEmV0EKEIfycg+Da+6F/xGTgveD4h689/NcPbfUcseDOfvyYAC
   lm9syWQPiJnSiLOVvgz6AndCme7X1MnFXMoXn1o7Lm5HMhnsDatuPb4+l
   98R1+QhHkwxipnxyEgZFA0AvsrICrCAwZIfu1geoMrAqMHNvO68QD5uZ+
   d0orhmBpY40C4CoVx3ws287XoCZbsQDCJVlcCZy+oO/SScnzvHCnFpJeS
   qAxtcZ25f0/45I9mdRpuMNwD3OYqNOrOUUAGL+XC8IgA4QRbdIf9OKmLq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340724874"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="340724874"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 19:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875437806"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200"; 
   d="scan'208";a="875437806"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 May 2023 19:22:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pykKv-0006sc-0m;
	Tue, 16 May 2023 02:22:49 +0000
Date: Tue, 16 May 2023 10:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrii Nakryiko <andrii@kernel.org>
Subject: Error: failed to load BTF from vmlinux: No data available
Message-ID: <202305161059.bKLKKlkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Changbin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
commit: acd3b7768048fe338248cdf43ccfbf8c084a6bc1 libbpf: Return -ENODATA for missing btf section
date:   4 months ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=acd3b7768048fe338248cdf43ccfbf8c084a6bc1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout acd3b7768048fe338248cdf43ccfbf8c084a6bc1
        make O=/tmp/kselftest headers
        make O=/tmp/kselftest -C tools/testing/selftests

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305161059.bKLKKlkO-lkp@intel.com/

All errors (new ones prefixed by >>):

   libbpf: failed to find '.BTF' ELF section in vmlinux
>> Error: failed to load BTF from vmlinux: No data available
   make[3]: *** [Makefile:76: tools/bpf/runqslower//vmlinux.h] Error 195
   make[3]: *** Deleting file 'tools/bpf/runqslower//vmlinux.h'
   make[2]: *** [Makefile:122: runqslower] Error 2
   make[2]: *** Waiting for unfinished jobs....
   libbpf: failed to find '.BTF' ELF section in vmlinux
>> Error: failed to load BTF from vmlinux: No data available
   make[3]: *** [Makefile:204: tools/bpf/bpftool/vmlinux.h] Error 195
   make[3]: *** Deleting file 'tools/bpf/bpftool/vmlinux.h'
   make[3]: *** Waiting for unfinished jobs....
   make[2]: *** [Makefile:113: bpftool] Error 2
--
   libbpf: failed to find '.BTF' ELF section in vmlinux
>> Error: failed to load BTF from vmlinux: No data available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
