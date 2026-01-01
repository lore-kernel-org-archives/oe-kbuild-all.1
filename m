Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58709296BD7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767285365; cv=none; b=XNixUh5NBgWKcz1F1JtIaVos+y29CnUY/wmphtkvlXlqeLl02ZDYBLyYXu6Ui9jRI/72bKauLhwXY6CtB4OBjeCX5ko0zX9AIDS+ikeJPHb23+ToKjGFyyu4VN/qFue1oaQ9lXqUrzMo/GEayeobElvzlKTgl4hRhR9HVhAtSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767285365; c=relaxed/simple;
	bh=/ZXZtUJEst/oOlWV8f4/YDUNF3AZZOFOS73TANSrEgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKfrIZ8dN6Lpy/gnZQ0teteG/ANCZzBSO8hAjkUuuFUw+QDUHkG8J4/kjoZQibPYb/AHe6bJoZQ/13qWpOE7dilubVbeppcLpZTk9tnnUW133AFdFttIa5xo08J/4s2v+LRlDThHxUbfSP+47eJD8PoQe9A//n8lAqiDO2f3v+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q46OqOvA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q46OqOvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767285362; x=1798821362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ZXZtUJEst/oOlWV8f4/YDUNF3AZZOFOS73TANSrEgY=;
  b=Q46OqOvAzQ5ecoUISEFIrodwUrcQUP4cFofXdW8n2ZKkjJpEChmODaQJ
   P+eC20QBsSBmNqKgmWRqdAwDDQpraT59nFtAfJyNBWxjHI5U/HQLew594
   TKuQwhSsgy3AWbZGJDSn+2PAJ3/e5fogw01mY/Gg/u6O999p8F9wtW+BW
   zQNeu26QOqfb0RPkWjybYcKRmxL8EgDeKmpkLddMErmLBUaiiV3S+yD31
   5iGqjrvKLkSA6tF5GaxZezVTEg+SyxksgsAdlYxxzzIbw55nFTYfCzhkM
   5L3Qe37dD/LOjeeFoehd7gc9cXupZIbg7feswTTK4LWgODlIb+rV4RFKz
   A==;
X-CSE-ConnectionGUID: lMSxd6NuTJmuF6GoSBMpXQ==
X-CSE-MsgGUID: 6/pJ1ZmlSayB/l1+fRXFLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67824191"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67824191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 08:36:01 -0800
X-CSE-ConnectionGUID: Bkjm9KrwR8mIB+CsabLbsw==
X-CSE-MsgGUID: 5cEyU2yoT7muaClKLLfdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="225149724"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jan 2026 08:36:00 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbLeX-000000000In-43tn;
	Thu, 01 Jan 2026 16:35:57 +0000
Date: Thu, 1 Jan 2026 17:35:05 +0100
From: kernel test robot <lkp@intel.com>
To: Kari Argillander <kari.argillander@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 6/6] rust: WIP: Replace ModuleMetadata with
 THIS_MODULE
Message-ID: <202601011715.KzrKcjdz-lkp@intel.com>
References: <20260101-this_module_fix-v1-6-46ae3e5605a0@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-this_module_fix-v1-6-46ae3e5605a0@gmail.com>

Hi Kari,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kari-Argillander/rust-Enable-const_refs_to_static-feature/20260101-172411
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20260101-this_module_fix-v1-6-46ae3e5605a0%40gmail.com
patch subject: [PATCH RFC 6/6] rust: WIP: Replace ModuleMetadata with THIS_MODULE
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260101/202601011715.KzrKcjdz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011715.KzrKcjdz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601011715.KzrKcjdz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `str::CStr`
   --> rust/kernel/driver.rs:94:31
   |
   94 | use crate::{acpi, device, of, str::CStr, try_pin_init, types::Opaque, ThisModule};
   |                               ^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused import: `str::CStr`
   --> rust/kernel/pci.rs:21:5
   |
   21 |     str::CStr,
   |     ^^^^^^^^^
--
>> warning: unused import: `str::CStr`
   --> rust/kernel/usb.rs:14:5
   |
   14 |     str::CStr,
   |     ^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
