Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB201D63C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 05:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544806; cv=none; b=Ac8vbKV9FHD5lXl9/Z2par4dTyE1J5GDfxkjMR5/ZCExG/fCgDAnUmBkPjqMBhHKFIZg6Z+gbLdzO7nO8GT4F3iBFpQvsp9dnQjl7WpUU+Dxn9kMMBeyodACHi0rAlp071okuBuGzJJsShrUGSXoMo512l+yqt29Omxsz9GPAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544806; c=relaxed/simple;
	bh=tz2D3OApHgLAfujvprGkjbtzWXLUsrZJvmyvTDXuvc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bH3V3nybCmo+CPUnSIkudP+eNySt3LhDJvZ3HSvFsdmg+RjIjpP3+SZukFsgfWXih61f/4oonMCFXwa25BNprE22aWn7PHtD9+Tn+ZZ9GiEhX40qlPBZSWw1BxW5c6J38IzH70VVIGs1jroNuUav+dn5/wqacsHntO+506Xjl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6LrqPvk; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6LrqPvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754544805; x=1786080805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tz2D3OApHgLAfujvprGkjbtzWXLUsrZJvmyvTDXuvc0=;
  b=a6LrqPvkOsod4/dm0GU8v2ZvZVcDe8PftMCXuK9Ns30782flz26EIwMO
   DMQADYQlEWSg31NlfLWaZEhQP9iGvuskXoz+WbizK3A82ZrGFr4IYSZz2
   R/skB5sql3MQviO9yFJ8Q8F34Qc6H63ESjHioiqaNtBs+8S8f5jh/Afwa
   nzgSdpc7JmKGyOrXrkuDM70y1JLnPRIkaMXt3i8eFylyC04HIKcCUtf/h
   P68gMG7MAq0MaEdutORTfdMQbN3140QJ581RknZgZik3/4XLpft1aiThy
   HI3yxyF/7mJ7oD2jmIniSd0oKuRljZnincv//w4nZgu0Yuxrc+tLtMDMJ
   g==;
X-CSE-ConnectionGUID: Tbx/cRkPTOuvBJeatgaLvg==
X-CSE-MsgGUID: UwHF/kFsSj2iW4EbJrAFNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74330252"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74330252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:33:24 -0700
X-CSE-ConnectionGUID: /ncaNtXmSXuOeNbf4JT7Ug==
X-CSE-MsgGUID: NkxIxxAlTt6v5NXUw0mFIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165330724"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2025 22:33:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtFg-0002Pn-1z;
	Thu, 07 Aug 2025 05:33:20 +0000
Date: Thu, 7 Aug 2025 13:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 5/17] ERROR: modpost: __ex_table+0x1e3c
 references non-executable section '.data.rel.local..Lubsan_data80'
Message-ID: <202508071337.aVjMcHS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   56067bc9ae98ae8d75fbb2506874ef96ee0396e5
commit: 5c65bc14d10adbf548af5538a32e6199906f97d6 [5/17] mm: introduce bpf kfuncs to deal with memcg pointers
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071337.aVjMcHS6-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071337.aVjMcHS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071337.aVjMcHS6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x1bc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bcc (section: __ex_table) -> .LASF1766 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bcc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd0 (section: __ex_table) -> .LASF1768 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bd8 (section: __ex_table) -> .LASF1770 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bd8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bdc (section: __ex_table) -> .LASF1772 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bdc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be4 (section: __ex_table) -> .LASF1195 (section: .debug_str)
ERROR: modpost: __ex_table+0x1be4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1be8 (section: __ex_table) -> .LASF1197 (section: .debug_str)
ERROR: modpost: __ex_table+0x1be8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf0 (section: __ex_table) -> .LASF1199 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bf4 (section: __ex_table) -> .LASF1201 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bf4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1bfc (section: __ex_table) -> .LASF1203 (section: .debug_str)
ERROR: modpost: __ex_table+0x1bfc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c00 (section: __ex_table) -> .LASF1205 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c00 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c08 (section: __ex_table) -> .LASF1207 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c08 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c0c (section: __ex_table) -> .LASF1209 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c0c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c14 (section: __ex_table) -> .LASF1211 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c14 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c18 (section: __ex_table) -> .LASF1213 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c20 (section: __ex_table) -> .LASF1215 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c20 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c24 (section: __ex_table) -> .LASF1217 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c2c (section: __ex_table) -> .LASF1219 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c30 (section: __ex_table) -> .LASF1221 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c30 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c38 (section: __ex_table) -> .LASF1223 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c3c (section: __ex_table) -> .LASF1225 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c3c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c44 (section: __ex_table) -> .LASF1227 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c48 (section: __ex_table) -> .LASF1229 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c48 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c50 (section: __ex_table) -> .LASF1231 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c54 (section: __ex_table) -> .LASF1233 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c54 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c5c (section: __ex_table) -> .LASF1235 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1c60 (section: __ex_table) -> .LASF1237 (section: .debug_str)
ERROR: modpost: __ex_table+0x1c60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d40 (section: __ex_table) -> .Ldebug_info0 (section: .debug_info)
ERROR: modpost: __ex_table+0x1d40 references non-executable section '.debug_info'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d44 (section: __ex_table) -> .LASF848 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d44 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d4c (section: __ex_table) -> .LASF850 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d4c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d50 (section: __ex_table) -> .LASF852 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d50 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d58 (section: __ex_table) -> .LASF854 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d58 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d5c (section: __ex_table) -> .LASF856 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d5c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d64 (section: __ex_table) -> .LASF858 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d64 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d68 (section: __ex_table) -> .LASF860 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d68 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d70 (section: __ex_table) -> .LASF862 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d70 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d74 (section: __ex_table) -> .LASF864 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d74 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d7c (section: __ex_table) -> .LASF866 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d7c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d80 (section: __ex_table) -> .LASF868 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d80 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d88 (section: __ex_table) -> .LASF870 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d88 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d8c (section: __ex_table) -> .LASF872 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d8c references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d94 (section: __ex_table) -> .LASF874 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d94 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1d98 (section: __ex_table) -> .LASF876 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1d98 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da0 (section: __ex_table) -> .LASF878 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1da0 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1da4 (section: __ex_table) -> .LASF880 (section: .debug_line_str)
ERROR: modpost: __ex_table+0x1da4 references non-executable section '.debug_line_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e10 (section: __ex_table) -> .LLST170 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1e10 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e18 (section: __ex_table) -> .LASF1424 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e18 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e1c (section: __ex_table) -> .LASF1426 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e1c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e24 (section: __ex_table) -> .LASF1428 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e24 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e28 (section: __ex_table) -> .LASF1430 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e3c (section: __ex_table) -> .Lubsan_data80 (section: .data.rel.local..Lubsan_data80)
>> ERROR: modpost: __ex_table+0x1e3c references non-executable section '.data.rel.local..Lubsan_data80'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e54 (section: __ex_table) -> .Lubsan_data83 (section: .data.rel.local..Lubsan_data83)
>> ERROR: modpost: __ex_table+0x1e54 references non-executable section '.data.rel.local..Lubsan_data83'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e6c (section: __ex_table) -> .LC160 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1e6c references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e70 (section: __ex_table) -> .LC162 (section: .rodata.str1.4)
ERROR: modpost: __ex_table+0x1e70 references non-executable section '.rodata.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e84 (section: __ex_table) -> .LASF4965 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e90 (section: __ex_table) -> .LASF48 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e94 (section: __ex_table) -> .LASF50 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1e9c (section: __ex_table) -> .LASF52 (section: .debug_str)
ERROR: modpost: __ex_table+0x1e9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea0 (section: __ex_table) -> .LASF54 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ea8 (section: __ex_table) -> .LASF57 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ea8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eac (section: __ex_table) -> .LASF60 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb4 (section: __ex_table) -> .LASF59 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1eb8 (section: __ex_table) -> .LASF62 (section: .debug_str)
ERROR: modpost: __ex_table+0x1eb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec0 (section: __ex_table) -> .LASF3151 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ec4 (section: __ex_table) -> .LASF3153 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ec4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ecc (section: __ex_table) -> .LASF3155 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ecc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ed0 (section: __ex_table) -> .LASF3157 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ed0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ee4 (section: __ex_table) -> .L0  (section: .debug_frame)
ERROR: modpost: __ex_table+0x1ee4 references non-executable section '.debug_frame'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f14 (section: __ex_table) -> .LLST76 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f14 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f18 (section: __ex_table) -> .LLST77 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f18 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f20 (section: __ex_table) -> .LLST78 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f20 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f24 (section: __ex_table) -> .LLST79 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f24 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f2c (section: __ex_table) -> .LLST80 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f2c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f30 (section: __ex_table) -> .LLRL81 (section: .debug_rnglists)
ERROR: modpost: __ex_table+0x1f30 references non-executable section '.debug_rnglists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f38 (section: __ex_table) -> .LVUS82 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f38 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f44 (section: __ex_table) -> .LLST84 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f44 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f48 (section: __ex_table) -> .LLST85 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f48 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f50 (section: __ex_table) -> .LLST86 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f50 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f54 (section: __ex_table) -> .LLST87 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1f54 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f60 (section: __ex_table) -> .LASF4330 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f60 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f74 (section: __ex_table) -> .LASF150 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f78 (section: __ex_table) -> .LASF152 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f78 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f80 (section: __ex_table) -> .LASF154 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f80 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f84 (section: __ex_table) -> .LASF156 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f84 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f8c (section: __ex_table) -> .LASF158 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f8c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f90 (section: __ex_table) -> .LASF160 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f98 (section: __ex_table) -> .LASF162 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1f9c (section: __ex_table) -> .LASF164 (section: .debug_str)
ERROR: modpost: __ex_table+0x1f9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa4 (section: __ex_table) -> .LLST414 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1fa4 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fa8 (section: __ex_table) -> .LLST415 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1fa8 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fb0 (section: __ex_table) -> .LLST416 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1fb0 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe0 (section: __ex_table) -> .LASF3861 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fe4 (section: __ex_table) -> .LASF3863 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fe4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1fec (section: __ex_table) -> .LASF1694 (section: .debug_str)
ERROR: modpost: __ex_table+0x1fec references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff0 (section: __ex_table) -> .LASF1696 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ff8 (section: __ex_table) -> .LASF1698 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ff8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ffc (section: __ex_table) -> .LASF1700 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ffc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2004 (section: __ex_table) -> .LASF2548 (section: .debug_str)
ERROR: modpost: __ex_table+0x2004 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2008 (section: __ex_table) -> .LASF2550 (section: .debug_str)
ERROR: modpost: __ex_table+0x2008 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2010 (section: __ex_table) -> .LASF2552 (section: .debug_str)
ERROR: modpost: __ex_table+0x2010 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x2014 (section: __ex_table) -> .LASF2554 (section: .debug_str)
ERROR: modpost: __ex_table+0x2014 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x201c (section: __ex_table) -> .LASF2556 (section: .debug_str)
ERROR: modpost: __ex_table+0x201c references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
