Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC945ED0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676879709; x=1708415709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eV+W/+KaSjNTqOmgvNHUQddQsAozslkKM9YV9lcsMUM=;
  b=NQAakJ+iVMgWF+GJ15PL0rDBistjNx9m897VjE7hGZev34rRvXTrtrEQ
   l18J1e9RTAO6IP0sl6s23efav0ghVK5GTrfnfOo7gQio8wOKo6z43673m
   8aEg169FAtQVqYW05IqV/rTFRw8uJJwYiKi0SQQDOaefbxPXgZs07RkxQ
   GW/l3AdFUtexPzrkcK6z8L65d41l/DGkBjen2Q8tUDjtCNwNIrEJlpvXh
   EfHhp9No3Sy31pwZY2qDLWdbktK4cJV8DoTOYerpfkdMUKG9P5kRMP3jo
   EumxuJ1F3fuex161ZzWehhnwLKsMXUcTB/nKKWqZ2OWzFOjP3kUT3s3UI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="330059121"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="330059121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 23:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="814045926"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="814045926"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2023 23:55:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU10s-000Dll-2x;
	Mon, 20 Feb 2023 07:55:06 +0000
Date: Mon, 20 Feb 2023 15:54:32 +0800
From: kernel test robot <lkp@intel.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: [linux-next:master 1627/13681] FAILED: load BTF from vmlinux: No
 data available
Message-ID: <202302201555.OI4N54jb-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: acd3b7768048fe338248cdf43ccfbf8c084a6bc1 [1627/13681] libbpf: Return -ENODATA for missing btf section
config: parisc-randconfig-r003-20230219 (https://download.01.org/0day-ci/archive/20230220/202302201555.OI4N54jb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=acd3b7768048fe338248cdf43ccfbf8c084a6bc1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout acd3b7768048fe338248cdf43ccfbf8c084a6bc1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201555.OI4N54jb-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Encountered error while encoding BTF.
   libbpf: failed to find '.BTF' ELF section in vmlinux
>> FAILED: load BTF from vmlinux: No data available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
