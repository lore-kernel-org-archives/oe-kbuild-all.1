Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D37E28D82F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197108; cv=none; b=YN7mi0I+BT01oYxtKKdVOHX9/M5BUWNNbOUO7EXfR9iZ+YloCqmLT81V+Ns+NW1MunGFR80X3wSvBiD3zz80TkQJJ0fNu4+EHEDZTr5K2bwEjEDyZ6vOeqYWGQFG9EUakndq75QxriEUFuSwLMvk/hPUmS+7P8AlcIEjiezG1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197108; c=relaxed/simple;
	bh=uAFFKmQa//fs0+LMWVv9EZobeYoKu1dW4TUYnhTtYRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQVDcswfn3+0K7rU3+a83PX+lV48PusC6cs8AZXx8A+PwDdTcBcPBWpOYfnqdqayAbdumxiIbhVPu/XEHhsjfUhek0gm0s2VdRmGwkjWdVojSCXVrIGv8X+WU3mikY/GZAwhCQnrQpmlbQnHikk3qYmsYLplfBFQo+giZ9niH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rm9Y7UK2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rm9Y7UK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765197107; x=1796733107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uAFFKmQa//fs0+LMWVv9EZobeYoKu1dW4TUYnhTtYRw=;
  b=Rm9Y7UK2tVmJCYWB+AuoZV3OTbNBHS5Q+JxI7Q1uPkahM/hJHFjBAybB
   o/d8hiA8BEVmZX2UmTiur+9aUXnCPt2VUlabOFcsdMobfcgzcheCngbMs
   NHRgYi0AgeQ3CNK3ELB5jXo6NP2RLKtCIKZSS+kaLFahhBe42ak0egTKc
   pd3AjWj7gSgWFmYgULeqd0x0BhoMjWQfu0nwYqSCW21RgUI0vkHhlPUbY
   1Rz3oBZ+XY47UEqHYTnfz6jErVmM1Mbr4kheE8Hhf8sdeIKM3Y+BAQKHD
   b+/qDZm9nekV3jitzrFtEEJhbIK5upRo4t9YWu41RNs64UWt/BdAj+40k
   g==;
X-CSE-ConnectionGUID: ex6I/8m7TT24l0DfMSyF8A==
X-CSE-MsgGUID: L5yD2IbZScWpnLKuK5fXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="66320013"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="66320013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 04:31:46 -0800
X-CSE-ConnectionGUID: TsbW/6nBSeKci9rVDfSzXg==
X-CSE-MsgGUID: la/RKgQ/SMGbuUqe3hyydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196388981"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2025 04:31:45 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSaP0-0000000005d-2yQS;
	Mon, 08 Dec 2025 12:31:42 +0000
Date: Mon, 8 Dec 2025 13:30:51 +0100
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>, Kees Cook <kees@kernel.org>
Subject: kernel/bpf/helpers.c:1065:53: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 3, 0)' attribute to the declaration
 of '____bpf_snprintf'
Message-ID: <202512081321.2h9ThWTg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 7bf819aa992faee980610e9021aec0c38aac53be vsnprintf: Mark binary printing functions with __printf() attribute
date:   9 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251208/202512081321.2h9ThWTg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2222cfe7e11ff3e0434bc696856629199ef0da7c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081321.2h9ThWTg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081321.2h9ThWTg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:1065:53: warning: diagnostic behavior may be improved by adding the 'format(printf, 3, 0)' attribute to the declaration of '____bpf_snprintf' [-Wmissing-format-attribute]
    1045 |         err = bstr_printf(str, str_size, fmt, data.bin_args);
         |                                                            ^
   kernel/bpf/helpers.c:1045:1: note: '____bpf_snprintf' declared here
    1045 | BPF_CALL_5(bpf_snprintf, char *, str, u32, str_size, char *, fmt,
         | ^
   ./include/linux/filter.h:613:31: note: expanded from macro 'BPF_CALL_5'
     613 | #define BPF_CALL_5(name, ...)   BPF_CALL_x(5, __NOATTR, name, __VA_ARGS__)
         |                                 ^
   ./include/linux/filter.h:597:6: note: expanded from macro 'BPF_CALL_x'
     597 |         u64 ____##name(__BPF_MAP(x, __BPF_DECL_ARGS, __BPF_V, __VA_ARGS__));   \
         |             ^
   <scratch space>:194:1: note: expanded from here
     194 | ____bpf_snprintf
         | ^
   1 warning generated.


vim +1065 kernel/bpf/helpers.c

d9c9e4db186ab4 Florent Revest  2021-04-19  1044  
7b15523a989b63 Florent Revest  2021-04-19  1045  BPF_CALL_5(bpf_snprintf, char *, str, u32, str_size, char *, fmt,
78aa1cc9404399 Jiri Olsa       2022-12-15  1046  	   const void *, args, u32, data_len)
7b15523a989b63 Florent Revest  2021-04-19  1047  {
78aa1cc9404399 Jiri Olsa       2022-12-15  1048  	struct bpf_bprintf_data data = {
78aa1cc9404399 Jiri Olsa       2022-12-15  1049  		.get_bin_args	= true,
78aa1cc9404399 Jiri Olsa       2022-12-15  1050  	};
7b15523a989b63 Florent Revest  2021-04-19  1051  	int err, num_args;
7b15523a989b63 Florent Revest  2021-04-19  1052  
335ff4990cf3bf Dave Marchevsky 2021-09-17  1053  	if (data_len % 8 || data_len > MAX_BPRINTF_VARARGS * 8 ||
78aa1cc9404399 Jiri Olsa       2022-12-15  1054  	    (data_len && !args))
7b15523a989b63 Florent Revest  2021-04-19  1055  		return -EINVAL;
7b15523a989b63 Florent Revest  2021-04-19  1056  	num_args = data_len / 8;
7b15523a989b63 Florent Revest  2021-04-19  1057  
7b15523a989b63 Florent Revest  2021-04-19  1058  	/* ARG_PTR_TO_CONST_STR guarantees that fmt is zero-terminated so we
7b15523a989b63 Florent Revest  2021-04-19  1059  	 * can safely give an unbounded size.
7b15523a989b63 Florent Revest  2021-04-19  1060  	 */
78aa1cc9404399 Jiri Olsa       2022-12-15  1061  	err = bpf_bprintf_prepare(fmt, UINT_MAX, args, num_args, &data);
7b15523a989b63 Florent Revest  2021-04-19  1062  	if (err < 0)
7b15523a989b63 Florent Revest  2021-04-19  1063  		return err;
7b15523a989b63 Florent Revest  2021-04-19  1064  
78aa1cc9404399 Jiri Olsa       2022-12-15 @1065  	err = bstr_printf(str, str_size, fmt, data.bin_args);
48cac3f4a96ddf Florent Revest  2021-04-27  1066  
f19a4050455aad Jiri Olsa       2022-12-15  1067  	bpf_bprintf_cleanup(&data);
7b15523a989b63 Florent Revest  2021-04-19  1068  
7b15523a989b63 Florent Revest  2021-04-19  1069  	return err + 1;
7b15523a989b63 Florent Revest  2021-04-19  1070  }
7b15523a989b63 Florent Revest  2021-04-19  1071  

:::::: The code at line 1065 was first introduced by commit
:::::: 78aa1cc9404399a15d2a1205329c6a06236f5378 bpf: Add struct for bin_args arg in bpf_bprintf_prepare

:::::: TO: Jiri Olsa <jolsa@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
