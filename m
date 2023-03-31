Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A113D63
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680289952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=673XRyizobae774kUu5nrXw20qs2InjIWxuBx9XJVCI=;
	b=GwJRySSTpl9Weht9L8JZLCMa1nGUyemu/+Oo3w0w6KN6gPmLIVIedH1BbRsWNim5AXkIjG
	eRDFLDUDbhT2gNR0yCX7ZzMEx57b1qjlURlxVAJCJv5gJzSLJI2flM6nM4ja6zRevSEuEd
	HfEQXoPY8yy3IjUn1Ud2lU4EX2PEk9Q=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-FFqzLpX_NBe6mn_YWQfj6Q-1; Fri, 31 Mar 2023 15:12:30 -0400
X-MC-Unique: FFqzLpX_NBe6mn_YWQfj6Q-1
Received: by mail-lj1-f200.google.com with SMTP id h16-20020a05651c125000b002a3b2b80165so5122832ljh.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 12:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680289949;
        h=content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:cc:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=673XRyizobae774kUu5nrXw20qs2InjIWxuBx9XJVCI=;
        b=6/oANt6JGbdsYALsTEKiIf96nU68o53zJ31EQl5LMJ9m1vk5Cyjz00VNrkTpj5a/Js
         /Iwjmj3348xoSe7D+2Rl843YLAH61uHE2ElHz1bi6eoDW1q0JxaqGsL1AjPja/zFt1+T
         fM3+ATQUVN4XLRgw4PpQJLzqf20fZ/mPJh92Dj/uOFX6fDHBBnu/UBvwuEBPqbGUFtII
         x+LDz1+yLzqtDLO45N+oblzytf/egH9OfG1o2gej5prOxkJ0fhgA98poPCW8tbm0dlrd
         9/ksdPyzPErp4JXpFUgBXjhAQnGxzZHqZR7uvH5cHIi860QLQW19MnNKD//qGnK5E/ez
         sDfA==
X-Gm-Message-State: AAQBX9eLxcrnmbJNMSmdUWVGrWmD84t82HhAotetV9L8gpKxKx43pyfV
	63pNfLlBk3sU6tcv/bxX8/1pHP7cXafGgehZ+Lo35RcYQXjqtB1y8tROP6Z9jvHBMBhRZ5goL2h
	WjeUMyWT9NZ1dcChR6sgYLzVLnQ==
X-Received: by 2002:ac2:57d0:0:b0:4e9:ad85:aa09 with SMTP id k16-20020ac257d0000000b004e9ad85aa09mr7874037lfo.68.1680289949151;
        Fri, 31 Mar 2023 12:12:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTs7xrb3JbT2oC5qnyecTLJcHIrhwpbP+I6d+Wfo3Jaci9tWwy1Iq+Ij3x13faw8d7dCIp5A==
X-Received: by 2002:ac2:57d0:0:b0:4e9:ad85:aa09 with SMTP id k16-20020ac257d0000000b004e9ad85aa09mr7874032lfo.68.1680289948804;
        Fri, 31 Mar 2023 12:12:28 -0700 (PDT)
Received: from [192.168.42.100] (83-90-141-187-cable.dk.customer.tdc.net. [83.90.141.187])
        by smtp.gmail.com with ESMTPSA id v16-20020ac25610000000b004caf992bba9sm485353lfd.268.2023.03.31.12.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 12:12:28 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <3de525f4-096b-b0fe-aaf3-7992acb2451f@redhat.com>
Date: Fri, 31 Mar 2023 21:12:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: brouer@redhat.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, martin.lau@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, alexandr.lobakin@intel.com, larysa.zaremba@intel.com,
 xdp-hints@xdp-project.net, anthony.l.nguyen@intel.com,
 yoong.siang.song@intel.com, boon.leong.ong@intel.com,
 intel-wired-lan@lists.osuosl.org, pabeni@redhat.com,
 jesse.brandeburg@intel.com, kuba@kernel.org, edumazet@google.com,
 john.fastabend@gmail.com, hawk@kernel.org, davem@davemloft.net,
 tariqt@nvidia.com
Subject: Re: [PATCH bpf V4 1/5] xdp: rss hash types representation
To: kernel test robot <lkp@intel.com>, bpf@vger.kernel.org,
 Stanislav Fomichev <sdf@google.com>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@redhat.com>
References: <168027498690.3941176.99100635661990098.stgit@firesoul>
 <202304010239.Jw6bKkWC-lkp@intel.com>
In-Reply-To: <202304010239.Jw6bKkWC-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hopefully addressed in V5.

I obviously need to change function signature for all driver xmo_rx_hash
calls in patch 1/5 to make this compile.  I kept the RSS type
implementations for each driver as separate patches as this is more
reasonable to review and handle.


On 31/03/2023 20.23, kernel test robot wrote:
>
[...]
> All errors (new ones prefixed by >>):
> 
>>> drivers/net/veth.c:1685:43: error: initialization of 'int (*)(const struct xdp_md *, u32 *, enum xdp_rss_hash_type *)' {aka 'int (*)(const struct xdp_md *, unsigned int *, enum xdp_rss_hash_type *)'} from incompatible pointer type 'int (*)(const struct xdp_md *, u32 *)' {aka 'int (*)(const struct xdp_md *, unsigned int *)'} [-Werror=incompatible-pointer-types]
>      1685 |         .xmo_rx_hash                    = veth_xdp_rx_hash,
>           |                                           ^~~~~~~~~~~~~~~~
>     drivers/net/veth.c:1685:43: note: (near initialization for 'veth_xdp_metadata_ops.xmo_rx_hash')
>     cc1: some warnings being treated as errors

