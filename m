Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE0B2E972B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769933867; cv=pass; b=s1AWBl/InfEIZtAMEVIlxJeFwcgD8iGZ0w/6QYio6m4zLHFcLTn4IYX4yWQd+zIVV0HOVOmJhb8n/rSamdy2IxPFMUNZPin0rqXJZHvji3Q2WYWP9K8Dl4Rg8p/OFsHXa1+9QrU03JU3oADyl8lY6CkiJbMXZrA57lXZXCo9VKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769933867; c=relaxed/simple;
	bh=3re9rxV/8dh5KL5dWJSWC+HvSoBzJ1kgExDXoj22Fd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+NJBOIa8D7+rtnb1jgUZ0LkXy9yD/xv8A/vk8d3qI5xjNcFxgmuuBm5+xRL0AY7Ew0iYqb2xnK+GqUwYJK1kdN6E8OJ+Yvk8a41Rz7pfWDm/yA7Admv/3q9WaayxYrc8b8AzaObygl7fR4TQH8kYh/HV2aOWXV+WgwS1wJWUH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cFgsGSts; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cFgsGSts"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50145d27b4cso40125791cf.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Feb 2026 00:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769933864; cv=none;
        d=google.com; s=arc-20240605;
        b=JFsHuE8t9vMhM4XyKMuur2z/rmXisUZOi/sW7eUjE1LJqpXZuKoE0V2kARvHez3R9f
         QTiLInbkEoahTJKCvHsQ5Hi08HJfSKDgergldexC/Z2a74GCpcBJr8F3lrqXSH3yZ+wp
         barNV/OXUjgvqMGttcEGFHqQIOSmHu8yHIs66OH7gjcYe/+q63hpmQjdrEXWKLpAPWL2
         utT4qTkH9BSIFmLNVy5XJgW3WDcuVtNsZo6/rQloDN1Eurgdc151vVGPAt/9r4F2oQPe
         PJfFh/LewW/kikCG8e1ov+RGObuomAcyhyyxeVLI22PuWC/pf4CSxSnDUq1Km5g7630H
         WG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PB0m9gxhrqXIUqCxYwXzor327qBnTXWpH9xmdwbkgxQ=;
        fh=SyuvhfKH4Yl0sDzDYIF/hc5x+mlFe2zP3116T46br48=;
        b=ljZjpc3SFYJtABEok5tordNaBK0hcLV7bthHMQOLfJvU2MXRUPc2n8Ze9vcvGN/Q2X
         FMKL97LZ+Ee/h8ENJmCd3LvF2lE5gyShl5l9Pr15WdZQ/volhZ26qbP71V6/Jj9n0vEH
         N9ScjI2RzemdvT2i4IJuHmgd06W2oKh+eeE6Mt+zMDgrl/oV02C6HwlBk7bxb04IyMUs
         DrDXjpG223LWD+vYDopZ8qCSYEzLhapaX4/botdJ2r2gX8CnHs+d43BZEZ+Gu2xy7XTO
         WPM2caj2gJ92tG0cixz7wFJTCSo64g+VC933Pz9S0FPJpEprhIV4JJe3AWOdO/vdGNjr
         3HPQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769933864; x=1770538664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB0m9gxhrqXIUqCxYwXzor327qBnTXWpH9xmdwbkgxQ=;
        b=cFgsGStsxKPlnpfw2xvMYkNLQDLD5mjFUlIQyls62IqclaFXwl4L2jdv3nf1ckUztS
         AVAve/QRSYyotXDfPgbJnit+eNL6hddTTisZhJyWAD6DfYqqw9iSarT5lPaNP5thfu7G
         Cxd1x5ct7i/LTjli4tl/LYBc+8sBUSQiWzVP01nAbbpNo1yNWrEw0m0SIFV1X+Gn0Kb6
         sHjb4oZzthLYSfqxxA/9ujwCHfoeGctISKBUYsh8KVEFBiOPAGbmwtW2h3fDdAWEzYIE
         zOfmPhtHppNYslfnf3IDbKQE/1s5SfSaKzEQrVjJkvMqdiqR1Q86rqrN5ZtVVGracT9Q
         iEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769933864; x=1770538664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PB0m9gxhrqXIUqCxYwXzor327qBnTXWpH9xmdwbkgxQ=;
        b=Kfqo+VEIyUtCEp8immwEO/4Ujvz5itTCr0JJXPD1kkKV71b8Ek3cJLRSwyYtMAF+BJ
         TYFLgy3TS4n09e5s+2NbjecpfKco37Xr57TU0cP+IQTa0vjyk90UH2M6RRX55nFGbTVT
         KmpgUi/f1wc5OggJjbgF2N+zwml32vPQXdssqEUMm3P4lDBi2HlqLTTtt2JevyPOhUTm
         /JS9hxL01E9/TItjyScaxAyMSFY6kn3FCu39u5OYTY3X17vO1f9sZL4ttTKIfS+/mZ8r
         OUKs/2lx4d28OiqTbGWgdZNYQC1cLUgo43GJcGiLH85nBN1XlHaOqanzBZ8AvK7UFg+m
         BGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVIhqb9jq0JGvr6UO0uGC6JZ93y0ywHtINHMoSkIH5CGDj4DQ1kDXUPltShbqISBwmbdKMhgCaDt9SFJczX@lists.linux.dev
X-Gm-Message-State: AOJu0YwZP0WY/tX1YuzNdfCrf55vKHRSh8ztFtRwPsNSuUQHndTzwSYu
	7xjqzQP7K3Ccy3Oiu6bkY5aUwDxt3l3lPKl066xGE0nlIZtCV/fazxtFroeBDFsmBI/nhs2X4U6
	AFfyKZx0WWx0tvm+s3HQMWZRLQOi6w0zVyXVobRYS
X-Gm-Gg: AZuq6aK10xj9FNx8hjo9MdMgNXBLenMmhzlvsL7NZNSdn48lSSLIXR+M40AzDL+VDIL
	xT/bSm9WhbqdkhSzMrPVUzRjEB4+dD6ePwQ7PZdx+2hssVr5W5pVdmQ0IOCBBmXf8RC+CtTG8ps
	KclK6BeGBLpFys0osYNnsugnbRQi6UMlAKw0Ijezb8hWawDm884gRK22S+nRg1DFR5RjNLPO/Mw
	yRUoRg5t+/2O7d0aWvHbqvRrbYop5HcKkjiF/YPixrDEL6QZVQvi/hwhImAunh1KnI8OyQR1MdU
	puXtqg==
X-Received: by 2002:ac8:7f49:0:b0:4ed:5f45:448a with SMTP id
 d75a77b69052e-505d212da0amr132861661cf.6.1769933864353; Sun, 01 Feb 2026
 00:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260131171627.1852894-1-edumazet@google.com> <202602010830.7VDNDITy-lkp@intel.com>
In-Reply-To: <202602010830.7VDNDITy-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 1 Feb 2026 09:17:33 +0100
X-Gm-Features: AZwV_Qhyp2z7W_bgyb2YmyDk-fm0N4Cut2JyNVHPhM_8aq_boW5IWNZ1Z4-S3EY
Message-ID: <CANn89i+5d1-HqBPwr2c5U0dFw7WGg9ZOc3mYD3GPtanzyyBaQQ@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: move __reqsk_free() out of line
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 1:18=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/tcp-m=
ove-__reqsk_free-out-of-line/20260201-011758
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260131171627.1852894-1-edumaze=
t%40google.com
> patch subject: [PATCH net-next] tcp: move __reqsk_free() out of line
> config: um-randconfig-001-20260201 (https://download.01.org/0day-ci/archi=
ve/20260201/202602010830.7VDNDITy-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260201/202602010830.7VDNDITy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602010830.7VDNDITy-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permis=
sions
>    /usr/bin/ld: net/core/request_sock.o: in function `reqsk_fastopen_remo=
ve':
> >> include/net/request_sock.h:137:(.ltext+0x103): undefined reference to =
`__reqsk_free'
>    clang: error: linker command failed with exit code 1 (use -v to see in=
vocation)
>
>
> vim +137 include/net/request_sock.h
>
> 9403cf23025880 Guillaume Nault  2019-03-19  133
> 1e2e01172fd11b Eric Dumazet     2015-03-12  134  static inline void reqsk=
_put(struct request_sock *req)
> 1e2e01172fd11b Eric Dumazet     2015-03-12  135  {
> 41c6d650f6537e Reshetova, Elena 2017-06-30  136         if (refcount_dec_=
and_test(&req->rsk_refcnt))
> c34506406dd5cf Eric Dumazet     2024-06-05 @137                 __reqsk_f=
ree(req);
> 1e2e01172fd11b Eric Dumazet     2015-03-12  138  }
> 1e2e01172fd11b Eric Dumazet     2015-03-12  139
>

Great, time to get rid of net/core/request_sock.c

I will send in V2 a series with these 3 patches before moving
__reqsk_free out of line.

commit a79b5cb06e365dc8d3e1fb4872ec861266306c14
Author: Eric Dumazet <edumazet@google.com>
Date:   Sun Feb 1 08:12:11 2026 +0000

    net: get rid of net/core/request_sock.c

    After DCCP removal, this file was not needed any more.

    Signed-off-by: Eric Dumazet <edumazet@google.com>

commit 58ab84ff63932e13f1c59aa45493333c04e6f4df
Author: Eric Dumazet <edumazet@google.com>
Date:   Sun Feb 1 08:08:40 2026 +0000

    tcp: move reqsk_fastopen_remove to net/ipv4/tcp_fastopen.c

    This function belongs to TCP stack, not to net/core/request_sock.c

    We get rid of the now empty request_sock.c n the following patch.

    Signed-off-by: Eric Dumazet <edumazet@google.com>

commit 1718fc81eb4742c1eab842852e600b906a08fded
Author: Eric Dumazet <edumazet@google.com>
Date:   Sun Feb 1 08:00:42 2026 +0000

    inet: move reqsk_queue_alloc() to net/ipv4/inet_connection_sock.c

    Only called once from inet_csk_listen_start(), it can be static.

    Signed-off-by: Eric Dumazet <edumazet@google.com>
