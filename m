Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2C1397
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178424; cv=none; b=Q6DCwp2E6lFz1HUlRPncbxn2y02o1kyiHR97RZ0wIT44Gdq6Eo9FwgoIfztaPHewDUNQX4EJ3y0SaJCL0pirmmejvMm2SlWZ765RIQgnjAhaYvsLzYka1rr4NZeceKuzAa0N+Jm9Aj/+pIDoSE2yzwkkWDHLZWQ/1sK7Qk1j0sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178424; c=relaxed/simple;
	bh=9w5sTkI9SgjuiL483Sau3+HW1QvPUd6XWs+3CPgO98g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A1u18a2ggduVJGd0w1QFdPGmNvAyz+K2lf3khw6D3nZS5N1TXhTFov/LXsyu3hufvx7o9GrPcLJuAG+QgN+JoH/GlW1GJmrEObHnEkPDSThmWDg876e5MefzKwdtiHSPVuobSlv5xv19o5XZiX9OHt4iKf7DnLvnhSfS0iEzDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9PP77mv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9PP77mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772178422; x=1803714422;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9w5sTkI9SgjuiL483Sau3+HW1QvPUd6XWs+3CPgO98g=;
  b=T9PP77mvikUncl6xMEJPUiYRSrJbpR5y51qTy2U4LenlJY5YcpKsoyTO
   vwIlQWrdb33jDHz+OVHe7uiqb3uJrjwhI12PT7m+d/czHVsaOKTfFe/7p
   R6MnW53zDwcWgyYxiFI3POea6YGxlUUL3AzlenEyjUjesl07fMM+ORoHI
   egth/f8o7rBItQJ/ute9sc1tGy5R5CNdjawvR259L6WdvorfS+1AuWg5u
   VK26W8MLyDOPFF8BXFafUyRU6yZfgPEL+ePoEYEflpdA31MFQ4TVwzhWu
   9KQPO9liYzAT9xPoBO6XLLmNXaxH2UacLSVogP+GSUvLeQ91QS8Jk2bE7
   w==;
X-CSE-ConnectionGUID: 6l8CUt2GRjWCdTh7Cxld5w==
X-CSE-MsgGUID: z9anRa30TCiULMAsD2Jw4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73166401"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73166401"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:47:01 -0800
X-CSE-ConnectionGUID: uxL8rY9sRjS0xUJt01Kdpg==
X-CSE-MsgGUID: P3zNthVCSNmj8e7M9OG3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216057720"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.241.147]) ([10.124.241.147])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:47:00 -0800
Message-ID: <3a1aba2c-6f64-43fb-85c2-c10c8161fb91@linux.intel.com>
Date: Fri, 27 Feb 2026 15:46:57 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [acrn:6.17/linux 51/3102] arch/x86/events/intel/ds.c:2881:24:
 warning: cast from pointer to integer of different size
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Lili Li <lili.li@intel.com>
References: <202602271552.8NPMraId-lkp@intel.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <202602271552.8NPMraId-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This warning has been fixed in upstream tree and It seems the acrn kernel
still uses the old patches. Thanks.

On 2/27/2026 3:39 PM, kernel test robot wrote:
> Hi Dapeng,
>
> FYI, the error/warning still remains.
>
> tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
> head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
> commit: 67977912bebfec14bf4c0ced6c01df309725fc8d [51/3102] perf/x86/intel: Process arch-PEBS records or record fragments
> config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260227/202602271552.8NPMraId-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271552.8NPMraId-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602271552.8NPMraId-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
>>> arch/x86/events/intel/ds.c:2881:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>     2881 |         top = (void *)((u64)cpuc->ds_pebs_vaddr +
>          |                        ^
>>> arch/x86/events/intel/ds.c:2881:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>     2881 |         top = (void *)((u64)cpuc->ds_pebs_vaddr +
>          |               ^
>
>
> vim +2881 arch/x86/events/intel/ds.c
>
>   2860	
>   2861	static void intel_pmu_drain_arch_pebs(struct pt_regs *iregs,
>   2862					      struct perf_sample_data *data)
>   2863	{
>   2864		short counts[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS] = {};
>   2865		void *last[INTEL_PMC_IDX_FIXED + MAX_FIXED_PEBS_EVENTS];
>   2866		struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
>   2867		union arch_pebs_index index;
>   2868		struct x86_perf_regs perf_regs;
>   2869		struct pt_regs *regs = &perf_regs.regs;
>   2870		void *base, *at, *top;
>   2871		u64 mask;
>   2872	
>   2873		rdmsrq(MSR_IA32_PEBS_INDEX, index.full);
>   2874	
>   2875		if (unlikely(!index.split.wr)) {
>   2876			intel_pmu_pebs_event_update_no_drain(cpuc, X86_PMC_IDX_MAX);
>   2877			return;
>   2878		}
>   2879	
>   2880		base = cpuc->ds_pebs_vaddr;
>> 2881		top = (void *)((u64)cpuc->ds_pebs_vaddr +
>   2882			       (index.split.wr << ARCH_PEBS_INDEX_WR_SHIFT));
>   2883	
>   2884		mask = hybrid(cpuc->pmu, arch_pebs_cap).counters & cpuc->pebs_enabled;
>   2885	
>   2886		if (!iregs)
>   2887			iregs = &dummy_iregs;
>   2888	
>   2889		/* Process all but the last event for each counter. */
>   2890		for (at = base; at < top;) {
>   2891			struct arch_pebs_header *header;
>   2892			struct arch_pebs_basic *basic;
>   2893			u64 pebs_status;
>   2894	
>   2895			header = at;
>   2896	
>   2897			if (WARN_ON_ONCE(!header->size))
>   2898				break;
>   2899	
>   2900			/* 1st fragment or single record must have basic group */
>   2901			if (!header->basic) {
>   2902				at += header->size;
>   2903				continue;
>   2904			}
>   2905	
>   2906			basic = at + sizeof(struct arch_pebs_header);
>   2907			pebs_status = mask & basic->applicable_counters;
>   2908			__intel_pmu_handle_pebs_record(iregs, regs, data, at,
>   2909						       pebs_status, counts, last,
>   2910						       setup_arch_pebs_sample_data);
>   2911	
>   2912			/* Skip non-last fragments */
>   2913			while (arch_pebs_record_continued(header)) {
>   2914				if (!header->size)
>   2915					break;
>   2916				at += header->size;
>   2917				header = at;
>   2918			}
>   2919	
>   2920			/* Skip last fragment or the single record */
>   2921			at += header->size;
>   2922		}
>   2923	
>   2924		__intel_pmu_handle_last_pebs_record(iregs, regs, data, mask, counts,
>   2925						    last, setup_arch_pebs_sample_data);
>   2926	
>   2927		index.split.wr = 0;
>   2928		index.split.full = 0;
>   2929		wrmsrq(MSR_IA32_PEBS_INDEX, index.full);
>   2930	}
>   2931	
>
