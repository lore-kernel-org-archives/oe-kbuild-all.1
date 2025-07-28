Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204A82673B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753718396; cv=none; b=mIRpquVKvDfc5kLn4Jbu9pWcTl8dK7FTSNVJqZb9Ip4PQ/+4Cb7t6SFOaIAXkkCyhkpkiBhw47s3rYlLoS5LxFl4v5eKOIzvCS6VzSWkBwa0n/F6tB1l1HelwFy0Ea+u49OScGjYeC82zVx/klwHK0U2I4r+IRH5DRpeyNKi/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753718396; c=relaxed/simple;
	bh=dNfaG4D18D9CjOcgvaBVkHp+jyn6+cieep0hDJfD19Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrJESwKPEa0rXCvKmBm4WOHylWkpKo/d0agB82Oy89HnZi6m0y1EpUhYa/gIMWg/h95rhIe4i8AV62bov3oIYUiiOzCESlOxw/+nQIHZmX3yBZinh7rIf5rds2MJ+KZDdgCGOtnO/dh3OdqmaFuJ930vimR8/eJ7fFHyvUniEU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1Lyvseu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1Lyvseu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b783ea502eso35092f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Jul 2025 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753718393; x=1754323193; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tjx13zWedBGyIKTA7New5uvsNC41+GLmdqfifANAW9s=;
        b=h1Lyvseu8GoD2HG8vuFA7FnP+7DEjQEq5V8nUlNDW7SxfdJxchny0vGNTjKUAYlmiD
         9wsRDxuHLIZuqlperohIyP/MTIwoFa/nzJY/tmvJ0A6Qfebliap2ueN1oEnA8u8XFPI4
         zOxdltD48VAr/SPhTQjoy/glD6WSvycD+HeocgzxXbstd9SZf5Y1hkwIPHPpm4vuEH8l
         pbHNrvb46db6+ON+cKamSOFIl4eC6uga+ew9TLmxDq5NaXE9ktftnN9u+fjcrOJ3UedD
         hFkMKV8FatdgE88+k6/SNGY74hQDAxX39SjN2NGNFTNoQJgxIuAg0G5XnX2+QJbMMgTz
         lJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718393; x=1754323193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjx13zWedBGyIKTA7New5uvsNC41+GLmdqfifANAW9s=;
        b=PfRFXNYFlc6+cNMTa8+X4eRq4z5JS9vtJbg4x7L6wDUox+w2mhTon5asct9kbK3oTY
         kkDZnN/sGqbNGHC7HEnOtkjRlmBAznsphqgXzISNd7nxuLvdq/nymBMDbfmiF7vhyCWQ
         yBcuFmW9fw5ZbiFljArZYu/jGLRD5OId7nvTOz+aKXuJPYcK+nKr81IjlC9Sm2+0ckyG
         79NdYFyeg4qZxaVTYxokN8ZYCQqkyScX3oEWs204cdNuua27feGVT5ISEyMkSioHgiAb
         GK31tJkmGYQ7YsNifEDdcjWTrmsRnt7P0jh2kKSt3QBqb9mL9jujDWkvwLtcUwUt1YYi
         4hPg==
X-Forwarded-Encrypted: i=1; AJvYcCWcX1BcgSupLK/E+GG2Sdu57MF+CHT4c6bVPYTeHpcY4TPxy77rla3zDTdYcQ71ubicDZCg4v5yJiC0zBhc@lists.linux.dev
X-Gm-Message-State: AOJu0YzTmrKiy000V8Ka9AYVc5pfS35/fO5l1zVE3Ouh4XYfnZxG5RDP
	6rNT0wezYWARj/8PDWFpMlOdUffi/j1h+KsKzX1Y5EAwNXmjhFj1urJT
X-Gm-Gg: ASbGncvWo/HjTfF8e++v6m9h7hBfU5LWx1xV16M8Sud1MebdINOeulaobbhxaE8Sh1D
	sWLixdi1Rr8D/v5t/UvAjC/dTF70hNosILeLw2mkDQsCsLR6yhV3wpAYC2WsdUBpS1HoqziiriL
	lcXNiSngCzz6DQc/iEbhorE2iqpEhS1aJCeviyyutk0McP06640p5vXli4bqjefgW2IMHBs6ja5
	kAk6rDeZf8rwwDG/Ow97lnPy7WFhSrGr2xb5g9ZnDJ7ypk2x5ZF6EX94+QxmV5cuqO3CNTbqGmw
	oqcU/aiCoZV4h9e5a206RyBgjHoBtWdPcPNcEN/NfwLqsZzJ+aoReaOty4NkFrLEvY13xOpb69a
	4buJ5prhKomaZ+I1fCHmEP22TguGmVIbushtG2+kCrWgQH0z9UZ4cSjiLDGS0s2Uv6w==
X-Google-Smtp-Source: AGHT+IHt942cS6W+rTZ71qArgtk78wyYddcCFyLJ6WkmhpsfPuo0O6TXSbk1FwgDtS4bjvFjnrZW7w==
X-Received: by 2002:a05:6000:459a:b0:3b7:76ac:8b9f with SMTP id ffacd0b85a97d-3b78e60fa69mr61150f8f.25.1753718393105;
        Mon, 28 Jul 2025 08:59:53 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f04009sm9336711f8f.38.2025.07.28.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:59:52 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:59:50 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: lkp@intel.com, alexei.starovoitov@gmail.com, andrii@kernel.org,
	ast@kernel.org, bpf@vger.kernel.org, coreteam@netfilter.org,
	daniel@iogearbox.net, fw@strlen.de, john.fastabend@gmail.com,
	martin.lau@linux.dev, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org
Subject: Re: [PATCH bpf-next v3 4/4] selftests/bpf: add icmp_send_unreach
 kfunc tests
Message-ID: <aIeedqGvdfO641Ht@gmail.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
 <20250728094345.46132-5-mahe.tardy@gmail.com>
 <356fe0b5-b66e-475b-b914-919339bb441a@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <356fe0b5-b66e-475b-b914-919339bb441a@linux.dev>

On Mon, Jul 28, 2025 at 08:40:49AM -0700, Yonghong Song wrote:
> 
> 
> On 7/28/25 2:43 AM, Mahe Tardy wrote:

[...]

> > +
> > +void test_icmp_send_unreach_kfunc(void)
> > +{
> > +	struct icmp_send_unreach *skel;
> > +	int cgroup_fd = -1, client_fd = 1, srv_fd = -1;
> 
> Should set client_fd = -1? See below ...

Well spotted yes, it's a typo, thank you.

> > +	int *code;
> > +
> > +	skel = icmp_send_unreach__open_and_load();
> > +	if (!ASSERT_OK_PTR(skel, "skel_open"))
> > +		goto cleanup;
> > +
> > +	cgroup_fd = test__join_cgroup("/icmp_send_unreach_cgroup");
> > +	if (!ASSERT_GE(cgroup_fd, 0, "join_cgroup"))
> > +		goto cleanup;
> > +
> > +	skel->links.egress =
> > +		bpf_program__attach_cgroup(skel->progs.egress, cgroup_fd);
> > +	if (!ASSERT_OK_PTR(skel->links.egress, "prog_attach_cgroup"))
> > +		goto cleanup;
> > +
> > +	code = &skel->bss->unreach_code;
> > +
> > +	for (*code = 0; *code <= NR_ICMP_UNREACH; (*code)++) {
> > +		// The TCP stack reacts differently when asking for
> > +		// fragmentation, let's ignore it for now
> > +		if (*code == ICMP_FRAG_NEEDED)
> > +			continue;
> > +
> > +		skel->bss->kfunc_ret = -1;
> > +
> > +		srv_fd = start_server(AF_INET, SOCK_STREAM, "127.0.0.1",
> > +				      SRV_PORT, TIMEOUT_MS);
> > +		if (!ASSERT_GE(srv_fd, 0, "start_server"))
> > +			goto for_cleanup;
> 
> Otherwise if client_fd = 1, goto for_cleanup will close(1).
> 
> > +
> > +		client_fd = socket(AF_INET, SOCK_STREAM, 0);
> > +		ASSERT_GE(client_fd, 0, "client_socket");
> 
> The above two lines are not necessary since client_fd is
> actually set in the below.

Yep, must have been a leftover from when I was discovering the
network_helpers, oops!

> > +
> > +		client_fd = connect_to_fd(srv_fd, 0);
> > +		if (!ASSERT_GE(client_fd, 0, "client_connect"))
> > +			goto for_cleanup;
> > +
> > +		read_icmp_errqueue(client_fd, *code);
> > +
> > +		ASSERT_EQ(skel->bss->kfunc_ret, SK_DROP, "kfunc_ret");
> > +for_cleanup:
> > +		close(client_fd);
> > +		close(srv_fd);
> > +	}
> > +
> > +cleanup:
> > +	icmp_send_unreach__destroy(skel);
> > +	close(cgroup_fd);
> > +}
> [...]

I'm sending a v4 with those fixed + fixing the builds error when IPv6 is
built as a module from the kfunc patch. Thanks for the review.
