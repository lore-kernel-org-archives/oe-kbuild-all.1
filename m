Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A7238D42
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 23:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754524406; cv=none; b=JencpH4GMvZvW2gpJESJW96CYdx8fAIjpoW+tv62xPz/iMEXI0gOZR4NdHAMpQ0eXVzRP0B2P16MPsbA5QLW/muZ5oTYuSw9IygXePIOuXvQIcrG5kZ6Z/oVxrKEhufw3gkOHI1m15ucKXwwLiTWQ2sNkF/s7Tb9HXonbo0tjtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754524406; c=relaxed/simple;
	bh=Y4gFinm7HrOSJQbOwHpensyTnjV0Wj4ZcfiHbpZ3BiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sU02TNiB1J+VrkwJGGm8aUidrU5wwqn3s7iqU6ykc1nkYuUan4BepJy2hTWiHwEf7xy/sVKXy69mFAZMfCxKwuCsgYr+Pi2pt8zJPn9CLFz5g3/sNm/DkyL/usJLjoeyrh5SOc2xXnJwI7sGzbUzwMYL8bBvDQuWo5BDF6T/URw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHnqoIN/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHnqoIN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754524405; x=1786060405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4gFinm7HrOSJQbOwHpensyTnjV0Wj4ZcfiHbpZ3BiA=;
  b=QHnqoIN//pmcPYAQr1h1ZH7kXfgg71tHmVCdpie1SRu5s1irGtdJO2HL
   1Z4ZFqCQsWZKxV2JXE12jMaGvVROcca900jzBzXpBCDCPxZY8p7wlV5rj
   itkeQXvZdNHkEv2Pmt+TiADLxJ5yqoKnSOiJc0YLAJcwDWGvd7d7m0w4q
   NuzscIySwhLmXQkIx5hgMAHNCi1ZJX5FM9tgFUF2+GHQjbzXJWaBfnCEp
   RoJAjayjgQ43LzrtX2G0JC/8YZy3O3WlUWYqt/KL++hyvFZFzq1K/TQmW
   TTyXLyz/88pcyyY+wWZp7nW78+AmA0PWURRkDvl42ep6V4vA2wagA14W2
   g==;
X-CSE-ConnectionGUID: des9YvSpRrKU4h5/O6zbwg==
X-CSE-MsgGUID: zHSEknyAQzW4Z8f8jfaLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67119507"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67119507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 16:52:50 -0700
X-CSE-ConnectionGUID: rlQiD5tvSai7PcDemgZumQ==
X-CSE-MsgGUID: H8cDy0wwRdS+pEgDl7BQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164915894"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 16:52:49 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujnw6-0002Bo-1v;
	Wed, 06 Aug 2025 23:52:46 +0000
Date: Thu, 7 Aug 2025 07:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 268/274] ERROR: modpost:
 __ex_table+0x2004 references non-executable section
 '.rodata.anx7625_bridge_edid_read.str1.4'
Message-ID: <202508070741.ARXxIZ9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   370c4b838c9641630225ee0f1e2a7938f16d7f54
commit: 198c4d8e24bc213ba888afd0e6bd8e7c7fa207f8 [268/274] workqueue: Basic memory allocation profiling support
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070741.ARXxIZ9Y-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070741.ARXxIZ9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070741.ARXxIZ9Y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1df8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e00 (section: __ex_table) -> .LASF1148 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e04 (section: __ex_table) -> .LASF1150 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e04 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e0c (section: __ex_table) -> .LASF1456 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LASF1458 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF1460 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF1462 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .LLST27 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LASF2642 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e30 (section: __ex_table) -> .LLST69 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1e30 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e34 (section: __ex_table) -> .LASF2645 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .LASF1614 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e58 (section: __ex_table) -> .LASF1616 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e60 (section: __ex_table) -> .LASF2293 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e64 (section: __ex_table) -> .LASF2295 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e6c (section: __ex_table) -> .LASF747 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e70 (section: __ex_table) -> .LASF749 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e78 (section: __ex_table) -> .LASF751 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e7c (section: __ex_table) -> .LASF749 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e7c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb4 (section: __ex_table) -> .LASF3507 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb8 (section: __ex_table) -> .LASF3509 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef0 (section: __ex_table) -> .LASF142 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ef4 (section: __ex_table) -> .LASF144 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ef4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> .LASF844 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f48 (section: __ex_table) -> .LASF846 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f50 (section: __ex_table) -> .LASF848 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f54 (section: __ex_table) -> .LASF850 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f5c (section: __ex_table) -> .LASF4240 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> .LASF4242 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f68 (section: __ex_table) -> .LASF4244 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f6c (section: __ex_table) -> .LASF4246 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f6c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> .LASF4248 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> .LASF4250 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> .LASF4252 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> .LASF4254 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> .LASF3376 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> .LASF3378 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> .LASF3380 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb4 (section: __ex_table) -> .LASF3382 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fbc (section: __ex_table) -> .LASF3384 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fbc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc0 (section: __ex_table) -> .LASF3382 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fc8 (section: __ex_table) -> .LASF3387 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fc8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fcc (section: __ex_table) -> .LASF3382 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fd8 (section: __ex_table) -> .LLST26 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1fd8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe0 (section: __ex_table) -> .LASF539 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe4 (section: __ex_table) -> .LASF541 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fec (section: __ex_table) -> .LASF543 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff0 (section: __ex_table) -> .LASF545 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff8 (section: __ex_table) -> .LASF547 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ffc (section: __ex_table) -> .LASF545 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2004 (section: __ex_table) -> .LC53 (section: .rodata.anx7625_bridge_edid_read.str1.4)
>> ERROR: modpost: __ex_table+0x2004 references non-executable section '.rodata.anx7625_bridge_edid_read.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2034 (section: __ex_table) -> .LASF147 (section: .debug_str)
ERROR: modpost: __ex_table+0x2034 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2038 (section: __ex_table) -> .LASF149 (section: .debug_str)
ERROR: modpost: __ex_table+0x2038 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2040 (section: __ex_table) -> .LASF151 (section: .debug_str)
ERROR: modpost: __ex_table+0x2040 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2044 (section: __ex_table) -> .LASF149 (section: .debug_str)
ERROR: modpost: __ex_table+0x2044 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x204c (section: __ex_table) -> .LASF3981 (section: .debug_str)
ERROR: modpost: __ex_table+0x204c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2050 (section: __ex_table) -> .LASF3983 (section: .debug_str)
ERROR: modpost: __ex_table+0x2050 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2058 (section: __ex_table) -> .LASF3985 (section: .debug_str)
ERROR: modpost: __ex_table+0x2058 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x205c (section: __ex_table) -> .LASF3987 (section: .debug_str)
ERROR: modpost: __ex_table+0x205c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2064 (section: __ex_table) -> .LASF3989 (section: .debug_str)
ERROR: modpost: __ex_table+0x2064 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2068 (section: __ex_table) -> .LASF3987 (section: .debug_str)
ERROR: modpost: __ex_table+0x2068 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2070 (section: __ex_table) -> .LASF3992 (section: .debug_str)
ERROR: modpost: __ex_table+0x2070 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2074 (section: __ex_table) -> .LASF3987 (section: .debug_str)
ERROR: modpost: __ex_table+0x2074 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x207c (section: __ex_table) -> .LASF2847 (section: .debug_str)
ERROR: modpost: __ex_table+0x207c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2080 (section: __ex_table) -> .LASF2849 (section: .debug_str)
ERROR: modpost: __ex_table+0x2080 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
