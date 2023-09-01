Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40439476
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 09:26:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so208165366b.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 01 Sep 2023 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693560375; x=1694165175; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aFmHZTLlIQkbBzornOPgrV8aRoSDhdsHZyavX+Ey+So=;
        b=KahNk0owQP/0/+Lqegsg5aXmHCXqwzVU7gpdl/CJOiwVSXwFMUjeG5K5WbHWCkxmbR
         eWOduoO8Mij7rOE0V7Y/U0mLP6e1+kArBNeHetzP9/nD7rvuxK5GtQ2TRwz9bnC1sQUh
         xiqJkCZRupW05gNoXhIMUC7dIEfESfIjIhTViM60n4ai/pcHcxeYR5GmqYHUFal6OMyJ
         LbE8BiL8MGGIUBvjIGSXGxKg+GKvTy684LxoyPAAFMPfePIyAtu8M0zn0thKbNSrg52I
         PkQ9lzrJ8ko3gOoCJObDnM5ylaBgIgMrw+9FkutJFihDBJGFAuCPRmfXHp73eY6L9IM/
         KLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693560375; x=1694165175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFmHZTLlIQkbBzornOPgrV8aRoSDhdsHZyavX+Ey+So=;
        b=DrBnUlITCcoORzsqoI3/1pAKc+MGvg9iaNGZgHkk+jMWDWeFmAxB3avFYU3e+/Br/U
         bQvdVzIQmkYTi1nxcKP2+ete73yv25GJHK0je44N4IDyCw9wRMHyHE+b9YaK/luLqlXX
         g9PPjcnLEDlaekzuCkbn2kSA9lqjdQ1sPcsN93UaMTviF13ow4v+jBMizewz4HF1JGT6
         zjhx6sHyTWZFUa7WIp6WmtNpHXSFfQPhmquD8oytLTttmKHGNeK/45bFW5skVrSUPUCK
         2DTSu82EgQybqRApP1gTTOIx395vu76zYHv6E+QsmElbfE9mHtREV3S/G8NN3gzxdQfN
         lblw==
X-Gm-Message-State: AOJu0Yz8Hgs4XnAA6Y6nql5N1E4UNuD5jrTK7dSa7D8YQ3dBNDSi4j4r
	yMNRKnBQYNgKaP2ucIYbzp8=
X-Google-Smtp-Source: AGHT+IHehlB4aC9ZcuCGZ1KNjx6dilk4rgHXOqoik7CTyzTtojx4tshpzbkwbfQmLuov5rA7oLztzw==
X-Received: by 2002:a17:906:2249:b0:9a1:da9a:f1c5 with SMTP id 9-20020a170906224900b009a1da9af1c5mr1163975ejr.45.1693560375260;
        Fri, 01 Sep 2023 02:26:15 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709060f5500b009a1be9c29d7sm1754642ejj.179.2023.09.01.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:26:14 -0700 (PDT)
Message-ID: <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
From: Eduard Zingerman <eddyz87@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Date: Fri, 01 Sep 2023 12:26:13 +0300
In-Reply-To: <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
References: <202309010804.G3MpXo59-lkp@intel.com>
	 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> Hi Eduard,
>=20
> On 9/1/23 2:05 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git mas=
ter
> > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add d=
escription for CO-RE relocations
> > reproduce: (https://download.01.org/0day-ci/archive/20230901/2023090108=
04.G3MpXo59-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> > > > Warning: Documentation/bpf/btf.rst references a file that doesn't e=
xist: Documentation/bpf/llvm_reloc
> > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that do=
esn't exist: Documentation/bpf/btf
>=20
> Could you send a follow-up fix for bpf tree?

Hi Daniel,

Will send the fix shortly. Strangely, I did check this syntax locally
before sending the original patch, and had no warnings reported.

Thanks,
Eduard
