Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A019883E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682712470; x=1714248470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PRZUzl2+jUQ5/3Y8Iv0j6iOFtZtJybzPsYUqZNHp0vc=;
  b=HkgWE4lfe4WieiCPjOxq1HGDDuu1H1PSbrxaI98m8RKHtdQmrTb37RK7
   SO4gTeQvVCJ5rdUn3IpsyJvFES84EpgijyTqkM6sFINneMM+b1ierSRgX
   8A/eZ02sDl6fcig2Uq8r8DurL2/g5UEZKPGo0/E4IjEonP2Xmh9TjWIzP
   vdKXbT1Iq1ZjggP/KFGDO53BDSvDqUJn1wGtnTGwpAd+/BaEQQwyEllgf
   PV0/JJexyEF7OoAfPb0MJJBsQ+5oTZ9FhXhPLUfMd/WVjYA30BD0YJU6R
   ab+zc9FZ/SUmGsv9tmnkxleXSshXv5Q3kQ8Qi3p+iv/UW9dD/Xk2A5KcV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346616663"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="346616663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 13:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="838971503"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="838971503"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 13:07:43 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psUNa-0000er-12;
	Fri, 28 Apr 2023 20:07:42 +0000
Date: Sat, 29 Apr 2023 04:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yi-De Wu <yi-de.wu@mediatek.com>,
	Yingshiuan Pan <yingshiuan.pan@mediatek.com>,
	Ze-Yu Wang <ze-yu.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	David Bradil <dbrazdil@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Jade Shih <jades.shih@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Ivan Tseng <ivan.tseng@mediatek.com>,
	My Chuang <my.chuang@mediatek.com>,
	Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <peilun.suei@mediatek.com>,
	Liju Chen <liju-clr.chen@mediatek.com>
Subject: Re: [PATCH v2 3/7] virt: geniezone: Introduce GenieZone hypervisor
 support
Message-ID: <202304290334.fCw7PKYU-lkp@intel.com>
References: <20230428103622.18291-4-yi-de.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428103622.18291-4-yi-de.wu@mediatek.com>

Hi Yi-De,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on robh/for-next arnd-asm-generic/master linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230428103622.18291-4-yi-de.wu%40mediatek.com
patch subject: [PATCH v2 3/7] virt: geniezone: Introduce GenieZone hypervisor support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230429/202304290334.fCw7PKYU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0e3f05a6e4547eb309032d047115a47d8f59641d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yi-De-Wu/docs-geniezone-Introduce-GenieZone-hypervisor/20230428-183738
        git checkout 0e3f05a6e4547eb309032d047115a47d8f59641d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/geniezone/ drivers/virt/geniezone/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290334.fCw7PKYU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/geniezone/gzvm_arch.c:112:5: warning: no previous prototype for 'gzvm_vm_arch_enable_cap' [-Wmissing-prototypes]
     112 | int gzvm_vm_arch_enable_cap(struct gzvm *gzvm, struct gzvm_enable_cap *cap,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
--
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a0' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a1' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a2' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a3' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a4' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a5' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a6' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'a7' not described in 'gzvm_hypcall_wrapper'
   arch/arm64/geniezone/gzvm_arch.c:24: warning: Function parameter or member 'res' not described in 'gzvm_hypcall_wrapper'
>> arch/arm64/geniezone/gzvm_arch.c:24: warning: expecting prototype for geniezone_hypercall_wrapper(). Prototype was for gzvm_hypcall_wrapper() instead
   arch/arm64/geniezone/gzvm_arch.c:133: warning: Function parameter or member 'gzvm' not described in 'gzvm_vm_ioctl_get_pvmfw_size'
   arch/arm64/geniezone/gzvm_arch.c:133: warning: Function parameter or member 'cap' not described in 'gzvm_vm_ioctl_get_pvmfw_size'
   arch/arm64/geniezone/gzvm_arch.c:133: warning: Function parameter or member 'argp' not described in 'gzvm_vm_ioctl_get_pvmfw_size'
   arch/arm64/geniezone/gzvm_arch.c:155: warning: Function parameter or member 'gzvm' not described in 'gzvm_vm_ioctl_cap_pvm'
   arch/arm64/geniezone/gzvm_arch.c:155: warning: Function parameter or member 'cap' not described in 'gzvm_vm_ioctl_cap_pvm'
   arch/arm64/geniezone/gzvm_arch.c:155: warning: Function parameter or member 'argp' not described in 'gzvm_vm_ioctl_cap_pvm'


vim +/gzvm_vm_arch_enable_cap +112 arch/arm64/geniezone/gzvm_arch.c

    13	
    14	/**
    15	 * geniezone_hypercall_wrapper()
    16	 *
    17	 * Return: The wrapper helps caller to convert geniezone errno to Linux errno.
    18	 */
    19	static int gzvm_hypcall_wrapper(unsigned long a0, unsigned long a1,
    20					unsigned long a2, unsigned long a3,
    21					unsigned long a4, unsigned long a5,
    22					unsigned long a6, unsigned long a7,
    23					struct arm_smccc_res *res)
  > 24	{
    25		arm_smccc_hvc(a0, a1, a2, a3, a4, a5, a6, a7, res);
    26		return gz_err_to_errno(res->a0);
    27	}
    28	
    29	int gzvm_arch_probe(void)
    30	{
    31		struct arm_smccc_res res;
    32	
    33		arm_smccc_hvc(MT_HVC_GZVM_PROBE, 0, 0, 0, 0, 0, 0, 0, &res);
    34		if (res.a0 == 0)
    35			return 0;
    36	
    37		return -ENXIO;
    38	}
    39	
    40	int gzvm_arch_set_memregion(gzvm_id_t vm_id, size_t buf_size,
    41				    phys_addr_t region)
    42	{
    43		struct arm_smccc_res res;
    44	
    45		return gzvm_hypcall_wrapper(MT_HVC_GZVM_SET_MEMREGION, vm_id,
    46					    buf_size, region, 0, 0, 0, 0, &res);
    47	}
    48	
    49	static int gzvm_cap_arm_vm_ipa_size(void __user *argp)
    50	{
    51		__u64 value = CONFIG_ARM64_PA_BITS;
    52	
    53		if (copy_to_user(argp, &value, sizeof(__u64)))
    54			return -EFAULT;
    55	
    56		return 0;
    57	}
    58	
    59	int gzvm_arch_check_extension(struct gzvm *gzvm, __u64 cap, void __user *argp)
    60	{
    61		int ret = -EOPNOTSUPP;
    62	
    63		switch (cap) {
    64		case GZVM_CAP_ARM_PROTECTED_VM: {
    65			__u64 success = 1;
    66	
    67			if (copy_to_user(argp, &success, sizeof(__u64)))
    68				return -EFAULT;
    69			ret = 0;
    70			break;
    71		}
    72		case GZVM_CAP_ARM_VM_IPA_SIZE: {
    73			ret = gzvm_cap_arm_vm_ipa_size(argp);
    74			break;
    75		}
    76		default:
    77			ret = -EOPNOTSUPP;
    78		}
    79	
    80		return ret;
    81	}
    82	
    83	/**
    84	 * gzvm_arch_create_vm()
    85	 *
    86	 * Return:
    87	 * * positive value	- VM ID
    88	 * * -ENOMEM		- Memory not enough for storing VM data
    89	 */
    90	int gzvm_arch_create_vm(void)
    91	{
    92		struct arm_smccc_res res;
    93		int ret;
    94	
    95		ret = gzvm_hypcall_wrapper(MT_HVC_GZVM_CREATE_VM, 0, 0, 0, 0, 0, 0, 0,
    96					   &res);
    97	
    98		if (ret == 0)
    99			return res.a1;
   100		else
   101			return ret;
   102	}
   103	
   104	int gzvm_arch_destroy_vm(gzvm_id_t vm_id)
   105	{
   106		struct arm_smccc_res res;
   107	
   108		return gzvm_hypcall_wrapper(MT_HVC_GZVM_DESTROY_VM, vm_id, 0, 0, 0, 0,
   109					    0, 0, &res);
   110	}
   111	
 > 112	int gzvm_vm_arch_enable_cap(struct gzvm *gzvm, struct gzvm_enable_cap *cap,
   113				    struct arm_smccc_res *res)
   114	{
   115		return gzvm_hypcall_wrapper(MT_HVC_GZVM_ENABLE_CAP, gzvm->vm_id,
   116					   cap->cap, cap->args[0], cap->args[1],
   117					   cap->args[2], cap->args[3], cap->args[4],
   118					   res);
   119	}
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
