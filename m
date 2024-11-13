Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22D230984
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731495503; cv=none; b=o1mNa/OwCWp+yCNJ/5MCAX06xsbZvQu6tCM3wsDOt92iqLfDVdQQ9rPOKr0B66Nzvrl37tCza4Y5lvJpjYOCVdpM2LURCmsiVMJviuEj9hRB4t1c8X2YqjHRSUdBCsSxJoKU/vbdcV+/6ekxs2xuMqim5KB2DAoKQGS8BXTcGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731495503; c=relaxed/simple;
	bh=ZjTRsOF4qwzLsDiCUTq+yM1yuZi+CSMqTmTWlNn1XbU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=cxjvLymqKWNKywh0vOMIYOpNwBOTc5lvPxk7rf7JQjZYFNtzkkPz8zPDlDWtMxGpoh7pdZNdBjqZhwtKYsY0+ZQcKVpYEGzY3S7gxdvmaxAIF2sfr4xlsOUZiahmKMEocCzEV5pwGpgcQyWvnZih77TlYCkOmcSK80cKs0XpzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlJMiHfe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlJMiHfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF682C4CECD;
	Wed, 13 Nov 2024 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731495503;
	bh=ZjTRsOF4qwzLsDiCUTq+yM1yuZi+CSMqTmTWlNn1XbU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LlJMiHfeVwv+O1yoEQl0PLijxDj9yEa2UrHg6x6hfWKFbmjT/MEX9q1n+H7S3rPba
	 9oB0fGCLUaLZ6gaIUmaE7k1khvDai2HijLZqVyqDf3Gb3LKAYMygmOp76VnHVmLZaV
	 8OxI3KuBvuNC+BMvA54o7OQs5b+3tb/qfE75s+cKylvIGResq7r/01bd/NtWNp/gSO
	 vWZSOnuqF4XeVQS8RBIIkSbbTj9z/AeSV6Q8AGMoOX0TAPKXbBD86lPKUgaN9ysBK4
	 sHWK1gWMquOw9FM43nVYMhTEpBG9G5PPeO760k+XtT8vxVFw+R1xUshSNCCSambjwe
	 vlitQF+vVMDCA==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>,  oe-kbuild-all@lists.linux.dev,  Jeff
 Johnson <jjohnson@kernel.org>,  ath12k@lists.infradead.org,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [ath:master 2/4]
 drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit
 declaration of function 'ice_read_sma_ctrl'; did you mean
 'ice_read_sr_word'?
References: <202411131838.DE0FWg8Q-lkp@intel.com>
Date: Wed, 13 Nov 2024 12:58:19 +0200
In-Reply-To: <202411131838.DE0FWg8Q-lkp@intel.com> (kernel test robot's
	message of "Wed, 13 Nov 2024 18:31:45 +0800")
Message-ID: <87ldxn2yes.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
> head:   fc6f018eda7f9054e427f731db1e8b200f22873c
> commit: 33e2bcda33620fc43cc948627be525ddb342c446 [2/4] Merge branch 'ath-current'
> config: arc-allyesconfig
> (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build):
> (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411131838.DE0FWg8Q-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_sma_cfg':
>>> drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit
>>> declaration of function 'ice_read_sma_ctrl'; did you mean
>>> 'ice_read_sr_word'? [-Werror=implicit-function-declaration]
>      165 |         err = ice_read_sma_ctrl(&pf->hw, &data);
>          |               ^~~~~~~~~~~~~~~~~
>          |               ice_read_sr_word
>>> drivers/net/ethernet/intel/ice/ice_ptp.c:187:16: error: implicit
>>> declaration of function 'ice_write_sma_ctrl'; did you mean
>>> 'ice_write_intrl'? [-Werror=implicit-function-declaration]
>      187 |         return ice_write_sma_ctrl(&pf->hw, data);
>          |                ^~~~~~~~~~~~~~~~~~
>          |                ice_write_intrl

Our ath.git master branch is an integration branch of other branches and
it's not sent forward to other trees. Looks like we did a merge error in
the master branch but no action needed as it's only within ath.git.
We'll try to fix it the next time we update the master branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
