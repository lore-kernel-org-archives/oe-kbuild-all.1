Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB03EEBE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726957632; cv=none; b=KwPymGrenkRddvk8YohZCrS17KpfDXXpEd/1ZcjpLxJnRiLK92Guycv04ykZ123nzngcKLVZkU91KoPWawbnm8kmCcw8jTxoG8CxTmgXFXKGAzSCed1kMgatsGrh0yEuK+aoRRPHztoycE/lzKvfHp0ngVvPAvr9tNNnlFRqYuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726957632; c=relaxed/simple;
	bh=TLp8qG9qNPNvGdrWpsa8x543ylv1zTwPwj6ivHXUHIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUNSE9BiYGTZKg+am/YzS/AL7xp0plCc+nv/EK10llZlGbOmSt1RMoeQWOGhsVkY6XtoOMw8ibfSCfRlDe6buJSrFgp7m/1+S+rUvWnZL9x0OUuoqWyNhJ3mM2hx/olgXChMEkmbfiLFkn1qZ66iUZznvkJsXS8jlftXdX0pShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3ReuyAj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3ReuyAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726957629; x=1758493629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLp8qG9qNPNvGdrWpsa8x543ylv1zTwPwj6ivHXUHIk=;
  b=H3ReuyAjm/PPR1wL7lysF1THQ9yF+AWm/5C351GTKpgacN6wHd962ana
   Y6fvCwyzQNvOlYt10OsHCwy2P7c4nE+zq4xu/Kw2zi5M9aJw5ytIHgXKs
   N+tNu4BImthvBC+w7AQv1OcKhORt2Q45m3bjISqVWiKdzXYgNMJlyRfGs
   zar2f5eERuaoh1UxPkx8Ed6uL+HfhRE9GAYEIpxZvONmTzu7CQZzvloUS
   ickF0zW6gkQqBWvjy5UYZpSSDLFc6UfC0outncwWTR7zyo4DAt8K3WgEj
   3cMikQBUkpjUX3V1fYfrilIOZqjKx35eJ8/FxrVD4Wdx2f6/4Gf6S5V64
   A==;
X-CSE-ConnectionGUID: RfbLVOmaS4aoTyKx1coBJw==
X-CSE-MsgGUID: HA66B5TgRouJXACjWd+DUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26060068"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="26060068"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 15:27:09 -0700
X-CSE-ConnectionGUID: RoEr5zkoTruPopgrUH4wcw==
X-CSE-MsgGUID: 7hovbYNzQ+aXV5F/hvOIIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="94003623"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2024 15:27:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss8ZF-000FqA-2w;
	Sat, 21 Sep 2024 22:27:05 +0000
Date: Sun, 22 Sep 2024 06:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10552/14021] arch/x86/kvm/svm/sev.c:2200:24:
 error: 'struct hygon_kvm_hooks_table' has no member named 'false'
Message-ID: <202409220627.7Iic9Lx5-lkp@intel.com>
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
head:   70522ace7844a6fe96f8b19325c878ff23701ee7
commit: 1c3b1095a26ed8bc1aa7ac3d4e8dd3e65964a74b [10552/14021] KVM: SVM: Add KVM_CSV_COMMAND_BATCH command for applying CSV RING_BUFFER mode
config: x86_64-randconfig-003-20240921 (https://download.01.org/0day-ci/archive/20240922/202409220627.7Iic9Lx5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220627.7Iic9Lx5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220627.7Iic9Lx5-lkp@intel.com/

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
  2198	void sev_install_hooks(void)
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
