Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD73BBF2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 01:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756948224; cv=none; b=n3uU4Omo/h6uhorGW5p7nwlIxJA1AwPqpMdkMNHKcQqlmBdnxiA/o+pZQOM+M7azGZB0RgAhVrmuetO/TuNEa3msgTTmPr9cqyxIierT7VreobJfxDu5NSH2Wp+L+aKqqug7HxrMgHhT0dnlxx9YBLtO5H63g2LN7mFG0T+r5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756948224; c=relaxed/simple;
	bh=6FCBhKYb3NrgCsIyfOKKeiM9X6/CtL039joG2SkW/CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjhFUJc3rq9i2c4XON+i5w9fza0poqwpmV/Li5XoJ+wAPpIfxfzQLZaNao30WmGXNGdusFY/4uqvzps6GvWlsaXKpyiZsxq4ER98RZEj4LcZlgNbaiQ9EUTkkLZAG0TTEJF6DEAUrOY2bBoV+FzuXd2H0I8TBkvH8hgxMt2zX0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICgXveb4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICgXveb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756948222; x=1788484222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6FCBhKYb3NrgCsIyfOKKeiM9X6/CtL039joG2SkW/CA=;
  b=ICgXveb40PpPzWqY/xQy4IG6ZIcHhT7nXf7hp5DW3URf1jCd8AETczLE
   hTzGnW9igrLLiSd3x2C9EJfom8OUPpSXigwNhK/SbYy86DDq3WlfV0Tvk
   +sj79uflDTAimhqRCfn3COcCIMbjLAZA5I9IW3E2+Cdgu3lZ/n9KEpk22
   Ve+CDLGav0Ksuud53iBrlmwmxKY+tDngkjtqlLHEhg/zKjXqLhz/XfjXE
   0gLRvwcgtx3OO7wOcIAWs9gAD7+4qkZJVzZE4Ij1YnWk7JidKreJ5ucKp
   35z6HQDNLBH2vFB9BHCQMHHuRAaVZqa3QXd/6g8auewvSpxZQ6ZBUuzOP
   g==;
X-CSE-ConnectionGUID: KCJXIRG2QgWXiZNIokQ8WA==
X-CSE-MsgGUID: hcLJvZnISgudpe+WXpGzxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84704073"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="84704073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:10:21 -0700
X-CSE-ConnectionGUID: VO53nFOqQF2CS2IBQ7WIiA==
X-CSE-MsgGUID: FNpHHKv6TdKjiPKAw1N0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="171677908"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Sep 2025 18:10:20 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utyUU-0004ZT-0I;
	Thu, 04 Sep 2025 01:10:18 +0000
Date: Thu, 4 Sep 2025 09:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 1/1] include/ras/ras_event.h:219:undefined
 reference to `__tracepoint_non_standard_event'
Message-ID: <202509040857.ezl0YsOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/dd/ddf894ce18acd9a4ec8cc41a8f041706feda1eeb-first_error_kconfig --flag create-dir

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   ddf894ce18acd9a4ec8cc41a8f041706feda1eeb
commit: ddf894ce18acd9a4ec8cc41a8f041706feda1eeb [1/1] APEI: GHES: Replace log_non_standard_event with direct tracepoint call
config: x86_64-buildonly-randconfig-004-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040857.ezl0YsOZ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040857.ezl0YsOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040857.ezl0YsOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23:(.text+0x1442ae8): undefined reference to `__tracepoint_non_standard_event'
>> ld: arch/x86/include/asm/atomic.h:23:(.text+0x1442af3): undefined reference to `__tracepoint_non_standard_event'
   ld: vmlinux.o: in function `__do_trace_non_standard_event':
>> include/ras/ras_event.h:219:(.text+0x1442b91): undefined reference to `__tracepoint_non_standard_event'
>> ld: include/ras/ras_event.h:219:(.text+0x1442b9d): undefined reference to `__tracepoint_non_standard_event'
>> ld: include/ras/ras_event.h:219:(.text+0x1442bec): undefined reference to `__SCT__tp_func_non_standard_event'
>> ld: vmlinux.o:(.static_call_sites+0x4184): undefined reference to `__SCK__tp_func_non_standard_event'


vim +219 include/ras/ras_event.h

e9279e83ad1f4b5 Tyler Baicar            2017-06-21  209  
297b64c74385fc7 Tyler Baicar            2017-06-21  210  /*
297b64c74385fc7 Tyler Baicar            2017-06-21  211   * Non-Standard Section Report
297b64c74385fc7 Tyler Baicar            2017-06-21  212   *
297b64c74385fc7 Tyler Baicar            2017-06-21  213   * This event is generated when hardware detected a hardware
297b64c74385fc7 Tyler Baicar            2017-06-21  214   * error event, which may be of non-standard section as defined
297b64c74385fc7 Tyler Baicar            2017-06-21  215   * in UEFI spec appendix "Common Platform Error Record", or may
297b64c74385fc7 Tyler Baicar            2017-06-21  216   * be of sections for which TRACE_EVENT is not defined.
297b64c74385fc7 Tyler Baicar            2017-06-21  217   *
297b64c74385fc7 Tyler Baicar            2017-06-21  218   */
297b64c74385fc7 Tyler Baicar            2017-06-21 @219  TRACE_EVENT(non_standard_event,
297b64c74385fc7 Tyler Baicar            2017-06-21  220  
9359a8cbcc77d4a Andy Shevchenko         2019-01-25  221  	TP_PROTO(const guid_t *sec_type,
9359a8cbcc77d4a Andy Shevchenko         2019-01-25  222  		 const guid_t *fru_id,
297b64c74385fc7 Tyler Baicar            2017-06-21  223  		 const char *fru_text,
297b64c74385fc7 Tyler Baicar            2017-06-21  224  		 const u8 sev,
297b64c74385fc7 Tyler Baicar            2017-06-21  225  		 const u8 *err,
297b64c74385fc7 Tyler Baicar            2017-06-21  226  		 const u32 len),
297b64c74385fc7 Tyler Baicar            2017-06-21  227  
297b64c74385fc7 Tyler Baicar            2017-06-21  228  	TP_ARGS(sec_type, fru_id, fru_text, sev, err, len),
297b64c74385fc7 Tyler Baicar            2017-06-21  229  
297b64c74385fc7 Tyler Baicar            2017-06-21  230  	TP_STRUCT__entry(
297b64c74385fc7 Tyler Baicar            2017-06-21  231  		__array(char, sec_type, UUID_SIZE)
297b64c74385fc7 Tyler Baicar            2017-06-21  232  		__array(char, fru_id, UUID_SIZE)
297b64c74385fc7 Tyler Baicar            2017-06-21  233  		__string(fru_text, fru_text)
297b64c74385fc7 Tyler Baicar            2017-06-21  234  		__field(u8, sev)
297b64c74385fc7 Tyler Baicar            2017-06-21  235  		__field(u32, len)
297b64c74385fc7 Tyler Baicar            2017-06-21  236  		__dynamic_array(u8, buf, len)
297b64c74385fc7 Tyler Baicar            2017-06-21  237  	),
297b64c74385fc7 Tyler Baicar            2017-06-21  238  
297b64c74385fc7 Tyler Baicar            2017-06-21  239  	TP_fast_assign(
297b64c74385fc7 Tyler Baicar            2017-06-21  240  		memcpy(__entry->sec_type, sec_type, UUID_SIZE);
297b64c74385fc7 Tyler Baicar            2017-06-21  241  		memcpy(__entry->fru_id, fru_id, UUID_SIZE);
2c92ca849fcc6ee Steven Rostedt (Google  2024-05-16  242) 		__assign_str(fru_text);
297b64c74385fc7 Tyler Baicar            2017-06-21  243  		__entry->sev = sev;
297b64c74385fc7 Tyler Baicar            2017-06-21  244  		__entry->len = len;
297b64c74385fc7 Tyler Baicar            2017-06-21  245  		memcpy(__get_dynamic_array(buf), err, len);
297b64c74385fc7 Tyler Baicar            2017-06-21  246  	),
297b64c74385fc7 Tyler Baicar            2017-06-21  247  
297b64c74385fc7 Tyler Baicar            2017-06-21  248  	TP_printk("severity: %d; sec type:%pU; FRU: %pU %s; data len:%d; raw data:%s",
297b64c74385fc7 Tyler Baicar            2017-06-21  249  		  __entry->sev, __entry->sec_type,
297b64c74385fc7 Tyler Baicar            2017-06-21  250  		  __entry->fru_id, __get_str(fru_text),
297b64c74385fc7 Tyler Baicar            2017-06-21  251  		  __entry->len,
297b64c74385fc7 Tyler Baicar            2017-06-21  252  		  __print_hex(__get_dynamic_array(buf), __entry->len))
297b64c74385fc7 Tyler Baicar            2017-06-21  253  );
297b64c74385fc7 Tyler Baicar            2017-06-21  254  

:::::: The code at line 219 was first introduced by commit
:::::: 297b64c74385fc7ea5dfff66105ab6465f2df49a ras: acpi / apei: generate trace event for unrecognized CPER section

:::::: TO: Tyler Baicar <tbaicar@codeaurora.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
