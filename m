Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E542A82
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729930678; cv=none; b=oTSUA3K/onreTqumRBYmFi1QQNYr4VsARHg2ORylp17FdzfLtrIf9X9ff9XyUpbg0KUXllk3zLSpx+cViBrQElEmu/Gu+JJgf/jZuRZH+dLiS8d5MKZm7lFUtMkP65ZlGNRZLC/J3gz3l1JcAjENJo7hmLmHUTW0KqEMvFJ95wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729930678; c=relaxed/simple;
	bh=RA63VpqQ6KddRQwachzmmAZNQXwejqZUPCOJFUAp7ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDN49R3v5Of7oqaYsuL3T+ZX2r86WZUyxZKLFCO3Hdg4cEUpOxEuU/uC4OPP7xBZDsnrK1IyzB3kaOunDjNtgFzrR9plYDoNw7w++ygiLda01+4G5FRsF9d+8qCpw1PNVhgcxKO5WWEn+ccAaAkZ4eKmPABUVbZyP9eaX8exrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwrsAJkL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwrsAJkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729930676; x=1761466676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RA63VpqQ6KddRQwachzmmAZNQXwejqZUPCOJFUAp7ok=;
  b=YwrsAJkL20GOm2RrbC2kvgAJ/Z278tdeUYsKrsb1Cg2Uz7W2duncGqHi
   BOwW2IkFld/5+GQtqKeLpOzCgngzGQKudrNUwRRs8JzGsuIk/2EqrfcoY
   IBwyOsMVYv5DLF7L0iXFWGXxs1jcVdpQ8RLJ8AnA0mMV/naeno8Cc8GIP
   5EmqlEjF98pjHIRnAyCklCHPhqlqgldqOI1c5hr81geFprpZf3ce93tBE
   WW0G6baw3wE0qY6kJoBNHVhwpe+//woZyRivxncu/sQg6HEIgTOLLpG4X
   /kkipLikUV8BABhu34VDRAfVUNoVjyGIpyzg9wIueFY0Fm+YP3+HwF+PW
   Q==;
X-CSE-ConnectionGUID: wbEH+63+RIaDPRzUd9VB7w==
X-CSE-MsgGUID: d8AKVVRiR0i5mbcpedvt8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40986383"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="40986383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 01:17:55 -0700
X-CSE-ConnectionGUID: F9pn3obcR8GtTXzEWl4rjA==
X-CSE-MsgGUID: wxFwNWjlRDm9ZwCWOFt+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85905746"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2024 01:17:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4bzb-000ZQn-1f;
	Sat, 26 Oct 2024 08:17:51 +0000
Date: Sat, 26 Oct 2024 16:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10553/15325] arch/x86/kvm/svm/sev.c:2200:24:
 error: 'struct hygon_kvm_hooks_table' has no member named 'false'
Message-ID: <202410261641.KwxLXwTB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi fangbaoshun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   86591467ffc7fadfd84e3f8769e8ba303cf7d2de
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [10553/15325] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-003-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261641.KwxLXwTB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261641.KwxLXwTB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261641.KwxLXwTB-lkp@intel.com/

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
