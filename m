Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A033112D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116287; cv=none; b=CfOkm9EFRy38aE9Qpq7+9OWzJw857FhxEKiB2Mimzh6gdGev1nv77ktHZWcwsPFV0UvAIIu1UcFqzwYsPN691Q8zU82I93jgDnGC57DpopFZLVX2rlHcvh8UE5s8t/XYXb2xxFHQovUxujT2vf0+MiyYRAuI2ql+Wo1WkBc+34I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116287; c=relaxed/simple;
	bh=hgpDGBTK8auuNnzKOsAmqR7fLWM+6d8IGyBqe3LBHFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GiFDb5qjTl0dzXPT/R+LO4n9tepwipefT33Y+0H7sfWlFZW5t1Sq6tMeQZZ3nmhzTqs1Q7F6mUiLLQ8skjPWleP5gNS7uQSwDypFn1HyZWYqtxbbUkNmrg9v3DJ1xy2Sed0TKvpd4QUV7vzX2LXlhaaSSeg6FPMRu8lbtQv55q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJUj4sz7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJUj4sz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763116284; x=1794652284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgpDGBTK8auuNnzKOsAmqR7fLWM+6d8IGyBqe3LBHFo=;
  b=CJUj4sz7zLj7I6D/nXZ7TiQBvyGuVHMTn4qpXuOCFsWow3GqJRlneNZp
   lxKmdA2ksKUsMVLx0a1d5j63rhIOFsNOiQ44lmsAIQfnN6/T4iuz/H9K4
   hI06MbDV9tTF6FCNG8gPgbOVZLpn0RrxlKGVQV5JWNyt7pVukz6ZVHEaI
   VE/OocyHrpLkYCBstTDTzunx9dIwwHl9Wz3QZeC9fpE/Co4crNusde5jv
   uzQjnPf0ah284qhseA9/CuFS/YoOTGqg2T5TJwFxs2ZvJjeRE7KEpziVo
   /LBVRVTRloqilwW+b5zmjBgG2fDtnCAF65jFw9cBWPPSs48zh0QITXaGF
   Q==;
X-CSE-ConnectionGUID: KeiVos71QhqdAJJN81BvYg==
X-CSE-MsgGUID: p84VUIiuRF2nDowJpXRGkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76555075"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="76555075"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 02:31:23 -0800
X-CSE-ConnectionGUID: yxYFTGkYTYeUa0RmIAq6/w==
X-CSE-MsgGUID: x+tBs9RCRjGMiITIle31dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="189577414"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2025 02:31:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJr5M-0006TB-0k;
	Fri, 14 Nov 2025 10:31:20 +0000
Date: Fri, 14 Nov 2025 18:31:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3184/3184]
 drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1574:6: warning: no previous
 prototype for function 'ngbe_set_vf_link_state'
Message-ID: <202511141823.O1X38Q99-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a3ad7e81bef76a9ab092cddd9d22a64743270c0f
commit: 0e80b39fcf6c1b2a13b11f8632b185a89b012b14 [3184/3184] net: wangxun: ngbe: add support for wangxun 1G
config: arm64-randconfig-003-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141823.O1X38Q99-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141823.O1X38Q99-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141823.O1X38Q99-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1079:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1079 |         case NGBE_VF_BACKUP:
         |         ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1079:2: note: insert 'break;' to avoid fall-through
    1079 |         case NGBE_VF_BACKUP:
         |         ^
         |         break; 
>> drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1574:6: warning: no previous prototype for function 'ngbe_set_vf_link_state' [-Wmissing-prototypes]
    1574 | void ngbe_set_vf_link_state(struct ngbe_adapter *adapter, int vf, int state)
         |      ^
   drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1574:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1574 | void ngbe_set_vf_link_state(struct ngbe_adapter *adapter, int vf, int state)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]


vim +/ngbe_set_vf_link_state +1574 drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c

  1566	
  1567	/**
  1568	 * ngbe_set_vf_link_state - Set link state
  1569	 * @adapter: Pointer to adapter struct
  1570	 * @vf: VF identifier
  1571	 * @state: required link state
  1572	 * Set a link force state on/off a single vf
  1573	 **/
> 1574	void ngbe_set_vf_link_state(struct ngbe_adapter *adapter, int vf, int state)
  1575	{
  1576		bool link_up = false;
  1577	
  1578		adapter->vfinfo[vf].link_state = state;
  1579	
  1580		switch (state) {
  1581		case NGBE_VF_LINK_STATE_AUTO:
  1582			if (test_bit(__NGBE_DOWN, &adapter->state)) {
  1583				adapter->vfinfo[vf].link_enable = false;
  1584			} else {
  1585				link_up = adapter->link_up;
  1586				adapter->vfinfo[vf].link_enable = true;
  1587			}
  1588			break;
  1589		case NGBE_VF_LINK_STATE_ENABLE:
  1590			adapter->vfinfo[vf].link_enable = true;
  1591			link_up = true;
  1592			break;
  1593		case NGBE_VF_LINK_STATE_DISABLE:
  1594			adapter->vfinfo[vf].link_enable = false;
  1595			link_up = false;
  1596			break;
  1597		}
  1598	
  1599		/* restart the VF */
  1600		adapter->vfinfo[vf].clear_to_send = false;
  1601		ngbe_ping_vf(adapter, vf);
  1602	
  1603		ngbe_ping_vf_with_link_status(adapter, link_up, vf);
  1604	
  1605		ngbe_set_vf_rx_tx(adapter, vf);
  1606	}
  1607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
