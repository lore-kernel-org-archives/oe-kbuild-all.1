Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8320632E6B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766428204; cv=none; b=hHPeYhuUqfPLiYy7pmMF1cgaB3tZV09NEH0bDChMjKauVjMkZ/suaqEkExqSq8983X4GJ+6zZgr4zcXgRwQVAgrwJbBeYjS0FySlfUdqvNIN3oJ4BCyoxkCO5mrTirB2cToPaoUub4cRGf3Iv+tPlFn0Fpki4qQGLkwNmQTf4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766428204; c=relaxed/simple;
	bh=IXyWRuiMr9qA1yl9TXWOW3DoyRAwFq/Bx6+HLVZcBf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UdspgzkMvXBcyu1In/vDNzESlvnlKVPlk+ijEtZGBqDa7EeDLaeWIM7Mz23IClPjjqJgnPFEmr2FJr5Dfh4uJ6oKKpb+rA1bhIV0q4Be/IfTm6144ERTzNaaWhTdgZzqYNN2g5ylP1C57ez5E/XtIxhC2pW/aNW+u40TLxIosxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bei6qfPt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bei6qfPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766428201; x=1797964201;
  h=date:from:to:cc:subject:message-id;
  bh=IXyWRuiMr9qA1yl9TXWOW3DoyRAwFq/Bx6+HLVZcBf4=;
  b=Bei6qfPtU86xoTQ61YYpLedyhX2Sf45s6lnnMrvdOfpVs+HxtUnCrViq
   ITJTZ9cjy3SbKC5rNe2ExDg0xoGRlxVC9/aAGllfx/6iKuYPLLReuMuFb
   iyOeJnbtN0YWC1yrerk9O3c8PlPcpLvjbMKqjmzKlDIHFRe71834IHQnA
   IVjQf4nZinFipR0YbUiG7RXUVYfJbcHY8+WLEiPkn2XKFiaWSzbK5q/qr
   Ghy/d5IniK4NUPt1l4UR0E+kKBarfIly1wxK17mhnhjKqhtEp6BvZNk4G
   lJ4sKm/SNTmDIPDfd1wFTOc2/JMoyk6djg4YjYR+K/IE67BiYX7HIUXiH
   w==;
X-CSE-ConnectionGUID: a38DxHeZTO+j1PlBqEPTSA==
X-CSE-MsgGUID: TcQvLCtpTsqACUVgSsRqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68178222"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68178222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:29:59 -0800
X-CSE-ConnectionGUID: 3CQkKCnmSnGBvTxv3knFqQ==
X-CSE-MsgGUID: mhH7lhXnRI65HrlLWEl/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198825842"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 10:29:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkey-000000000yv-3SPl;
	Mon, 22 Dec 2025 18:29:35 +0000
Date: Tue, 23 Dec 2025 02:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 78/82]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:1186:44: warning: variable 'host_l2sz'
 set but not used
Message-ID: <202512230249.PtF5RcJh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: ba5d2e0b287e57a009751d6a993a4b31206fd97b [78/82] KVM: arm64: gic-v5: Implement Save/Restore for ISTs
config: arm64-randconfig-003-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230249.PtF5RcJh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230249.PtF5RcJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230249.PtF5RcJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-v5-tables.c: In function 'vgic_v5_save_spi_ist':
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:1186:44: warning: variable 'host_l2sz' set but not used [-Wunused-but-set-variable]
    1186 |         unsigned host_id_bits, host_istsz, host_l2sz;
         |                                            ^~~~~~~~~
   arch/arm64/kvm/vgic/vgic-v5-tables.c: In function 'vgic_v5_restore_spi_ist':
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1380:44: warning: variable 'host_l2sz' set but not used [-Wunused-but-set-variable]
    1380 |         unsigned host_id_bits, host_istsz, host_l2sz;
         |                                            ^~~~~~~~~


vim +/host_l2sz +1186 arch/arm64/kvm/vgic/vgic-v5-tables.c

  1179	
  1180	int vgic_v5_save_spi_ist(struct kvm *kvm, struct kvm_device_attr *attr)
  1181	{
  1182		u16 vm_id = vgic_v5_vm_id(kvm);
  1183		u32 __user *uaddr = (u32 __user *)(unsigned long)attr->addr;
  1184		int ret = 0;
  1185		__le32 h_iste;
> 1186		unsigned host_id_bits, host_istsz, host_l2sz;
  1187		volatile void *host_ist_base;
  1188		struct vmtl2_entry *vmte;
  1189		gicv5_vm_info *vmi;
  1190	
  1191		ret = vgic_v5_check_vm_id(vm_id);
  1192		if (ret)
  1193			return ret;
  1194	
  1195		vmi = xa_load(&vm_info, vm_id);
  1196		if (WARN_ON_ONCE(!vmi))
  1197			return -EINVAL;
  1198	
  1199		ret = vgic_v5_get_l2_vmte(vm_id, &vmte);
  1200		if (ret)
  1201			return ret;
  1202	
  1203		host_ist_base = vmi->h_spi_ist;
  1204		if (!host_ist_base && attr)
  1205			return -ENOENT;
  1206		else if (host_ist_base && !attr)
  1207			return -EINVAL;
  1208	
  1209		host_id_bits = FIELD_GET(GICV5_VMTEL2E_IST_ID_BITS, vmte->val[3]);
  1210		host_istsz = FIELD_GET(GICV5_VMTEL2E_IST_ISTSZ, vmte->val[3]);
  1211		host_l2sz = FIELD_GET(GICV5_VMTEL2E_IST_L2SZ, vmte->val[3]);
  1212	
  1213		for (int i = 0; i < BIT(host_id_bits); ++i) {
  1214			volatile void *h_iste_addr = host_ist_base + i * BIT(host_istsz + 2);
  1215			h_iste = *((__le32*)h_iste_addr);
  1216	
  1217			ret = put_user(h_iste, uaddr);
  1218			if (ret)
  1219				return ret;
  1220	
  1221			uaddr++;
  1222		}
  1223	
  1224		return ret;
  1225	}
  1226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
