Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB1D29E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 06:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721804049; cv=none; b=Ytsxw4sHLgXCu90TD7WUPbmMsxUqlrHj3618CD/ICwTbt6sR+KdLfmthF/+NMNJPxbiQWg4Hv2m0Z2dQiVY6uXoYIBJPTcPJsbn5/eNfgqseFj25i6tX4I1S/j7XqwzIlGfu0Ta0yikUWy13BJVO1gAhe8W3ixsXcggqiBtr86g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721804049; c=relaxed/simple;
	bh=AUoV4/UWAxqT8yICcvc9Fq4MrUqhJGvpIlmGg0jLffo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksiYL0fn1yX5v2TBD++sjCoMKbUqR4Rl2xpTphWwVujT8mrVn1O1j+1MKbocj9G5BvwiV1HVB9AfjxbFwEl71dN0vP8pKqvzB7B0hQAI9bU+wZtZbouTa6PKp1A6cL4YPR51YkBXmPud994gxUg9K8VKVBVW2p0uhjVzsXeXDOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZUruJCYZ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZUruJCYZ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so6140526a12.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721804046; x=1722408846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LsOjcoGm+30jXQP9UfeyD1a5hhEGlKTQno0S2gPuCU0=;
        b=ZUruJCYZxb55G9o37QFp+Bf9Kjzd9rQWAmAmvAtDksgmmR4+UIzNJR2I5+BbFbW0Jw
         qPRQ3ywl/yEQmuLq5DjX/8jpKf680yoBkicWSZRVrwBz1dOHR3ATbJMnItJ7umTIzEXr
         vLaexFANXxau38dOhY6OevB/pmAWzJAsmunqO2eDJBr95Hct1dvYbZqaIfPo0MPjaYai
         xfpj3UYnKTkhZpNcc/k0UjUj3qgBq/mj12s77qNSnPWe0xG+eRaHHKJ7z3uK82n9FTrq
         7UxWWSV116CUWHvE0FCUfCknySWtCeCaY8GGK8v3aAF9zvGsUZxPPITiH/OnQiNr30oV
         fl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721804046; x=1722408846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsOjcoGm+30jXQP9UfeyD1a5hhEGlKTQno0S2gPuCU0=;
        b=wN81hSsJ29TCzuEXoGi7AFrRx74jUwvuuar57/6Imz/E+lxfxylyNz/LYlJ0900VEh
         EssbpFGT75K3ePml28LrIaTvn8uErUDdDhaGVJin66mcxEPoLFIVyIOx4VmevAm4Ls/A
         4NPmNgY72wiJoyG7Hm/AFkLCk9y0VnzNWXbp88hdqOvFcktc40xa3T5f4uBuTkFCQcm8
         KbCGXuXcWcN0ZMrJS3iqZ+DBZug9FjcB14iq11mV5ryRZEKxB4nufgFYeOKk2lb/x3rk
         0rZ0Kjfl5f+jqvZmTGmqEey42wu193Wstyy8M5JBCV1YLN2jcaNk2qxBINOJGXPg/E9Z
         Y/6A==
X-Gm-Message-State: AOJu0YwjWX5NzBqf7H4/mbhVKY3NWtQc/YXJiwi64RCN7JpPZ3y5WPX3
	NllYL1/wNZHQF6Yw5XxkEqcS3rr7TNAH5siQNNIsri02QBU8CM3q8MG2LYSEdA==
X-Google-Smtp-Source: AGHT+IECdLND7sCB3+z89RmfXnP2F4KLDLgbhuGIiPK2EUeg3/+ackv4rufs8Q97rg24KpVjA09SPQ==
X-Received: by 2002:a50:871c:0:b0:5a2:763e:b8bf with SMTP id 4fb4d7f45d1cf-5aaedfe2befmr814539a12.25.1721804045653;
        Tue, 23 Jul 2024 23:54:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de. [37.24.206.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a59be83c69sm5180416a12.58.2024.07.23.23.54.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 23:54:05 -0700 (PDT)
Message-ID: <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
Date: Wed, 24 Jul 2024 08:54:04 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel test robot <lkp@intel.com>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 08:07, Juergen Gross wrote:
> On 24.07.24 03:08, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
>> head:   368990a7fe30737c990f628a60d26d9854a9e690
>> commit: 368990a7fe30737c990f628a60d26d9854a9e690 [12/12] xen: fix multicall debug data referencing
>> config: x86_64-randconfig-012-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/config)
>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240907.u0NJHgTu-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
> 
> With current infrastructure this is not easily fixable, as there is no way
> to tag a percpu variable as __refdata.

Would it be an option to drop the static initializer and set CPU0's value
from xen_parse_mc_debug()?

Jan
