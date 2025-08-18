Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC262D8382
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505175; cv=none; b=VQCgZNnhF88Yaz9nXCXAqbWge/uavTLOU3kGCFrBCG3cUF/LTQxnaBB6KhGeJSNl4fK9Xf7eULJmZSYjjvLiIEJCoBHu2Rtx5IFcUU9o+hb7RFrFq4sPiM88R1dG0q2I2KcKuXgvDeLn8RAF7Kdpp0jyEJjn8cvViW8mOgXtOiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505175; c=relaxed/simple;
	bh=rN/UTNEkHE3uBRZLBThrHpULRHST6ls2EaemSZgDm2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciqCNECIFrOtMhZnVeNzBqARO6JJx5Uhr70rfMltcS0w683Vmjt228xWAC3KlPEZdFkBiVW9L7e8PDbCUywakAqOTigLGkWmvLGBfWqOZeCqeR3yBuNqc+AdMvx9pvEZ+N65h7sUvxRZt//8OwitFKxqZEEEQ5TrAnSzT4JHKVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL7p4ygx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL7p4ygx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a286135c8so6090765e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 01:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755505172; x=1756109972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NeEY3uW9vGqD0NjAylwhSwOYu+Sb02hS8tqOcGAgYnw=;
        b=iL7p4ygxQcD9MyWDrajUjHtTqB1WpnDLyH9VVZuVL0QsOkxeWT2xaNt0faYbiiAnMq
         gyt1GidPoETcWh6W0kM+oo3/Fsg3T9B2aGCRmW2TV+1At6MdI+87SVmUtwvU7LUsVoX+
         0yhGsHiR37PEiYY/OXOQ3pxSJVv5RMeiHnjiq4bO9z1k3c32qSoX0tTwM6VboGBUU0yi
         GwiUz8SBPGTNojnrOBedXDJmzsD3Q9S2nfsNmHDANJVCJO+cevAlOPY+oCvPYbd0De3n
         kewRUm3NqmYd3HHZW3pdAbrQJSEVmqRXS2WmKAMacbuMsfYdLdryzNkEBx0hipDM8fS1
         ++0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505172; x=1756109972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeEY3uW9vGqD0NjAylwhSwOYu+Sb02hS8tqOcGAgYnw=;
        b=BNmVl/O8cPL4cBngCL2asBG7g0OU0fDex6hT9IASqIT5inUPwv3MXeNxz+qVWwIs0I
         zjTVLDXPTMvZHfcbpKcBzlhOVmtBzcIKu58YhnsnT0DMqMFaEf991bTr+5OKvKVsct87
         Ny6d90mF2dC7ZTdFWPwf8P29jMIPodWqU41gEvoS4m4rZHDk5byxxIBpG6XpJDPVEKK8
         ZfnWjlDjdfNFSng3e7LwTEII7dWp/pX6MXOErx29V1vrVRIbYHg+AkjEWwanCOOccUEK
         MQF7J73FTSemaDX3O6DXoHUz/a/OhjP13ec25KKU+95tAq3V93ddNlq+pn+/NvnY1ioK
         fE7g==
X-Forwarded-Encrypted: i=1; AJvYcCU81EuJ+JO1WuoNAFukcIWcDWNcyKPeViQXCAN7kIPO0a2ZTpTOW6Jo+axXNnN56K4UL5vBU5F2aTTF7IHm@lists.linux.dev
X-Gm-Message-State: AOJu0YzU+Qd8FU2CQlr0BdC34NZemdF5Wgi5nff+ee5hH3b2SV4yP3rv
	LXvJBW/rVyjO7SsOlr6kBPjnP8HoWm4YF73s4lbjpNICWHRe0zPQ4Jn4
X-Gm-Gg: ASbGnctH7F/Vf1tMcvZX15VkDdTzH+aU0DcJKPqq5cJqDGa/+37enD5R5N/fXAfyNHe
	xEiw4ht2QjWOhuuahx4agZQYPQh7Z4tlaw4LBMdZp2AkUSU3prJ/6IYB8JfvCwte4czCb50t/V6
	bSugVL2jhdLbf0TBLiHNPqHCSf9js9GaoKXti941ttdVZFcfXuueTjP4gsiipzqODI28+/j/3kd
	1iKXFPPwsueFu2TbFDHpQN8Zzl/YUc59ar7GDTv/Nil9Ug77o7255jfzyTmOkuPQIU4fovaa7nm
	ZYOvDWyE7eRkuDJWCwdbdvtGKn3St0hS4vTkbxsTdjT3NhoSYapNJ4ylTMgPSO12h+beLvcLHxR
	1fuoRsOjsXfMCcHlE5zHt1Jkv4vUw5tQAuw==
X-Google-Smtp-Source: AGHT+IE4/Ywx353cazJs7pIfC+EI2xfVHZUjR2nORVtwe0LInZT9u8RV5DJbXw9M+U8k4EAA8VWZXA==
X-Received: by 2002:a05:600c:4ed0:b0:456:1146:5c01 with SMTP id 5b1f17b1804b1-45a1b6bde0bmr122268245e9.12.1755505172119;
        Mon, 18 Aug 2025 01:19:32 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a25c13696sm104998905e9.25.2025.08.18.01.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:19:31 -0700 (PDT)
Date: Mon, 18 Aug 2025 08:24:12 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Anton Protopopov <aspsk@isovalent.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 bpf-next 05/11] bpf: support instructions arrays with
 constants blinding
Message-ID: <aKLjLFSXImtu89rT@mail.gmail.com>
References: <20250816180631.952085-6-a.s.protopopov@gmail.com>
 <202508171315.5y3oPyC2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508171315.5y3oPyC2-lkp@intel.com>

On 25/08/17 01:50PM, kernel test robot wrote:
> Hi Anton,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on bpf-next/master]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-fix-the-return-value-of-push_stack/20250817-020411
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20250816180631.952085-6-a.s.protopopov%40gmail.com
> patch subject: [PATCH v1 bpf-next 05/11] bpf: support instructions arrays with constants blinding
> config: sparc-randconfig-001-20250817 (https://download.01.org/0day-ci/archive/20250817/202508171315.5y3oPyC2-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508171315.5y3oPyC2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508171315.5y3oPyC2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    sparc64-linux-ld: kernel/bpf/core.o: in function `bpf_jit_blind_constants':
> >> core.c:(.text+0x8064): undefined reference to `bpf_insn_array_adjust'

This is because the bpf_insn_array_adjust() is enabled with CONFIG_BPF_SYSCALL.
Will add the corresponding check in v2.

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
