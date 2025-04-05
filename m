Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACF78F2E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 04:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743827984; cv=none; b=db/U+MvLNh+I+4YefYu/b1U/KWi9eQboHTrlyKULM+O9oHqQaTigzI09jRyhR+3Wz33/OmQ61vgaFKyV18n9hNPdxW7PZQMAMORJl0egVTDcxwxAx635y+/4tCDKvBZd/+cevzPP/HTPc0C6jiQvMWjjnDmzsxaL1sx0DlQVmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743827984; c=relaxed/simple;
	bh=WKPnDnwqw/fNSt2JKCP2o7GVokX6+onv5secmMorqHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lV+j+Ony2dqSvXpJa/kl2sRioYETRbkQE9VPYSvCtRwM+K1NjwacQT1pxCM7CD/2TEROo9XoYpuhP90T8rpkaLTD5wqAGbZEczN8U194KEdC+yjLLSZaLjGWTJeZ4RLV2dc40lYQqieBV/Fw1aI9B9iV9n2AXJ9wUD59lsaGvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aO+Fjazz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aO+Fjazz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743827983; x=1775363983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WKPnDnwqw/fNSt2JKCP2o7GVokX6+onv5secmMorqHs=;
  b=aO+Fjazz+1U5gty2iY+yMDxvPyEsCMUkwVIpuBY4azq2gnk11ZMkoNb6
   OBOw5S5XDC9+PShHPVIoWyqMLRsL0yln3idvuJmZv5bFbVs7piuuF/c3z
   ysJex/C4O5qYsEYnF+IcssIyG+vteztqdP34sTpInsYhYPpjQKYESoye5
   7cAe0a+2fGonhSxD+eGlewmYy4x/EhaQW8krFR1QFORluyyHjJ1ylN/gP
   6eYYGB9pTdjGdJZJxrUdxBsL+Ybgbgw/eQXNH+zLFqPyZ3PPISOsBUoCu
   WImxNhOd/xDqX+p5QR5TaZ+qGhNqaMl/My3yraGHRbnQ0zkfYQkw0RK6N
   A==;
X-CSE-ConnectionGUID: UY8XVTOQSkiAEvFPCxVBgQ==
X-CSE-MsgGUID: woUR2oO/RhKYzJxd/2HukQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44523596"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="44523596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 21:39:42 -0700
X-CSE-ConnectionGUID: 8EQh62sFT8OOO66qQ/yyYg==
X-CSE-MsgGUID: MUST2v1cQbaKgLrWpg0hxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="127997699"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 21:39:41 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0vJi-0001oe-2m;
	Sat, 05 Apr 2025 04:39:38 +0000
Date: Sat, 5 Apr 2025 12:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 5/7] {standard input}:72089: Error: invalid
 operands (.discard.unwind_hints and .text sections) for `-'
Message-ID: <202504051213.eKSECgNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   d9200f830505ef0415720e0bd90fe183e62222c5
commit: b0b640fa028879fb570ed70c6f08ba979e958ade [5/7] objtool: Improve code generation readability
config: loongarch-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051213.eKSECgNR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051213.eKSECgNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051213.eKSECgNR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:4739: Error: unknown pseudo-op: `.popsectionst.d'
>> {standard input}:4777: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4784: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4792: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4800: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4808: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4816: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4825: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4830: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4831: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4833: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4835: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4837: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4838: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4839: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4842: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4843: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4849: Warning: dwarf line number information for .discard.unwind_hints ignored
>> {standard input}:4851: Error: CFI instruction used without previous .cfi_startproc
   {standard input}:4853: Error: CFI instruction used without previous .cfi_startproc
   {standard input}:4855: Error: CFI instruction used without previous .cfi_startproc
>> {standard input}:4863: Error: .cfi_endproc without corresponding .cfi_startproc
   {standard input}:4872: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4874: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4875: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4880: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4883: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4884: Warning: dwarf line number information for .discard.unwind_hints ignored
   {standard input}:4889: Warning: dwarf line number information for .discard.unwind_hints ignored
>> {standard input}:5197: Error: previous CFI entry not closed (missing .cfi_endproc)
>> {standard input}:70488: Error: leb128 operand is an undefined symbol: .LVU1495
   {standard input}:70489: Error: leb128 operand is an undefined symbol: .LVU1495
>> {standard input}:72068: Error: leb128 operand is an undefined symbol: .LVU1490
   {standard input}:72069: Error: leb128 operand is an undefined symbol: .LVU1490
>> {standard input}:72089: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
   {standard input}:72093: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
   {standard input}:72094: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
   {standard input}:72140: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
   {standard input}:72153: Error: leb128 operand is an undefined symbol: .LVU1490
   {standard input}:72154: Error: leb128 operand is an undefined symbol: .LVU1490
   {standard input}:72174: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
   {standard input}:72178: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
   {standard input}:72179: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
>> {standard input}:72188: Error: leb128 operand is an undefined symbol: .LVU1480
   {standard input}:72192: Error: invalid operands (.discard.unwind_hints and .text sections) for `-'
>> {standard input}: Error: .size expression for show_stack does not evaluate to a constant

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
