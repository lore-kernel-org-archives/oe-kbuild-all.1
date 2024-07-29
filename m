Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CFC13B783
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722244975; cv=none; b=Mq4ER8Mwv9MhEw2vwa1H3EadAJ2AT87dzny4ansak6DXAFmyg4HV2voSphYj/JV8OkKvXAiwD+9ZY1hKlmYfbR0pqgAiAtcpbRcXX0bc+hzITZnkF46Q4Y9qNV0XtGC4yl6YWSCKFDXVqzMIkE4msQW7pfOpX8ozpo98VgvvWSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722244975; c=relaxed/simple;
	bh=dUunVYuIolYphShoMRKFE3NfIqrUxMbHANSUajAKZKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNwoJcw+K1+5v0DWNP1em29n3QM3uNN6MIw/EkyBNYsQtcEfl3EsKDK58ysH3zK5odlzgrY24j95mud3j/nfA+EvoCUTMsg8Twe0Y5KoXFqBkgPTYbRkpo1kL+nEm+/UgAYfQwwPvk/ETY6v9hGRBEiLqoJ1LnQ3RMbFZMyL6kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mxq9LYLW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mxq9LYLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722244973; x=1753780973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUunVYuIolYphShoMRKFE3NfIqrUxMbHANSUajAKZKA=;
  b=Mxq9LYLWIuwFrzo9X1uReIMtZyJOguodDLK1BdP/E45MOJU6X9qX8UzD
   xHgmmrvouBsK0xYmDvBTUMq/m5miC8g5EYCtjqqvw/plzb/h11o1Vyc+U
   xrZPqAo073/L2hQ+amHuYk0xozwN+SBcPzB66IDYeYx3LRPPlm6/842rl
   KrxlqoytUQbwgpGq8bxOpbnV/NdAvdfgE06B1HjsnkVNAtK48mTs3XPTU
   VySbcAT22m1TduOHMQRrn3V3TujgvTlTJNFj3O18YS/grG0MsXLzbdwVp
   2x2qKvROpX1TSg0H9N5bFmEPfCl5GPkLZi4F1Mix7rx1cazz723bvy+g1
   w==;
X-CSE-ConnectionGUID: nJw1J/V2SIOfPHAvhBK4Fw==
X-CSE-MsgGUID: kqRTbDkbR3uNqbw2sAaCuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="31398844"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="31398844"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 02:22:53 -0700
X-CSE-ConnectionGUID: pOeoLFaEQoy21lnczIFMoQ==
X-CSE-MsgGUID: EYgoM9rrS/abD95ILAtzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="84864181"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2024 02:22:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYMaT-000rbG-2T;
	Mon, 29 Jul 2024 09:22:37 +0000
Date: Mon, 29 Jul 2024 17:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6418/7897] arch/loongarch/kvm/vcpu.c:68:37: error:
 'struct sched_info' has no member named 'run_delay'
Message-ID: <202407291712.xo2TsEnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   8827461ac92e93f2c805b31a00cd444f7b59f41e
commit: 64bbfb6b7072ee7ccc17aadbce5a6cc265037fdf [6418/7897] LoongArch: KVM: Add steal time support in kvm side
config: loongarch-randconfig-001-20240729 (https://download.01.org/0day-ci/archive/20240729/202407291712.xo2TsEnk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240729/202407291712.xo2TsEnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407291712.xo2TsEnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/kvm/vcpu.c: In function 'kvm_update_stolen_time':
>> arch/loongarch/kvm/vcpu.c:68:37: error: 'struct sched_info' has no member named 'run_delay'
      68 |         steal += current->sched_info.run_delay -
         |                                     ^
   arch/loongarch/kvm/vcpu.c:70:55: error: 'struct sched_info' has no member named 'run_delay'
      70 |         vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                       ^
--
   arch/loongarch/kvm/exit.c: In function 'kvm_save_notify':
>> arch/loongarch/kvm/exit.c:764:63: error: 'struct sched_info' has no member named 'run_delay'
     764 |                 vcpu->arch.st.last_steal = current->sched_info.run_delay;
         |                                                               ^


vim +68 arch/loongarch/kvm/vcpu.c

    33	
    34	static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
    35	{
    36		struct kvm_steal_time __user *st;
    37		struct gfn_to_hva_cache *ghc;
    38		struct kvm_memslots *slots;
    39		gpa_t gpa;
    40		u64 steal;
    41		u32 version;
    42	
    43		ghc = &vcpu->arch.st.cache;
    44		gpa = vcpu->arch.st.guest_addr;
    45		if (!(gpa & KVM_STEAL_PHYS_VALID))
    46			return;
    47	
    48		gpa &= KVM_STEAL_PHYS_MASK;
    49		slots = kvm_memslots(vcpu->kvm);
    50		if (slots->generation != ghc->generation || gpa != ghc->gpa) {
    51			if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa,
    52						sizeof(*st))) {
    53				ghc->gpa = INVALID_GPA;
    54				return;
    55			}
    56		}
    57	
    58		st = (struct kvm_steal_time __user *)ghc->hva;
    59		unsafe_get_user(version, &st->version, out);
    60		if (version & 1)
    61			version += 1;
    62		version += 1;
    63		unsafe_put_user(version, &st->version, out);
    64		/* Make sure st->version is written first */
    65		smp_wmb();
    66	
    67		unsafe_get_user(steal, &st->steal, out);
  > 68		steal += current->sched_info.run_delay -
    69			vcpu->arch.st.last_steal;
    70		vcpu->arch.st.last_steal = current->sched_info.run_delay;
    71		unsafe_put_user(steal, &st->steal, out);
    72	
    73		/* Make sure st->steal is written first */
    74		smp_wmb();
    75		version += 1;
    76		unsafe_put_user(version, &st->version, out);
    77	out:
    78		mark_page_dirty_in_slot(vcpu->kvm, ghc->memslot, gpa_to_gfn(ghc->gpa));
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
