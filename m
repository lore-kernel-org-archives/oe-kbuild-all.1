Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEBA1D5174
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 05:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768713650; cv=none; b=oCt6Ya9bNd1tYSrhwuPzMXRVMyuQPQPJZHYxyQ5Hwg++mN9uSvZY0BsF92EUU+B93GDz0tN8aBbnJ6FVFUG+CQR4KEzoeo/+g0DW64r3c9kdhVZLl0m537FsiY0v+wbNp4Hyyab6dyfdOIKgXRv74THG+SxuvRZYcc3gAvTi3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768713650; c=relaxed/simple;
	bh=4xPz7yiqXNkpipMBz1Tf5XldG5O69fnnxx4YcdVfLAQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NL0mfHpZFQfpPVgNrf9gL0R1mqP19t7c9ed1pmarGjNgVua71KTHnN14X5V+6JxwEdQwqe5yKtgqjc2fNO/cfxkZMBws/r2eKBav3WNC1n4SqeTqVqEflKirOGlrJx3071PUD982C4o7Vv5sFBkyoH+KKcoKTpAlnuAV2QNqZAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=C28nsDyp; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="C28nsDyp"
Received: from ehlo.thunderbird.net ([172.56.210.108])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60I5K6EV974661
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 17 Jan 2026 21:20:08 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60I5K6EV974661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1768713609;
	bh=ywA2nmlB0JZ4XrmUcLbvC2Bpw0ZOD2zoS5ilA1ofBpA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=C28nsDypG6ZPwsExsyEXlGNktiq8ONbBJrCucIJBWwxYzDnPVlG3wTJk5piqNfYDN
	 XlcESn0dqzYu7CNgvC/jSesSVZ+yWulUzz094NqS3XUwuPYjiiXVkHBko4yOg7QMzl
	 XiIqYY3aHHmsuUPnNvktdkjnULMhmmd6zl6jesi+KoIK5b3n7RrzSHWpUcljhCLKwL
	 olMEqOdoamTj3pi5+GP8E7hd8u5qh4v0JShquE3AlvOvCP1+SHMVFiQ5D3OMwKBbl+
	 glzxG7arDBFbJXEFbrttHhrB3Z2QLGJHCoQVGFq637zc/vsbXDW6Y+u0uYZ6ZF57mX
	 +dfJoUXWTXrCA==
Date: Sat, 17 Jan 2026 21:19:57 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
CC: oe-kbuild-all@lists.linux.dev, x86@kernel.org,
        Chris Mason <chris.mason@fusionio.com>,
        Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_x86/entry/vdso=3A_?=
 =?US-ASCII?Q?fix_filtering_of_vdso_compiler_flags?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aWxCsCrTfItJ/WUw@rli9-mobl>
References: <aWxCsCrTfItJ/WUw@rli9-mobl>
Message-ID: <77D47E8C-5ECC-4B07-9A8E-C5E0F1E1EA80@zytor.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 17, 2026 6:17:20 PM PST, kernel test robot <lkp@intel=2Ecom> wro=
te:
>Hi Peter,
>
>First bad commit (maybe !=3D root cause):
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on tip/master]
>[also build test ERROR on next-20260116]
>[cannot apply to tip/auto-latest linus/master v6=2E19-rc5]
>[If your patch is applied to the wrong git tree, kindly drop us a note=2E
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm=2Ecom/docs/git-format-patch#_base_tree_information]
>
>url:    https://github=2Ecom/intel-lab-lkp/linux/commits/H-Peter-Anvin/x8=
6-entry-vdso-update-the-object-paths-for-make-vdso_install/20260117-044522
>base:   tip/master
>patch link:    https://lore=2Ekernel=2Eorg/r/20260116204057=2E386268-3-hp=
a%40zytor=2Ecom
>patch subject: [PATCH v2 2/3] x86/entry/vdso: fix filtering of vdso compi=
ler flags
>config: x86_64-rhel-9=2E4-func (https://download=2E01=2Eorg/0day-ci/archi=
ve/20260118/202601180025=2ElLCHWiad-lkp@intel=2Ecom/config)
>compiler: gcc-14 (Debian 14=2E2=2E0-19) 14=2E2=2E0
>reproduce (this is a W=3D1 build): (https://download=2E01=2Eorg/0day-ci/a=
rchive/20260118/202601180025=2ElLCHWiad-lkp@intel=2Ecom/reproduce)
>
>If you fix the issue in a separate patch/commit (i=2Ee=2E not just a new =
version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel=2Ecom>
>| Closes: https://lore=2Ekernel=2Eorg/r/202601180025=2ElLCHWiad-lkp@intel=
=2Ecom/
>
>All errors (new ones prefixed by >>):
>
>   In file included from include/linux/compiler_types=2Eh:44,
>                    from <command-line>:
>   include/linux/compiler-context-analysis=2Eh: In function '_context_uns=
afe_alias':
>>> include/linux/compiler-context-analysis=2Eh:237:1: error: '-mindirect-=
branch' and '-fcf-protection' are not compatible
>     237 | static inline void _context_unsafe_alias(void **p) { }
>         | ^~~~~~
>   In file included from include/linux/export=2Eh:5,
>                    from include/linux/linkage=2Eh:7,
>                    from arch/x86/include/asm/cache=2Eh:5,
>                    from include/vdso/cache=2Eh:5,
>                    from include/linux/cache=2Eh:6,
>                    from include/linux/time=2Eh:5,
>                    from arch/x86/entry/vdso/vdso64/=2E=2E/common/vclock_=
gettime=2Ec:11,
>                    from arch/x86/entry/vdso/vdso64/vclock_gettime=2Ec:1:
>   include/linux/compiler=2Eh: In function 'offset_to_ptr':
>   include/linux/compiler=2Eh:272:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     272 | {
>         | ^
>   In file included from include/asm-generic/rwonce=2Eh:26,
>                    from =2E/arch/x86/include/generated/asm/rwonce=2Eh:1,
>                    from include/linux/compiler=2Eh:382:
>   include/linux/kasan-checks=2Eh: In function 'kasan_check_read':
>   include/linux/kasan-checks=2Eh:41:1: error: '-mindirect-branch' and '-=
fcf-protection' are not compatible
>      41 | {
>         | ^
>   include/linux/kasan-checks=2Eh: In function 'kasan_check_write':
>   include/linux/kasan-checks=2Eh:45:1: error: '-mindirect-branch' and '-=
fcf-protection' are not compatible
>      45 | {
>         | ^
>   In file included from include/asm-generic/rwonce=2Eh:27:
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_check_access':
>   include/linux/kcsan-checks=2Eh:190:41: error: '-mindirect-branch' and =
'-fcf-protection' are not compatible
>     190 |                                         int type) { }
>         |                                         ^~~
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_mb':
>   include/linux/kcsan-checks=2Eh:192:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     192 | static inline void __kcsan_mb(void)                     { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_wmb':
>   include/linux/kcsan-checks=2Eh:193:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     193 | static inline void __kcsan_wmb(void)                    { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_rmb':
>   include/linux/kcsan-checks=2Eh:194:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     194 | static inline void __kcsan_rmb(void)                    { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_release':
>   include/linux/kcsan-checks=2Eh:195:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     195 | static inline void __kcsan_release(void)                { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_disable_current':
>   include/linux/kcsan-checks=2Eh:196:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     196 | static inline void kcsan_disable_current(void)          { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_enable_current':
>   include/linux/kcsan-checks=2Eh:197:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     197 | static inline void kcsan_enable_current(void)           { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_enable_current_nowa=
rn':
>   include/linux/kcsan-checks=2Eh:198:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     198 | static inline void kcsan_enable_current_nowarn(void)    { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_nestable_atomic_beg=
in':
>   include/linux/kcsan-checks=2Eh:199:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     199 | static inline void kcsan_nestable_atomic_begin(void)    { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_nestable_atomic_end=
':
>   include/linux/kcsan-checks=2Eh:200:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     200 | static inline void kcsan_nestable_atomic_end(void)      { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_flat_atomic_begin':
>   include/linux/kcsan-checks=2Eh:201:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     201 | static inline void kcsan_flat_atomic_begin(void)        { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_flat_atomic_end':
>   include/linux/kcsan-checks=2Eh:202:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     202 | static inline void kcsan_flat_atomic_end(void)          { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_atomic_next':
>   include/linux/kcsan-checks=2Eh:203:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     203 | static inline void kcsan_atomic_next(int n)             { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_set_access_mask':
>   include/linux/kcsan-checks=2Eh:204:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     204 | static inline void kcsan_set_access_mask(unsigned long mask) {=
 }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_begin_scoped_access=
':
>   include/linux/kcsan-checks=2Eh:210:34: error: '-mindirect-branch' and =
'-fcf-protection' are not compatible
>     210 |                           struct kcsan_scoped_access *sa) { re=
turn sa; }
>         |                                  ^~~~~~~~~~~~~~~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_end_scoped_access':
>   include/linux/kcsan-checks=2Eh:211:51: error: '-mindirect-branch' and =
'-fcf-protection' are not compatible
>     211 | static inline void kcsan_end_scoped_access(struct kcsan_scoped=
_access *sa) { }
>         |                                                   ^~~~~~~~~~~~=
~~~~~~~
>   include/linux/kcsan-checks=2Eh: In function 'kcsan_check_access':
>   include/linux/kcsan-checks=2Eh:230:39: error: '-mindirect-branch' and =
'-fcf-protection' are not compatible
>     230 |                                       int type) { }
>         |                                       ^~~
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_enable_current':
>   include/linux/kcsan-checks=2Eh:231:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>     231 | static inline void __kcsan_enable_current(void)  { }
>         | ^~~~~~
>   include/linux/kcsan-checks=2Eh: In function '__kcsan_disable_current':
>   include/linux/kcsan-checks=2Eh:232:1: error: '-mindirect-branch' and '=
-fcf-protection' are not compatible
>--
>   include/linux/find=2Eh: In function 'find_first_bit':
>   include/linux/find=2Eh:207:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     207 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_nth_bit':
>   include/linux/find=2Eh:233:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     233 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_nth_and_bit':
>   include/linux/find=2Eh:259:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     259 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_nth_and_andnot_bit':
>   include/linux/find=2Eh:289:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     289 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_first_and_bit':
>   include/linux/find=2Eh:316:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     316 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_first_andnot_bit':
>   include/linux/find=2Eh:340:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     340 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_first_and_and_bit':
>   include/linux/find=2Eh:365:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     365 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_first_zero_bit':
>   include/linux/find=2Eh:386:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     386 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_last_bit':
>   include/linux/find=2Eh:407:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     407 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_next_and_bit_wrap':
>   include/linux/find=2Eh:432:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     432 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_next_bit_wrap':
>   include/linux/find=2Eh:454:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     454 | {
>         | ^
>   include/linux/find=2Eh: In function '__for_each_wrap':
>   include/linux/find=2Eh:471:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     471 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_next_zero_bit_le':
>   include/linux/find=2Eh:511:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     511 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_next_bit_le':
>   include/linux/find=2Eh:517:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     517 | {
>         | ^
>   include/linux/find=2Eh: In function 'find_first_zero_bit_le':
>   include/linux/find=2Eh:523:1: error: '-mindirect-branch' and '-fcf-pro=
tection' are not compatible
>     523 | {
>         | ^
>   In file included from include/linux/bitmap=2Eh:13:
>   include/linux/string=2Eh: In function 'memdup_array_user':
>   include/linux/string=2Eh:33:1: error: '-mindirect-branch' and '-fcf-pr=
otection' are not compatible
>      33 | {
>         | ^
>   include/linux/string=2Eh: In function 'vmemdup_array_user':
>   include/linux/string=2Eh:53:1: error: '-mindirect-branch' and '-fcf-pr=
otection' are not compatible
>      53 | {
>         | ^
>   include/linux/string=2Eh: In function 'strstrip':
>   include/linux/string=2Eh:190:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     190 | {
>         | ^
>   include/linux/string=2Eh: In function 'memset_l':
>   include/linux/string=2Eh:237:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     237 | {
>         | ^
>   include/linux/string=2Eh: In function 'memset_p':
>   include/linux/string=2Eh:245:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     245 | {
>         | ^
>   include/linux/string=2Eh: In function 'mem_is_zero':
>   include/linux/string=2Eh:295:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     295 | {
>         | ^
>   include/linux/string=2Eh: In function '__free_argv_free':
>   include/linux/string=2Eh:316:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     316 | DEFINE_FREE(argv_free, char **, if (!IS_ERR_OR_NULL(_T)) argv_=
free(_T))
>         | ^~~~~~~~~~~
>   include/linux/string=2Eh: In function 'memzero_explicit':
>   include/linux/string=2Eh:365:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     365 | {
>         | ^
>   include/linux/string=2Eh: In function 'kbasename':
>   include/linux/string=2Eh:380:1: error: '-mindirect-branch' and '-fcf-p=
rotection' are not compatible
>     380 | {
>         | ^
>   In file included from include/linux/fortify-string=2Eh:5,
>                    from include/linux/string=2Eh:386:
>   include/linux/bitfield=2Eh: In function 'field_multiplier':
>>> include/linux/bitfield=2Eh:202:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     202 | {
>         | ^
>   include/linux/bitfield=2Eh: In function 'field_mask':
>   include/linux/bitfield=2Eh:208:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     208 | {
>         | ^
>   include/linux/bitfield=2Eh: In function 'u8_encode_bits':
>   include/linux/bitfield=2Eh:237:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     237 | ____MAKE_OP(u8,u8,,)
>         | ^~~~~~~~~~~
>   include/linux/bitfield=2Eh: In function 'u8_replace_bits':
>   include/linux/bitfield=2Eh:237:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u8p_replace_bits':
>   include/linux/bitfield=2Eh:237:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u8_get_bits':
>   include/linux/bitfield=2Eh:237:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le16_encode_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     238 | __MAKE_OP(16)
>         | ^~~~~~~~~
>   include/linux/bitfield=2Eh: In function 'le16_replace_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le16p_replace_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le16_get_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be16_encode_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be16_replace_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be16p_replace_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be16_get_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u16_encode_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u16_replace_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u16p_replace_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u16_get_bits':
>   include/linux/bitfield=2Eh:238:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le32_encode_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     239 | __MAKE_OP(32)
>         | ^~~~~~~~~
>   include/linux/bitfield=2Eh: In function 'le32_replace_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le32p_replace_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le32_get_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be32_encode_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be32_replace_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be32p_replace_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be32_get_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u32_encode_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u32_replace_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u32p_replace_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u32_get_bits':
>   include/linux/bitfield=2Eh:239:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le64_encode_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>     240 | __MAKE_OP(64)
>         | ^~~~~~~~~
>   include/linux/bitfield=2Eh: In function 'le64_replace_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le64p_replace_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'le64_get_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be64_encode_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be64_replace_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be64p_replace_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'be64_get_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u64_encode_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u64_replace_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u64p_replace_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/bitfield=2Eh: In function 'u64_get_bits':
>   include/linux/bitfield=2Eh:240:1: error: '-mindirect-branch' and '-fcf=
-protection' are not compatible
>   include/linux/fortify-string=2Eh: In function 'strncpy':
>   include/linux/fortify-string=2Eh:198:1: error: '-mindirect-branch' and=
 '-fcf-protection' are not compatible
>     198 | {
>         | ^
>   include/linux/fortify-string=2Eh: In function 'strnlen':
>   include/linux/fortify-string=2Eh:220:1: error: '-mindirect-branch' and=
 '-fcf-protection' are not compatible
>=2E=2E
>
>
>vim +237 include/linux/compiler-context-analysis=2Eh
>
>3269701cb25662 Marco Elver 2025-12-19  221 =20
>3269701cb25662 Marco Elver 2025-12-19  222  /**
>3269701cb25662 Marco Elver 2025-12-19  223   * context_unsafe_alias() - h=
elper to insert a context lock "alias barrier"
>3269701cb25662 Marco Elver 2025-12-19  224   * @p: pointer aliasing a con=
text lock or object containing context locks
>3269701cb25662 Marco Elver 2025-12-19  225   *
>3269701cb25662 Marco Elver 2025-12-19  226   * No-op function that acts a=
s a "context lock alias barrier", where the
>3269701cb25662 Marco Elver 2025-12-19  227   * analysis rightfully detect=
s that we're switching aliases, but the switch is
>3269701cb25662 Marco Elver 2025-12-19  228   * considered safe but beyond=
 the analysis reasoning abilities=2E
>3269701cb25662 Marco Elver 2025-12-19  229   *
>3269701cb25662 Marco Elver 2025-12-19  230   * This should be inserted be=
fore the first use of such an alias=2E
>3269701cb25662 Marco Elver 2025-12-19  231   *
>3269701cb25662 Marco Elver 2025-12-19  232   * Implementation Note: The c=
ompiler ignores aliases that may be reassigned but
>3269701cb25662 Marco Elver 2025-12-19  233   * their value cannot be dete=
rmined (e=2Eg=2E when passing a non-const pointer to an
>3269701cb25662 Marco Elver 2025-12-19  234   * alias as a function argume=
nt)=2E
>3269701cb25662 Marco Elver 2025-12-19  235   */
>3269701cb25662 Marco Elver 2025-12-19  236  #define context_unsafe_alias(=
p) _context_unsafe_alias((void **)&(p))
>3269701cb25662 Marco Elver 2025-12-19 @237  static inline void _context_u=
nsafe_alias(void **p) { }
>3269701cb25662 Marco Elver 2025-12-19  238 =20
>

For the record: already fixed=2E
