Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63F2701D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358445; cv=none; b=V+ju+P+sBjmCabXkfF9yiyRNSzd00e7SG1P3vdUnr/CgfEgDYSRjQbF5Au7eu0k6regkUkVb8eR1CIc3MN/TO0GnXBtvGCGX7ieiT+7qF2yMLSO1QJhUKr8yweCWoccDy3ZR31pvcBlg9Fn0psKc4u1iDUDRC6uZqCD/TJFimSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358445; c=relaxed/simple;
	bh=HfSCIDLuWiba12//NVR1MYWlUSt+8oh2weQ/A1DwNPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gEGklbpzN+O3Rrvh8T8P4ZiZSW5j4koFJUwva4XDyartHVcCYnDInj+1ll0bsgCEkLmcPAci70GObHB+x7JlDROB676biJVWLJKZeQRyNpgIFQhjw4Ft/pm/NMnPQqousSyB1DRHmlSIQxmKbEt7sXxiGi5bNEMGVWX4iRKfJco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKvASum9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKvASum9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358443; x=1791894443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HfSCIDLuWiba12//NVR1MYWlUSt+8oh2weQ/A1DwNPI=;
  b=HKvASum9OobL7UQuRQeceOxoU8BdJ4y97QO9rzx+OIwVmau+iy2XysIG
   tY9ZwMhArWEsYD/4DvRfTyXA0wV7VptQvbncMaZLtcVZ/pIS1cXmbXJOX
   SKE2bd5hITRSZHOsC/WEbR/MFtsl2SumNiwvOLs540cO3iFm1eqb/vBNZ
   6Ea4UtGBrPHea8uT/1Gb9XXXyIx6LeVJLCoCaXSrm3AAAQDFF6mRImsGC
   n3updDdAoQY5Jyw6oT5ATfpTX7ULL/EzHFMzLUT1JRJQciZFOQMrus8ag
   xHB+pEmjEmUFS1XoFbLHlTar9xEx4fJrb1443oUsNiDXCWK1EE8rYVEHY
   w==;
X-CSE-ConnectionGUID: cE496vfISeib/7pJSNOATQ==
X-CSE-MsgGUID: PNQ2LvsPSNqnzWc9+R2wmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62528676"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62528676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:19 -0700
X-CSE-ConnectionGUID: UGOwGhHXTRCGuRnQbn+wvw==
X-CSE-MsgGUID: XKV+OXZNQjSQQuio1zzuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186001671"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008s7-1iAE;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:49 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 52/75] warning: empty line after doc comment
Message-ID: <202510121911.JPiL9A1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   8b6709186beeb5586868e91c84775efe3194d98d
commit: a09925f1f4bd157b08f8d675f6f7c6551a1704ee [52/75] rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251012/202510121911.JPiL9A1e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121911.JPiL9A1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121911.JPiL9A1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty line after doc comment
   --> rust/kernel/types.rs:452:1
   |
   452 | / /// into a &mut T.
   453 | |
   | |_^
   ...
   458 |   pub unsafe trait OwnableMut: Ownable {}
   |   --------------------------- the comment documents this trait
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
   = note: `-W clippy::empty-line-after-doc-comments` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_line_after_doc_comments)]`
   = help: if the empty line is unintentional, remove it
   help: if the documentation should include the empty line include it in the comment
   |
   453 | ///
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
