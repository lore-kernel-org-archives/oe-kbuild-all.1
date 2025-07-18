Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1E1F4C85
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752831072; cv=none; b=Zq165Lkp/ax+QMLd92PTg/KfYizjZBKqnzPJMAftGEMAnR5YQlFc7nQre4EYh6F12/KjAUcUbD4G/MOkNzfymEqjQ3/EYCBSRtiGBombVPnxE7VnGyWBJcy33OsPkOLYV6ZprpjsLgO67R5Kc+DTeMxkk5yuFAHx+lA/ug5JrD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752831072; c=relaxed/simple;
	bh=bhe0zcLGy5GklMgwNIQG4xyAuKnkHHvNVTH7d7Uwzqs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lle26XuGb5IgOxvtCBi7BehheCUlB8AAsWtyDlM8WZQy5lnuO2XR1K8U2P6dGShum9OzGE86hJGh2xgh+dXjuRP1wT6BN0/HhBTKwxsn4VVvw/TWO2AhYpoM6j5Qyj1M69Qsnd3aWyfST4LG9Og6UZ3u2Rt8zUG04+nfePdqMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lc6yO3Bv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lc6yO3Bv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0e0271d82so335663066b.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752831070; x=1753435870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjU6nrqfbiw0u0TIKCSt6roZUluHkikf0/decEoYNJE=;
        b=Lc6yO3Bvklv6Jx9+9ZwJXkhG2qPxBLF7RuA+4s1H388Tg0dcvL40R659mu2YWOCaZw
         FaCdkLJU7TIajiOIMdll6Bh+cmZYSPslsrNz7zQ0dZaa71pe+jbL/PK9vGDdVJ3mNVYh
         fqTJ+JjSRoErIFbzcEkZ2havyR0VJvhAUDT2w9ueQTCwp/l0Ey0R82xPKrBP5n7DVCVB
         OjVYLPjo78iBc3FMxDTrQ18+eEeBHCFU+49U+urNEI04j1+sfpBN4XrIJyGutyxH0Mg0
         A7isRNqlKo0Te4hEeqMhbfMP57UoMhXFjmZ7kqpAN/xxCpXLTHLe706b9B55b3JH8OJs
         SNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752831070; x=1753435870;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjU6nrqfbiw0u0TIKCSt6roZUluHkikf0/decEoYNJE=;
        b=vOi/5ncZUk/bhdBkp/SwhrtxJ4XKXkt/+W1RUZ9EayZdVPUtEXtUdPcLbbOZNyo8JD
         pdptkK/LEcXobTVOjNGlcbj56Y6H6OvlENaMAdW/0ljNRmXCiQToNJ7Zp15DGNBIzM+p
         KfhCePO7P8XxX4fnCV1IjUbGslx4jxKfFhOjvu4PDUVnuLINcEoHerQtE4yJJykT5dV5
         7FSwDk3WWhI15/iRyQW6OWgwsbR0wtUTjSsCVFiTccRY9em15M5tMSJE65l4YO7rRIPc
         Xh1kzsCvPP6z88Ow6u2EIUXFWywYpTBd/LX26MwD2bt9vl3nBh0usoqJvGUN7xqlBikY
         VwRg==
X-Forwarded-Encrypted: i=1; AJvYcCUgXdGAch7bbVeoNwWbuTCmBQ8fwbfvBw4LLlJDIA0+XQqIsJbj4KF3cl3MBIDfc72RKCoEBkHg+H56Virz@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+3259KbsFUGb/pO5iGgu0yShi/Xk27kbWgKzBjfzHfungj/Vr
	YzZElIJbcjlY70WS5Uu2zeWVXnNpkn9KHo/HMrxYibABenYik0E7iJqE
X-Gm-Gg: ASbGnctyI5Cxi/0LUsYC/NOWWFm2Ez4pTQMMxlu79KgaPEQby0U1d61czm6be2Khfgi
	3f+FaeHVs7vUgnt0OTvOVzGORRYRLx0q4QI70yaLeZt1NgbcLun2keLVKzeuXRn/GcShhIqP9VD
	sryD4CXg1gaQvswT6UihG/aZjsewlEIjrhkjsuCf0edCuh35IJ4LKzurAPuSrAoo41TWM+nFdmh
	PIs9J0bKDwL5AaloOvHniiAGzx0Vu5Nhr6kcegDakn81r82qbPSqmVqJgfgRRlZL0vATWr3tN00
	FEufOCXWVHWLO+PcBlFAUpcaM3TTEDnpi7rLnFmvJ+hhi8EB8f9E5sH6wPQCuxlWr5N52FEcXvH
	ss+tSBOiIJT+LHWabwvFqfzRIY56NE7Meryk=
X-Google-Smtp-Source: AGHT+IFIqad+0hlUN3zY87QsZXaNiyLAJ+x0TZ9qnNxIHZCIsq6bsPaf5QF99Ci+hSan+dVtZ2on2A==
X-Received: by 2002:a17:907:990c:b0:ae6:eff6:165c with SMTP id a640c23a62f3a-aec4fc41e91mr497084166b.48.1752831069432;
        Fri, 18 Jul 2025 02:31:09 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:6915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm88380066b.42.2025.07.18.02.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 02:31:08 -0700 (PDT)
Message-ID: <1fe747ea-56ce-4418-92cb-057d989e3732@gmail.com>
Date: Fri, 18 Jul 2025 10:32:38 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH net-next v11 12/12] libeth: xdp: access
 ->pp through netmem_desc instead of page
From: Pavel Begunkov <asml.silence@gmail.com>
To: Byungchul Park <byungchul@sk.com>, kernel test robot <lkp@intel.com>
Cc: willy@infradead.org, netdev@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kernel_team@skhynix.com, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com,
 akpm@linux-foundation.org, andrew+netdev@lunn.ch, toke@redhat.com,
 david@redhat.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-rdma@vger.kernel.org,
 bpf@vger.kernel.org, vishal.moola@gmail.com, hannes@cmpxchg.org,
 ziy@nvidia.com, jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com,
 xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
References: <20250717070052.6358-13-byungchul@sk.com>
 <202507180111.jygqJHzk-lkp@intel.com>
 <20250718004346.GA38833@system.software.com>
 <20250718011407.GB38833@system.software.com>
 <35592824-6749-4fa4-89d9-2de9caccc695@gmail.com>
Content-Language: en-US
In-Reply-To: <35592824-6749-4fa4-89d9-2de9caccc695@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/18/25 10:18, Pavel Begunkov wrote:
> On 7/18/25 02:14, Byungchul Park wrote:
...>>>>     include/linux/mm.h:4176:54: note: expected 'struct page *' but argument is of type 'const struct page *'
>>>>      static inline bool page_pool_page_is_pp(struct page *page)
>>>>                                              ~~~~~~~~~~~~~^~~~
>>>
>>> Oh.  page_pool_page_is_pp() in the mainline code already has this issue
>>> that the helper cannot take const struct page * as argument.
> 
> Probably not, and probably for wrong reasons. netmem_ref is define
> as an integer, compilers cast away such const unlike const pointers.

Taking a look libeth, at least at the reported spot it does
page->pp->p.offset, that should be fine. And your problem
is caused by the is_pp check in pp_page_to_nmdesc().

-- 
Pavel Begunkov

