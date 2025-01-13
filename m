Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9310E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 00:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736727135; cv=none; b=a/F2fiUX/UkyFMlBQI91Ibz4ubKmQwUgYD6QsCF8GShjnCvBhMK0tuDX1kuvDMQ3YqiKm9y0QpztOrAqFxEV6TwUaGzYNvLb7ZN+Vh0Wt/LetheLcgX+H9LVcQPBvPU/cfokP0Q8ogC4iWHJnnsiokFyPU/bnIXq8TkbhWFasU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736727135; c=relaxed/simple;
	bh=TMlTbizgnR+xTCZnuoTxQWuoOkPGbMGynCYA2mYCmRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gc0t6fej90IPcI18hPttf9d/O5vYggwFztBxMyQgzbH3rBOVMBGqKsf2GeO7cfMdS8WsEFPXrVqpqzMn5n7AfwxDWdRX9cFUr+vs2hX/H1sthlHsKvmcvrRFAmSk1VN35/350aQ9m0kJc0lLWaX+I6R1kBz6KOarxqHnghPYa68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrK7Gt45; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrK7Gt45"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-84a012f7232so154195539f.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 16:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736727133; x=1737331933; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cnJ53oIhTglfaz80ugv/pgKzPSiLe7spK70sPzYX4E=;
        b=PrK7Gt45nrdrWZYQ0Mc+u8ya3jrUGiobRPoIEkoR39tqnK76XTGsOBGegH4j+Pa1/6
         yShyI3jaVrof6E5XfrqJ0jc2L5kV+ULMYYEuOL4sWcZ9Si1XlNrPvBBpI/50cOOkFmA3
         xC6z3IqSNZA3rAzD4D8J/WuHBLHug44+hg9xBD9KezZUx91DdzAw3vCD9aHETfPDIIRT
         WTijOyI6uo4Dp4/TNpraP64s7ll71lnzyHk4toGR/CaZgKgB5XMfM+US6HRqjHLOzFsb
         B/xfrIaoycgBqi+goXIpYv+KgLZt6Jgn6uMpqRzMOZ6vpAH/9P1hMHmXuWLzeol3pQE2
         rc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736727133; x=1737331933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cnJ53oIhTglfaz80ugv/pgKzPSiLe7spK70sPzYX4E=;
        b=HbyQM2ctXtAu+OmKrnWJzJ9eqXWFRiNhed0+Ujc3vqflC0PhOthzxx/3MpQKMv9MVi
         W5CqwXM3Vl/lDUT0+PRpR6cdsqPyzBGGV29xDPQ189UUdsGM28epZWbJutpiftXDLq/O
         yWdHT0tjOIaMABMp0AbmBGDtbT7XE0QdmnPv439xc0QMDW3uRR6RYgcRSBvypIrV/q3F
         LUqpK/XFOFEwgsrtpGUI4pg8Fvkzd1z61bnA8o2nxui7GPMDQ0QtwX6GsV5rhUonIMoF
         tN3C0T22pOf908LVdMXribyk8niEu0fcpFlcNUopKJqYAQ3hWI5PqQHstKS9Uzna1DNy
         Tpdw==
X-Forwarded-Encrypted: i=1; AJvYcCWW2VOM5GtSvedFdRBVbdEGeSQ+GYblogKRgmUncaDpnEYfHiRqeh45HlwyS1fE5ht3ttq6Nkk2qj1Inx7k@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+l+fn55EHOR6nOOlux7yRJ+OoSHuyV7sDi3kuuO/S2qy6lasX
	WIHMA6G7wB5YTL9sFqpLHgDWy9PwaeJrQawtmc03bhBMwMTw4TcDI632gGzlVlJxWKBHvkw9yXK
	coZcdIVdaBD7O+jVoar6kt7VGRy4=
X-Gm-Gg: ASbGncsBpIYZyfva2qL8XFjw86nODGlY5tmKNpdQbtSLWnA/t4uDINKk7fLabzWSYNB
	x/FkLSP76pp87vW59Fdnw0eJrEYOiep/gY3I1AQ==
X-Google-Smtp-Source: AGHT+IGk8dqDNQZ+mjNd6puxoUiqimP8vd2vEum9Ue7CkZ1G4OHaDEjH5RRs6SCz0wf9/v01BbY3JYfjAXvcG/l1jwk=
X-Received: by 2002:a05:6e02:1a8a:b0:3cd:d14c:be69 with SMTP id
 e9e14a558f8ab-3ce4b212f1dmr96833635ab.11.1736727133078; Sun, 12 Jan 2025
 16:12:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250112113748.73504-2-kerneljasonxing@gmail.com> <202501122252.dqEPb1Wd-lkp@intel.com>
In-Reply-To: <202501122252.dqEPb1Wd-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 13 Jan 2025 08:11:37 +0800
X-Gm-Features: AbW1kvbp1NkkMKbd-_UYgUVRy7aU5R7K_OeYQ0U2gfRHv-CnaHRd4pm1sdL37Sw
Message-ID: <CAL+tcoCvO8xapF55_TKj-rs8jJvSRRQ=EQHiZZvrwSPYoVFc_w@mail.gmail.com>
Subject: Re: [PATCH net-next v5 01/15] net-timestamp: add support for bpf_setsockopt()
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dsahern@kernel.org, willemdebruijn.kernel@gmail.com, 
	willemb@google.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, horms@kernel.org, 
	oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report.

On Sun, Jan 12, 2025 at 10:50=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jason,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-tim=
estamp-add-support-for-bpf_setsockopt/20250112-194115
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250112113748.73504-2-kerneljas=
onxing%40gmail.com
> patch subject: [PATCH net-next v5 01/15] net-timestamp: add support for b=
pf_setsockopt()
> config: i386-buildonly-randconfig-005-20250112 (https://download.01.org/0=
day-ci/archive/20250112/202501122252.dqEPb1Wd-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250112/202501122252.dqEPb1Wd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501122252.dqEPb1Wd-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    net/core/filter.c: In function 'sk_bpf_set_cb_flags':
>    net/core/filter.c:5237:11: error: 'struct sock' has no member named 's=
k_bpf_cb_flags'
>     5237 |         sk->sk_bpf_cb_flags =3D sk_bpf_cb_flags;
>          |           ^~

Strange. In this series, I've already ensured that the caller of
sk_bpf_set_cb_flags is protected under CONFIG_BPF_SYSCALL, which is
the same as sk_bpf_cb_flags.

I wonder how it accesses the sk_bpf_cb_flags field if the function it
belongs to is not used, see more details as below (like "defined but
not used").

Thanks,
Jason

>    net/core/filter.c: At top level:
> >> net/core/filter.c:5225:12: warning: 'sk_bpf_set_cb_flags' defined but =
not used [-Wunused-function]
>     5225 | static int sk_bpf_set_cb_flags(struct sock *sk, char *optval, =
bool getopt)
>          |            ^~~~~~~~~~~~~~~~~~~
>
>
> vim +/sk_bpf_set_cb_flags +5225 net/core/filter.c
>
>   5224
> > 5225  static int sk_bpf_set_cb_flags(struct sock *sk, char *optval, boo=
l getopt)
>   5226  {
>   5227          u32 sk_bpf_cb_flags;
>   5228
>   5229          if (getopt)
>   5230                  return -EINVAL;
>   5231
>   5232          sk_bpf_cb_flags =3D *(u32 *)optval;
>   5233
>   5234          if (sk_bpf_cb_flags & ~SK_BPF_CB_MASK)
>   5235                  return -EINVAL;
>   5236
> > 5237          sk->sk_bpf_cb_flags =3D sk_bpf_cb_flags;
>   5238
>   5239          return 0;
>   5240  }
>   5241
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
