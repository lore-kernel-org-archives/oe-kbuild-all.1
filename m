Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC12519047C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385574; cv=none; b=sisGyDN46SO6alCwREZWTe8Z3HCU5MUy4qixqlrtGN9Xnw6D2M0uIFRxl7nWcSti/Qalcm6xS3AEMmdCnGh9x6jsT/l8GhfoXSgfuFv4edkK1t3ijuzjgDwEMqo51nj04rHGk0kChcjPD8v8VgD84G+4ilf9AzApUB51wSuYrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385574; c=relaxed/simple;
	bh=GTfoMMVnkWvYKIcJjs0IHr2PijIX4ckD3KyiIm1lcxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ts6CAPH4upeDwhMp0W+kkTfm+73aKzvk2dD2WHJFl0fb6DuiNikl3mdmVqjwP++j8swyBZc3lYLqbCQ5fpu0enZd0Q4h75Y6gfHrlnN3z2sKhcDMQ2e5S5kLbhwQH8yaBw65Bp2aNHqGOq3VQM2VOY8/h6cUr8rCUHoa6yup9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MX14s02z; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MX14s02z"
Message-ID: <4e5afba2-fe0a-4501-a21e-fd373d105bc0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725385569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TwSRZYjVaOQ2W1wsehVtPVkGIxbX1dsaxBkPonjj9/w=;
	b=MX14s02zI5A4imtCOEgvRVg4RVlnZ5Fh/0flB8f4grDuU6xaJKdKBsZgEHjt0IHpC4QvKB
	EwZPIi7EaIbwnrq1RzjJd4YHH4xPTx15C1Ggot2B+3Clv/JxbDuo9c4f1RTYX+T/xYgVeO
	lAgsZJC2Z+D2d04p4Uz1qhri2ZMEZyw=
Date: Tue, 3 Sep 2024 10:46:03 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [bpf-next:master 6/17] kernel/bpf/verifier.c:19785
 convert_ctx_accesses() warn: inconsistent indenting
To: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <martin.lau@kernel.org>
References: <202408311622.4GzlzN33-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <202408311622.4GzlzN33-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/31/24 2:00 AM, kernel test robot wrote:
> smatch warnings:
> kernel/bpf/verifier.c:19785 convert_ctx_accesses() warn: inconsistent indenting
> 

[ ... ]

>   19769			} else if (insn->code == (BPF_JMP | BPF_EXIT) &&
>   19770				   epilogue_cnt &&
>   19771				   i + delta < subprogs[1].start) {
>   19772				/* Generate epilogue for the main prog */
>   19773				if (epilogue_idx) {
>   19774					/* jump back to the earlier generated epilogue */
>   19775					insn_buf[0] = BPF_JMP32_A(epilogue_idx - i - delta - 1);
>   19776					cnt = 1;
>   19777				} else {
>   19778					memcpy(insn_buf, epilogue_buf,
>   19779					       epilogue_cnt * sizeof(*epilogue_buf));
>   19780					cnt = epilogue_cnt;
>   19781					/* epilogue_idx cannot be 0. It must have at
>   19782					 * least one ctx ptr saving insn before the
>   19783					 * epilogue.
>   19784					 */
>   19785					 epilogue_idx = i + delta;

There is one extra space by mistake. I will address it together during the 
inline_bpf_loop() followup.

