Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6E30594E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630693; cv=none; b=m4nVQZ5wMknjtoOA53pYc7Rc8kSNs/du5/AqgmW1PBjcnbh+81buw0e49HWKsI7Au1RzyGWzN+fyBQ2OpqJwp+QEAOPLqH6H7yhGXFxabFBpl/utTuT8oYLJAU78/QrKliF6Ft/+5V/2NFqanmNdZntY8B0TVd3wmEV0R8CNve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630693; c=relaxed/simple;
	bh=Ch4VQ0nXP3uSFLZekUnH52pH15kDGwnS0g+nlZgkFfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FChyCs4dV2BsUJbMjVFgmt9EBG7cWo7qQnivDjhbFlSx/GyOkj2lKZYPESRB0VDFzNtPsS+y6+EJ3OGEIZ/TP7u9JQdKzyhZVlCYu6xuLzpb6gY0QE7Bafcrg2A7Mhb74EnfA2IQ7mJ75o7SH7WgXs2ZqihAII7VFQcX+e9tsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOx6UYDu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOx6UYDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763630691; x=1795166691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ch4VQ0nXP3uSFLZekUnH52pH15kDGwnS0g+nlZgkFfU=;
  b=nOx6UYDuKExus/wg5XzX/qdWCPWB1nix2rpps4MpDvl9sc3ZJNexJizq
   JAQut33KTC69udpJ/hKuWBoGmjOVHwyngy6kMUn89Hr87pkARNjgnyDTz
   mvLff45TiEsNLvCsSSTozM0cTgoKMTwwItzE0IKa6CbPGUBjWNLm2/j5g
   PgttfI8O6YEPLX2Bu7MOHFr6JoTXVjwaDvTbk3nrqiNGDhwaUp1DN4zQE
   r8VOckjGKEn93JHWA+z/yE98983eUD2EjqBUAKmULC6kck7XIJDfPmCsD
   2kycwue45qWGTzE8dO/zXjxMn8bT1wAr7HC/baYTwGPK5ljEJjwfvPAU2
   Q==;
X-CSE-ConnectionGUID: iHNFIAJDQkO6LhRaB/sjSQ==
X-CSE-MsgGUID: 8rJnwJxnQralsoZ+2S13BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65572006"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65572006"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:24:50 -0800
X-CSE-ConnectionGUID: j4Fsqz4VQCagWRd1BFkHQA==
X-CSE-MsgGUID: y9W4T1ZFQHqVDj74ZvQMGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="221957865"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 01:24:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0uD-0003oJ-2y;
	Thu, 20 Nov 2025 09:24:45 +0000
Date: Thu, 20 Nov 2025 17:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [POC][RFC][PATCH 1/3] tracing: Add perf events
Message-ID: <202511201604.uyinorJA-lkp@intel.com>
References: <20251118003531.644484343@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118003531.644484343@kernel.org>

Hi Steven,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on next-20251119]
[cannot apply to linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Add-perf-events/20251118-083721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251118003531.644484343%40kernel.org
patch subject: [POC][RFC][PATCH 1/3] tracing: Add perf events
config: arc-randconfig-6001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201604.uyinorJA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201604.uyinorJA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201604.uyinorJA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_output.c: In function 'trace_perf_event_print':
>> kernel/trace/trace_output.c:1681:18: error: invalid use of undefined type 'struct perf_event_entry'
    1681 |  for (val = field->values; val < end; val++) {
         |                  ^~
   kernel/trace/trace_output.c:1682:19: error: invalid use of undefined type 'struct perf_event_entry'
    1682 |   if (val != field->values)
         |                   ^~
>> kernel/trace/trace_output.c:1684:11: error: implicit declaration of function 'PERF_TRACE_VALUE' [-Werror=implicit-function-declaration]
    1684 |   value = PERF_TRACE_VALUE(*val);
         |           ^~~~~~~~~~~~~~~~
>> kernel/trace/trace_output.c:1685:11: error: implicit declaration of function 'PERF_TRACE_TYPE' [-Werror=implicit-function-declaration]
    1685 |   switch (PERF_TRACE_TYPE(*val)) {
         |           ^~~~~~~~~~~~~~~
>> kernel/trace/trace_output.c:1686:8: error: 'PERF_TRACE_CYCLES' undeclared (first use in this function)
    1686 |   case PERF_TRACE_CYCLES:
         |        ^~~~~~~~~~~~~~~~~
   kernel/trace/trace_output.c:1686:8: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/trace/trace_output.c:1689:8: error: 'PERF_TRACE_CACHE' undeclared (first use in this function); did you mean 'PERF_TYPE_HW_CACHE'?
    1689 |   case PERF_TRACE_CACHE:
         |        ^~~~~~~~~~~~~~~~
         |        PERF_TYPE_HW_CACHE
   kernel/trace/trace_output.c: In function 'trace_perf_event_raw':
   kernel/trace/trace_output.c:1714:18: error: invalid use of undefined type 'struct perf_event_entry'
    1714 |  for (val = field->values; val < end; val++) {
         |                  ^~
   kernel/trace/trace_output.c:1715:19: error: invalid use of undefined type 'struct perf_event_entry'
    1715 |   if (val != field->values)
         |                   ^~
   cc1: some warnings being treated as errors


vim +1681 kernel/trace/trace_output.c

  1665	
  1666	static enum print_line_t
  1667	trace_perf_event_print(struct trace_iterator *iter, int flags,
  1668			       struct trace_event *event)
  1669	{
  1670		struct trace_entry *entry = iter->ent;
  1671		struct trace_seq *s = &iter->seq;
  1672		struct perf_event_entry *field;
  1673		u64 value;
  1674		u64 *val;
  1675		u64 *end;
  1676	
  1677		end = (u64 *)((long)iter->ent + iter->ent_size);
  1678	
  1679		trace_assign_type(field, entry);
  1680	
> 1681		for (val = field->values; val < end; val++) {
  1682			if (val != field->values)
  1683				trace_seq_putc(s, ' ');
> 1684			value = PERF_TRACE_VALUE(*val);
> 1685			switch (PERF_TRACE_TYPE(*val)) {
> 1686			case PERF_TRACE_CYCLES:
  1687				trace_seq_printf(s, "cpu_cycles: %lld", value);
  1688				break;
> 1689			case PERF_TRACE_CACHE:
  1690				trace_seq_printf(s, "cache_misses: %lld", value);
  1691				break;
  1692			default:
  1693				trace_seq_printf(s, "unkown(%d): %lld",
  1694						 (int)PERF_TRACE_TYPE(*val), value);
  1695			}
  1696		}
  1697		trace_seq_putc(s, '\n');
  1698		return trace_handle_return(s);
  1699	}
  1700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
