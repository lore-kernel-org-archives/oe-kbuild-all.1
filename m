Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601891A01C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732539432; cv=none; b=Za2rvHj3vsNF9TdpMYAKt0D3fasnnBzHp2J9bZqQ9G7s/36h0SCdSbVV82l7S05kBdOTWpn6e11Jc3iCa6NB/bneqq+AGWn8r89KnP0fnoeNuEMbMonl06ROGZu2BkPEmYxHjiF/YE+MNz9DwVil0ya/c1Qa3C6GmhXGl5r8VD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732539432; c=relaxed/simple;
	bh=wxz4HGZvhgjE0k0AAFgSUOsbo3/YJugF2FGoOjtn0YI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OigNNyIGeOmRLyqoxS1nvbOIQrEH2Gv/uvHI60HxqZuqqHgPOxbfafwMrifyGhWJgQ3LeOYDLLP+wcg3suvw0S2L9/kMb0QXVH/XS9ohFGyxyN6KnA8+IKNGZKpa03kFSM5pM+vUZ1Xw4IOcsegPiwZGlxAvXPVJqfpjdQi1zvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFBJctCv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFBJctCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732539430; x=1764075430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxz4HGZvhgjE0k0AAFgSUOsbo3/YJugF2FGoOjtn0YI=;
  b=QFBJctCvok0RaeG8HsBR5Z1bxXw/du2fdUBd61xZVceXbvg5vZo7/srJ
   5bVN4WyMLXZwfUq10EYtu4QUUQHhs7b8CDA6tj1w9JRHnvPledZlXNsNv
   F8GkAKQx4fcX2TVVn9jdESIJ1zo6v6mC1izSRfApwfy5dVS5/cJtZF4GY
   ycNsxi1pcM2GZPh6IFG9QFuKlbUc4BGzi48qyFPGFSArkJxb0esL14BNa
   PhzMhdNX3HVqjC0jrqtSOTQH4X33llUsh+jnEJt852IGyWPZKDIXBN9gi
   yol1dB9wLxKGRDygoFr9ipYCQvjA8wIb0xCWMPGnFQfpg7jQ3DbQl7GgL
   A==;
X-CSE-ConnectionGUID: pOqAa1bZRpOSwd6R0mv0hA==
X-CSE-MsgGUID: wIAL5xquQ4q47IcC4XUyTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36564101"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="36564101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 04:57:00 -0800
X-CSE-ConnectionGUID: 3KvpJ0PxTauZO2BVc1jsig==
X-CSE-MsgGUID: H+Eep+nmTwC0JS0k83fg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96314700"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 04:56:59 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFYe8-0006Ow-0s;
	Mon, 25 Nov 2024 12:56:56 +0000
Date: Mon, 25 Nov 2024 20:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466] arch/loongarch/kvm/exit.c:768:2-3:
 Unneeded semicolon
Message-ID: <202411252036.xy4CfSQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e5f9cb08ccf02777d4bcc83a9bcdbba6434a7ab2
commit: 60f12ac296b9c755ff6f94fed1590a9ae2e6dfa7 [1466/1466] LoongArch: KVM: Add pv ipi support on kvm side
config: loongarch-randconfig-r051-20241114 (https://download.01.org/0day-ci/archive/20241125/202411252036.xy4CfSQv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252036.xy4CfSQv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kvm/exit.c:768:2-3: Unneeded semicolon

vim +768 arch/loongarch/kvm/exit.c

   751	
   752	/*
   753	 * hypercall emulation always return to guest, Caller should check retval.
   754	 */
   755	static void kvm_handle_pv_service(struct kvm_vcpu *vcpu)
   756	{
   757		unsigned long func = vcpu->arch.gprs[LOONGARCH_GPR_A0];
   758		long ret;
   759	
   760		switch (func) {
   761		case KVM_HCALL_FUNC_PV_IPI:
   762			kvm_pv_send_ipi(vcpu);
   763			ret = KVM_HCALL_STATUS_SUCCESS;
   764			break;
   765		default:
   766			ret = KVM_HCALL_INVALID_CODE;
   767			break;
 > 768		};
   769	
   770		vcpu->arch.gprs[LOONGARCH_GPR_A0] = ret;
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
