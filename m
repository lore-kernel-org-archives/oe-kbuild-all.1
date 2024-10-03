Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8AF1AAE2B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980731; cv=none; b=Fc3E04FC0mIR6nFnxjDK0hsqk2d7v+8FSidjpIH8yYBEFWTXvvkshl62RVGhUJ1gi6qfG8j/xSsg/epeADPf7QCdU71cZaVLsNIE4KHk4Bwvu+A/xkPs5QNPWcQH/zPiCuUaRvFcEYWHU8Q4YoGPx5RLBuWBoqXh+AcXNBws3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980731; c=relaxed/simple;
	bh=GXZlm7Iex7FcxNs5TcQY2ZFjLwy8SauxSHbdkQuxXvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YP7IptNG9Y0qWFBRQpUVCaNYuEjS2PjRMZSfkUIFmAofmdUWXhrCaXEe0lvc8ooi+wHlummrCp+LOjIBOBXt/BMe0o8JdGZz5b9wp6hgsdcD28dCcllKSFhm4+E+7pEl7ZmUJT5+1q8Qfa3qrUpH1wk2Qd0zV4HiLFV0oTt25sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWe/rDj/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWe/rDj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727980730; x=1759516730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXZlm7Iex7FcxNs5TcQY2ZFjLwy8SauxSHbdkQuxXvM=;
  b=kWe/rDj/+R4XlXfYUko1L8skS5ucEyawrWQmbMpu7TeSA3KEdO2JKhWs
   YyC9CrfZdRU2HiBRTvk4tvplMLuOY5liLfPT2nyW1IC2QSPd7SY4cmT38
   IXCz8Z0b7IqijzmXOcbhOb5C4Db6a9LMY0OVyr3b6zEtXAw+Xh2dcxubk
   i7lkQyASQV7FzvVKvy/0MtV19HNhldrASQXVahV86Qq7eDz75/R8VxItL
   P9nTDyo77v8jC3rCyzc5tGeFvsD/M6JJtENUQQfTcWlHRN6Ip7dxc5hpb
   c0S3TrZNbiI4tbV8fBywCG/wAPAp7+6lKIMzmy6Pvw9J0uanussaAIuib
   Q==;
X-CSE-ConnectionGUID: sr/UOTvaTImbVJhdbbUbsg==
X-CSE-MsgGUID: T4YLp1yrS1iaGxPQXl3cfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44723897"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="44723897"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 11:38:48 -0700
X-CSE-ConnectionGUID: SnlFKVH6RfyCaqjrmtjuog==
X-CSE-MsgGUID: xut8bDtoSVKMsy4Fuoll2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111909309"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 11:38:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swQiq-0000mg-0F;
	Thu, 03 Oct 2024 18:38:44 +0000
Date: Fri, 4 Oct 2024 02:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rajat Soni <quic_rajson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>
Subject: [ath:pending 8/12]
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left
 shift count >= width of type
Message-ID: <202410040200.Mwb85JzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
head:   08dd5d93509f962500dc983864b4effb2600831a
commit: f6a46bc3719cc6b445cb071a7dd6968891ffb169 [8/12] wifi: ath12k: Support DMAC Reset Stats
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dmac_reset_stats_tlv':
>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]
    2515 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
         |                                                                             ^~
   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2519:81: warning: left shift count >= width of type [-Wshift-count-overflow]
    2519 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
         |                                                                                 ^~
   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2523:78: warning: left shift count >= width of type [-Wshift-count-overflow]
    2523 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
         |                                                                              ^~


vim +2515 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c

  2498	
  2499	static void
  2500	ath12k_htt_print_dmac_reset_stats_tlv(const void *tag_buf, u16 tag_len,
  2501					      struct debug_htt_stats_req *stats_req)
  2502	{
  2503		const struct ath12k_htt_dmac_reset_stats_tlv *htt_stats_buf = tag_buf;
  2504		u8 *buf = stats_req->buf;
  2505		u32 len = stats_req->buf_len;
  2506		u32 buf_len = ATH12K_HTT_STATS_BUF_SIZE;
  2507		unsigned long time;
  2508	
  2509		if (tag_len < sizeof(*htt_stats_buf))
  2510			return;
  2511	
  2512		len += scnprintf(buf + len, buf_len - len, "HTT_DMAC_RESET_STATS_TLV:\n");
  2513		len += scnprintf(buf + len, buf_len - len, "reset_count = %u\n",
  2514				 le32_to_cpu(htt_stats_buf->reset_count));
> 2515		time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
  2516			le32_to_cpu(htt_stats_buf->reset_time_lo_ms);
  2517		len += scnprintf(buf + len, buf_len - len, "reset_time_ms = %ld\n", time);
  2518	
  2519		time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
  2520			le32_to_cpu(htt_stats_buf->disengage_time_lo_ms);
  2521		len += scnprintf(buf + len, buf_len - len, "disengage_time_ms = %ld\n", time);
  2522	
  2523		time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
  2524			le32_to_cpu(htt_stats_buf->engage_time_lo_ms);
  2525		len += scnprintf(buf + len, buf_len - len, "engage_time_ms = %ld\n", time);
  2526	
  2527		len += scnprintf(buf + len, buf_len - len, "disengage_count = %u\n",
  2528				 le32_to_cpu(htt_stats_buf->disengage_count));
  2529		len += scnprintf(buf + len, buf_len - len, "engage_count = %u\n",
  2530				 le32_to_cpu(htt_stats_buf->engage_count));
  2531		len += scnprintf(buf + len, buf_len - len, "drain_dest_ring_mask = 0x%x\n\n",
  2532				 le32_to_cpu(htt_stats_buf->drain_dest_ring_mask));
  2533	
  2534		stats_req->buf_len = len;
  2535	}
  2536	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
