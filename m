Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC481E49F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718207220; cv=none; b=ralrYz+mci1cIjDWHn8+zrxDukdn2cJuDDvcsJ3HSKoZ0vLe+0qGB7/vTzvr3+BWPD8/HAhzMc/oGhf5ztVPHMxCg5zVOlEi3PsVxfg6skVQEZGs+dbX8zeSEml0PoJmXjGReQMqq5M1TVvt5jvPMIblmaCzWFQGkP2dNiplrl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718207220; c=relaxed/simple;
	bh=IH3kvWJ2QbJrkJGCa88l8l/2mKv5p1ioWKeo4dVw/1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzo9tCHGo9aqANn7ohljsi29AKXHRaoxpAoVO1cm2P2ozeCKIBYLAFl+rfNeY18N0vh9zIVe4LWXsYo95Nvji9k/z3b8FFusHbIKrnHfMEAB3BisSf15InNL9d9569gGNjNmXUYp+LDwvTP9CenuGtmEMlB/xS/ai8icBaGONns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGIWI5JU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGIWI5JU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718207219; x=1749743219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IH3kvWJ2QbJrkJGCa88l8l/2mKv5p1ioWKeo4dVw/1w=;
  b=aGIWI5JUZxbozMyzsjK4EXcCPCUCTAS+Wo3ntxxA9YPtDpq2KHo4GI0D
   0MD9/4GhLsZ+Ij9vt9TvFLTQTBBcdyLUU7RnSrgz3tjbvnrE8DSkf8wtz
   G6mx6J1IIiWFqsDQbsblaR1b7tXiJW8RKzTRZC0JXq716fq5J1mjvoshn
   IRRwiZtPkV9tT6VamdVeWuZFEn99WEuzt0ddHcWMW0+dpDW4ohr5KSm+y
   9od1iiwQwmunZOcTU8r6b5b5OMokY3WuoBxAmhhdFipGyTauocToUfVX5
   oYh7/lAoNplnsaGppOTkcQdKDS0Wke/cEm0UP03BmJZCm1dKJAAo9EZhA
   Q==;
X-CSE-ConnectionGUID: Go22SDOUSjyYzOUtUv821g==
X-CSE-MsgGUID: 2S/Qsb8MSsy3jz6IdScwlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40385580"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40385580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 08:46:57 -0700
X-CSE-ConnectionGUID: TIfBdp+fRGi4yTfv4o9bUA==
X-CSE-MsgGUID: V+EnsodvQyedEIp8C4IRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="77282946"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jun 2024 08:46:56 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHQBZ-0001fS-2K;
	Wed, 12 Jun 2024 15:46:53 +0000
Date: Wed, 12 Jun 2024 23:45:55 +0800
From: kernel test robot <lkp@intel.com>
To: Shaoqin Huang <shahuang@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 1/2] KVM: arm64: Allow BT field in ID_AA64PFR1_EL1
 writable
Message-ID: <202406122308.XjWtHze5-lkp@intel.com>
References: <20240612023553.127813-2-shahuang@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612023553.127813-2-shahuang@redhat.com>

Hi Shaoqin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on linus/master v6.10-rc3 next-20240612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shaoqin-Huang/KVM-arm64-Allow-BT-field-in-ID_AA64PFR1_EL1-writable/20240612-103828
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20240612023553.127813-2-shahuang%40redhat.com
patch subject: [RFC PATCH v1 1/2] KVM: arm64: Allow BT field in ID_AA64PFR1_EL1 writable
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406122308.XjWtHze5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122308.XjWtHze5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122308.XjWtHze5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/sys_regs.c:2097:18: error: pasting "SYS_" and "(" does not give a valid preprocessing token
    2097 |         SYS_DESC(SYS_##name),                   \
         |                  ^~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
   In file included from arch/arm64/kvm/sys_regs.c:35:
>> arch/arm64/kvm/sys_regs.c:2097:18: error: implicit declaration of function 'SYS_' [-Werror=implicit-function-declaration]
    2097 |         SYS_DESC(SYS_##name),                   \
         |                  ^~~~
   arch/arm64/kvm/sys_regs.h:239:32: note: in definition of macro 'Op0'
     239 | #define Op0(_x)         .Op0 = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:247:13: note: in expansion of macro 'sys_reg_Op0'
     247 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |             ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
>> arch/arm64/include/asm/sysreg.h:46:25: error: initializer element is not constant
      46 | #define sys_reg_Op0(id) (((id) >> Op0_shift) & Op0_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:239:32: note: in definition of macro 'Op0'
     239 | #define Op0(_x)         .Op0 = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:247:13: note: in expansion of macro 'sys_reg_Op0'
     247 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |             ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:46:25: note: (near initialization for 'sys_reg_descs[104].Op0')
      46 | #define sys_reg_Op0(id) (((id) >> Op0_shift) & Op0_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:239:32: note: in definition of macro 'Op0'
     239 | #define Op0(_x)         .Op0 = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:247:13: note: in expansion of macro 'sys_reg_Op0'
     247 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |             ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:47:25: error: initializer element is not constant
      47 | #define sys_reg_Op1(id) (((id) >> Op1_shift) & Op1_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:240:32: note: in definition of macro 'Op1'
     240 | #define Op1(_x)         .Op1 = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:247:36: note: in expansion of macro 'sys_reg_Op1'
     247 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |                                    ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:47:25: note: (near initialization for 'sys_reg_descs[104].Op1')
      47 | #define sys_reg_Op1(id) (((id) >> Op1_shift) & Op1_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:240:32: note: in definition of macro 'Op1'
     240 | #define Op1(_x)         .Op1 = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:247:36: note: in expansion of macro 'sys_reg_Op1'
     247 |         Op0(sys_reg_Op0(reg)), Op1(sys_reg_Op1(reg)),   \
         |                                    ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:48:25: error: initializer element is not constant
      48 | #define sys_reg_CRn(id) (((id) >> CRn_shift) & CRn_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:241:32: note: in definition of macro 'CRn'
     241 | #define CRn(_x)         .CRn = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:248:13: note: in expansion of macro 'sys_reg_CRn'
     248 |         CRn(sys_reg_CRn(reg)), CRm(sys_reg_CRm(reg)),   \
         |             ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \
         |         ^~~~~~~~
   arch/arm64/kvm/sys_regs.c:2121:9: note: in expansion of macro 'ID_DESC'
    2121 |         ID_DESC(name),                          \
         |         ^~~~~~~
   arch/arm64/kvm/sys_regs.c:2309:9: note: in expansion of macro 'ID_WRITABLE'
    2309 |         ID_WRITABLE(SYS_ID_AA64PFR1_EL1, ID_AA64PFR1_EL1_BT),
         |         ^~~~~~~~~~~
   arch/arm64/include/asm/sysreg.h:48:25: note: (near initialization for 'sys_reg_descs[104].CRn')
      48 | #define sys_reg_CRn(id) (((id) >> CRn_shift) & CRn_mask)
         |                         ^
   arch/arm64/kvm/sys_regs.h:241:32: note: in definition of macro 'CRn'
     241 | #define CRn(_x)         .CRn = _x
         |                                ^~
   arch/arm64/kvm/sys_regs.h:248:13: note: in expansion of macro 'sys_reg_CRn'
     248 |         CRn(sys_reg_CRn(reg)), CRm(sys_reg_CRm(reg)),   \
         |             ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:2097:9: note: in expansion of macro 'SYS_DESC'
    2097 |         SYS_DESC(SYS_##name),                   \


vim +2097 arch/arm64/kvm/sys_regs.c

280b748e871e5a Jintack Lim  2023-02-09  2084  
d86cde6e335fa4 Jing Zhang   2023-06-09  2085  /*
d86cde6e335fa4 Jing Zhang   2023-06-09  2086   * Since reset() callback and field val are not used for idregs, they will be
d86cde6e335fa4 Jing Zhang   2023-06-09  2087   * used for specific purposes for idregs.
d86cde6e335fa4 Jing Zhang   2023-06-09  2088   * The reset() would return KVM sanitised register value. The value would be the
d86cde6e335fa4 Jing Zhang   2023-06-09  2089   * same as the host kernel sanitised value if there is no KVM sanitisation.
d86cde6e335fa4 Jing Zhang   2023-06-09  2090   * The val would be used as a mask indicating writable fields for the idreg.
d86cde6e335fa4 Jing Zhang   2023-06-09  2091   * Only bits with 1 are writable from userspace. This mask might not be
d86cde6e335fa4 Jing Zhang   2023-06-09  2092   * necessary in the future whenever all ID registers are enabled as writable
d86cde6e335fa4 Jing Zhang   2023-06-09  2093   * from userspace.
d86cde6e335fa4 Jing Zhang   2023-06-09  2094   */
d86cde6e335fa4 Jing Zhang   2023-06-09  2095  
56d77aa8bdf527 Oliver Upton 2023-10-03  2096  #define ID_DESC(name)				\
93390c0a1b20b9 Dave Martin  2017-10-31 @2097  	SYS_DESC(SYS_##name),			\
93390c0a1b20b9 Dave Martin  2017-10-31  2098  	.access	= access_id_reg,		\
56d77aa8bdf527 Oliver Upton 2023-10-03  2099  	.get_user = get_id_reg			\
56d77aa8bdf527 Oliver Upton 2023-10-03  2100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
