Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAC01FF1DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 02:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943505; cv=none; b=Y1lkIUU/84tp1xP1G0UMSKs0yuwjRAZOEN2dtIXvs1RF2yjCunzPRr+2oa81k4HfCvJ4Lgk1U8zFgud7J9f/w01TcfUho1CjvHm4sDjjtZpNntwx9ElIen/uELGY2WNpHPvGVEKx4SXKQhWX20k3iRVNDtXG+qGUGFgmQTOh0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943505; c=relaxed/simple;
	bh=1u2Ii0ncK6PZCKhP5aVBwqTw4477knfUMZJywt4pj1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ksxv9rk9omDhDkBHOpwVP6h0J0XWiJHN61OONXW+6bivcoLFtDMV0AFPe8V+0QSK5MnVeNjbAGHaLXuUfh81MJCfymkAcDs4VW6mAfm25J2MrdHPurqlPeryyVWIW4qUjLrertVQTy+lLim+Xaw0d2vNAXBC98quj+0Rhn3tvmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT6A0di4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT6A0di4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791943504; x=1823479504;
  h=date:from:to:cc:subject:message-id;
  bh=1u2Ii0ncK6PZCKhP5aVBwqTw4477knfUMZJywt4pj1E=;
  b=HT6A0di4PIAFPPRW4wIKDXVc3BHXdK9Np4MBvcZynU8HiqxguAZTAAr4
   aZsmr7rvFXx0Ms4cc8i5DK1jUpJhmVR2WpLo1+T3iG1F3a/qQtBwvsMXr
   KyQzwphv/UHwy8pafiUJN0+YE7ymtZzoTiVdfbxvjN5NOZa9zfduDuI86
   NgX+huxVNpf37Cxqs1Rrzcw56oYORnMUF1oH7sEKl9Yqyt/dlYv2+l7hR
   770PBQDqKz7dW73U8KktAk5+oTPVVGsXHx/z4OlcdmZJiXZyTuMURJ4gj
   sypYcfU5jMieaNj45oh98dQhyxO4BI6fmXhFWZ9614P7d0Caw4wgAkodY
   A==;
X-CSE-ConnectionGUID: Zp9IndeiSNisY7SxuLTFMA==
X-CSE-MsgGUID: rL2ImfzERpmPz5+G0x44GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="582358"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="582358"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 19:05:03 -0700
X-CSE-ConnectionGUID: D0L6sNkcSpiyIm8sogoIYA==
X-CSE-MsgGUID: MDjtHs0BTqWfT9GXSr5F3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3079930"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Oct 2026 19:05:01 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGoMU-00000000AoP-0W4E;
	Wed, 14 Oct 2026 02:04:58 +0000
Date: Wed, 14 Oct 2026 04:04:53 +0200
From: kernel test robot <lkp@intel.com>
To: "Wei-Lin Chang" <weilin.chang@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 8368/16498]
 arch/arm64/kvm/ptdump.c:180:7-33: opportunity for str_enabled_disabled(mmu ->
 nested_stage2_enabled)
Message-ID: <202610140417.oTs6ey1z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1fffefb00cc0b0da1f2ae24e3d33364530ea6515
commit: b1cc219eb21ab5f31fe4caa32be8057159e42db5 [8368/16498] KVM: arm64: ptdump: Fix shadow ptdump sleep-in-atomic-context problem
config: arm64-randconfig-r2101-20261014 (https://download.01.org/0day-ci/archive/20261014/202610140417.oTs6ey1z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140417.oTs6ey1z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/ptdump.c:180:7-33: opportunity for str_enabled_disabled(mmu -> nested_stage2_enabled)

vim +180 arch/arm64/kvm/ptdump.c

   151	
   152	static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
   153	{
   154		int ret;
   155		struct kvm_ptdump_guest_state *st = m->private;
   156		struct kvm_s2_mmu *mmu = st->mmu;
   157		struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
   158		struct kvm_pgtable_walker walker = (struct kvm_pgtable_walker) {
   159			.cb	= kvm_ptdump_visitor,
   160			.arg	= &st->parser_state,
   161			.flags	= KVM_PGTABLE_WALK_LEAF,
   162		};
   163	
   164		guard(write_lock)(&kvm->mmu_lock);
   165		if (!mmu->pgt)
   166			return 0;
   167	
   168		st->parser_state = (struct ptdump_pg_state) {
   169			.marker		= &st->ipa_marker[0],
   170			.end_address	= BIT(mmu->pgt->ia_bits),
   171			.level		= -1,
   172			.pg_level	= &st->level[0],
   173			.seq		= m,
   174		};
   175	
   176		if (kvm_is_nested_s2_mmu(kvm, mmu)) {
   177			if (kvm_s2_mmu_valid(mmu))
   178				seq_printf(m, "VTCR: 0x%016llx VTTBR: 0x%016llx s2: %s\n",
   179					   mmu->tlb_vtcr, mmu->tlb_vttbr,
 > 180					   mmu->nested_stage2_enabled ? "enabled" : "disabled");
   181			else
   182				return 0;
   183		}
   184	
   185		ret = kvm_pgtable_walk(mmu->pgt, 0, BIT(mmu->pgt->ia_bits), &walker);
   186		if (ret)
   187			return ret;
   188		note_page_flush(&st->parser_state.ptdump);
   189	
   190		return 0;
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
