Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304BD43DEC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123073; cv=none; b=VCLcluMUgn52/AiZH3TNpudChNm37zeiyJswT8asF4Hs1J4ACtMADSg8lNeTkX+YyJXFBxslZlolBQd0CIaTlpwj4vKYtfWn5fys0atRAeQbcxX3NkOG5XdY82NbQVAAihAUgmtUK8kaMKGjoIx7iLP6J6ZEe4OQ4ms3sCtp6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123073; c=relaxed/simple;
	bh=u3ml56j4b77Wl1GbiGVHUmqogW08AlS96mTkV2PdT1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SLnVuB4tCWlrSrRZ5PVpWRVljhHilfbFIAIhtk2hfRTq2AyUtQHPtXceOci2Wc6nq7dozNQYeONZZwZO6tPkOCQLz22izW8w7Fh1s8kaYoA4OA9GX1j/wj09c/8ZLzt/rddebbNx7uhLFf1XJEct/v9UCLb5vV4dWnYe2hLOPec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+PgXW8Z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+PgXW8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789123068; x=1820659068;
  h=date:from:to:cc:subject:message-id;
  bh=u3ml56j4b77Wl1GbiGVHUmqogW08AlS96mTkV2PdT1A=;
  b=R+PgXW8ZTVKdl3dP24X91gd4Vkchn4k17HXVR9+tSnO/uqd87PZ9zT4O
   351Y72kyNQPmQ84Q8svU9KswDc65jfEecnTnXFS3kyTh4GFd3Yexpt+hL
   JkYWgyr1bcDNDLZl4YPEVvUbh7RWQe0zUPem1Hs1k1ewfRjOwYoKrJ8wT
   9TGnF2DsqLnhIt1lKPecu5MKsfjH1/DInpbHLmbkXg5nJSc/EqVFAezWY
   WWwRm3SOWg6q907+qnwcvux9Ae1B8nHzL4tLVuZbgcnLif7+4IAQnUVUv
   cZZGpC98SgEMGfDMxmjEcUrxn77ixCqZZXM5c45mKty0sE+DD/THuORZ2
   w==;
X-CSE-ConnectionGUID: KzCLNIzjTlqhSPK61y+BZA==
X-CSE-MsgGUID: oHHT5sO6Q3KmiIzkcQ12Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100936761"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100936761"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 03:37:40 -0700
X-CSE-ConnectionGUID: Yo5Ovl7FSyuoOr0ZG2dk5A==
X-CSE-MsgGUID: Bh5Zt72aQT6CqFBs9bQUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268207484"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2026 03:37:39 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ydU-000000000lj-3gdS;
	Fri, 11 Sep 2026 10:37:36 +0000
Date: Fri, 11 Sep 2026 12:36:52 +0200
From: kernel test robot <lkp@intel.com>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-doc@vger.kernel.org
Subject: [linux-next:master 5112/5916] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
Message-ID: <202609111242.3THMmby4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2bfbc3554ca6919484030729424b9dee2942d24
commit: 3f21de6784a654503cc148169d1f59d89971da13 [5112/5916] power: supply: rt9467: Use POWER_SUPPLY_PROP_LOAD_SWITCH
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260911/202609111242.3THMmby4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111242.3THMmby4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/ABI/testing/sysfs-class-power-rt9467:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
   Documentation/driver-api/basics:42: ./kernel/time/time.c:387: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:410: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.


vim +1 Documentation/ABI/testing/sysfs-class-power-rt9467

eedb923279b78c ChiaEn Wu 2023-01-03 @1  What:		/sys/class/power_supply/rt9467-*/sysoff_enable

:::::: The code at line 1 was first introduced by commit
:::::: eedb923279b78cbfe16dd54dade0d73e9977f118 Documentation: power: rt9467: Document exported sysfs entries

:::::: TO: ChiaEn Wu <chiaen_wu@richtek.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
