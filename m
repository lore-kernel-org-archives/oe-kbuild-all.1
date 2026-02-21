Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B8A2DECA8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771667889; cv=none; b=Rmp1AHR8QNAKOoEL70nl5xleemWshqAWxSlrQIaKuqdH6g83njnNXOYNSKvxcErfnAiLllXgjFnARtoIaoy5lFFh1akwLdziuZ8l1p3OSI7WtdIaSJh7970dftB8DTfd8d7JlrBK/nZlfECQ6c2Q1GUnGzmsfsC8aEACC1h0vfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771667889; c=relaxed/simple;
	bh=yeFPaj6dVZUGfQ6mk7TVN6TVYypxiVGLknPgkecZgsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DG1UtGPp3GsREzMp1itxFC+pBvjsBVJKfxmgkwzScVHjXuy9XxJyaU/J4vdgPZuw9MTVSiheN1HMY59VD+S0DpnEvm1J6ijGi7Jj2v1OPb/l/T1n5Eago4MViJz87fTgp2kf8YXEKockqZ3ctMWW2SbVzTNOKoBlBccUtPBrpA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aIeMlcOG; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aIeMlcOG"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43767807da6so2061388f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 01:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771667886; x=1772272686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=;
        b=aIeMlcOGEncsdeMyNJysNMlTBBmRu3Tu9rLKSSsaDJyZo9SNnozfBh8hr1a1Noiaro
         WEbJc09lriV4hcCcnd1E8RoA9CDU4BL/tEOEMY9ZTuZfVz2LJDS06QXC85ZKq/Sp08Bv
         QW9V8xhxarOgL67ZbDVRR49GU4nqRZUeZL5pYtf6c/t1T++MnxRpU2qd7jvZCtpLWxdV
         tcjl6r3NaexwioEQuLjs1M8T6x1/BP2OICUJDvwHq4+2GWMmcL3l8NYP+4woEyLRy0QV
         Ymiit2V8EHugj9fjFaYv7mk0UkxLK/UwCcsno/od5OOErkwrH6KUJGK76SL29GVcG38D
         bRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771667886; x=1772272686;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG95ysl0cBzDn6owjLxKJa0jdHI3ZVF2zQtfxEizLIg=;
        b=uIgKw69IKDHOlRtefCWAYaZzH9IY3NccsC7AmdSAThtMWe2En1qooWZAYMNAr6pzaK
         YLpEd8Vj3HlmRzkmzRwV/iF/Ye9CibOkKicOeLsHtPrqAseDwFCo7eOc4+7nbmaLjRUp
         wuLejpNOLPojw8+5EWRt3sdNNPdUIrvx879irUSHJjNUpClrJpdwUcOaAJNLBMlOw3oy
         edn1/UE4qBnGntGDJ4pfsv74hJO8OkXU72P/Xt7jDXD9wB/CofebHn/dsbT5ZqO1ng/x
         RgDpI8EArYkA+kOWtaceiht3p+z5wvIVz9qwC+dzLdygbgL6dvQPYfQEH6p0YKIDIwXh
         9a8g==
X-Forwarded-Encrypted: i=1; AJvYcCV85qI0yN0Ksaom7T3D6pZn2ZsFt2TUPR7EDZ1WBy+37eQJJ5cB0b8m//k5+aHiv+7vSWdnJEQ09ECOuV/o@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8nUKUUmXNvPve9XzhkaGHG6X03w1dWRT3ZrCevNib8hg9hqIF
	Xt2HqzSWwB2ndRS6VvNvV8TaLe7SLIlQxbcuKFbJZoggvKJA9dCds6XRRlugdh5Pl0Q=
X-Gm-Gg: AZuq6aJxZKEfLEv0y9eigpSgLAPG9kFIgQRxbjVp398Ho1UiYMVZnI4s6y/N2dSU4SV
	SSsaV+x4xrpXeU5pV7vOww0duu2gaxporpL+XpSfAb6bdpl+cYK4oN/IqFjjbLxDCA0keh3IPhi
	GHFzWs7j9Vo2a8Tv83XT5sGhXb9pyrAoVQJb1RwDKM/6e8ULN/c2NpJ3XY8vlyITtG4nIk6Xvtq
	GOfm16xBm4qrTypCJ2lzCu83mTinP4rWwCU8Mei23fECZSWsXhnZjhn3zPzC4pervK54kPm1IRo
	YjDGN6mJ5+55RzKqBvIO2Ydm8nObVoPElnOBVLVXo2/e1HtYEtw05KBPp8VcIShsf8pdemBRZgL
	ER6XvBn8hB3WYquuFI/L++OVds6TsOGfg5pIcv0HNnSWmNdv3LbR/zmr8Hy4EtAewshUHCmtVqV
	AR9uSiy1Gtk16grK/W5F8XHbNaOwTmfI4SK8wE5q4=
X-Received: by 2002:a05:6000:2601:b0:437:81b0:6638 with SMTP id ffacd0b85a97d-4396f188767mr4885393f8f.59.1771667886111;
        Sat, 21 Feb 2026 01:58:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa015sm4427011f8f.8.2026.02.21.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:58:05 -0800 (PST)
Date: Sat, 21 Feb 2026 12:58:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Leon Hwang <leon.hwang@linux.dev>,
	bpf@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Leon Hwang <leon.hwang@linux.dev>, Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
Message-ID: <202602210241.E7Q88vvq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219142933.13904-2-leon.hwang@linux.dev>

Hi Leon,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Introduce-64-bit-bitops-kfuncs/20260219-223550
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260219142933.13904-2-leon.hwang%40linux.dev
patch subject: [PATCH bpf-next v2 1/6] bpf: Introduce 64-bit bitops kfuncs
config: i386-randconfig-141-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210241.E7Q88vvq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602210241.E7Q88vvq-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:18245 bpf_kfunc_is_fastcall() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +18245 kernel/bpf/verifier.c

966e89879bbea4 Leon Hwang       2026-02-19  18223  static bool bpf_kfunc_is_fastcall(struct bpf_verifier_env *env, u32 func_id, u32 flags)
966e89879bbea4 Leon Hwang       2026-02-19  18224  {
966e89879bbea4 Leon Hwang       2026-02-19  18225  	if (!(flags & KF_FASTCALL))
966e89879bbea4 Leon Hwang       2026-02-19  18226  		return false;
966e89879bbea4 Leon Hwang       2026-02-19  18227  
966e89879bbea4 Leon Hwang       2026-02-19  18228  	if (!env->prog->jit_requested)
966e89879bbea4 Leon Hwang       2026-02-19  18229  		return true;
966e89879bbea4 Leon Hwang       2026-02-19  18230  
966e89879bbea4 Leon Hwang       2026-02-19  18231  	if (func_id == special_kfunc_list[KF_bpf_clz64])
966e89879bbea4 Leon Hwang       2026-02-19  18232  		return bpf_jit_inlines_kfunc_call(bpf_clz64);
966e89879bbea4 Leon Hwang       2026-02-19  18233  	if (func_id == special_kfunc_list[KF_bpf_ctz64])
966e89879bbea4 Leon Hwang       2026-02-19  18234  		return bpf_jit_inlines_kfunc_call(bpf_ctz64);
966e89879bbea4 Leon Hwang       2026-02-19  18235  	if (func_id == special_kfunc_list[KF_bpf_ffs64])
966e89879bbea4 Leon Hwang       2026-02-19  18236  		return bpf_jit_inlines_kfunc_call(bpf_ffs64);
966e89879bbea4 Leon Hwang       2026-02-19  18237  	if (func_id == special_kfunc_list[KF_bpf_fls64])
966e89879bbea4 Leon Hwang       2026-02-19  18238  		return bpf_jit_inlines_kfunc_call(bpf_fls64);
966e89879bbea4 Leon Hwang       2026-02-19  18239  	if (func_id == special_kfunc_list[KF_bpf_bitrev64])
966e89879bbea4 Leon Hwang       2026-02-19  18240  		return bpf_jit_inlines_kfunc_call(bpf_bitrev64);
966e89879bbea4 Leon Hwang       2026-02-19  18241  	if (func_id == special_kfunc_list[KF_bpf_popcnt64])
966e89879bbea4 Leon Hwang       2026-02-19  18242  		return bpf_jit_inlines_kfunc_call(bpf_popcnt64);
966e89879bbea4 Leon Hwang       2026-02-19  18243  	if (func_id == special_kfunc_list[KF_bpf_rol64])
966e89879bbea4 Leon Hwang       2026-02-19  18244  		return bpf_jit_inlines_kfunc_call(bpf_rol64);
966e89879bbea4 Leon Hwang       2026-02-19 @18245  	if (func_id == special_kfunc_list[KF_bpf_ror64])
                                                                                          ^^^^^^^^^^^^
special_kfunc_list[] has 64 elements and KF_bpf_ror64 is 64 so
this is out of bounds.

966e89879bbea4 Leon Hwang       2026-02-19  18246  		return bpf_jit_inlines_kfunc_call(bpf_ror64);
966e89879bbea4 Leon Hwang       2026-02-19  18247  
966e89879bbea4 Leon Hwang       2026-02-19  18248  	return true;
966e89879bbea4 Leon Hwang       2026-02-19  18249  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

