Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05EA1D9340
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728316225; cv=none; b=sfDxnHPl4vFz2trMRTP77r4poR1BQdpdW/qarR09PWfDLAUThhuE04SQCfOHldZDPfQkCXq7id+VIfGwPzRVzvrzBjKng7RD6Pb+P43/pkJy96fUFaXKERf1KfwXUWcRAJ1gsy67O3n6RVa8Nli8isJ4jlNGdteYJxAJQLl3jtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728316225; c=relaxed/simple;
	bh=qML5pkxadoNVXdBJ5X/OIyBz8I3Rh1mFnP9bs/fG8nY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=njk6Bprs/oVq6bMONFGRVdF69ChAdQdvo69wflRvvyva95PfgbBrBVTAauhrjRlB5g8SnE9mRvUMv3q54tYBFnm3FpqrF9Nwtyo1aLgGMi6vVXGeedi+Rc7AIw30bjOQKK7FWjCMWqxIH+OPIPugn8WwpA7W3HedpxR5QGAoSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuf0xLZL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuf0xLZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E138EC4CECF;
	Mon,  7 Oct 2024 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728316224;
	bh=qML5pkxadoNVXdBJ5X/OIyBz8I3Rh1mFnP9bs/fG8nY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nuf0xLZLVBjmI45TNxIWsfPslO8ijInXjZaK9oSH7BFKHZ3xx26S+JP6RgklMW9RC
	 O5ZOEaqjwxXDHfQSK+BJdS225ubGrTLrutwVwOS86IWRkd1e6Wn/93jQ08rBxdKyUJ
	 un+i9GRIbyIuKUFTa4+l6N+nLrd0rkTT9BVkScExx95iBUG/vZePYQtbxbpacajHTr
	 XVbYtadPq5RwmRbEJvgydCFRNyANtn8mlKLOMP7VZ4qaqEJH2mlzgD4/3+xEK9LDSV
	 CvWlkKwAj++mE24AjVjvSf4KdR2dSTETLN2LxbjEDnq4+cLIEnCrAdW6gAkr+RTnpE
	 4lrxzka9bYZiA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kernel test robot <lkp@intel.com>,  Rajat Soni
 <quic_rajson@quicinc.com>,  <oe-kbuild-all@lists.linux.dev>,  Jeff Johnson
 <jjohnson@kernel.org>,  <ath12k@lists.infradead.org>,  Roopni Devanathan
 <quic_rdevanat@quicinc.com>
Subject: Re: [ath:pending 8/12]
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left
 shift count >= width of type
References: <202410040200.Mwb85JzQ-lkp@intel.com>
	<9db6842d-ddc6-4f0e-a818-c13298eedd8b@quicinc.com>
Date: Mon, 07 Oct 2024 18:50:21 +0300
In-Reply-To: <9db6842d-ddc6-4f0e-a818-c13298eedd8b@quicinc.com> (Jeff
	Johnson's message of "Mon, 7 Oct 2024 08:40:30 -0700")
Message-ID: <87iku352v6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/3/2024 11:37 AM, kernel test robot wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
>> head:   08dd5d93509f962500dc983864b4effb2600831a
>> commit: f6a46bc3719cc6b445cb071a7dd6968891ffb169 [8/12] wifi: ath12k: Support DMAC Reset Stats
>> config: i386-allmodconfig
>> (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com/
>> 
>> All warnings (new ones prefixed by >>):
>> 
>>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dmac_reset_stats_tlv':
>>>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]
>>     2515 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
>>          |                                                                             ^~
>>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2519:81:
>> warning: left shift count >= width of type [-Wshift-count-overflow]
>>     2519 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
>>          |                                                                                 ^~
>>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2523:78:
>> warning: left shift count >= width of type [-Wshift-count-overflow]
>>     2523 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
>>          |                                                                              ^~
>
> Out of curiosity is there a way to tell if this is a 32-bit build vs a 64-bit
> build? I just want to verify that the issue is that unsigned long is 32-bits
> and not that the shift occurs before the typecast

The config is i386-allmodconfig so it has to be 32-bit. The report also
includes link to the actual .config file.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
