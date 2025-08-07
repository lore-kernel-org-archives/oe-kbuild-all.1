Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CA221737
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 22:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754606727; cv=none; b=u1zwluu7mrFzhk4VcHQWesyaP1ebUsRBgLn1a9+ppm5TR+7iemdtvz4Z63ijGXaariYeICXIdhiv1ynMdXuYwxlheJZyF9bGZnKaEn4JH6PHBvSxqUBHlmU7YpRu22zAPepn5YR7yoSy5WLQBTZk7f7Ja9P6Q8Yx2c4UGGi6hWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754606727; c=relaxed/simple;
	bh=dP8M0RlEr+Yq9XviTN7ripchL0Jg+Irmb/RRjJS6qy0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1lqD2MEqKwSW8h8rAExcBLQblRiTpO06olsH8m30yaT6XRvoCBfRn2LdBaYhjualCWSHBHjszXL9drlLRl1zFPHW96gpi6JU3mmT+Go4favdgwYwJQEfUa4y7CDAeyiYJjSaYY7MtIG4xGkB9BkwDuj1udHAzyQINWx0UZewXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjaipmYk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjaipmYk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754606726; x=1786142726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dP8M0RlEr+Yq9XviTN7ripchL0Jg+Irmb/RRjJS6qy0=;
  b=RjaipmYkAnwkPMZFoAexSokKhR6OcsNf5ANOCMkedhQXMf+B4gV///PU
   xLqLRPLVG9tAasqZGPt8VcvMJEXdk061AcqU+J0Z8aUndWdbi6TB6rB9h
   vURSz/h68JhUPuAalWCdPAdmUTKZfWp+pdtCrUJk26UcpOxq4UaTBtGSV
   JTVcRHoUqgX/WdqlGChHgIzVYVSIrzJ/X/9US6HO4pmiI8eOSAQzltHGS
   TfnYNEDvQtsNyiGO0TjNgNVytHMd/qNFdKD2ja500HH3lQ8/Y4tsEdNqd
   fVpO6IQuY5Mc1BuqAV7EY5eSXh8rHVhQIkIc7lDU267iG/40GSj8kwTud
   A==;
X-CSE-ConnectionGUID: a5oFT+c6TXOzGUhKtmo0Hg==
X-CSE-MsgGUID: HAzsQzhGS2uzut6OSxlkqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68411593"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68411593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 15:45:25 -0700
X-CSE-ConnectionGUID: LSowsUCUTtu9TFoHcwRJAg==
X-CSE-MsgGUID: zQyTDxH5So+TUoWOTW3AFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="170557506"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Aug 2025 15:45:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk9MQ-0003Kk-0T;
	Thu, 07 Aug 2025 22:45:22 +0000
Date: Fri, 8 Aug 2025 06:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 15/17] include/linux/bpf_psi.h:34:39: warning:
 'struct psi_trigger_params' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202508080626.6ixUDVZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   5da37b0fa382bf6c978606c1f682424f3e49d27e
commit: 6de83397e2150cad0ca5ee7ce49a1fd8cf05f4f1 [15/17] sched: psi: implement psi trigger handling using bpf
config: arc-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080626.6ixUDVZf-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080626.6ixUDVZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080626.6ixUDVZf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:22:
   include/linux/bpf_psi.h:18:41: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      18 |         void (*handle_psi_event)(struct psi_trigger *t);
         |                                         ^~~~~~~~~~~
>> include/linux/bpf_psi.h:34:39: warning: 'struct psi_trigger_params' declared inside parameter list will not be visible outside of this definition or declaration
      34 |                          const struct psi_trigger_params *params);
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/bpf_psi.h:33:33: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      33 | void bpf_psi_add_trigger(struct psi_trigger *t,
         |                                 ^~~~~~~~~~~
   include/linux/bpf_psi.h:35:36: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      35 | void bpf_psi_remove_trigger(struct psi_trigger *t);
         |                                    ^~~~~~~~~~~
   include/linux/bpf_psi.h:36:34: warning: 'struct psi_trigger' declared inside parameter list will not be visible outside of this definition or declaration
      36 | void bpf_psi_handle_event(struct psi_trigger *t);
         |                                  ^~~~~~~~~~~


vim +34 include/linux/bpf_psi.h

    31	
    32	#ifdef CONFIG_BPF_SYSCALL
    33	void bpf_psi_add_trigger(struct psi_trigger *t,
  > 34				 const struct psi_trigger_params *params);
    35	void bpf_psi_remove_trigger(struct psi_trigger *t);
    36	void bpf_psi_handle_event(struct psi_trigger *t);
    37	#ifdef CONFIG_CGROUPS
    38	void bpf_psi_cgroup_free(struct cgroup *cgroup);
    39	#endif
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
