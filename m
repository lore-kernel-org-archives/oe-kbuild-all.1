Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4139184F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785906696; cv=none; b=KJL9ZmeRvBV+5SFKjcsolmqPa/J9ACmHwY8XbXkntFtAftN0VqXIRTBOdy73OhPf/Up5iuZo6MLWTODD12wgnff1p/23S6j/jN2n9vtR3RLYE1dI46nxNO0gdTk5ve2UDi9aJ8ot+4Ov6eipflQtQz4G0wzW3QJltcDYsXIE43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785906696; c=relaxed/simple;
	bh=tqBGZ8a6QCjVzDpBTVmGzHyX+FhioNp1HRZLPvbKiWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOxrqEMGav+3bxZTqrBeIWRVwx8msrGvHomGO6SvmleZ9yMfFtMBj0KpzjsdVG/MMjeiBQ2JLL4u0EJdYxUFy+NI97xlD8m9axHKhf1niu0+7EOGKf/EpiawHes5CP//gIdei39ScRo0giF2+syinRWHJC3BKYFpyUS0ZI0FZTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFIP2SO+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFIP2SO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785906694; x=1817442694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tqBGZ8a6QCjVzDpBTVmGzHyX+FhioNp1HRZLPvbKiWM=;
  b=cFIP2SO+UiPU4CHtmVFwZ7Np5PK8D1y1UCnk9yZN2PQHJVWGGbRwHrMP
   FIqIK+2i8xbXdZmZYWvSnj2fFVHCE3GK/J0RPqLUYDcZJg9OPecKJ/9DK
   77htu1UNBWs/IHWRFMhzFnc7S1DqGsqnay8sPWklZdaV3zVsn3DIRm7fK
   q/lXvD+bW5IKvAS3YuhPOXfij4XWp1EMevaJN1TlVvXsVAkFO6RHYJQ07
   hHgNMtUYLExdFIifd9G92YmTLkogOHb8GIK6fMJPx/r9aBTSza5bj3cHJ
   2ssQj42DoSV0153MuCMPGJDg7L+QQasyu/tNm788X9T5XoNpnWMBSrFD3
   g==;
X-CSE-ConnectionGUID: /H4SH7EcTeib/4ixCxyLXQ==
X-CSE-MsgGUID: hlYju4toQCCAIp1ddCsIOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="74007177"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="74007177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 22:11:34 -0700
X-CSE-ConnectionGUID: pSs3JMSkToOze32GLjQk2g==
X-CSE-MsgGUID: 1bvSYkESQb+loZNv3D8xNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="265950761"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Aug 2026 22:11:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrTua-00000000Bbl-1jrS;
	Wed, 05 Aug 2026 05:11:28 +0000
Date: Wed, 5 Aug 2026 13:11:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Yuhang.Chen" <yhchen312@gmail.com>, Anup Patel <anup@brainfault.org>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
Message-ID: <202608051354.KYOXP5po-lkp@intel.com>
References: <20260804024707.2400404-1-yhchen312@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804024707.2400404-1-yhchen312@gmail.com>

Hi Yuhang.Chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v7.2-rc6 next-20260804]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuhang-Chen/RISC-V-KVM-Add-kvm-riscv-wfi_trap_policy-to-control-VS-mode-WFI-trapping/20260805-030043
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260804024707.2400404-1-yhchen312%40gmail.com
patch subject: [PATCH v2] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control VS-mode WFI trapping
config: riscv-randconfig-001-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051354.KYOXP5po-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051354.KYOXP5po-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051354.KYOXP5po-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu.c:60:13: error: expected declaration specifiers or '...' before string constant
    early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu.c:60:42: error: expected declaration specifiers or '...' before 'early_kvm_riscv_wfi_trap_policy_cfg'
    early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/riscv/kvm/vcpu.c:43:19: warning: 'early_kvm_riscv_wfi_trap_policy_cfg' defined but not used [-Wunused-function]
    static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +60 arch/riscv/kvm/vcpu.c

    39	
    40	static enum kvm_riscv_wfi_trap_policy kvm_riscv_wfi_trap_policy __read_mostly =
    41		KVM_RISCV_WFI_TRAP;
    42	
  > 43	static int __init early_kvm_riscv_wfi_trap_policy_cfg(char *arg)
    44	{
    45		if (!arg)
    46			return -EINVAL;
    47	
    48		if (strcmp(arg, "trap") == 0) {
    49			kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_TRAP;
    50			return 0;
    51		}
    52	
    53		if (strcmp(arg, "auto") == 0) {
    54			kvm_riscv_wfi_trap_policy = KVM_RISCV_WFI_AUTO;
    55			return 0;
    56		}
    57	
    58		return -EINVAL;
    59	}
  > 60	early_param("kvm-riscv.wfi_trap_policy", early_kvm_riscv_wfi_trap_policy_cfg);
    61	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
