Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198295A4C3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Feb 2024 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706804359; cv=none; b=fCRQeJ9C8A8PABq/xmdFwDXKqKceS9XVdopDtuqCqbWEtN4JhEGkgywqNpk3ZDEOhWrmqJKVCz5qU02423KyB1YLnXACmmhc8nKhTb7DHGmkiDDQtYQWLGV85HLfX8vGWRvVA85YJ8eFFIWtchz6cw8l/NNo6T6urzFbOUrWADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706804359; c=relaxed/simple;
	bh=pSQXkVGhSGtJOxhtkZViUKXNZZUqaeze9tefymigJbA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=PtMsvnM9M5dzwoxhGx+lzjzCea8tInmPWQEEd8U/rBBMFtDgwPeek1/kMSQslAv42anRh4m9jjqz3B8GbyaU7Re0OE9vXtdoDCBwed5zusW33kkHO0mTu4/ppNqKw1DgD3TrM+KaahNBM0Y3Hkd+lR4EZ6CjUXRE8uUnafQjvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exyFCQTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exyFCQTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760F4C433C7;
	Thu,  1 Feb 2024 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706804358;
	bh=pSQXkVGhSGtJOxhtkZViUKXNZZUqaeze9tefymigJbA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=exyFCQTl+lEujf2xl6+qQVAB/fItTO43EFuBTk3rBdhLadCVw+liyTtzHRs7VoOJf
	 BQ1m3ISjqq/4i7TAC9lUa8VmaZ7dKfzbOOT/hYXL2Z22/O6ubtY5+SyMq981QOMNHM
	 1ckfRXeEUYUMYYCh3NiUuAkW7+cV3PyWT2Rouzqg1aN0LY+MGRYlOoq4Xz0RF0k0M3
	 KqpBYG1dpowlJhbezMVTZM3gi4yIrlLC0gYxTCwPLVJxx/F0bflFNFr9GnNOHGk6Bj
	 SD65/iWn6HEqD38xhNSYwPsLpGM8up20GaTj08oV352+gC8S2wRouz7wUdX3ZqvXIM
	 9eRHZqwk2af6g==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <oe-kbuild-all@lists.linux.dev>,  <ath10k@lists.infradead.org>,  kernel
 test robot <lkp@intel.com>,  <ath11k@lists.infradead.org>
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
References: <202401311243.NyXwWZxP-lkp@intel.com> <87ttmtvfx4.fsf@kernel.org>
	<a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com>
Date: Thu, 01 Feb 2024 18:19:15 +0200
In-Reply-To: <a2fb59bb-6090-433f-9c3d-d35aaab93e70@quicinc.com> (Baochen
	Qiang's message of "Thu, 1 Feb 2024 12:31:22 +0800")
Message-ID: <87zfwktaws.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 1/31/2024 8:35 PM, Kalle Valo wrote:
>> + ath11k list
>> kernel test robot <lkp@intel.com> writes:
>> 
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
>>> head:   2c471f31297856be56f60ef29f2565dea1470800
>>> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
>>> ath11k: fill parameters for vdev set tpc power WMI command
>>> config: i386-randconfig-141-20240129
>>> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
>>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes:
>>> | https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>>>
>>> New smatch warnings:
>>> drivers/net/wireless/ath/ath11k/mac.c:7949
>>> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
>>> 'eirp_power'.
>> Baochen, could you take a look at this new warning and if it's valid
>> send a fix for it, please?
>
> I sent the patch yesterday. search
> "wifi: ath11k: initialize eirp_power before use"

Great, thanks again Baochen. It's always a good practice to reply to
build bot mails, something like "This is a valid warning, I'll fix it"
is usually enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
