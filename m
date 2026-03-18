Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2552877D8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773852360; cv=none; b=OI5Q41K63NzOWQ/QMlusmfPNO7K/0MADh4QqP5d1EeuccWm3Biw70i1sZXkV5MGzYyQNE7exFiiokNj1ev81esnhGP+J4vy0oHT6Vv1ziN3iF5gHbfR6eMQuZ7B/IULElSFBzdHXksZkhfZf3LCc8Em7GvrlJw1Oex6VIHgvJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773852360; c=relaxed/simple;
	bh=SnSmZn69cHUpht+dvlnYOC2ttF3gT8OI8AN2TRAdps4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRUtYihszoD8d/JJ7qxe+yN067DtzINU0EA3o+QzR8KlkHVwEeMb7BX2H/zfrfdIIqilc8/xqYnSql6jB1OxzGnAAadlAgld+V9SE7B8Z1Sn1PEphjjhw8mVCcXmtlEXGNiBRenLZI6eTqimbFgAqnujtM4cKVX5j0Xvb0kzLSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUAGOefm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUAGOefm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4610EC19421;
	Wed, 18 Mar 2026 16:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773852359;
	bh=SnSmZn69cHUpht+dvlnYOC2ttF3gT8OI8AN2TRAdps4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VUAGOefmVnTL0oUfbxVB23v+wbRLKTFb1SZPVyTUHWs+MuW1a6O1uxm8UsHaRsKLV
	 7hGyjhBxK0Ez/k1cCwl+j/xhadewVuNLKUIDX6BqIIJxvKaZ0OZa9JX//CyKo75j+m
	 +nSPKN6UIllnh+gOJOmK4hJHWkEOZtZnY29i/lzcdl59d+1aBrl+aXzd0Ol3cSj14Z
	 CGJ2Vc53RZhRES+Vt8EkJR9/SNTLZfAomz552PsO876voexqLALndTaWn/aGiBeNho
	 E+PgS9PF1+XOT3TtXaCvKZn90BeAOHeaUN4I/JNQD9KZ/xQRY9N1yWVa4Q5YY0+TCY
	 Bxs44+vfl2nMA==
Message-ID: <cbe3f593-6941-41e0-86cd-bcd3a73310b0@kernel.org>
Date: Wed, 18 Mar 2026 17:45:55 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linuxppc:next-test 12/13] error[E0658]: inline assembly is not
 stable yet on this architecture
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 kernel test robot <lkp@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>
References: <202603180631.GYjY89hw-lkp@intel.com>
 <abrRoLwaMhgALR0W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <abrRoLwaMhgALR0W@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 18/03/2026 à 17:24, Mukesh Kumar Chaurasiya a écrit :
> On Wed, Mar 18, 2026 at 06:52:05AM +0800, kernel test robot wrote:
>> tree:   https://github.com/linuxppc/linux next-test
>> head:   217e0d3cb6437f802ac73e6a614d7a2525f61e36
>> commit: b964fb2e44b9b4078a822cb63ec6427ddac5f8ac [12/13] rust: Add PowerPC support
>> config: powerpc-randconfig-r071-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> smatch: v0.5.0-9004-gb810ac53
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180631.GYjY89hw-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202603180631.GYjY89hw-lkp@intel.com/
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>     clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
>>     make[3]: *** [rust/Makefile:644: rust/helpers/helpers.o] Error 1
>>>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>>>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>>>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>>>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>>>> error[E0658]: inline assembly is not stable yet on this architecture
>>     --> rust/kernel/sync/barrier.rs:19:14
>>     |
>>     19 |     unsafe { core::arch::asm!("") };
>>     |              ^^^^^^^^^^^^^^^^^^^^
>>     |
>>     = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
>>     = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
>>     = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date
>>
> 
> Support for this got merged Feb 2026 last week so powerpc is supported only on nightly build. Which is expected.

Does it mean it is too early to merge that into linux kernel v7.1 ?

Christophe

