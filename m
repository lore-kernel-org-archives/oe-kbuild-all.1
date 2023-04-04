Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172F63C07
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 16:17:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso1121939wmo.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 04 Apr 2023 09:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680625036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeoTfM9IE31WpQAHtBZQ6P4u+SGWj42bFgZh9//cw64=;
        b=UsJlJtglwVTL79cS4mjCtYkKJjqudOec+JGHg061L3CdSYYXu6+qAd0ezddFaqxDZy
         MpgWomkVyp0DB+YW7TijroJcRpSKWBLbcmYTg+7wZznCFH4/o9ZY98ER5Yjd8wGpr+J5
         rlmZMo4XnnwIswhtbZzenXBOaZq8qOpIph1t5/BaGQ2ln4ceb2Zd2VPIZF+z6Hb+prGR
         9RAPK8Hs992Dm8kGXbWIByDcO7XJz6iq+ooWSWG5vFO252ojZY7MA8Mq+PJy8mEOsASu
         39S98YHSrUFnMPzbaOiLzcAiVgyngDml4dX3xfo6gm8ZWAQgmwWb6relSNl7AyhydvBZ
         W2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeoTfM9IE31WpQAHtBZQ6P4u+SGWj42bFgZh9//cw64=;
        b=2D1e99wvDmfpK8crjVq7HF6AvV5HHWxl87uzANdDtfshvUY9B1tXHPpfYG7aGmspQ+
         KiG3ejOtFVwvJ6Zhj8hRrbo4p3Rk9qxnsOwhyGtVP8ujxDiZiWT2U23rPahlh4dstwnm
         I9ToIMr459vv6tJ7UNL+K3ceS7wzXD/mp8J0J6VbrbEvdL0aZGq5nvOTS/tJhjaeqjg6
         BVpuOoLOtB+b8wKQ9gmH9bsXAHkwS+hmD/LNYkyOzVKINk5R43ykgxfSWuzUzOvDnmih
         Qwpr1NqozCG5p+xUMW86lGHPZl2FS92dusCaZ7chwUNh9oi3dhWiO80ooxj/+lMlL6iG
         8OnA==
X-Gm-Message-State: AAQBX9fgkDeOTUFErsfqr5RJHO5hBaci0Mm89PYg7ilmFUvvsTuCYZlB
	Uh9ooxukResDzdDA4VYwQHe8kNQeDP5+DNbwoU+OxQ==
X-Google-Smtp-Source: AKy350Y2XCaAKou1W/+qWYHFfYr04Nbc2BgboeZyVoBHZKNLVUoSVpuBAPQsXO5iDjiO8H16/GXdQgp0JA3P8qo1hO4=
X-Received: by 2002:a7b:ca4f:0:b0:3ed:d6cb:d025 with SMTP id
 m15-20020a7bca4f000000b003edd6cbd025mr905141wml.0.1680625036072; Tue, 04 Apr
 2023 09:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304042104.UFIuevBp-lkp@intel.com>
In-Reply-To: <202304042104.UFIuevBp-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 4 Apr 2023 18:17:04 +0200
Message-ID: <CANn89iLt=gzdNF4owZS-hY79knRuaaBZtf6L44ZEc5BsJf8H6Q@mail.gmail.com>
Subject: Re: [linux-next:master 5025/9010] tcp_mmap.c:211:61: warning: 'lu'
 may be used uninitialized in this function
To: kernel test robot <lkp@intel.com>
Cc: Xiaoyan Li <lixiaoyan@google.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 4:10=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   6a53bda3aaf3de5edeea27d0b1d8781d067640b6
> commit: 5c5945dc695c54f2b55a934a10b6c4e220f9c140 [5025/9010] selftests/ne=
t: Add SHA256 computation over data sent in tcp_mmap
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D5c5945dc695c54f2b55a934a10b6c4e220f9c140
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 5c5945dc695c54f2b55a934a10b6c4e220f9c140
>         make O=3D/tmp/kselftest headers
>         make O=3D/tmp/kselftest -C tools/testing/selftests
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304042104.UFIuevBp-lkp@i=
ntel.com/
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it n=
ow.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    tcp_mmap.c: In function 'child_thread':
> >> tcp_mmap.c:211:61: warning: 'lu' may be used uninitialized in this fun=
ction [-Wmaybe-uninitialized]
>      211 |                         zc.length =3D min(chunk_size, FILE_SZ =
- lu);
>          |                                                             ^


This is not a false warning, I will submit this fix, thanks.

diff --git a/tools/testing/selftests/net/tcp_mmap.c
b/tools/testing/selftests/net/tcp_mmap.c
index 607cc9ad8d1b72cdcb96ca0d6fdb70900c9b9bc0..6e59b1461dcceaa658185071a75=
8e1006b48299a
100644
--- a/tools/testing/selftests/net/tcp_mmap.c
+++ b/tools/testing/selftests/net/tcp_mmap.c
@@ -208,7 +208,7 @@ void *child_thread(void *arg)

                        memset(&zc, 0, sizeof(zc));
                        zc.address =3D (__u64)((unsigned long)addr);
-                       zc.length =3D min(chunk_size, FILE_SZ - lu);
+                       zc.length =3D min(chunk_size, FILE_SZ - total);

                        res =3D getsockopt(fd, IPPROTO_TCP, TCP_ZEROCOPY_RE=
CEIVE,
                                         &zc, &zc_len);
