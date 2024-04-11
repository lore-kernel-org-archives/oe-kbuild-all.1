Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BB1422D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712826200; cv=none; b=mUS+EyyhIX6u9PDcdL/HeTMC3nLlgeLViDBuemFf6lzwq8uH3Ujlk2zHR1mxEK1QgD1ziDTz/3EPkJG1oGhHsu49O8cSPg6ghF8osmcK2Q3uiBdosxu7HdE7hlGjIRdjjarpGdx1pzK4iyBwKiJ4q+8ZZrQXiV2PNTP13ZwTaAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712826200; c=relaxed/simple;
	bh=K5XXdkw8SD2rYAWX35WV1Fobd/3jfVdf6jIKOjs1Lts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPFkxJ3GzQ1RCwJvTXpgoaIrKkEgWnLarcgCdSBVpaG/VJqRdCAWpX9o4bGwCd1llKv+og3Xaex1b1lAYumlSrBSAcIqDSJu8McwQ6FTUI3cuVbv17XljeBIGgvCKy7cSS1V7pfMyzsVT0uhcgk/1ST5uTPC+Zz+Gd6p/8t3m4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BY3Rw20B; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BY3Rw20B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712826199; x=1744362199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5XXdkw8SD2rYAWX35WV1Fobd/3jfVdf6jIKOjs1Lts=;
  b=BY3Rw20B8DN2vqsm0PuzsoVL0D/EhnkrX+3j9KtdoyFZ994P8kytQnwh
   +Kl9BD/PimD3m3EBTIEXyLPcXKr/rO0mweT1CyJV+3ZN5mQXuoOd5eGiD
   j1IED9V/twNGvzxUv8uDenyHNfIyjDZ+3Y4nLtTUGnYj+hl2P9zCI+8pH
   gEaUhL/xoAxDy/HFGM1z2AT7tkOkNxhHkCdJlvC1D/c0yGqF5s8pZVOEi
   xZ2VFnlJIgSfuxcSzU7zM8iq/SQ/F62Prr4kj1MUV8kWGPdYzPJx/ohGu
   qkNQhNE+P03p3loXRcaimlNtKMYVP+IYprfNK/cbWNoTtEBt2xNKIcaqu
   w==;
X-CSE-ConnectionGUID: r3u9d0QyRoOFNR/H/HISGg==
X-CSE-MsgGUID: WE82f5mQRx6ymxyn5jd+fw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12004442"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12004442"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:03:18 -0700
X-CSE-ConnectionGUID: kFKPLnOfTXSmM1ePzLLTuw==
X-CSE-MsgGUID: fWt8KrTTQquucyvz2wQHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="58264833"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2024 02:03:18 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruqKw-0008Rp-2i;
	Thu, 11 Apr 2024 09:03:14 +0000
Date: Thu, 11 Apr 2024 17:02:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 19/19]
 kernel/trace/trace_output.c:1015:64: error: 'struct trace_array' has no
 member named 'text_delta'
Message-ID: <202404111633.kfX4NO5n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   26231feef0abf43a00e0ea834d7e0df0c017be2f
commit: 26231feef0abf43a00e0ea834d7e0df0c017be2f [19/19] tracing: Update function tracing output for previous boot buffer
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111633.kfX4NO5n-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111633.kfX4NO5n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111633.kfX4NO5n-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_output.c: In function 'trace_fn_trace':
>> kernel/trace/trace_output.c:1015:64: error: 'struct trace_array' has no member named 'text_delta'
    1015 |         print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, flags);
         |                                                                ^~
   kernel/trace/trace_output.c: In function 'trace_func_repeats_print':
   kernel/trace/trace_output.c:1680:64: error: 'struct trace_array' has no member named 'text_delta'
    1680 |         print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, flags);
         |                                                                ^~


vim +1015 kernel/trace/trace_output.c

  1005	
  1006	/* TRACE_FN */
  1007	static enum print_line_t trace_fn_trace(struct trace_iterator *iter, int flags,
  1008						struct trace_event *event)
  1009	{
  1010		struct ftrace_entry *field;
  1011		struct trace_seq *s = &iter->seq;
  1012	
  1013		trace_assign_type(field, iter->ent);
  1014	
> 1015		print_fn_trace(s, field->ip, field->parent_ip, iter->tr->text_delta, flags);
  1016		trace_seq_putc(s, '\n');
  1017	
  1018		return trace_handle_return(s);
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
