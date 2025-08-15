Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D9D2367D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 21:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755292539; cv=none; b=qrrNZiPkTZ/l6OROd57aFeiNWt9dETK6AfICGEIV4uu1NjVCSCBxfwEiFbxcC6Vufi6mjZ32z4o5OZtOpJ7h9/pwuwsSjCcZC3XFJam0djR6CnJRSdugAwsSg4FrxyMuqX2oeSeBFP16Tv0qoErzQo+wuHwACxLYAT3NOS/lnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755292539; c=relaxed/simple;
	bh=JccR+MeRpbxA2BdXVlsurkAIQGSZ9mkerBDc4zoVWYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qcfFtSGEMdagVnsKE7U32Pm6PcAftEF+FsKycyErZaJMpZ54Cq0q/8u7k5JoMnnn0NWyJdH9sSmDnLr343TKR+vhTizXfWUaL3UGKP6a+uzO6PMo4IGzdhJ2dQXlTJvsa2LGPFTNH9JoC8f07sCO9JbzxrXH6qILRObpMaihG64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m0FQBA1i; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m0FQBA1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755292538; x=1786828538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JccR+MeRpbxA2BdXVlsurkAIQGSZ9mkerBDc4zoVWYA=;
  b=m0FQBA1iGE80z/1wOc0FpMjXPRb0J7sSbYjVRxGF/O0n+0ZWXzHZIFnh
   lpgceXC5U2E8Fk//bkATc83OWsgZEXGN8j8nnxw3Xc2XUSNO2qmpnJVdx
   R3S/flUeh37WWvCLdba8lgXADY7szUyhpXVjwG2ARg4EvpwCQenF1tLi3
   j1HJOgwECsJtayIBTGmzelZQfzyNEKbW4E4/q9XxVdKgdxWO/OckGTqF0
   dDHj+x7goPSQqHpApfdPgetL3XnFBTTbfrk168Wz4/4FcnHT7I4DulIgq
   O58ol+EcT+K09c45GiLNiZPtBrfEOuyJ7Ko3Wkn45K+x/VqmnePXylAoS
   Q==;
X-CSE-ConnectionGUID: z9pIkBIpSviGa8gDx/b6nw==
X-CSE-MsgGUID: TlWxPB9oSaGsnHyd8qA//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57543454"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57543454"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:15:35 -0700
X-CSE-ConnectionGUID: M+e9jHqHTyeJ/QDrnF7x+Q==
X-CSE-MsgGUID: 8bgtTj18S/G3V6NxGFQVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204270106"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 14:15:34 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un1lr-0000Zv-26;
	Fri, 15 Aug 2025 21:15:31 +0000
Date: Fri, 15 Aug 2025 23:14:58 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dongxu Sun <sundongxu3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3121/3121] arch/arm64/kvm/vgic/vgic-v4.c:258:
 warning: Function parameter or member 'vcpu' not described in
 'kvm_vgic_get_vcpu_vpeid'
Message-ID: <202508152341.eaFFPaF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ba1cb5cd91532ae2be2a0db5d153889580453f5f
commit: f1aaf830a93ca4915d9ffe39168f5eda472918a3 [3121/3121] KVM: arm64: GICv4.1: Add support for MBIGEN save/restore
config: arm64-randconfig-2001-20250814 (https://download.01.org/0day-ci/archive/20250815/202508152341.eaFFPaF8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152341.eaFFPaF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152341.eaFFPaF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-v4.c:258: warning: Function parameter or member 'vcpu' not described in 'kvm_vgic_get_vcpu_vpeid'


vim +258 arch/arm64/kvm/vgic/vgic-v4.c

   251	
   252	/**
   253	 * kvm_vgic_get_vcpu_vpeid - Get the VCPU's vpeid
   254	 *
   255	 * The vtimer mbigen needs the vcpu vpeid info which will resident.
   256	 */
   257	u16 kvm_vgic_get_vcpu_vpeid(struct kvm_vcpu *vcpu)
 > 258	{
   259		return vcpu->arch.vgic_cpu.vgic_v3.its_vpe.vpe_id;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
