Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3A15E8C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721467209; cv=none; b=Bg18270sXVPysAr6v8MJ//XkuWHZdPx//98+mCSMKM37M1/eQw+0dHNnk9eDghoI0fc6pmhAyIIC3KQFs0+TyFD1aO9yUgNXobLSLHm4WagiRB29LA6OQ2bumduQGC8FmkZU+pomkEd+EWwkbqR17F1sS9p+bjsouoRYiIAhm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721467209; c=relaxed/simple;
	bh=5vRtK8Jaq3gSia9bMjW5fW4uY+98cDzH50PEXuDZKUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D77Ljfx2ZHIMAcRAg5mwoc7ATF81qDxkHLc5hT4e08pJk7vaYux9EtZTQ7N1Q4ao6XQGS8Q+SvPvzw5Sw65iLOtU43ez2NvNAtWaW0bjtDQojfGqKqnMmxXfICO6vKWYwVOgw04sdQaVrLwyvJaM6dgCl8/Bku9B6PfldR9PTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRHzWITy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRHzWITy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721467207; x=1753003207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5vRtK8Jaq3gSia9bMjW5fW4uY+98cDzH50PEXuDZKUE=;
  b=KRHzWITyq/MYO3NzMYbD4yClX61EgoOkd+VaYGwjQUfhJRgeJZ5YCoHG
   rj6ZL3JGGbvsAFpIE+/bp6HtK29fcafc9EzLjVP+sJGiaIKpSs9K5weRT
   HSFAOjbbpTDxkx1n71hV6qzxjLFFJ1g5uZMl4ctCf+rRxDZugOIYt1JJT
   P0RrwCfC4MuKtxCT+OnsvQNHitk4PJpNLTCYEPBVog0SqqLjJ1Jvixl7g
   Laml/yRUihP+qpprgECAOYrXWhsHPIwzMg28wkMzKhqbDiSa5avzqj1Kn
   MJ8YskL4ZW4dZ1gMDc3MMyG8F9j4z0pwUXypTwbVUYIbuPA7odWfv57lB
   Q==;
X-CSE-ConnectionGUID: FrbPa4L/S4CVY0FHBwCPsQ==
X-CSE-MsgGUID: jL2MIa/jSAa5ycYwmEPQHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="36624560"
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="36624560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 02:20:06 -0700
X-CSE-ConnectionGUID: GMpdDlOGToGg7WXav+q17w==
X-CSE-MsgGUID: GtmrzYz2S4uSgmYmiI62IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,223,1716274800"; 
   d="scan'208";a="51332544"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jul 2024 02:20:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV6G3-000j40-0K;
	Sat, 20 Jul 2024 09:20:03 +0000
Date: Sat, 20 Jul 2024 17:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10543/10853] arch/x86/kvm/svm/sev.c:2200:24:
 error: 'struct hygon_kvm_hooks_table' has no member named 'false'
Message-ID: <202407201747.if3DROph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b53be02fc76386cd434560ddfa8c5f5f908ced12
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [10543/10853] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-072-20240720 (https://download.01.org/0day-ci/archive/20240720/202407201747.if3DROph-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201747.if3DROph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201747.if3DROph-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/sev.c: In function 'sev_install_hooks':
>> arch/x86/kvm/svm/sev.c:2200:24: error: 'struct hygon_kvm_hooks_table' has no member named 'false'
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |                        ^
>> arch/x86/kvm/svm/sev.c:2200:39: error: lvalue required as unary '&' operand
    2200 |         hygon_kvm_hooks.sev_enabled = &sev_enabled;
         |                                       ^


vim +2200 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
> 2198	void sev_install_hooks(void)
  2199	{
> 2200		hygon_kvm_hooks.sev_enabled = &sev_enabled;
  2201		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2202		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2203		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2204		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2205	
  2206		hygon_kvm_hooks.sev_hooks_installed = true;
  2207	}
  2208	#endif
  2209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
