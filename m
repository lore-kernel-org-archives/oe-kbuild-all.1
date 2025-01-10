Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6075815E90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 01:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736471329; cv=none; b=L1yauYBOMlq1oxuKVjsSedR+jIUL2AZW1LBpeAzS44AGpAXnC1z4xQGMFPgQwtkBcMoV0uAi18seu6sO8CbaF4vBghu+WPVIQw/jmf5te/K2CxeGpe6kT49JqYxyv+9pVOzWbOOKL8/AkM78YKARiPQdumG9FD2T9YcZlrvZ9dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736471329; c=relaxed/simple;
	bh=RDlqjCiRkkhK/e38jPlhC2wBfRvBVv4rxLWm2ebzzH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vd4OqY4JAaMa8BV4ccM4fZcfM+y2At2DBiehSu0JAD2wXGXcZm8vs9Q6zw12ppdezJ5h4U6tTkl3t8uFvGNidcuHAO3Ct0/r4e3hd645rPgRqoKIZpyFygGBdd6rfrX1kXDs7r+EiwzIw2LxaLAE2FrdQxMoaKtuOYBzMqmcJnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMmct3/Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMmct3/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D1FC4CED3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 01:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736471328;
	bh=RDlqjCiRkkhK/e38jPlhC2wBfRvBVv4rxLWm2ebzzH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mMmct3/Y40Dpm3gZ0WhZnobvu7igtut/vfLO6+G0V1JnU1TJAGcB/EkH5SfaAkyEH
	 DZHKH3iN23FZhfsMPCms8YxB/9ccnnoqTNYtdaDaWC7gaYg2FcYQQ7gzAMpiHIffE6
	 3pY5B2dXC+80HQsIQANejO/yMSJJdFRqRoxfV9acGbEgqqo8MK+LxtLq1qeioPCwL1
	 3OVpXOJYKlQBJHIj+wKCcigwWC3zTh1T8n8jo1tvwh9bDbhAwnfxgKbRlXeCotwEW0
	 6gfYu4Rp7Eb1b2VXhTI6ix3P8GfheKarU2/eXa3L2kKfFpKu8MHZBsgEX+yMXsTtiQ
	 68saWfoMg/pNw==
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844e161a957so111302139f.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jan 2025 17:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUmtQ05ZU1azqZcPF54L5E1sINuNe2uEvQuRh2gcpalWxk8J9Uvoc5posqQF3E16+4wwZq70SYUEP21uwX@lists.linux.dev
X-Gm-Message-State: AOJu0YwerVS0yDEBxakmgpPqiWlrdcWadtbps2JNzjdyaXtM9XOewxff
	/+gk3kZKoGf9ZIaQ8WGF2wbfDdqw500pueWvWWIGrY8bEqdy4H2BgZebYR2ZajYCEhiAq52D6OR
	AcKL5k9Yw1xiU7gZj+TK7l+lqRHA=
X-Google-Smtp-Source: AGHT+IHwCjHrEBvPJ9mfelms1VvOaRKWT9lW3aZg+HHZ2TzuKAAbCpZy0/k6TLVbPjOLJXhYF16+oVDszL1iQp+hORI=
X-Received: by 2002:a05:6e02:1f02:b0:3a7:c5b1:a55e with SMTP id
 e9e14a558f8ab-3ce3a7a8aa1mr73496695ab.0.1736471328212; Thu, 09 Jan 2025
 17:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250108225140.3467654-6-song@kernel.org> <202501100757.HDb5slrv-lkp@intel.com>
In-Reply-To: <202501100757.HDb5slrv-lkp@intel.com>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jan 2025 17:08:37 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4xKCeZ9GoeVHx47GiTbwCU=b7G3orkcULOq7aH5TKo9Q@mail.gmail.com>
X-Gm-Features: AbW1kvZcu9TPeqs5A-WIrB4rbn26UVknvaDOrBfZ5EuYERQQUajjnAMrLj_wVw0
Message-ID: <CAPhsuW4xKCeZ9GoeVHx47GiTbwCU=b7G3orkcULOq7aH5TKo9Q@mail.gmail.com>
Subject: Re: [PATCH v8 bpf-next 5/7] bpf: Use btf_kfunc_id_set.remap logic for bpf_dynptr_from_skb
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	kernel-team@meta.com, andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, kpsingh@kernel.org, mattbobrowski@google.com, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, memxor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 3:56=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Song,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/fs-xattr-=
bpf-Introduce-security-bpf-xattr-name-prefix/20250109-065503
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20250108225140.3467654-6-song%40=
kernel.org
> patch subject: [PATCH v8 bpf-next 5/7] bpf: Use btf_kfunc_id_set.remap lo=
gic for bpf_dynptr_from_skb
> config: i386-buildonly-randconfig-005-20250110 (https://download.01.org/0=
day-ci/archive/20250110/202501100757.HDb5slrv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250110/202501100757.HDb5slrv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501100757.HDb5slrv-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
> >> net/core/filter.c:12071:1: error: return type defaults to 'int' [-Werr=
or=3Dimplicit-int]
>    12071 | BTF_HIDDEN_KFUNCS_START(bpf_kfunc_check_hidden_set_skb)
>          | ^~~~~~~~~~~~~~~~~~~~~~~

Good catch.. Fixing this in v9.

Thanks,
Song
