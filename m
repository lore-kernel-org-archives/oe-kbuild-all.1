Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCF1A58B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707920835; cv=none; b=X4aEou+YOwMu9E/AH/VlbnsO8bfjRbmUS4qKUn/RpuzuqZLnQhecs2LfdygIuquEATRdkT1Yqr4VRNv4/7BhkYlaAhTvXPpxCLBWTwfL17jxqXUFcUg9EY7U5pgXWDAeS4UX5V/y5OCN5RRQmJpAd8Vow64xpEH8lup22RVeEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707920835; c=relaxed/simple;
	bh=jvNvPRJjU7Uvz/XSoywmG3p0zF8HMGzdrIW6yGRBqnE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWJtooe1JsHV7chyCASqQtPm4GTP/TDQ8OW/wmakMka9BehX1NY6W20ckP9JEi8dwTc7qkFPPcv8yB8vrJOz9r+NcDcjyH3NuWFhpSxchNxEr4OEZ/JmId6obGOAFmS8pBzf2o7BUYh5Yik7Pm6kO93jXtSmz6NUiGB80UBR0tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K9DnozGk; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K9DnozGk"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d073b54359so81461971fa.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 06:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707920830; x=1708525630; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fgs9VGKynfGZ10173Lr8cJQxDPbsczU2W+33RMyPMBw=;
        b=K9DnozGkHk7VRnaR5i8lh0HJfM+09a/8cDMPunweNHqX2/bCDw6cIyQwWd6NOS2hsi
         /qpOrzqx0ZaTsVAYH4aBeO1kp318FvDCNBqkWhVUugUlfNS8VrR94edpgdnYY5TRdzY5
         I6Nf/B8RlmkqurbFm4/wwUUokAGibj1iR2dv0cHaHKnpoyO/NVR18lEyC/UX2z530IXa
         Q5g6FWRulFc/ZYP1vyoLLai5y6AQXeze+wmIhs+/NmgKpdYMl3vOKGW+emvNFo5UelzK
         egCmvV5HacFnn6L5BAfQml0gzEUf6QC0dShUpDe0MYA1dHdBASwH7CNd+klcSVJ8ULEL
         fGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707920830; x=1708525630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fgs9VGKynfGZ10173Lr8cJQxDPbsczU2W+33RMyPMBw=;
        b=FosQpwL8vuqeWpNWIJvlTLCIsUaKwHRb8zM37/uTTq5rH8UI0favNmuf4qQo/C0z+/
         4mESkeqVEOiIW2e1Gk9BMe+ozh///9xi02DlapNXHBCPms0UFDoOGrlGb67k3yCUwjYe
         qn1mrnIktBj2+kRgAf2zEb3ENbn7rkcRaiKEURAk1AOyV6pJdPNQsrm4j+kDE05U5x3u
         6BeongXdp+iYotwzNz7h93CdbbWwUDg1Ddq/BDlhYr5njz5zP59rsv5iv41PXdqdtOEO
         +V3BJWSjOvALZ057oWVZkUKsDjJhbSVpeyUGWFyGa7SCkmQ1E0kFoWNQCgXhCbdpQgZB
         zurQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKjDnIivwxyViZGl1ot9CprfNTI5YmmYI3HeHw9rsTl8ELGm3ZHe1gpGCedMkqyuWmnMTiqNfcYYP58s9KQiJS5kTihz4Atq5KwVTXRQ==
X-Gm-Message-State: AOJu0YzSMfDXFD/pFZdBF5Fjc33gTsf23yLt/EHywzrM+JDXgn8pF5Jl
	BF59T7e9xQWcqwPSkuRjNrXhyqNiFiT2VIRfJ+YDZrC480mUfpMzXVTTg7fIsHg=
X-Google-Smtp-Source: AGHT+IEl0AU4JtMnHSIY/5pez0TAt00MVyXvCiktjH0kRdcgI7GoyA+jlXJfCCtWlBT3gEqj7hGDww==
X-Received: by 2002:a2e:7802:0:b0:2d0:ece7:d931 with SMTP id t2-20020a2e7802000000b002d0ece7d931mr2169912ljc.37.1707920830048;
        Wed, 14 Feb 2024 06:27:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgoqdNziOGZ0lkGqRoMgfenP8LCOfLvdl5BmB56zQJhrJeI8snaNtDvtHNSmvhPR0S32sCMLh8JpTctt0B2Hw8oDmgUNU3m7eIeKANjPmaTFNwRGkWC/suc6Io9G5rytqjC6VTcz8BCEqcrR/US0o23oijud0C/XInXm4oNxIuuNp6oWBW7TuyiZ5UGEUtxA8Wm5zuIuBaRx7qTxllCeU3UN5CdWvE
Received: from ?IPv6:2804:30c:167a:ef00:fc7a:1b9f:b267:a6b6? ([2804:30c:167a:ef00:fc7a:1b9f:b267:a6b6])
        by smtp.gmail.com with ESMTPSA id kt7-20020a170903088700b001db45ab819asm2326543plb.106.2024.02.14.06.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 06:27:09 -0800 (PST)
Message-ID: <4c1a70fdd5d18afae472392108bc0a68399f2046.camel@suse.com>
Subject: Re: [linux-next:master 1016/2825] make[2]: ***
 kselftest/livepatch/test_modules: No such file or directory.  Stop.
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Petr Mladek <pmladek@suse.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
	Memory Management List
	 <linux-mm@kvack.org>, Shuah Khan <skhan@linuxfoundation.org>, Joe Lawrence
	 <joe.lawrence@redhat.com>, mbenes@suse.com
Date: Wed, 14 Feb 2024 11:27:05 -0300
In-Reply-To: <02f28de735fd01e593b8c67941793945e28dc0f5.camel@suse.com>
References: <202401300736.GkSZoSrA-lkp@intel.com>
	 <ed54875555c282ad3b09503020a7aa978a80bd60.camel@suse.com>
	 <ZbpnBqHUl3pE_3Te@alley>
	 <fd027fa958a0bc65285a0c6c42e5921e7d28b0ad.camel@suse.com>
	 <ebd29766a769dc3844df9d0946736f2c5e2048be.camel@suse.com>
	 <02f28de735fd01e593b8c67941793945e28dc0f5.camel@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

I sent an email to linux-kbuild to ask Masahiro about it. I believe
that we should continue the discussion there.

https://lore.kernel.org/linux-kbuild/951fc31ee754ba86acaa9556e1d28c13075c66=
a2.camel@suse.com/T/#u

Thanks,
  Marcos

On Mon, 2024-02-05 at 15:05 -0300, Marcos Paulo de Souza wrote:
> On Wed, 2024-01-31 at 15:40 -0300, Marcos Paulo de Souza wrote:
> > CC'ing Miroslav, as he was also involved in the patchset and can
> > have
> > some ideas about how to fix this issue.
>=20
> Finally CCing Miroslav...
>=20
> >=20
> > On Wed, 2024-01-31 at 15:39 -0300, Marcos Paulo de Souza wrote:
> > > On Wed, 2024-01-31 at 16:34 +0100, Petr Mladek wrote:
> > > > On Tue 2024-01-30 11:39:56, Marcos Paulo de Souza wrote:
> > > > > On Tue, 2024-01-30 at 07:08 +0800, kernel test robot wrote:
> > > > > > tree:=C2=A0=C2=A0
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> > > > > > =C2=A0m
> > > > > > aster
> > > > > > head:=C2=A0=C2=A0 596764183be8ebb13352b281a442a1f1151c9b06
> > > > > > commit: c4bbe83d27c2446a033cc0381c3fb6be5e8c41c7
> > > > > > [1016/2825]
> > > > > > livepatch: Move tests from lib/livepatch to
> > > > > > selftests/livepatch
> > > > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > > > reproduce (this is a W=3D1 build):
> > > > > > (
> > > > > > https://download.01.org/0day-ci/archive/20240130/202401300736.G=
kSZ
> > > > > > oS
> > > > > > rA-lkp@intel.com/reproduce)
> > > > > >=20
> > > > > When looking at the lib.mk, I just followed the other
> > > > > variables
> > > > > and
> > > > > did
> > > > > the same:
> > > > >=20
> > > > > TEST_GEN_MODS_DIR :=3D $(patsubst
> > > > > %,$(OUTPUT)/%,$(TEST_GEN_MODS_DIR))
> > > > >=20
> > > > > But later on, I jump into $(TEST_GEN_MODS_DIR), which is
> > > > > invalid
> > > > > because of the O=3D that is used a prefix for the path:
> > > > > /tmp/kselftest/kselftest/livepatch/test_modules. My first
> > > > > idea
> > > > > was
> > > > > to
> > > > > just remove the patsubst and take TEST_GEN_MODS_DIR, which
> > > > > should
> > > > > be
> > > > > livepatch/test_modules in this case, but it then returns
> > > > > another
> > > > > problem:
> > > > >=20
> > > > >=20
> > > > > make: Entering directory
> > > > > '/home/mpdesouza/git/linux/tools/testing/selftests'
> > > > > make[1]: Entering directory
> > > > > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> > > > > make -C test_modules
> > > > > make[2]: Entering directory
> > > > > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/
> > > > > te
> > > > > st
> > > > > _m
> > > > > odul
> > > > >=20
> > > > > es'
> > > > > make -C /lib/modules/6.5.9-1-default/build modules
> > > > > KBUILD_EXTMOD=3D/home/mpdesouza/git/linux/tools/testing/selftes
> > > > > ts
> > > > > /l
> > > > > iv
> > > > > epat
> > > > >=20
> > > > > ch/test_modules
> > > >=20
> > > > Nit: There are sometimes strange empty lines between split long
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 lines. It looks like somehow messed cut&pa=
ste.
> > >=20
> > > Sorry about it. I'll double check the output next time I copy
> > > from
> > > my
> > > terminal.
> > >=20
> > > >=20
> > > > > make[3]: Entering directory '/usr/src/linux-6.5.9-1-
> > > > > obj/x86_64/default'
> > > > > make[4]: Entering directory '/tmp/kselftest'
> > > > > /usr/src/linux-6.5.9-1/Makefile:754:
> > > > > include/config/auto.conf:
> > > > > No
> > > > > such
> > > > > file or directory
> > > >=20
> > > > I see the same. It looks to me like a bug in kernel-devel
> > > > package.
> > > >=20
> > > > /usr/src/linux-6.5.9-1/Makefile is from the kernel-devel
> > > > package
> > > > for the running kernel. It should try to include auto.conf used
> > > > for building the running kernel:
> > > >=20
> > > > =C2=A0 1. auto.conf should be packaged in kernel-devel.
> > > >=20
> > > > =C2=A0 2. The Makefile from the kernel-devel packages should be abl=
e
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 to find/use auto.conf from the kernel-deve=
l package.
> > > >=20
> > > > IMHO, this actually helped to find a bug that
> > > > make -C tools/testing/selftests/livepatch used auto.conf from
> > > > the git tree while the modules are built against headers
> > > > for the running kernel.
> > > >=20
> > > > That said, I wonder why this problem does not happen when
> > > > building
> > > > external modules (KMPs). I would expect that they are using
> > > > the same Makefile from the kernel-devel package.
> > > >=20
> > > > Maybe the external modules somehow manage to clear "need-
> > > > config"
> > > > used by /usr/src/linux-6.5.9-1/Makefile. Maybe we do not need
> > > > to include it either.
> > > >=20
> > > > > make[4]: *** [/usr/src/linux-6.5.9-1/Makefile:234: __sub-
> > > > > make]
> > > > > Error 2
> > > > > make[4]: Leaving directory '/tmp/kselftest'
> > > > > make[3]: *** [../../../linux-6.5.9-1/Makefile:234: __sub-
> > > > > make]
> > > > > Error 2
> > > > > make[3]: Leaving directory '/usr/src/linux-6.5.9-1-
> > > > > obj/x86_64/default'
> > > > > make[2]: *** [Makefile:16: modules] Error 2
> > > > > make[2]: Leaving directory
> > > > > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/
> > > > > te
> > > > > st
> > > > > _m
> > > > > odul
> > > > >=20
> > > > > es'
> > > > > make[1]: *** [../lib.mk:92: gen_mods_dir] Error 2
> > > > > make[1]: Leaving directory
> > > > > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> > > > > make: *** [Makefile:180: all] Error 2
> > > > > make: Leaving directory
> > > > > '/home/mpdesouza/git/linux/tools/testing/selftests'
> > >=20
> > > Well, this maybe be indeed a bug in kernel-devel. I added some
> > > debug
> > > messages to make (-dd), and I believe that I understood what's
> > > going
> > > wrong.
> > >=20
> > > First of all, if we compile an out-of-tree module, like this:
> > >=20
> > > make -C tools/testing/selftests/livepatch/test_modules
> > >=20
> > > it goes to /usr/src/linux-6.5.9-1-obj/x86_64/default, and
> > > everything
> > > works. I printed the abs_objtree and it's in fact where it
> > > should.
> > >=20
> > > On like 234 of the toplevel Makefile, ion the __sub-make target,
> > > it
> > > executed the make passed -C to $(abs_objtree), and -f to
> > > $(abs_srctree). abs_objtree points to /usr/src/linux-6.5.9-1-
> > > obj/x86_64/default while abs_srctree points to /usr/src/linux-
> > > 6.5.9-
> > > 1.
> > > Everything works.
> > >=20
> > > But things change whenever we use the O=3D argument. Its value is
> > > passed
> > > to abs_objtree, making the __sub-make to execute is a peculiar
> > > way:
> > > while abs_objtree is /tmp/kselftest, abs_srctree continues to be
> > > /usr/src/linux-6.5.9-1. That's why the include fails in this
> > > case:
> > >=20
> > > ifdef need-
> > > config=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > > include
> > > include/config/auto.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > endif
> > >=20
> > > As we are calling the include from /tmp/kselftest, and Makefile
> > > include
> > > rules try to searching for the file in the directory of it's
> > > execution[1], it fails. IIUC, all include paths on the toplevel
> > > makefile should have $(abs_srctree) as prefix, so it could work.
> > > But
> > > as
> > > Petr said, we don't have the include/config directory packaged in
> > > kernel-devel.
> > >=20
> > > I would like to note that this is a problem with out-of-tree
> > > module
> > > building, and not only kselftest related. If we pass O=3D when
> > > building
> > > a
> > > module, this will happen.
> > >=20
> > > For testing purposes, I added the include/{generated,config}
> > > directories into my /usr/src/linux/include, and added abs_srctree
> > > to
> > > the include mentioned above, and now it's failing with:
> > >=20
> > > # CC [M]=20
> > > /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_
> > > mo
> > > du
> > > le
> > > s/test_klp_atomic_replace.o
> > > gcc -Wp,-
> > > MMD,/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/t
> > > es
> > > t_
> > > mo
> > > dules/.test_klp_atomic_replace.o.d -nostdinc -I/usr/src/linux-
> > > 6.5.9-
> > > 1/arch/x86/include -I./arch/x86/include/generated -
> > > I/usr/src/linux-
> > > 6.5.9-1/include -I./include -I/usr/src/linux-6.5.9-
> > > 1/arch/x86/include/uapi -I./arch/x86/include/generated/uapi -
> > > I/usr/src/linux-6.5.9-1/include/uapi -I./include/generated/uapi -
> > > include /usr/src/linux-6.5.9-1/include/linux/compiler-version.h -
> > > include /usr/src/linux-6.5.9-1/include/linux/kconfig.h -include
> > > /usr/src/linux-6.5.9-1/include/linux/compiler_types.h -
> > > D__KERNEL__
> > > -
> > > Werror -fmacro-prefix-map=3D/usr/src/linux-6.5.9-1/=3D -std=3Dgnu11 -
> > > fshort-
> > > wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -
> > > Wall
> > > -
> > > Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int
> > > -
> > > Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security
> > > -
> > > Wno-
> > > trigraphs -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-
> > > protection=3Dbranch -fno-jump-tables -m64 -falign-jumps=3D1 -falign-
> > > loops=3D1
> > > -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -
> > > mskip-
> > > rax-
> > > setup -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -Wno-sign-
> > > compare
> > > -
> > > fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-extern -
> > > mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-
> > > return=3Dthunk-extern -fno-jump-tables -fpatchable-function-
> > > entry=3D16,16
> > > -
> > > fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-
> > > truncation -Wno-format-overflow -Wno-address-of-packed-member -O2
> > > -
> > > fno-
> > > allow-store-data-races -Wframe-larger-than=3D2048 -fstack-
> > > protector-
> > > strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-
> > > variable -Wno-dangling-pointer -ftrivial-auto-var-init=3Dzero -fno-
> > > stack-
> > > clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -
> > > falign-functions=3D16 -Wvla -Wno-pointer-sign -Wcast-function-type
> > > -
> > > fstrict-flex-arrays=3D3 -Wno-stringop-truncation -Wno-stringop-
> > > overflow
> > > -
> > > Wno-restrict -Wno-maybe-uninitialized -Wno-array-bounds -Wno-
> > > alloc-
> > > size-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -
> > > fno-
> > > stack-check -fconserve-stack -Werror=3Ddate-time -
> > > Werror=3Dincompatible-
> > > pointer-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -g=C2=
=A0
> > > -
> > > DMODULE=C2=A0 -DKBUILD_BASENAME=3D'"test_klp_atomic_replace"' -
> > > DKBUILD_MODNAME=3D'"test_klp_atomic_replace"' -
> > > D__KBUILD_MODNAME=3Dkmod_test_klp_atomic_replace -c -o
> > > /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_
> > > mo
> > > du
> > > le
> > > s/test_klp_atomic_replace.o
> > > /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_
> > > mo
> > > du
> > > le
> > > s/test_klp_atomic_replace.c=C2=A0=20
> > > In file included from /usr/src/linux-6.5.9-
> > > 1/include/linux/build_bug.h:5,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /usr/src/linux-6.5.9-
> > > 1/include/linux/container_of.h:5,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /usr/src/linux-6.5.9-
> > > 1/include/linux/list.h:5,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from /usr/src/linux-6.5.9-
> > > 1/include/linux/module.h:12,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from
> > > /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_
> > > mo
> > > du
> > > le
> > > s/test_klp_atomic_replace.c:6:
> > > /usr/src/linux-6.5.9-1/include/linux/compiler.h:246:10: fatal
> > > error:
> > > asm/rwonce.h: No such file or directory
> > > =C2=A0 246 | #include <asm/rwonce.h>
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
> > > compilation terminated.
> > >=20
> > > Which seems to be missing the asm-generic targets (?). I'm not
> > > sure
> > > what to think now, if this is indeed a bug or if we should adjust
> > > other
> > > configurations. As you can see, my lack of Kbuild/Makefile
> > > knowledge
> > > is
> > > big, but I'm doing my best to understand what's wrong and how I
> > > could
> > > fix it :)
> > >=20
> > > What do you think about it? Thanks in advance!
> > >=20
> > > (I'm not sure if the output is messed up again...)
> > >=20
> > > [1]:
> > > https://www.gnu.org/software/make/manual/html_node/Include.html
> > >=20
> > > >=20
> > > > Best Regards,
> > > > Petr
> > >=20
> >=20
>=20

