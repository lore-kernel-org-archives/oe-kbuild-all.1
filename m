Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7762517AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765560196; cv=none; b=VVoS70J9YZ2vSaZJWWiQ0/hUlCCN6GGc6HyRLo/Jzt/lHsqvFyk+FQihn7x1AQvmhKQ+h1WAUL6Y92BZo1Q52oPtJYRsdHEG74Wu0UpNm5HPjtZI3wG7WPhm1EU2E6q4Pe0N+M46fpmbO7G1ujPpCwwpW1AuBU/F8pxNOwvUyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765560196; c=relaxed/simple;
	bh=4Rh/RTrrj1zshAml3Xdkn3j0yx2Gvpe8CWX8ZO3QJuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfbwAOHCbRkOYDtU9ytoYJO4i6j5+vIH5LJe17hfEiOYVvY0SRD4g0AclwThgZB+QiY2hviixVsxdR8COVGxpZFk2pncJv0uo8bzIG+Z2BNd8D7wYVxcP946jlRSOAxnfHR1AdeWF5tP4C7VL4685O7pkCNB/sJGXiDft19e9Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQtdpQUn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQtdpQUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765560194; x=1797096194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Rh/RTrrj1zshAml3Xdkn3j0yx2Gvpe8CWX8ZO3QJuk=;
  b=PQtdpQUn5fPmrLQp+aTDcFqgQ1qUS0czMuLwdgPqGKDY7cKgrO1hlfAJ
   D/D3+MdZL5oia57gzYekmlAHilpmbXF6P79B3D/JDfAEk7UX5i0pEG5Ao
   uH34otJpd+rt/5Uutl8yAL8QZYpFd0V03HlO25NhbtBQ54f3bZST+APAB
   nghMA0vheKlaexBuSYzY82E8M0KB7QCRXhg9rE6119z/V+NK1ZDC2OhvG
   ALd+m9GU5fMyNDOroEeSjrv+RLq6uvOotFTDE9qfC62eILVYUf1EMj+O/
   14RLtPkGPl8tOJh62jqYMHLG3Yy5BvOF5BiAM2m/1BuuqJJ/rjZoRlOiX
   g==;
X-CSE-ConnectionGUID: zb4mpzpYQtyI23WFyAcA/Q==
X-CSE-MsgGUID: dRJxBZR/SfyCdVexHL7L1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67607615"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67607615"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:23:13 -0800
X-CSE-ConnectionGUID: AMRcUOu3TVa+mKBfHauYNQ==
X-CSE-MsgGUID: Gytts3tuR8O45GkEaUvMRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196210317"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 09:23:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU6rG-000000006Mo-1zzc;
	Fri, 12 Dec 2025 17:23:10 +0000
Date: Sat, 13 Dec 2025 01:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3408/3408]
 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess
 function parameter 'file' description in 'SKB_DESCRIPTION_LEN'
Message-ID: <202512130140.fhwjYvmM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   da8948fdddb84e5496272bab85973165594dd469
commit: 8cee206b5558245197158bd20895f95cc28d8468 [3408/3408] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-013-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130140.fhwjYvmM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130140.fhwjYvmM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130140.fhwjYvmM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess function parameter 'file' description in 'SKB_DESCRIPTION_LEN'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess function parameter 'author' description in 'SKB_DESCRIPTION_LEN'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess function parameter 'date' description in 'SKB_DESCRIPTION_LEN'
--
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:16: warning: Function parameter or member 'hw' not described in 'sxe_check_cfg_fault'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:16: warning: Function parameter or member 'dev' not described in 'sxe_check_cfg_fault'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:16: warning: Excess function parameter 'file' description in 'sxe_check_cfg_fault'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:16: warning: Excess function parameter 'author' description in 'sxe_check_cfg_fault'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_pci.c:16: warning: Excess function parameter 'date' description in 'sxe_check_cfg_fault'
--
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:16: warning: Excess function parameter 'file' description in 'SXE_TC_BWG_PERCENT_PER_CHAN'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:16: warning: Excess function parameter 'author' description in 'SXE_TC_BWG_PERCENT_PER_CHAN'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:16: warning: Excess function parameter 'date' description in 'SXE_TC_BWG_PERCENT_PER_CHAN'
--
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ptp.c:18: warning: Function parameter or member 'cc' not described in 'sxe_ptp_read'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ptp.c:18: warning: Excess function parameter 'file' description in 'sxe_ptp_read'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ptp.c:18: warning: Excess function parameter 'author' description in 'sxe_ptp_read'
   drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ptp.c:18: warning: Excess function parameter 'date' description in 'sxe_ptp_read'
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_hdc.c:27: warning: cannot understand function prototype: 'atomic_t hdc_available = ATOMIC_INIT(1); '
--
>> drivers/net/ethernet/linkdata/sxevf/base/log/sxe_log.c:24: warning: Function parameter or member 'buff' not described in 'time_for_file_name'
   drivers/net/ethernet/linkdata/sxevf/base/log/sxe_log.c:24: warning: Function parameter or member 'buf_len' not described in 'time_for_file_name'
>> drivers/net/ethernet/linkdata/sxevf/base/log/sxe_log.c:24: warning: Excess function parameter 'file' description in 'time_for_file_name'
   drivers/net/ethernet/linkdata/sxevf/base/log/sxe_log.c:24: warning: Excess function parameter 'author' description in 'time_for_file_name'
   drivers/net/ethernet/linkdata/sxevf/base/log/sxe_log.c:24: warning: Excess function parameter 'date' description in 'time_for_file_name'


vim +18 drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c

    17	
  > 18	#define SKB_DESCRIPTION_LEN 256

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
