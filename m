Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD9F43151
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739178893; cv=none; b=JStUqdwOk4W0SNNOPRuIFt+BtpLZditskLBxRboKp0FAED5k1JZddsmxU87TYdNOK4ZoyoK/FVR5/biKbk8amGwq8gNA5myu8zzXDndWUb1G03G3h/CM67lL++2/xrySNsbaQIYVEL3ratBcz3K0Ja06CpHm8IKt3rOk9Uu/5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739178893; c=relaxed/simple;
	bh=uPnsilcxMO44zRzlYwAUASkTO8MPK8Bd/RGsblht0fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4thlIs/AjhGX5TQOPR7jeAkmAVegXyMiYRPsqzxGn8Fdu+LPAAgqWC1Bl4EBQJ9/DN9wNbB3B2VXMijuqRUxfug7jLDS0JyQAAjI3qSbNBhT0QJID5zbREK2D7f3wFjGj3sBkBpRWLGFxalj5QSSbJO4Pw00mtcRind2yJAX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brldkQUh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brldkQUh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739178892; x=1770714892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPnsilcxMO44zRzlYwAUASkTO8MPK8Bd/RGsblht0fM=;
  b=brldkQUhBJPQMd9rJLpOte1oX5htZwSEd8V/WzY1ffo4rmRtBNW4c7D4
   nYaws9eFaulBxCdjIVpxDyy9vX6J41fOXaxhDi4VIsl9o20dZyq2un1ko
   XqT8vPcYMs41eiKO0tQDLWuYlDNukdeEqcgLHcP+PlqZmWPwpXT+rwYGl
   dIGPkFik3vAkOCVCCeBBNFPf+MrtikhO2k5N4OJwzXETeDTVA4kPfbcuz
   3WxJSciLpv4efZaQWyoTbhjmvLvS4yCpZ8SfZjV1hF4F9jX8FmrFj/UTQ
   btpuMHcbED8H4UFrKgJU2OJz3rd57W2u5xLPHwRu3R65/zlCTb2xeAmgu
   A==;
X-CSE-ConnectionGUID: oFOVV7JXQ/mihmZTeRF+GA==
X-CSE-MsgGUID: B5t8hYSXS9mDzEir/tuzCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57165441"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="57165441"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:14:51 -0800
X-CSE-ConnectionGUID: k0LyYfm1SFadjKMrWL8eDw==
X-CSE-MsgGUID: Cu5GJD9JQTiZRX1rvxLVlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="117197077"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2025 01:14:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thPsN-0012Ux-2Q;
	Mon, 10 Feb 2025 09:14:47 +0000
Date: Mon, 10 Feb 2025 17:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 78/112] warning: unused import:
 `error::to_result`
Message-ID: <202502101747.NRAfNeDS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   fd3792ec2053672fb9359a570552a51ae48f4035
commit: 05ee061d013fffe313ec788233c61c76aae525a6 [78/112] rust: of: Add Node::address_as_resource()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250210/202502101747.NRAfNeDS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101747.NRAfNeDS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101747.NRAfNeDS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `error::to_result`
   --> rust/kernel/of.rs:7:47
   |
   7 | use crate::{bindings, device_id::RawDeviceId, error::to_result, io_mem::Resource, prelude::*};
   |                                               ^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused variable: `index`
   --> rust/kernel/of.rs:257:39
   |
   257 |     pub fn address_as_resource(&self, index: usize) -> Result<Resource> {
   |                                       ^^^^^ help: if this is intentional, prefix it with an underscore: `_index`
   |
   = note: `#[warn(unused_variables)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
