Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D5186A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 05:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765345930; cv=none; b=b5Ypbi4BF6oidic+g966e273jHvR7xnw4qxZR0D+gFTY9QNIbfdOXyqjb7iisYTRujCak3//OyLUXchkDb8nNBI2Fo4QrVIUXRov6dxxQJuYidB4kvt+JWTdLvfE5Nh7GYtlFAeYEKflnndIBqWfelf0uzvi3rqSud6jXWxFtS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765345930; c=relaxed/simple;
	bh=W+yd8AZzkrpk6Kz40u0oDw43Su6BOncph99N9qhqZqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCF/cCeY/Eo4viUldSfSyznvKBHT/YOZb26wqJywXk4UJHp9QP0/xyPWV9owB2sTYOUeHgYN0h+mcgkrYcYQ4R9JJujcJMvV0u60B++k5eQ39lVAmtrE7qxrFIkR2MpUo/2iv1YgxKf7WhdMExPHz+u1i+L9KFKeDi1b6tjviIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=RfOjTcyu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="RfOjTcyu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b9387df58cso9905496b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Dec 2025 21:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765345926; x=1765950726; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fidQhbKpG2Bu0EfnfKAGxGav7SVSE/5D3ltwWj3AtRs=;
        b=RfOjTcyu4i+m7NCpTABVaGorlzg5MOllnD1PHZ82mxvP03fCoPKHZ6nkPl/M7KAUor
         HjkhS8UvTpfLAZk/SfPXNyg9JLIxATYUoWgx2XkszqA2n2kwbaVvAfhYnXwspfF6y/dr
         iqXholkFjX8yXWF7PHcGcNKRxP7GaC6Rpdr8J8/bO4uaIYgFLkC32YjqjYEofymyksxg
         YfCyNLGWcaswZPcqKOq4FqsbcWV6mynrPaYkvEHYaozKMJccrZfRn5tVuFMyMHF3Ahfo
         WIQj//yAbj4KxjqdWFly0w4jlumvJhBUVmidcZKOLHbzfFAhurPCf780nyA2XRQzKWDj
         sToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765345926; x=1765950726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fidQhbKpG2Bu0EfnfKAGxGav7SVSE/5D3ltwWj3AtRs=;
        b=A3VpZMZJZzkvK6agJIp3PfyWizUTycQJmZhMthbV1gQ/lzWZUKmYAZDGrz3HHxIeUJ
         uHpk2k2plfiDxRCAEQodHDw0p9dmBX1k6vwbH/FajAgnfQ1jtSvVsDiaJpggEx6evEmv
         SMA45QC7KgnvcBPArkvDrPJ5RsX0trgKZr5KNnqLt3rBoRN2dGRwUV7+A4VO0ZGlOCV+
         pGqlfMPwOpR1g1Kt21u5JJi9d3sBp2pFG4P/9oWiduS5kN8kHsHSQXmax4NVqZFao+9Z
         Yz7yuNl3Qtxlz6K0LMujxGK6/BUztJlLgpWNjG4iSNEKUsVLVRfAyRB2COR837pwdj4L
         XqEA==
X-Gm-Message-State: AOJu0Yw6BQFx7tTPEpXRTGK3sNgU0Aa6V6HdR1RDsjfOl0bp+XIByp6J
	2JGCE6z1NZqzYT2ZRiMaJj/MYFhxvD342Q0yETKfM/k3u7XR3j9dWRiPplfrrsRxa/ZL42H4KIz
	bKcau
X-Gm-Gg: ASbGncueiIkFVMMPe5mrGOoPxJwb5kkdHJEYH0ySQ0Q7gXS5w+UV1aTBbgk1BkaNCt4
	p2ZbUNHbyNTAD634ocsLA29OUWhBn9aVFfP7TZ1R9YfTIOun/GPcubVbb3q+xFdhtFm1DjMw6VG
	gx47hHAUVpMGJBAMxqlDjWwIn3/rXvFcVMiFTEqNCHZos07abBAD52vpqkVEKo9Mrww/SIQbXoa
	fb0eRap+z+UKS2lUtTs0S3nfQZLUVkTG03+q5GAuRYn/eJVtVNSzSzVDx+ajFDXlSxOY77AC7x+
	HSz4SquyG6tPxcr8hkTi39wdkyKOrJGb7Cx2c2cC1HFgDbEeRi85gEKZLsJORV13KgXljLaZ56n
	ED+YzHuZD1jk8K/e1miQZeGDk9llyBINofQVK5p9wEpgoCUTeGt0XtW2NBWJbNMPMWFmOd3oQ+o
	eIWHViOhsCWOBtd2/uS49W
X-Google-Smtp-Source: AGHT+IE1iFMRJyYPo0z9WuKoQ/h4tdxhn+BG8estv17N7w4ShNXr5JCe45BMke8a2WwL9sjWzcDLHg==
X-Received: by 2002:a05:7022:6387:b0:119:e56b:c758 with SMTP id a92af1059eb24-11f296caf55mr894481c88.29.1765345925493;
        Tue, 09 Dec 2025 21:52:05 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm5787056c88.17.2025.12.09.21.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:52:04 -0800 (PST)
Date: Tue, 9 Dec 2025 21:52:03 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [linux-next:master 11881/13721]
 arch/riscv/kernel/vdso_cfi/vgettimeofday.c:15:16: error: implicit
 declaration of function '__cvdso_clock_gettime'; did you mean
 '__vdso_clock_gettime'?
Message-ID: <aTkKg_Lm85j591sN@debug.ba.rivosinc.com>
References: <202512081711.HA5UTd9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202512081711.HA5UTd9C-lkp@intel.com>

Sorry I didn't do all the config builds
But this should fix it. You want me to send another version?

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4612a99cb387..19d9d561cb13 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1152,7 +1152,7 @@ config RISCV_USER_CFI
         depends on 64BIT && \
                 $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss_zicfilp -fcf-protection=full)
         depends on RISCV_ALTERNATIVE
+       depends on MMU
         select RISCV_SBI
         select ARCH_HAS_USER_SHADOW_STACK
         select ARCH_USES_HIGH_VMA_FLAGS



On Mon, Dec 08, 2025 at 05:10:21PM +0800, kernel test robot wrote:
>tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>head:   82bcd04d124a4d84580ea4a8ba6b120db5f512e7
>commit: c5f5ce714457370edb6a309d0c07c0bbb6432662 [11881/13721] riscv: create a Kconfig for shadow stack and landing pad support
>config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20251208/202512081711.HA5UTd9C-lkp@intel.com/config)
>compiler: riscv64-linux-gcc (GCC) 15.1.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081711.HA5UTd9C-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202512081711.HA5UTd9C-lkp@intel.com/
>
>All error/warnings (new ones prefixed by >>):
>
>   arch/riscv/kernel/vdso_cfi/vgettimeofday.c: In function '__vdso_clock_gettime':
>>> arch/riscv/kernel/vdso_cfi/vgettimeofday.c:15:16: error: implicit declaration of function '__cvdso_clock_gettime'; did you mean '__vdso_clock_gettime'? [-Wimplicit-function-declaration]
>      15 |         return __cvdso_clock_gettime(clock, ts);
>         |                ^~~~~~~~~~~~~~~~~~~~~
>         |                __vdso_clock_gettime
>   arch/riscv/kernel/vdso_cfi/vgettimeofday.c: In function '__vdso_gettimeofday':
>>> arch/riscv/kernel/vdso_cfi/vgettimeofday.c:20:16: error: implicit declaration of function '__cvdso_gettimeofday'; did you mean '__vdso_gettimeofday'? [-Wimplicit-function-declaration]
>      20 |         return __cvdso_gettimeofday(tv, tz);
>         |                ^~~~~~~~~~~~~~~~~~~~
>         |                __vdso_gettimeofday
>   arch/riscv/kernel/vdso_cfi/vgettimeofday.c: In function '__vdso_clock_getres':
>>> arch/riscv/kernel/vdso_cfi/vgettimeofday.c:25:16: error: implicit declaration of function '__cvdso_clock_getres'; did you mean '__vdso_clock_getres'? [-Wimplicit-function-declaration]
>      25 |         return __cvdso_clock_getres(clock_id, res);
>         |                ^~~~~~~~~~~~~~~~~~~~
>         |                __vdso_clock_getres
>--
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:11:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
>      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                 ^~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:15:41: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
>      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                         ^~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c: In function 'riscv_vdso_get_values':
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:22:43: error: invalid use of undefined type 'struct riscv_hwprobe'
>      22 |         struct riscv_hwprobe *end = pairs + pair_count;
>         |                                           ^
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:30:45: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
>      30 |         if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
>         |                                             ^~
>   In file included from include/linux/array_size.h:5,
>                    from include/linux/string.h:6,
>                    from arch/riscv/kernel/vdso_cfi/hwprobe.c:6:
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:30:81: error: 'const struct vdso_arch_data' has no member named 'ready'
>      30 |         if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
>         |                                                                                 ^~
>   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
>      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
>         |                                             ^
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:31:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
>      31 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
>         |                                      ^~~~~
>         |                                      |
>         |                                      struct riscv_hwprobe *
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
>      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:35:21: error: implicit declaration of function 'riscv_hwprobe_key_is_valid' [-Wimplicit-function-declaration]
>      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
>         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:35:49: error: invalid use of undefined type 'struct riscv_hwprobe'
>      35 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
>         |                                                 ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:36:26: error: invalid use of undefined type 'struct riscv_hwprobe'
>      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
>         |                          ^~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:36:39: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
>      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
>         |                                       ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:36:65: error: invalid use of undefined type 'struct riscv_hwprobe'
>      36 |                         p->value = avd->all_cpu_hwprobe_values[p->key];
>         |                                                                 ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:39:26: error: invalid use of undefined type 'struct riscv_hwprobe'
>      39 |                         p->key = -1;
>         |                          ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:40:26: error: invalid use of undefined type 'struct riscv_hwprobe'
>      40 |                         p->value = 0;
>         |                          ^~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:43:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
>      43 |                 p++;
>         |                  ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c: At top level:
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:49:39: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
>      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                       ^~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c: In function 'riscv_vdso_get_cpus':
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:55:43: error: invalid use of undefined type 'struct riscv_hwprobe'
>      55 |         struct riscv_hwprobe *end = pairs + pair_count;
>         |                                           ^
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:71:36: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
>      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
>         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:71:36: note: each undeclared identifier is reported only once for each function it appears in
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:71:68: error: 'const struct vdso_arch_data' has no member named 'homogeneous_cpus'
>      71 |         if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
>         |                                                                    ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:72:38: error: passing argument 1 of 'riscv_hwprobe' from incompatible pointer type [-Wincompatible-pointer-types]
>      72 |                 return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
>         |                                      ^~~~~
>         |                                      |
>         |                                      struct riscv_hwprobe *
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:11:48: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
>      11 | extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                          ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:75:49: error: invalid use of undefined type 'struct riscv_hwprobe'
>      75 |                 if (riscv_hwprobe_key_is_valid(p->key)) {
>         |                                                 ^~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:76:32: error: variable 't' has initializer but incomplete type
>      76 |                         struct riscv_hwprobe t = {
>         |                                ^~~~~~~~~~~~~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:77:34: error: 'struct riscv_hwprobe' has no member named 'key'
>      77 |                                 .key = p->key,
>         |                                  ^~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:77:41: error: invalid use of undefined type 'struct riscv_hwprobe'
>      77 |                                 .key = p->key,
>         |                                         ^~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:77:40: warning: excess elements in struct initializer
>      77 |                                 .key = p->key,
>         |                                        ^
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:77:40: note: (near initialization for 't')
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:78:34: error: 'struct riscv_hwprobe' has no member named 'value'
>      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
>         |                                  ^~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:45: error: 'const struct vdso_arch_data' has no member named 'all_cpu_hwprobe_values'
>      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
>         |                                             ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:71: error: invalid use of undefined type 'struct riscv_hwprobe'
>      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
>         |                                                                       ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:42: warning: excess elements in struct initializer
>      78 |                                 .value = avd->all_cpu_hwprobe_values[p->key],
>         |                                          ^~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:78:42: note: (near initialization for 't')
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:76:46: error: storage size of 't' isn't known
>      76 |                         struct riscv_hwprobe t = {
>         |                                              ^
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:81:30: error: implicit declaration of function 'riscv_hwprobe_pair_cmp' [-Wimplicit-function-declaration]
>      81 |                         if (!riscv_hwprobe_pair_cmp(&t, p))
>         |                              ^~~~~~~~~~~~~~~~~~~~~~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:76:46: warning: unused variable 't' [-Wunused-variable]
>      76 |                         struct riscv_hwprobe t = {
>         |                                              ^
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:85:26: error: invalid use of undefined type 'struct riscv_hwprobe'
>      85 |                         p->key = -1;
>         |                          ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:86:26: error: invalid use of undefined type 'struct riscv_hwprobe'
>      86 |                         p->value = 0;
>         |                          ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:88:18: error: increment of pointer to an incomplete type 'struct riscv_hwprobe'
>      88 |                 p++;
>         |                  ^~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c: At top level:
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:100:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
>     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                 ^~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:104:33: warning: 'struct riscv_hwprobe' declared inside parameter list will not be visible outside of this definition or declaration
>     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                 ^~~~~~~~~~~~~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:104:5: error: conflicting types for '__vdso_riscv_hwprobe'; have 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, long unsigned int,  long unsigned int,  long unsigned int *, unsigned int)'}
>     104 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |     ^~~~~~~~~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:100:5: note: previous declaration of '__vdso_riscv_hwprobe' with type 'int(struct riscv_hwprobe *, size_t,  size_t,  long unsigned int *, unsigned int)' {aka 'int(struct riscv_hwprobe *, long unsigned int,  long unsigned int,  long unsigned int *, unsigned int)'}
>     100 | int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
>         |     ^~~~~~~~~~~~~~~~~~~~
>   arch/riscv/kernel/vdso_cfi/hwprobe.c: In function '__vdso_riscv_hwprobe':
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:108:21: error: 'RISCV_HWPROBE_WHICH_CPUS' undeclared (first use in this function)
>     108 |         if (flags & RISCV_HWPROBE_WHICH_CPUS)
>         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:109:44: error: passing argument 1 of 'riscv_vdso_get_cpus' from incompatible pointer type [-Wincompatible-pointer-types]
>     109 |                 return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
>         |                                            ^~~~~
>         |                                            |
>         |                                            struct riscv_hwprobe *
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:49:54: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
>      49 | static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>>> arch/riscv/kernel/vdso_cfi/hwprobe.c:112:38: error: passing argument 1 of 'riscv_vdso_get_values' from incompatible pointer type [-Wincompatible-pointer-types]
>     112 |         return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
>         |                                      ^~~~~
>         |                                      |
>         |                                      struct riscv_hwprobe *
>   arch/riscv/kernel/vdso_cfi/hwprobe.c:15:56: note: expected 'struct riscv_hwprobe *' but argument is of type 'struct riscv_hwprobe *'
>      15 | static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
>         |                                  ~~~~~~~~~~~~~~~~~~~~~~^~~~~
>
>Kconfig warnings: (for reference only)
>   WARNING: unmet direct dependencies detected for RISCV_SBI
>   Depends on [n]: !RISCV_M_MODE [=y]
>   Selected by [y]:
>   - RISCV_USER_CFI [=y] && 64BIT [=y] && RISCV_ALTERNATIVE [=y]
>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
