Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132D1EE003
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740041867; cv=none; b=ozGObn2nTVACSCzZzZMQyxyrfk+8FioTeLfcloCzVVEmVLZb0jLT7UZ/Nhgh4ygxZuKtCIQDqjipYXtiS60ogPtzSOrqvjZ6ZVhxl14Q5k9J8MwL9PtBC3erZZ44xXH6JmMZ3DQ647yeZOr0WgcH9sI2qVyarGItzF3Oy9l61sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740041867; c=relaxed/simple;
	bh=Xe3KW08CtnTWxDsfXEunDUYKjhgHZTGBlTQTiSWGgco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/qJLrwosoTKnu0hTIU9k+SvPGOYkm9n7is+8sFbVNq1ko3ICv8/l+PY5ySsSHiJKlzIbOIOMcdUdj13zvzDBZTsIBV8xrpvT59X0FxvjI5EOgYmnCCvE7pG3VeTY9dCCqbVAJ+QWJtCMqUMFRbWT9GdyLQEHfsGtcha2ZPn7qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6+Q1BCg; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6+Q1BCg"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-855a8c1ffe9so20273539f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 00:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740041865; x=1740646665; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJ1ukTj9LoDYtqtD5ecMxI2UxUwlSfIH76RTECIiysM=;
        b=U6+Q1BCggGNMBNArQ0N5AbrCMkBCiGEsesxI6XclLwcbXjWLu1bqZmIT1nhUsjJwBn
         HLmS8bOdD2qyKiV5uHeicWXPSe9Y2SMgHSvDR4mSIfosgXQaICFKcJnpW9V/NCTnqOAr
         Uu4I+MYj5Gc9I9XGcKZaCxikE7n8VOKjWAASqEYRXyZ4ca35xMOk3PuEe0SVvGuEtYWP
         K1Itibxfdzcsf33PhYIfwkLaW+kYY54YFp3fC0waQQfnYGF0O8ke72KfNxBBc6ibUayN
         cxXAc6aJv2tUR4a7+La/t/60OlIocr926wdrCN65nqzs/99xt9XHrPOT18lp3kIS6ws/
         +81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740041865; x=1740646665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ1ukTj9LoDYtqtD5ecMxI2UxUwlSfIH76RTECIiysM=;
        b=gdaI5mynDeTAYWwZdQt9xgvpATeKLCHJGq2CLGjUnHPHqL2WVC5DOV7LXTxbqINv+p
         xxnUaFkARuq89202E/vuJRDCu+SV9N4utcbhAtNcsCIXePvP3KiLeqrU91JCZXYaVHbV
         L/wGnmAkpp3+wj9xhGTHpt2d1S54/K4EwkjWyia7oHBlxN8OwqcDqQzhjSdnX4uFkxoP
         vaUqRNRw4HiJibHPag96Kd4eUp3oVFgHfDF5JCObjAEzul4p2bJ3zFQMvieslKaXlxSD
         Ong9z7SDOdreuY6xMiRMgVyKfbTYd6GC9f9xZc2uO5rgPCXXFDJk/A2MP2rodcmSnOwf
         riYw==
X-Forwarded-Encrypted: i=1; AJvYcCVpYnX1r3BjPti/83TZoJaxsRyWKVHO31HKzSz9y3HxUZpK6jF71rVuqh0royGQlbehb/EB4kuyOdim7QIK@lists.linux.dev
X-Gm-Message-State: AOJu0YwDfdX1AQqRfmnqlLMa8BNcROs2ZO9gaUNCf66WQ85rkJ1nYRgD
	uXOf8m32vKv6f8skbW1D4YU13TuSWvVhvulQaxPs5mNQyQ+fOhHIFMuaxaCAcbOCZGus0CRxyyu
	KrG+C2YpyTuAGZcrAi3DOgWRLzH8=
X-Gm-Gg: ASbGncuTdN5FkgyQT5l0GRbnhAHjcJNMhT3Y7U/Uau+S82x3tHvA9mSV1IN+7nYkzUZ
	gZm76wZunKkzuavrVN5zoQcsddBUL1SjU7cW9C3mEmyyQdjdB94Vv8Q9bkVhlfD9G5r5iFvcL
X-Google-Smtp-Source: AGHT+IFqzNFKSbcp0m+sVNShsOIjZnefnBiSt3e7dTYZO4FvWSEE9vIyYmmpnmKMzyBwF8FIEZfT3i4wI6Q0Vt6JVKE=
X-Received: by 2002:a05:6e02:2686:b0:3d0:3fa2:ccfd with SMTP id
 e9e14a558f8ab-3d280771e1amr219813525ab.5.1740041864809; Thu, 20 Feb 2025
 00:57:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219081333.56378-2-kerneljasonxing@gmail.com> <202502201843.xA1qZbKX-lkp@intel.com>
In-Reply-To: <202502201843.xA1qZbKX-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 20 Feb 2025 16:57:08 +0800
X-Gm-Features: AWEUYZkZEa_RTXX9eGIodABGhTE06_-yx8MFYAYIY0b_nk5Ib5cNvbHdq_7paqg
Message-ID: <CAL+tcoC9nboQ9UNeP1-g4nQKqXg+fLDu68RHjwKRx97f_iuCZQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/2] bpf: support TCP_RTO_MAX_MS for bpf_setsockopt
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dsahern@kernel.org, kuniyu@amazon.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, ykolal@fb.com, 
	oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 4:52=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jason,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/bpf-sup=
port-TCP_RTO_MAX_MS-for-bpf_setsockopt/20250219-161637
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20250219081333.56378-2-kerneljas=
onxing%40gmail.com
> patch subject: [PATCH bpf-next v3 1/2] bpf: support TCP_RTO_MAX_MS for bp=
f_setsockopt
> config: x86_64-buildonly-randconfig-002-20250220 (https://download.01.org=
/0day-ci/archive/20250220/202502201843.xA1qZbKX-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250220/202502201843.xA1qZbKX-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502201843.xA1qZbKX-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    net/core/filter.c: In function 'sol_tcp_sockopt':
> >> net/core/filter.c:5385:14: error: 'TCP_RTO_MAX_MS' undeclared (first u=
se in this function); did you mean 'TCP_RTO_MAX'?
>     5385 |         case TCP_RTO_MAX_MS:
>          |              ^~~~~~~~~~~~~~
>          |              TCP_RTO_MAX
>    net/core/filter.c:5385:14: note: each undeclared identifier is reporte=
d only once for each function it appears in

We've discussed this a few hours ago. It turned out to be the wrong
branch which this series applied to. Please try bpf-next net branch
instead :)

Thanks,
Jason
