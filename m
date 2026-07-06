Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96E31A304A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344644; cv=none; b=mhUn/mxunYyBXV2dN1Lr2mM4UM83JBsTTNM3iyOKaXkwpMEM+hJU20KYYbtCIgTqJdHl3jnpqxIhkUNUFmZnBJScyPr0q/UH6g90pn7uIjpkpzDuvyezYI/bEg5HfPhEcah2VPUNzeEI2fi11ESdxioevYmkPhtEGSDzl4YhHHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344644; c=relaxed/simple;
	bh=G+DY5xvuSK6ItpMrypS2JlmjZ9dlcknu6IEc8D4G14w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FdxFeV1h8AjNS14ylOPWK2+xocvl2K71wP2oEKXlzNNGhBQW+IBXSIe9AIAnN4akP14JJFiFjiEcjZmQnxR/z7KHoqelsns98sLt1SQzVlCeQ7s7kzq5GXUur8ewymIf3Z15j/ZeCX2CyOwnhxw911GZP+zZPXZ6RgQLiV3KpN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ju8h+Mbs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ju8h+Mbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783344642; x=1814880642;
  h=date:from:to:cc:subject:message-id;
  bh=G+DY5xvuSK6ItpMrypS2JlmjZ9dlcknu6IEc8D4G14w=;
  b=ju8h+Mbs5L2mqNh7PvZXTRa1mWZaeKwXVoXbhn7hQEqYR6AHTRoVxQev
   3MoDzW2Ilucs927YTHrLeKM/RZWK/szgX6Y++JIiDUszahuKTDsY99hrE
   w2RM4IaPyFC+jp6QaKjl9VN85zzsojxpnMpgTFifhDxkHSelRndrB8s7o
   tJTRaDWaRxQdxNla+dKj/4D+fGcMtYyEqZCV1Nd88Ua4uUp6oB78okJWN
   4OMcVXiGn+YcNScHjiiqwI3DRSxK9gREDtqvJTAA+MNJi3MILdCj3WPrn
   PUxOwjNee3duC5LgnhRjXfHfkjSvmH+ndQu/7yibnTMIlWrW7xQA8gWv1
   Q==;
X-CSE-ConnectionGUID: pyUzmmUMTyKjbAD462vZog==
X-CSE-MsgGUID: M0jvXJ+tQFuEYaHJ7TcZ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83086496"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83086496"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:30:41 -0700
X-CSE-ConnectionGUID: nME7O3j2RWeLzp5sOEKRSw==
X-CSE-MsgGUID: kggqzhhaTgqMYBGeVtscxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258616258"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jul 2026 06:30:40 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgjPB-00000000EOd-36yF;
	Mon, 06 Jul 2026 13:30:37 +0000
Date: Mon, 06 Jul 2026 21:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:direct-map/v0 5/7] mm/vmalloc.h:41:33: error: implicit
 declaration of function 'get_vm_area_page_order'; did you mean
 'get_vm_area_caller'?
Message-ID: <202607062121.of7yzsQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git direct-map/v0
head:   21effbca0418e549e468c2141da5ba1ef83f06fb
commit: 741e3d404d2d11569c68f713ebd9345e283f8455 [5/7] mm/vmalloc: pull out set_direct_map into mm/vmalloc.h ...
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260706/202607062121.of7yzsQp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607062121.of7yzsQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607062121.of7yzsQp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mm_init.c:38:
   mm/vmalloc.h: In function 'vm_area_set_direct_map':
>> mm/vmalloc.h:41:33: error: implicit declaration of function 'get_vm_area_page_order'; did you mean 'get_vm_area_caller'? [-Wimplicit-function-declaration]
      41 |         unsigned int nr = (1 << get_vm_area_page_order(vm));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 get_vm_area_caller


vim +41 mm/vmalloc.h

    37	
    38	static inline void vm_area_set_direct_map(struct vm_struct *vm,
    39			int (*set_direct_map)(const void *addr, unsigned long numpages))
    40	{
  > 41		unsigned int nr = (1 << get_vm_area_page_order(vm));
    42		int err = 0;
    43	
    44		for (int i = 0; i < vm->nr_pages; i += nr) {
    45			err = set_direct_map(page_address(vm->pages[i]), nr);
    46			WARN_ON_ONCE(err);
    47		}
    48	}
    49	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
