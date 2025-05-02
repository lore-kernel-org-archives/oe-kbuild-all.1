Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199464400
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 03:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746156618; cv=none; b=RGHo1mBRvrsL39Uas8FL6oQvg76vDwQ6c1dUQimLICFS5z53o8uOWCaGHn0OV3BC/WVM9/EF9eyeh4NDJK1gczDZudkiia6MgxPWglnenK5iXwr+HlWofkOdZfZ/vxCGIVbMuKuNSMHoztzbUvTtjEuuBW+oXE/7BgTRGMnrUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746156618; c=relaxed/simple;
	bh=BqiMXA9turCuuSq+FF0xZYs15+LLxAZzi3ONiTL4jbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vFS4wC4cR2XPUDDCfAJbdeW+imP6ciagoLbWow4WsRcVINv2c5C5PwNZF55sJFixdEnMRZy6zGoyp1M0aNneCBQ6gXuKgSaC4kuTF0kN5sCXxE0INUIgoRG8s5oUEo8cttw9UKYovkanLmQL8V0/4Bw9etE9iXyLcJfcqHbdIzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeINNAE7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeINNAE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746156616; x=1777692616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BqiMXA9turCuuSq+FF0xZYs15+LLxAZzi3ONiTL4jbc=;
  b=SeINNAE7h4ZeSQwSXjypImfV/zuoYKP6YWeSWUhzKU3jhXlNWmzT4orl
   mQnesdnt0vNDEgAEf6E5x7gK4uBcBoT/RZLly1u4WTQPfTff49w0QYwhr
   AuMBO2ZpnyYYoQSHisPYuOMHbfR2cTP9t0xWnDShMFddzGPd1PMs096oC
   OWfB+RcJCK2Vm2h/VQBByHiplGzc10K7fEI1at2lZv+NV8XYMqdkwr20S
   XDNHc3cq2FrqG8adSbYdtCyqrQL98S1f34Ao4srCQpACwOASnGWAZGhD/
   oLF1Knzx3KoxUN6fmldp3DJWxef+KT/v00rPQ6hTkMg4u54ikuyKdTG55
   g==;
X-CSE-ConnectionGUID: 7oIw0xpKSzWmD1QU01sYpw==
X-CSE-MsgGUID: t+l3IipLReKA6XF/waxbzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47980762"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47980762"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 20:30:15 -0700
X-CSE-ConnectionGUID: INbvvPfaRKqQyOiUXlWzEA==
X-CSE-MsgGUID: LP4Qx/VoSFmTyysRG0YSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="165599717"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2025 20:30:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAh6K-0004Wr-1O;
	Fri, 02 May 2025 03:30:12 +0000
Date: Fri, 2 May 2025 11:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse:
 sparse: invalid assignment: |=
Message-ID: <202505021153.ilI6N3GY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2882/2882] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-122-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021153.ilI6N3GY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021153.ilI6N3GY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021153.ilI6N3GY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_csum.c: note: in included file:
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse:    right side has type unsigned int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:115:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:115:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:115:36: sparse:    right side has type unsigned int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse: sparse: invalid assignment: &=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse:    right side has type int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse:    right side has type unsigned int
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_cli.c:174:30: sparse: sparse: symbol 'sxe_cdev_fops' was not declared. Should it be static?
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_hdc.c:42:1: sparse: sparse: symbol 'g_hdc_sema' was not declared. Should it be static?
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:505:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:505:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:505:36: sparse:    right side has type int
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:507:41: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:508:32: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:509:41: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c:510:39: sparse: sparse: cast from restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.c: note: in included file:
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:115:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:115:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:115:36: sparse:    right side has type unsigned int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse: sparse: invalid assignment: &=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse:    right side has type int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse:    right side has type unsigned int
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:134:36: sparse:    right side has type unsigned int
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:147:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] mss_l4len_idx @@     got unsigned int [usertype] mss_l4len @@
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:147:34: sparse:     expected restricted __le32 [usertype] mss_l4len_idx
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:147:34: sparse:     got unsigned int [usertype] mss_l4len
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:128:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:128:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:128:36: sparse:    right side has type unsigned int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse: sparse: invalid assignment: &=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:121:36: sparse:    right side has type int
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h:122:36: sparse:    right side has type unsigned int
--
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_csum.c: note: in included file:
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:103:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:103:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:103:36: sparse:    right side has type unsigned int
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:77:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:77:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:77:36: sparse:    right side has type unsigned int
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:83:36: sparse: sparse: invalid assignment: &=
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:83:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:83:36: sparse:    right side has type int
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:84:36: sparse: sparse: invalid assignment: |=
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:84:36: sparse:    left side has type restricted __le32
   drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_tx_proc.h:84:36: sparse:    right side has type unsigned int

vim +134 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_tx_proc.h

   130	
   131	static inline void
   132	sxe_ctxt_desc_tucmd_set(struct sxe_tx_context_desc *ctxt_desc, u32 tucmd)
   133	{
 > 134		ctxt_desc->type_tucmd_mlhl |= tucmd;
   135	}
   136	
   137	static inline void
   138	sxe_ctxt_desc_sa_idx_set(struct sxe_tx_context_desc *ctxt_desc, u32 sa_idx)
   139	{
   140		ctxt_desc->sa_idx = sa_idx;
   141	}
   142	
   143	static inline void
   144	sxe_ctxt_desc_mss_l4len_set(struct sxe_tx_context_desc *ctxt_desc,
   145				    u32 mss_l4len)
   146	{
 > 147		ctxt_desc->mss_l4len_idx = mss_l4len;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
