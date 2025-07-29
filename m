Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6182286D7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780204; cv=none; b=YinPTliV8Ny2RNC1v2waUQiD6gsEmsHO17+CCEASd8pZNDGzok0+ALx2wYmgl3gFtfU8XDdbrUWNzLQWIBan5WS0B4L9GglTPp7M++Jyh+PI96gTkMlV/7mkzoXmTkfKiOjrSxz+9qXSHs1XfEBMfFykR9AGilpsP8T5RmEdkcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780204; c=relaxed/simple;
	bh=9LilFwsyzXEBNISNDgSQr3EDtxWlqZW1O/7Hpct2THM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9MvwYNc0oHDzMQsxzxxDI1LDKAYrxgTYDqcRW0QGA5YuUJGatNo/JWbGGYAqXaXbkLwjD8G4DOyVy1TUC3nVO7KmgofGDm1pDdcqeXPA8HEmP17INsplDs6OA7kxGPU2KA9xqeiZKj2VhOWSFiUgQ2CmfLG9QVu1acNNxiI5uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kl2mNktW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl2mNktW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b785a69454so1420546f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 02:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753780201; x=1754385001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDxjHKxEk4bzUf242dYSPxRTJXLTbFhf7MDZw//NVfw=;
        b=Kl2mNktWKsBrDz260r/jdakin4IQONgWjo5M7RxXnMd/0ylV6NXPscpHOaxKAqAJ08
         FYwErfOYcNGN9YrzEu3IEO60o4eDW/GytgJrgfi4fO2fKv4A3Xu1hcf2UtAMXyIP5ocQ
         BlgppjbfT+xCpJ9wvJlTsdLyJtU0wfyn3GlJk2mMcRL44g8+GCZph6HNeeJkrjTPzEiu
         E59vHjSAkioPLbMC3xCbZTWfXOmB6Iq7icPhlJ20zdDs3r2Lup4I22fr6+1tEQGuAI0x
         bF4e3rW2CI5R7F7xTYQxuG0U2C9/pcddGDI/tS7TSD9aC/DK9nNLSsgxkz1hBLo3ASCc
         tCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753780201; x=1754385001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDxjHKxEk4bzUf242dYSPxRTJXLTbFhf7MDZw//NVfw=;
        b=bJVeQC2NHy+0R7i0GPiwRHZWH9kni+/mgahbPHEq1SMaTP2lBIOFBYmKjd1cx4gUJS
         V8nmpJsMF/FfpEk+Gt4/Pq1ZuPJxXLxbQoTAlQc/iGnz6HjEbMp3FTxLo6bR2hYwb1F+
         VZmKq73j9oxpEIthDlMd0q31VUFhECSp+mimGb9O3d1F1xFEwDgZL+AOYshnkB0mKmMk
         JUAJ+pzFgAgKe1ZkgAhTlvTWpjt8i0rA4CFQW1BfIpoRskMa3FW9hRU8ffO3vL9A683O
         hpfOZR/EPgJP4CwNEyqP/QhmY4JQMXV1qU33yg8FVEllUxwUha83ahpxMIKYHjp0Ux3K
         QiEg==
X-Forwarded-Encrypted: i=1; AJvYcCUhY1h2H1OTNfZ+/PzX69mBqnpH3NzxwHAOGLP4snNwkOTBEppH7z7dPz9hCB3aXZsiogxDAw+O5kSG6TEJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwjC5HER02LHtltRVKVMNe21DCG38Tl8yFa8UYrqfjwT9TXHQI4
	timvFKdRMi+rI1F3XNdrJiZyAJyDMamFn8l+GuT3iJ6ZbhOhkxDH9vbj
X-Gm-Gg: ASbGncsL8h9ijxZ4Rac+1UyhHfA3eiqK8hjoTCX/puhrENurw3zaF6Q39VAUZ61WKUq
	qZ2aE2SXmEnNexm5vZ749K3dMH7verH4zDB1cHaNzLhC2gUoxHhpnlAqfUwUCYCfNz8p9WQUJCF
	9d1hK+dScd8uU5Amu9fR9valWb7I6lOAQKnLiHJaZLgMLeGcZCeUFEXHWe4T6N5VTSSBzQ5WBbF
	cXXhlEvvwC74Z7dGKJo6Fjz29aaAuVLAUe75oGkUBO0XZXaWcykWi0CZP1swk7i7gFYU616mNir
	0LDC2+1fNcFfmY+J3jqFwLpFKqlzFNRf9mM0hL3lbFN0cRYLUZaMB174qX+Ulfm4eYoW8m6pg67
	ZTPYDqtdR1Me6rfCQXLxt9NUrpfjRDULXYq5W8WCuDBxyQCs7OiUA/QBjUADqpTJjfw==
X-Google-Smtp-Source: AGHT+IHH8+al9qv6iocTAD7WJesBvsnSwWK7+DrhIw3/VbdqC+a5NBS2dU6E/8+5gIjse9mgfZInQg==
X-Received: by 2002:a05:6000:4a1b:b0:3b7:78c8:93d1 with SMTP id ffacd0b85a97d-3b778c89877mr11705436f8f.21.1753780200926;
        Tue, 29 Jul 2025 02:10:00 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78dd6cb0fsm2373722f8f.29.2025.07.29.02.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:10:00 -0700 (PDT)
Date: Tue, 29 Jul 2025 11:09:58 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, lkp@intel.com
Subject: Re: [PATCH bpf-next v3 4/4] selftests/bpf: add icmp_send_unreach
 kfunc tests
Message-ID: <aIiP5l24ihrS2x-u@gmail.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
 <20250728094345.46132-5-mahe.tardy@gmail.com>
 <382ff228-704c-4e0c-9df3-2eb178adcba8@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <382ff228-704c-4e0c-9df3-2eb178adcba8@linux.dev>

On Mon, Jul 28, 2025 at 06:18:11PM -0700, Martin KaFai Lau wrote:
> On 7/28/25 2:43 AM, Mahe Tardy wrote:
> > +SEC("cgroup_skb/egress")
> > +int egress(struct __sk_buff *skb)
> > +{
> > +	void *data = (void *)(long)skb->data;
> > +	void *data_end = (void *)(long)skb->data_end;
> > +	struct iphdr *iph;
> > +	struct tcphdr *tcph;
> > +
> > +	iph = data;
> > +	if ((void *)(iph + 1) > data_end || iph->version != 4 ||
> > +	    iph->protocol != IPPROTO_TCP || iph->daddr != bpf_htonl(SERVER_IP))
> > +		return SK_PASS;
> > +
> > +	tcph = (void *)iph + iph->ihl * 4;
> > +	if ((void *)(tcph + 1) > data_end ||
> > +	    tcph->dest != bpf_htons(SERVER_PORT))
> > +		return SK_PASS;
> > +
> > +	kfunc_ret = bpf_icmp_send_unreach(skb, unreach_code);
> > +
> > +	/* returns SK_PASS to execute the test case quicker */
> 
> Do you know why the user space is slower if 0 (SK_DROP) is used?

I tried to write my understanding of this in the commit description:

"Note that the BPF program returns SK_PASS to let the connection being
established to finish the test cases quicker. Otherwise, you have to
wait for the TCP three-way handshake to timeout in the kernel and
retrieve the errno translated from the unreach code set by the ICMP
control message."

I added this comment because I already had some (offline) feedback that
this looked off, maybe I should develop and put this here directly.

> 
> > +	return SK_PASS;
> 
