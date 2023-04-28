Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175E5CBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 16:19:03 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-95678d891d6so1861333266b.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 09:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1682698742; x=1685290742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVN1XAdeRtzZczE1pl99FKVVPYo2NA5UfAXorfmQJT0=;
        b=VBMuYvQCFxKZzjyb/wBiio3IjirlvUZsafJTrBaszhI8cr6gJyo4GGUBPbcValTnJt
         MBkXK8YiYEBDR4wWv89NOr3v6V8gQJmcgnsEiwBIC3MQLPUSikcygFYQ97JqVoyQeWWr
         C+wfeBSMczAsTTI3yFskceAsNG730TT3/RrCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682698742; x=1685290742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVN1XAdeRtzZczE1pl99FKVVPYo2NA5UfAXorfmQJT0=;
        b=i93hf0AR2Kscb/MPPBrITKN13zpRtxENXFO1iyyT42w5nduLMYFdz/4rsjCuWBYv/L
         tAXG30q6l3Rg8HPE2dVup7YAR4enqA2OhKsfijSh0HgvXfFo+ZkxVfOWnT97poK4+otl
         JKcLSwjbIYLxpFCmThcsFL5c13Qw8GC8qj/b+seMe9GEuQ4dxJSkVadWFceICPTfvB/r
         q9Agn0gp4JYSofVthIL9ws2UWeEOY+c5Kf5O7lMg8VuhayLFLO/t6BYOHQ2G41Fo8DPt
         Und6e5UCVWOKViTHvzHdiY3aet2MLPmECCyLlhWKi13UhWMBTuD+mGj1BqltNuwNXB3P
         nO+w==
X-Gm-Message-State: AC+VfDzC1MHHLbhOUAVtgLFKxUmjUmarncQo0xcvk27OnIPoTnMywyvI
	L9swTGJYEblo6JulxtBKlzSceBtN8VI1ficjJ+hmeg==
X-Google-Smtp-Source: ACHHUZ5iTx8YOhUNPs04ewi7egHD5mJN8NNtsIEsxOiFHtoufuffH6iPzeZYFu+Lnm+GnU4zPA16DQ==
X-Received: by 2002:a17:907:da4:b0:94a:96c4:2361 with SMTP id go36-20020a1709070da400b0094a96c42361mr6209491ejc.73.1682698741845;
        Fri, 28 Apr 2023 09:19:01 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id se20-20020a170907a39400b0095ef737dbd7sm4149637ejc.93.2023.04.28.09.19.00
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 09:19:01 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5068e99960fso17619623a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 09:19:00 -0700 (PDT)
X-Received: by 2002:aa7:ca51:0:b0:509:f221:cedc with SMTP id
 j17-20020aa7ca51000000b00509f221cedcmr5009557edt.35.1682698740150; Fri, 28
 Apr 2023 09:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel@mailbox.org>
 <202304250319.8IOPqkLH-lkp@intel.com> <f40dfa8b8ef8a85b14645fc797875fd5dcdfc42c.camel@mailbox.org>
In-Reply-To: <f40dfa8b8ef8a85b14645fc797875fd5dcdfc42c.camel@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Apr 2023 09:18:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiPxPOg5-G+CaHiyNt_QBqoWx0bt7UGCKSdHyd42fQkpQ@mail.gmail.com>
Message-ID: <CAHk-=wiPxPOg5-G+CaHiyNt_QBqoWx0bt7UGCKSdHyd42fQkpQ@mail.gmail.com>
Subject: Re: Library: [RFC PATCH] btree_blue - a btree with linear travesal
 function and more
To: liuwf <liuwf@mailbox.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@purestorage.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 6:27=E2=80=AFAM liuwf <liuwf@mailbox.org> wrote:
>
> btree_blue also needs to mature (debug, stable), and some APIs are needed=
 to
> give.

You would also need to include what the use-case would be, and
benchmarks for a real load.

Honestly, pure insert/remove numbers are kind of pointless. Most users
that care deeply about performance also happen to care about locking
overhead etc even more, and so high-performance users often need it to
br RCU-safe too.

Finally, we'd want more of a background for you before adding anything
like this anyway. I can't find this email address anywhere in the
kernel source history.

          Linus
