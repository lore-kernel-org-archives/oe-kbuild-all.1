Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A729D26E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 20:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786567655; cv=none; b=XtgXqwX9Ft+Le9BFRZ3+WSPE+3HyW20bHjVHO+rqX+DqgBmRiHMk6gPxxVGAt2gzJazmv2nePLiVhr3Gd0+LHinQc25+BICwcUdoyRN+b4Ttlkz7odtcc3YAMUb+8p/v/yy/potF3vythoVu6Lb3Ka6fT+MxaQfNLw+KK9AfdSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786567655; c=relaxed/simple;
	bh=NEmSX2o2cKCoYEHMaKoFzYgE1h1lb1UvMcn27q2QIzU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y3iuoCPvuoVrTEmomU8aRZoGJP0iKontxhPrhw7qA0arrq1SLLdDEBlO7pcNZwMRrPzzmh4O6qSAckPq8tbpVybg0pqFZgGGsu6vlY2IQ7oPnrjjNjCa3vtw6uhzzcyUB6T/6aspLoq8HGh0YBrabpCOkMuWr1+N7bfgWfyr+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nT2gv6mS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nT2gv6mS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786567652; x=1818103652;
  h=date:from:to:cc:subject:message-id;
  bh=NEmSX2o2cKCoYEHMaKoFzYgE1h1lb1UvMcn27q2QIzU=;
  b=nT2gv6mSvy86iu+e7isILYE3E5pw+NIXN4KybhZ0VLa2UNPDH1f+kVVW
   1z43y/85Qp32BoUuuxHxtji31K9alwGZ8yFlvxu97qZ4nE6/uRIWdkETd
   nxnBhYr93686oHTIyoGfOSDNEcgw8jQnbK79O+BmVD9vDSeQqko9Kl/rf
   mg3ywafSWUZrQtMYuALWgljMgJxVpO4q/vM5P24Shk515zodFU/bOdTUY
   kYFrsfrM5kOJ5WAr0WxPrhpt8VXBIZT+M7kn3IkycTrs7ZwxReQI9mDEo
   2XHJ+UzsCNf0oII5Xa9cGAZNqU7FjPhjzrPz2tmfWJ5EOUEMKui1Tis8B
   A==;
X-CSE-ConnectionGUID: fbaG5jqmS/KgJ2NP61L53A==
X-CSE-MsgGUID: lGmItzg0Rh+Mj1iW3WTL1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87259163"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87259163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:47:30 -0700
X-CSE-ConnectionGUID: T/ginAFhT5qriaVQGPVdjw==
X-CSE-MsgGUID: DGJK5MvwQ0aB2QohlbEPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260445182"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 13:47:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuFrD-00000000ReS-0xdp;
	Wed, 12 Aug 2026 20:47:27 +0000
Date: Thu, 13 Aug 2026 04:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type
 'struct pkvm_lm_context_param'
Message-ID: <202608130444.cipTvXQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 8ef015afc176a3d8627c1c1e6f561494d211e057 [1/1] ANDROID: pkvm: x86: Hypercalls for legacy mode context tables
config: i386-randconfig-r072-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130444.cipTvXQp-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130444.cipTvXQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130444.cipTvXQp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
>> arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:267:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +266 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
 > 266		struct pkvm_lm_context_param lm_context_param;
 > 267		struct pkvm_clear_translation_param clear_translation_param;
   268	} __aligned(PAGE_SIZE);
   269	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
