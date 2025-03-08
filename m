Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D11A2DF68
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 05:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741411042; cv=none; b=LGez/Qb5dgClGizluwgthoOoB+ZnSekrlyftCQ5XxX2Tfh8fF0UNla4rccUMk/BEe/hvcj/Z+5EUZN21oW7a9Y7TXVlJxtMJaHo0KhycWs3KZhOWJXEwnsIk9yj7q8u1hRON0tzpsbK1CjAin4hVO3WdKotrYzP25dDWLQ3f3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741411042; c=relaxed/simple;
	bh=w2Wtba9ih2Spxmf6BxrNAvVerNriXURahn4fpAJqKGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UdfJOSl5JyY6Cn7tkDtXjo799dnw/FzscGuKaKEii1lemSCnbqjEZtKSFGrnKRQ73fh5krzyLyDuIOIfdXKYhf8fe8sxzOIKsq4riF7R4F9Jnd6Ql2g6GRty5H3lMm0EnJAwQsC8bq1T9GwaHng+NBbqrHxUFeOLraRTrqOh89E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jah1OG+W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jah1OG+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741411040; x=1772947040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w2Wtba9ih2Spxmf6BxrNAvVerNriXURahn4fpAJqKGM=;
  b=Jah1OG+WjUlnaFeIY+REjJ3MTk3d+652ReLDuhiz38MQcdXqgp2mGbNe
   uKgIoBpR7RlXSqf8RjxBF5ksvm+267QFlWTP3NhoA8v83bso0QLZuIvaI
   gNf8nnX+gafPBJRNho+wqQJ/fMgnOfSGS4GZwIOxqeJewWrarHbSxCBzd
   ZekiSAVEew263sg90/BBpNysIY7/7yTLJGAEhQLd4z++51EY1zSLufLsv
   smBWeHLGm57Cu3aklrqrmta+jWUVAQIeLL4psX3wOIrOVebjEqBDmZupV
   siwuaSY2P3IhUdabZKq1hKx6BHP9Drz9aVj5ys+ksH3CZQTAwzB8hiyQY
   w==;
X-CSE-ConnectionGUID: +1WJZxA1SpmQv9zYEnC8+A==
X-CSE-MsgGUID: +OTx0uLaS3GlGfanVGcGPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="53861516"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="53861516"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 21:17:18 -0800
X-CSE-ConnectionGUID: 9lc6MZibTyCrtvI2mjTjnw==
X-CSE-MsgGUID: SzIIccUNSGytLdzsxMv2Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124730411"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 21:17:17 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqmYk-0001WS-1j;
	Sat, 08 Mar 2025 05:17:14 +0000
Date: Sat, 8 Mar 2025 13:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-core-experiments 247/411] warning: field `0` is never
 read
Message-ID: <202503081305.wDEJstf8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: fcfb703d90cd9cca4917782f4537e7cdcd6281e1 [247/411] rust: add auxiliary bus abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250308/202503081305.wDEJstf8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081305.wDEJstf8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081305.wDEJstf8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: field `0` is never read
   --> rust/kernel/auxiliary_bus.rs:85:21
   |
   85 | pub struct DeviceId(bindings::auxiliary_device_id);
   |            -------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |            |
   |            field in this struct
   |
   = note: `#[warn(dead_code)]` on by default
   help: consider changing the field to be of unit type to suppress this warning while preserving the field numbering, or remove the field
   |
   85 | pub struct DeviceId(());
   |                     ~~
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/auxiliary_bus.rs:87:1
   |
   87 | unsafe impl RawDeviceId for DeviceId {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: missing documentation for a module
   --> rust/kernel/lib.rs:38:1
   |
   38 | pub mod auxiliary_bus;
   | ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
