Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107131C07
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jan 2023 11:31:07 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ss4so60095014ejb.11
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jan 2023 03:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=SAOnHwXPVdXtwryZfI27E5TBP69wt16pOek6ktQQ6k4=;
        b=YPSxKdyv0vemU3n3JeBYbWHou1RxJV+ZCMpOJ7hPMdx5tZtYicYHOui+jxhh+tyP2u
         rKfjR+NYG6nJKaWYJ2nHV9ka5Ocuuq9vHvAX7MnwHVc5t73GJ500oA4u6OhnUmaIGxxy
         h2uVA7B5bKCEz67iqSKGh23bdiu5Ty3Cu0VrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAOnHwXPVdXtwryZfI27E5TBP69wt16pOek6ktQQ6k4=;
        b=EIENdGYoiZXn+WOUfo+bwUot7Asr4MUpGuf0oHP/FCpECTLVipt4OHIcuBc5Y3RaAU
         gppbl3wZjXNri1nJYrcV3BsFJMclqe72uXyh+LvYI8Aj/j3BbMg5hAh/n1SdKRU5ToGO
         pCifqmqocr/N4TwDreaAHGwSrn3Xu2HLhS2BZdtq9f2P4GIFFsCTnLEGWA08weQBEH6M
         HzFxOl7PprOeFGUxyK8+3FctlUgX37D07QtC+Bdo5DpLK0eQaf4scCTmYSnM0BAYplVf
         sek4Y80RmN8VmkdluaIoofHrfqzOiHzYIfAo7f847hWUSBWmTjoKdjvlwBuacPWOKvA0
         TYRw==
X-Gm-Message-State: AFqh2kqOmYg6hjox7FbvrcojuMeFn8VRak+GhzEMGpFhSx/LoyFYmywe
	Q3pysvurFmKMknZH+BEuiGYhAw==
X-Google-Smtp-Source: AMrXdXszUtRHn1sJvd2uIBJcBgsvnMr1m2Iqr0V4lqgHz6GwPtmxkNqKtoaZku1DmjVLfTfNQEOeGg==
X-Received: by 2002:a17:906:3687:b0:86b:914a:571 with SMTP id a7-20020a170906368700b0086b914a0571mr10054431ejc.5.1673868666301;
        Mon, 16 Jan 2023 03:31:06 -0800 (PST)
Received: from cloudflare.com (79.184.151.107.ipv4.supernova.orange.pl. [79.184.151.107])
        by smtp.gmail.com with ESMTPSA id p21-20020a056402045500b0048aff8b5b70sm11257374edw.67.2023.01.16.03.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 03:31:05 -0800 (PST)
References: <20230113-sockmap-fix-v1-1-d3cad092ee10@cloudflare.com>
 <202301141018.w4fQc4gd-lkp@intel.com> <87sfgayeg9.fsf@cloudflare.com>
 <CANn89iLanM-OJu8hThK__G_gQj0z39Rnj-5Fk=kQEmbhs2OPfA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 28.2
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Eric Dumazet <edumazet@google.com>
Cc: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
 netdev@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 kernel-team@cloudflare.com, John Fastabend <john.fastabend@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov
 <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 syzbot+04c21ed96d861dccc5cd@syzkaller.appspotmail.com
Subject: Re: [PATCH bpf 1/3] bpf, sockmap: Check for any of tcp_bpf_prots
 when cloning a listener
Date: Mon, 16 Jan 2023 12:27:10 +0100
In-reply-to: <CANn89iLanM-OJu8hThK__G_gQj0z39Rnj-5Fk=kQEmbhs2OPfA@mail.gmail.com>
Message-ID: <87lem2yavb.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 16, 2023 at 11:39 AM +01, Eric Dumazet wrote:
> We might add a generic helper to make all this a bit more clear ?
>
> +#define is_insidevar(PTR, VAR) (                       \
> +       ((void *)(PTR) <= (void *)(VAR)) &&             \
> +       ((void *)(PTR) <= (void *)(VAR) + sizeof(VAR)))
> +
>
>
> ...
>
> if (is_insidevar(prot, tcp_bpf_prots))
>      newsk->sk_prot = sk->sk_prot_creator;

Sure can do. Thanks for the suggestion. I adjusted it a bit:
 - added cast to char * so we don't offend -Wpointer-arith,
 - fixed the lower and upper bound check.

Final form would look like:

#define is_insidevar(ptr, var)						\
	((void *)(ptr) >= (void *)(var)) &&				\
	((void *)(ptr) <  (void *)((char *)(var) + sizeof(var)))

Not sure where to stuff it. I propose include/linux/util_macros.h.
