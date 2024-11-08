Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FCF1E5713
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731061982; cv=none; b=FJOZ4w+fa88zSOwsAqaXYsA/JlixGu8IBUSww/DtIr02kycuDQDESEtCzzLue9XLeRt4e9Q7rfDayhxlGNr6yYUUbehN65D1520kBx+M1Ai3IsONbEix3Yu6UCKhhwlx7SmGh/nAuwgpkTRS5GpXuCSK/QRHRkTLAT+MA8k3I1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731061982; c=relaxed/simple;
	bh=kWzMq+mQIBVzpnhWxF/FGM+XcSzgelMD7JdsBun0KCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgQcJuqjyukFrSWDoqOiBjvJXoveeioPlWsuzDfFWcFPQ6m9HkFjUicoPXgNmSfvuhhAtKIg7y/ruHxgPNGxJAQ3ONaKJ5ClkSqQjs7BOra0pEoEI5KfiXrVsx9dcE0qL6EsTGzCV3wx2qBTIEss+uRmuL7Uhw8a7ZSvWRZ/yl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiqyqE0d; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiqyqE0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731061980; x=1762597980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kWzMq+mQIBVzpnhWxF/FGM+XcSzgelMD7JdsBun0KCE=;
  b=DiqyqE0d11rshoWaQ09Hw9JCkBs9evA5pzxEOCMh771n3Qn6yU6oFojb
   A+9JFzMeehtzn1O+zEpZDsvCdvOEEvm8pLejO0NPp+Oy0fGfrJcDBn020
   DwivMX3feyYBI6qaoZ/88rvra4MuDnv020n0Iz2wmyTWBixQ2eaSCrqM7
   AnWAUBaJIhtwTxVyVf1HZY0QqbYlV+5Y+zAgeBv1pXhaAGxUDsXsfz9hd
   unLoYFcazh0RtvasuCIWjPwFkKW+B1d2zkxbT9D7XOmWxZKf+lsgUfCOC
   4vvFXwjQj2RyW4Esc+nRRSQ47L7000PDCgpQtOiqgZrnw60uDqU830hEJ
   g==;
X-CSE-ConnectionGUID: 30wQeKbuQvm1iVsZM1QcFQ==
X-CSE-MsgGUID: XZxnwKCpRGCfSgYCqAiVYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53501345"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53501345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 02:33:00 -0800
X-CSE-ConnectionGUID: kbBJjTLmRp6fzz+Qel9YXw==
X-CSE-MsgGUID: XDLIJ6gJRwabFtdb/xAMPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90142568"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2024 02:32:59 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9MIT-000rKC-0Y;
	Fri, 08 Nov 2024 10:32:57 +0000
Date: Fri, 8 Nov 2024 18:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/4] wifi: ath12k: Support Downlink Pager Stats
Message-ID: <202411081807.5xCRctRm-lkp@intel.com>
References: <20241106044548.3530128-2-quic_rdevanat@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106044548.3530128-2-quic_rdevanat@quicinc.com>

Hi Roopni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d63fbff74ab1af1573c1dca20cfe1e876f8ffa62]

url:    https://github.com/intel-lab-lkp/linux/commits/Roopni-Devanathan/wifi-ath12k-Support-Downlink-Pager-Stats/20241106-124653
base:   d63fbff74ab1af1573c1dca20cfe1e876f8ffa62
patch link:    https://lore.kernel.org/r/20241106044548.3530128-2-quic_rdevanat%40quicinc.com
patch subject: [PATCH v4 1/4] wifi: ath12k: Support Downlink Pager Stats
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241108/202411081807.5xCRctRm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081807.5xCRctRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081807.5xCRctRm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dlpager_entry':
>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2549:13: warning: variable 'ts_hi' set but not used [-Wunused-but-set-variable]
    2549 |         u32 ts_hi;
         |             ^~~~~
>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2548:13: warning: variable 'ts_lo' set but not used [-Wunused-but-set-variable]
    2548 |         u32 ts_lo;
         |             ^~~~~


vim +/ts_hi +2549 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c

  2544	
  2545	static void ath12k_htt_print_dlpager_entry(const struct ath12k_htt_pgs_info *pg_info,
  2546						   int idx, char *str_buf)
  2547	{
> 2548		u32 ts_lo;
> 2549		u32 ts_hi;
  2550		u64 page_timestamp;
  2551		u16 index = 0;
  2552	
  2553		ts_lo = le32_to_cpu(pg_info->ts_lsb);
  2554		ts_hi = le32_to_cpu(pg_info->ts_msb);
  2555		page_timestamp = ath12k_le32hilo_to_u64(pg_info->ts_msb, pg_info->ts_lsb);
  2556	
  2557		index += snprintf(&str_buf[index], ATH12K_HTT_MAX_STRING_LEN - index,
  2558				  "Index - %u ; Page Number - %u ; ",
  2559				  idx, le32_to_cpu(pg_info->page_num));
  2560		index += snprintf(&str_buf[index], ATH12K_HTT_MAX_STRING_LEN - index,
  2561				  "Num of pages - %u ; Timestamp - %lluus\n",
  2562				  le32_to_cpu(pg_info->num_pgs), page_timestamp);
  2563	}
  2564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
