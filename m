Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CAF41BA8B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224422; cv=none; b=d0X2wFlZT3FFEYsYvbR0ClrlQdd55tz+hCVhaoTJPzWapud4x3uEenIyh+uJ4/x4M0ghtCqO7a/cKube90Haw8D1RPfFHx3MDHi/EUkJLOljZVsmirDBK9amNnsbzlzg+Za0Yg9c/5Hj2yogvwPXxBfcQm1pXEi5cQc7ctbcagY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224422; c=relaxed/simple;
	bh=yCNzB+neYJgrbk9cNmONTlPoXtFBq6AAkmgz6+KkC2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qus3AMjapVHVsO1ZsSgqX81VzDSBYs7WBEMkofXy2UStULfAk/mLJ3DmQ1QwPGrdstSSnCj3PTt6Hel58EdN1v/mYY0J81ScfrnrL//YoH0L+ge9+dq2hoSSC8az+VCFWuj7rzU7XAWWvK75pByuffKP5ZYM2XtzgYt238uwOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMWisok9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMWisok9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787224421; x=1818760421;
  h=date:from:to:cc:subject:message-id;
  bh=yCNzB+neYJgrbk9cNmONTlPoXtFBq6AAkmgz6+KkC2Q=;
  b=nMWisok9G7ddNLTR6wfNpFdA7LQuzHMxhe+JLRI9a9yQOeJ1FZMRod2E
   uZ1e0EPV0XlGpWNrLPzXTGuhcV4+kPU7QFrItR7t70SFjw/SGsAizDpTd
   pKwkYF4G4+LqLgo/Poxtufq6tO8w+zmmEtaFOFkV1AfE/kFmAKFU9UjPv
   LI5YVGjXmUZeb/en2/DoFogQSw9BgZ9k9Nxcpg/oYMBoO2StHI3ZK2ajj
   Mt5tJ9+kRsG+Kra5D6mnUI7WoDt8NCAQQu5wU3QTEe2a58x9xvgn+U7UO
   PtQrjB7cyKjUzn6YefB7CV4TguAWF6AsCFa10ItRhe/U5wGvzYqO6VGuJ
   w==;
X-CSE-ConnectionGUID: 41KzI4iiRNO9MwNarbKj/A==
X-CSE-MsgGUID: 7ev5AHOpTSW/SpuKmmDcgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87877687"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87877687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 04:13:38 -0700
X-CSE-ConnectionGUID: 2bDrZ3slSkK22/UFf0No3w==
X-CSE-MsgGUID: ivkNdqd9RHmvbWCmWQQ7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="265493361"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Aug 2026 04:13:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wx0iE-00000000imd-11u3;
	Thu, 20 Aug 2026 11:13:34 +0000
Date: Thu, 20 Aug 2026 19:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 4858/16374]
 drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:18: warning:
 conditional expression between different enumeration types ('enum
 cdns_pcie_hpa_ltssm' and 'enum cdns_pcie_lga_ltssm')
Message-ID: <202608201933.w2579mwx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Hans,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a746cd265aed59107ebdaa9ce039bb832922969
commit: d70e964dc099821f6c159d8f40aa7be2c62ecfd2 [4858/16374] PCI: cadence: Add LGA IP debugfs for LTSSM status
config: loongarch-randconfig-r061-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201933.w2579mwx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201933.w2579mwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201933.w2579mwx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:18: warning: conditional expression between different enumeration types ('enum cdns_pcie_hpa_ltssm' and 'enum cdns_pcie_lga_ltssm') [-Wenum-compare-conditional]
     230 |                    pci->is_hpa ? hpa_ltssm : lga_ltssm);
         |                                ^ ~~~~~~~~~   ~~~~~~~~~
   1 warning generated.


vim +230 drivers/pci/controller/cadence/pcie-cadence-debugfs.c

   209	
   210	static int ltssm_status_show(struct seq_file *s, void *v)
   211	{
   212		struct cdns_pcie *pci = s->private;
   213		enum cdns_pcie_lga_ltssm lga_ltssm;
   214		enum cdns_pcie_hpa_ltssm hpa_ltssm;
   215		const char *str_ltssm;
   216		u32 val;
   217	
   218		if (pci->is_hpa) {
   219			val = cdns_pcie_hpa_readl(pci, REG_BANK_IP_REG,
   220						  CDNS_PCIE_HPA_PHY_DBG_STS_REG0);
   221			hpa_ltssm = FIELD_GET(CDNS_PCIE_HPA_LTSSM_STATUS_MASK, val);
   222			str_ltssm = cdns_pcie_hpa_ltssm_status_string(hpa_ltssm);
   223		} else {
   224			val = cdns_pcie_readl(pci, CDNS_PCIE_LM_BASE);
   225			lga_ltssm = FIELD_GET(CDNS_PCIE_LGA_LTSSM_STATUS_MASK, val);
   226			str_ltssm = cdns_pcie_lga_ltssm_status_string(lga_ltssm);
   227		}
   228	
   229		seq_printf(s, "%s (0x%02x)\n", str_ltssm,
 > 230			   pci->is_hpa ? hpa_ltssm : lga_ltssm);
   231	
   232		return 0;
   233	}
   234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
