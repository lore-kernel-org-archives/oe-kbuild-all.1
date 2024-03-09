Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11701335C7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709963538; cv=none; b=SaAonxQ45ipanKqX7HKJm4sNlXBAd/jVEi2r1uymnKJLFzTiAhdr0/MSVq3hUCeyObqIkIt6aDVxh3yOvptaQV7NT+EKYLW4hs/LIHurW7Zd0s4puCUNhuTfb2dEeGXbqmlyjrr3qpz8b13xoOmCkJdCujcwbTzOXJkQD1M3h/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709963538; c=relaxed/simple;
	bh=E5UDlPwJtRMUbnStyA53qqRBZPWJj8wtueolNYtlEmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s8Ho4DGrJsMw2VsU0JZ1EUWaXaaMXkSBYlxWzknHhrgByB3aomwqb9LWVX1szBqOXH/W09548h2cVmz0b3wvn0S+5gG7w4YjPYlFno4ZaC2ZnjvmsPeg1lLJ7XFGaxh+Dq02E3sqvM3ta10xHq6OgqGGva5CYC67RD9GOepGHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEfST6Fu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEfST6Fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709963536; x=1741499536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5UDlPwJtRMUbnStyA53qqRBZPWJj8wtueolNYtlEmQ=;
  b=YEfST6FuCfmQpAcjzLilMtObD3xcGx4kSSD0tmSmekzzSK7d0dCGAYl5
   jOT+FD2If79DmX8yfcbkb43+9rxzirtDo1nlY69pZG/pucdd1hbHQkCnp
   6MxCURUM+2HXmxsFiVEnd47AKFA3HL5JSN569M8RAeAjriQoavtyYI/yA
   JstBxVpSxgDo+qvYnrJQiHVxLmEDU/yHp+d3bw81jTfU+4DFNtdGHot1D
   yzECFE9RtAZwpShzTHPrfsdAajTObcSv0FIidqUNCQfpX/wzaMUJ1y240
   VI29LfN7Rgq6qVVvaV2xxt/1+E4qt8SxBBM3dzKWjndSjaRUdMiMhDtvk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="22151664"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="22151664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 21:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10749008"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Mar 2024 21:52:14 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ripcx-00071f-2Y;
	Sat, 09 Mar 2024 05:52:11 +0000
Date: Sat, 9 Mar 2024 13:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9111/9226]
 arch/arm64/kvm/hyp/nvhe/hyp-main.c:39:1: sparse: sparse: symbol
 '__pcpu_scope_host_hyp_reqs' was not declared. Should it be static?
Message-ID: <202403091301.hbvcfy3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6b00f1b219465a71cb11664536629575c5312bd0
commit: 70ade4bab360fa86696d8c60412d0de98bb9645b [9111/9226] ANDROID: KVM: arm64: Encode hyp requests in HVC return
config: arm64-randconfig-r122-20240307 (https://download.01.org/0day-ci/archive/20240309/202403091301.hbvcfy3Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240309/202403091301.hbvcfy3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091301.hbvcfy3Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/hyp-main.c:39:1: sparse: sparse: symbol '__pcpu_scope_host_hyp_reqs' was not declared. Should it be static?

vim +/__pcpu_scope_host_hyp_reqs +39 arch/arm64/kvm/hyp/nvhe/hyp-main.c

    34	
    35	/*
    36	 * Holds one request only, in theory we can compress more, but
    37	 * typically HVC returns on first failure.
    38	 */
  > 39	DEFINE_PER_CPU(struct kvm_hyp_req, host_hyp_reqs);
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
