Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43E813C3F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 05:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761974269; cv=none; b=RraAGWysrrBVYDyyGXgw8tcxVhKCm2ADR706g+Vw/hhpkY/Xnt11dvjCbLkDmM4ozeien8keZkCDh8KYJ0ohYTHKQSNvZuj9TJvgaH+wCbOXIMHlycJkGDHukqiGHA5ciU+URJ95R8zxZDXLki3OQyWoefZT+pZp2NzBwJsrnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761974269; c=relaxed/simple;
	bh=mxI3MgpSyFz5SL0e1+Jsds2AaC7KOeGO0W7912pWSFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGCMV8EA3ioAp6ujWuschES3lcveXdMibZOo3dVwbt9HBJKPD7OZFtMlaS03w0VHF2m4veIAdCrH3PvHuz1L1SiuOxLPYA/x32s1VYWFzZHQVBjG78qs63CxJj6IxBG0y2hkP27flTOSR9fjeI3QHl1QmNdtraPmdCmt5wtUbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdueKPBo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdueKPBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761974267; x=1793510267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mxI3MgpSyFz5SL0e1+Jsds2AaC7KOeGO0W7912pWSFU=;
  b=DdueKPBo5gUMiP9EpZZ82c3J6+a2wYK7+ynndcona+yOYFEaDQeuI6sT
   DCSMeff+GXwcDanJIrG8OTsDz5QT27iI3ycsr55UhAfbrdeLJ3MNEv4Ex
   /xkMnaldr773Ct69dZWKhHXJq6PfeXh0w11yhr4nyzpFwym3ORJZb1v8f
   TXOOqOj4UjX43G0bH6/Vzzc9QjHinwaVUT66sg4dRPP0NWQ0l8vwXc+sw
   Gz3Zsihl8qg0e0kajH2yIp5gNyjLjQKFkQYtb1Rs1SqEPmImtGZkIyi/M
   k+C6A8BekBGT3gMHMLXNOibxI7tqbSm+lliXXbTCviiWs4YJIhjY7Ykld
   Q==;
X-CSE-ConnectionGUID: 3s2TU2SaQT+zQ/UnjsZ+pw==
X-CSE-MsgGUID: IdyFedUHShe0FNfTk12Wag==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="75250203"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="75250203"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 22:17:47 -0700
X-CSE-ConnectionGUID: pkesUKZQSpqG3lEV0j6aGw==
X-CSE-MsgGUID: /gZ9LDt3RcCXNBgCs+RdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="185624340"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 31 Oct 2025 22:17:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF3zj-000Nvy-2y;
	Sat, 01 Nov 2025 05:17:43 +0000
Date: Sat, 1 Nov 2025 13:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Peng Zhang <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3081/3081] include/linux/userfaultfd_k.h:66:45:
 sparse: sparse: restricted uffd_flags_t degrades to integer
Message-ID: <202511011309.6fKIlijE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a5b2f9a14178b13fe5efc52ba6575f5294c1270
commit: 0214feb8f616acf62f9a6a2a131f0a1479b2b8af [3081/3081] mm/userswap: introduce UFFDIO_COPY_MODE_DIRECT_MAP
config: x86_64-randconfig-123-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011309.6fKIlijE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011309.6fKIlijE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011309.6fKIlijE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/userfaultfd.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - unexpected unlock
   mm/userfaultfd.c: note: in included file:
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode

vim +66 include/linux/userfaultfd_k.h

    63	
    64	static inline uffd_flags_t uffd_flags_set_mode(uffd_flags_t flags, enum mfill_atomic_mode mode)
    65	{
  > 66		if (IS_ENABLED(CONFIG_USERSWAP) && (flags & MFILL_ATOMIC_DIRECT_MAP) &&
  > 67		    uffd_flags_mode_is(mode, MFILL_ATOMIC_COPY))
    68			mode = MFILL_ATOMIC_DIRECT_MAP;
    69	
    70		flags &= ~MFILL_ATOMIC_MODE_MASK;
    71		return flags | ((__force uffd_flags_t) mode);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
