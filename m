Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCA32E2829
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803563; cv=none; b=GfMbElTRxxjFTOyczoaj/VORp5bVqKmq/l+S+9UpktlyJvcdpepWs30kudxadXJPCxL3xRKt49k8h6dXcfmjk7RzhBoquK/C2mrkHGx0npVXhvHTvWtzjZdUxDgpVzCOhhZA/eN5AEKTLQcnSXiHCmf3lJ6ykmTc7O1TdNLWIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803563; c=relaxed/simple;
	bh=OoCJrIEWjxTVTIfJZDOGGIgdvwyCFc34W3+yRbXYf9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wpe1K0qUAbQjVn4V12QWubNkR6FcGc7YJcV4jtRFm5qjJ0LEQivFBQvd6E16SHTMAJ2JUrou6lGCBgpPOIPEsFs45/57HEpnHsyO5oaGBMe8ayFWJ+ugfwUjLIAj4rbBNp+BDXmMy67Uge8QrcdGXgf3T6M0ha3RzG4sRW9ymaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=bm6cynPx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="bm6cynPx"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso205859366b.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 12:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1755803560; x=1756408360; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfvVkWYzE6e6WhFjHz85IWa0dLosToM/3nbq5rYpPHM=;
        b=bm6cynPxBIeY1+AJxUXNP8qkeAJVCGwnsgGY4X0oKMlZVVhLRf/ZkqJcpmXCsoIM0t
         0eKIxtrjY9L96HaK+mAdaTAr2zPrHVPvpBbGtWLNwtfQFWbZxTsq1EVTDb0ISFexG41p
         eY8UWxr/5l2QxzlNQOHevg4lC6mufKeiWIFX05YPQciugy3/qlq1oXeLF0/o3aK4uvjp
         lAcomHkfrOltFGo8thmQpFeX7FLAyqPn/0jtmZk2trTL7zzC+WW/34hECGKfAlKDyat2
         JtRUEoGiQr3fZth8NeaXc7YXJh0w3hWa3a97IJb2fEV+ZdrpxHFXkjB2zqbtVzkXZjFK
         L4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755803560; x=1756408360;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfvVkWYzE6e6WhFjHz85IWa0dLosToM/3nbq5rYpPHM=;
        b=TLlPqoPNYdDWaGrW4olTC2V0n7UnwrLpCeeGMaj7ZwZcw7LXCkmYpAZfaunPiHePc1
         O6ckbP5IcZ26nH9KjXMzel/vjewrboo3s/U2kb2mHVw3gfASGHBuy9y8TyQ8YkMAFnRD
         5RLX6Px06aUUc7up3PE3BZYtpowzTNSyS91qUI7rC7CxbdwWt4thcPL/dCRqN/8Gmssx
         leduPNKS431Sijgoz8hbWsJhF1UemiGP80BFBRnICnQ4XDW76OvUxlu9pJtd2j7z9Mtc
         AxDsUgI/U1yZQI4xy86WBzO7lWsTnqxjHv5tuTnMvPIsim5QJsDyqur/NdOXE+lWg+OI
         hQ1w==
X-Gm-Message-State: AOJu0YyJngER5rBDpjFh7OGeJLE0CnykOyt/7EDcYtmmi3QNSxGpfink
	24557bjlSZbaNh6lgMG4H0BHOgG+494Da3t83opmmEKLQgotsjaoBktP/cjnNaGG5BQ=
X-Gm-Gg: ASbGncuIzfOCu9wsewoB/HWFiTNgj1kRJzhUWYxK0PhaIOw8fU6pAgj1I5kgjun0Gm6
	9VvKEKclicNu1woe7Pplbhwgk/YlagwiOvjoOyH7ml7ii//d5C/04V/ouSV7T5gxuJgDpsLeS3j
	71KJzHz+xU75sNBdcIAcDt9pMU94VbDFfs9iA6acb8oxMhsWvkCVk+OEOqqPBr3Gty7id3YdhTO
	es+YnWBObPROmovazwE67ZDtTZQASS/zTC+jfhNfL4bkuam6bzIxc0F60WxQWzlB7vh4f298JaI
	9e4sRHbL+pTjAhd7uGjf+Et3BDbm0lMb/TfCbPFFAruSwhGJiXd2buAJmSm4/uqHJsHuRYOsntA
	+sgfMPVPC4pJ7BTLl2P8l4nk=
X-Google-Smtp-Source: AGHT+IE+UNhHtrc966Ga08RbSCwDjqHD/WxkQkZCEx8MV84/+fDn9iJehs9KaOE9jkoRnpnFjc6y5Q==
X-Received: by 2002:a17:907:c1c:b0:af9:a5f8:2f0c with SMTP id a640c23a62f3a-afe29054033mr22384066b.28.1755803559563;
        Thu, 21 Aug 2025 12:12:39 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:5063:2dc::49:c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded479020sm443727866b.74.2025.08.21.12.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 12:12:38 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,  Martin KaFai Lau <martin.lau@kernel.org>
Subject: Re: [linux-next:master 2782/3950] kernel/bpf/helpers.c:1784:17:
 warning: argument 2 null where non-null expected because argument 3 is
 nonzero
In-Reply-To: <87cy8ozoiz.fsf@cloudflare.com> (Jakub Sitnicki's message of
	"Thu, 21 Aug 2025 17:24:04 +0200")
References: <202508212031.ir9b3B6Q-lkp@intel.com>
	<87cy8ozoiz.fsf@cloudflare.com>
Date: Thu, 21 Aug 2025 21:12:37 +0200
Message-ID: <878qjczdy2.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 21, 2025 at 05:24 PM +02, Jakub Sitnicki wrote:
> On Thu, Aug 21, 2025 at 08:53 PM +08, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
>> commit: 6877cd392baecf816c2ba896a9d42874628004a5 [2782/3950] bpf: Enable
>> read/write access to skb metadata through a dynptr
>> config: sparc-randconfig-r063-20250821
>> (https://download.01.org/0day-ci/archive/20250821/202508212031.ir9b3B6Q-lkp@intel.com/config)
>> compiler: sparc-linux-gcc (GCC) 15.1.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20250821/202508212031.ir9b3B6Q-lkp@intel.com/reproduce)
>>

[...]

>> vim +1784 kernel/bpf/helpers.c
>>
>>   1754	
>>   1755	static int __bpf_dynptr_read(void *dst, u32 len, const struct bpf_dynptr_kern *src,
>>   1756				     u32 offset, u64 flags)
>>   1757	{
>>   1758		enum bpf_dynptr_type type;
>>   1759		int err;
>>   1760	
>>   1761		if (!src->data || flags)
>>   1762			return -EINVAL;
>>   1763	
>>   1764		err = bpf_dynptr_check_off_len(src, offset, len);
>>   1765		if (err)
>>   1766			return err;
>>   1767	
>>   1768		type = bpf_dynptr_get_type(src);
>>   1769	
>>   1770		switch (type) {
>>   1771		case BPF_DYNPTR_TYPE_LOCAL:
>>   1772		case BPF_DYNPTR_TYPE_RINGBUF:
>>   1773			/* Source and destination may possibly overlap, hence use memmove to
>>   1774			 * copy the data. E.g. bpf_dynptr_from_mem may create two dynptr
>>   1775			 * pointing to overlapping PTR_TO_MAP_VALUE regions.
>>   1776			 */
>>   1777			memmove(dst, src->data + src->offset + offset, len);
>>   1778			return 0;
>>   1779		case BPF_DYNPTR_TYPE_SKB:
>>   1780 return __bpf_skb_load_bytes(src->data, src->offset + offset, dst, len);
>>   1781		case BPF_DYNPTR_TYPE_XDP:
>>   1782 return __bpf_xdp_load_bytes(src->data, src->offset + offset, dst, len);
>>   1783		case BPF_DYNPTR_TYPE_SKB_META:
>>> 1784 memmove(dst, bpf_skb_meta_pointer(src->data, src->offset + offset), len);
>>   1785			return 0;
>>   1786		default:
>>   1787			WARN_ONCE(true, "bpf_dynptr_read: unknown dynptr type %d\n", type);
>>   1788			return -EFAULT;
>>   1789		}
>>   1790	}
>>   1791	
>
> Right. This happens with CONFIG_NET=n.
>
> I think in the end we need a simple wrapper around memmove to stub it
> out with -EOPNOTSUPP when CONFIG_NET is disabled.

Forgot to mention that this null-ptr-deref is not triggerable because
the bpf_dynptr_from_skb_meta kfunc is present only with CONFIG_NET=y.

So a fix is needed just for the sake of silencing compiler diagnostics.
