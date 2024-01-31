Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8E4F5F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706704555; cv=none; b=geZBAfibl1myugm7Mjme2R2xewqfQbPn4Y6YFXHQXnZoqmvHj8YrIC0Jpj78tYLTaP7f152LXWHG63lNgfbSaWO8r/2aB0HOMPxqRcjiCYIIitiMmY+ksAMJzK85DRQ4UYPz+SwrAORyh0Q27gWuAZU16qdp1aXYKaKHz+XnoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706704555; c=relaxed/simple;
	bh=xytjf0LR9arNjEEtHDXL4gqkOjsL5qAoCsPZDkHX/0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=rOP9wvzSo8kmQiNeu6w1OaVWcNMOEKWcyxlJFa72KgYGySXif/24gfzewX9zlJD7YSx44NT6JI18uahnFyQ41R0flKn3aQgTRdKdPNzcAgBI73q43hw1C9zndHKDCcEOVukWLtbn8/GUNT33K39GXdXr50GvZcOx5sQVsVGrvyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMVf+7zV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMVf+7zV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687C7C433C7;
	Wed, 31 Jan 2024 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706704554;
	bh=xytjf0LR9arNjEEtHDXL4gqkOjsL5qAoCsPZDkHX/0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fMVf+7zVGsr/DBv1OboE6VWvpdMnoe8oYdU80Etv6O9zjNPISOJh/p5PCEXl5vfx9
	 YiiBkxkTtQVw9Pkp41gx1X9ZErP3iXPtz+lgErReeIs2430Ef/rWkx+34O3kpwRyiw
	 sqOV2oSHRR4CE2uE68H3R9czPzYgr0j+8lCnSMxq5Ex4NZrR/P/qezWyvTEBEeeXf5
	 qAF520d3orCndMW9ZaEbg5kwrpjewlCYOk+kLZJSUvAkNtAg3JZkehJRJOvv35dnPz
	 t3qh657wpC1e4Hg5SbFSME5sjIjmER1KoZufTzZyHLQ4APprotTNJUTjE1dSeE0gL+
	 SgFih8YzJTN8A==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>,  oe-kbuild-all@lists.linux.dev,
  ath10k@lists.infradead.org,  kernel test robot <lkp@intel.com>,
    ath11k@lists.infradead.org
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
References: <202401311243.NyXwWZxP-lkp@intel.com>
Date: Wed, 31 Jan 2024 14:35:51 +0200
In-Reply-To: <202401311243.NyXwWZxP-lkp@intel.com> (kernel test robot's
	message of "Wed, 31 Jan 2024 13:01:18 +0800")
Message-ID: <87ttmtvfx4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

+ ath11k list

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   2c471f31297856be56f60ef29f2565dea1470800
> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
> ath11k: fill parameters for vdev set tpc power WMI command
> config: i386-randconfig-141-20240129
> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/mac.c:7949
> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
> 'eirp_power'.

Baochen, could you take a look at this new warning and if it's valid
send a fix for it, please?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
