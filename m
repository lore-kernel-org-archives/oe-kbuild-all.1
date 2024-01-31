Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6286033CF5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 18:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706726384; cv=none; b=op3/ZXmczkVfQNtwDl9aLcogf7Y/jAvWg53LukiIHdNoMGou9oVKnJcZK0C21hwl2PPzDKoSfkxJLdRzlz9OyVXt3yHYGu4ah5k4kNx5wsKwv44+hRwf7YvUlcFlkIvbcB63LmvdYav75vKCZ6B3S+1BERkngkOr2RFrxJXFg/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706726384; c=relaxed/simple;
	bh=7Uqyj8l1r8NE0bkd4J2UgvG89KO2S5zBNV3rnXHB0ZI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QFvmou32KWHw8J7ivavR4MaE94sxNY/amleOtY8Q+MVXYUzvNH+TbZDm/ah3nfk7lX63wuHQeQXjHrDos/moNVDJS5MfMfqPXdjxTMzAqjIts0cXDoN9sZf/yYuAkkrzmjQFf4FdeXPzpX8ZuBG3rurzvRptlNNPIfe6VFYgRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OLgxev39; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OLgxev39"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e9101b5f9so1015925e9.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 10:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706726379; x=1707331179; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=juQop2NLnMwYPIZdL2w80qPR0dgX4OMioW8zN30dagw=;
        b=OLgxev39ohKpkUeUU9MihyjVHWmTXDcwEr5ZiKRalsKkuLAeHlSVD2dQvY6gtNSrAE
         5h9v29ygt0i0ERibuiMdu6nmGeLHVnajTdqaSccobvDVbx1vttFU7WcRPzHXVoZxdAQj
         mHkPwn/HkgJVbgFMsGHJ5VNt/UvHvt1dV0Wre3ml0tJ3DvfFv+AI5JJ1O66A82urk7dD
         XE4IaeSDytlxcXnmnpjReq0dDSJkpbrdzRTcrEcZF8KCvHYe40A7TD5/E08euY3qRM6o
         hOn0OShoTfWX8TjY3aM/M8GE+6vCu1Syfn5QjEU2EPWLpUNQGnzMxRRSF/ZyrxCk4BAp
         7BWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706726379; x=1707331179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juQop2NLnMwYPIZdL2w80qPR0dgX4OMioW8zN30dagw=;
        b=DiRXtwT5UeAEa6iJS1n+U3D7WJnjutia0DoUucRnZyMkZBQgOHpgqlAC58IneAA5/m
         4Acj2G3cYEuVg6i5cn+tg2fSCzKRmAgpTTufyrXh7xiHfzLymvpl3PaCT7yaqnAFpIvQ
         K7dtxcFqLRvJOSoNowRau3hhOas6GLejun48NU5UMMeGrdLvOL2p3MwNf94OMqg7AD58
         KbeoOEywo4bitYUWU8CgFwSxfw7YRfe3lEPTppKP9xA6DzGvRsB0REG50/0OYyrAKTNs
         n9Zq20Cn0/U2ykP1hz2kBZ44/PsONd5ueb8l15e0hsFpWg26mt0tYLoO8LcqIEHpPBSn
         nkfQ==
X-Gm-Message-State: AOJu0Yz5hr2+lgekk8aZkxwMf26UnE4Fsh1r2h9MlrPPTM9ZpY9hP35L
	AI/3jShG3HLNln++chW+GhHhb5yMx7CUC4hZL+LeebWz8iCgsvhjTCwDvhK0Nkl3R5zWCVz5tol
	J
X-Google-Smtp-Source: AGHT+IHFJozvWPnKH7zmV7YyFXo20oEXLwg+l1dqJtygT+5eOiyTMhOkvHRtb30hGnIZlH7poY3HTg==
X-Received: by 2002:a05:600c:19cf:b0:40f:b732:1ed7 with SMTP id u15-20020a05600c19cf00b0040fb7321ed7mr812966wmq.34.1706726379446;
        Wed, 31 Jan 2024 10:39:39 -0800 (PST)
Received: from ?IPv6:2804:30c:1f49:9200:d29b:2478:179f:fbac? ([2804:30c:1f49:9200:d29b:2478:179f:fbac])
        by smtp.gmail.com with ESMTPSA id b26-20020adf9b1a000000b0033924b4d1f9sm14124717wrc.94.2024.01.31.10.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 10:39:39 -0800 (PST)
Message-ID: <fd027fa958a0bc65285a0c6c42e5921e7d28b0ad.camel@suse.com>
Subject: Re: [linux-next:master 1016/2825] make[2]: ***
 kselftest/livepatch/test_modules: No such file or directory.  Stop.
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Petr Mladek <pmladek@suse.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
	Memory Management List
	 <linux-mm@kvack.org>, Shuah Khan <skhan@linuxfoundation.org>, Joe Lawrence
	 <joe.lawrence@redhat.com>
Date: Wed, 31 Jan 2024 15:39:35 -0300
In-Reply-To: <ZbpnBqHUl3pE_3Te@alley>
References: <202401300736.GkSZoSrA-lkp@intel.com>
	 <ed54875555c282ad3b09503020a7aa978a80bd60.camel@suse.com>
	 <ZbpnBqHUl3pE_3Te@alley>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-01-31 at 16:34 +0100, Petr Mladek wrote:
> On Tue 2024-01-30 11:39:56, Marcos Paulo de Souza wrote:
> > On Tue, 2024-01-30 at 07:08 +0800, kernel test robot wrote:
> > > tree:=C2=A0=C2=A0
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > =C2=A0m
> > > aster
> > > head:=C2=A0=C2=A0 596764183be8ebb13352b281a442a1f1151c9b06
> > > commit: c4bbe83d27c2446a033cc0381c3fb6be5e8c41c7 [1016/2825]
> > > livepatch: Move tests from lib/livepatch to selftests/livepatch
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=3D1 build):
> > > (
> > > https://download.01.org/0day-ci/archive/20240130/202401300736.GkSZ
> > > oS
> > > rA-lkp@intel.com/reproduce)
> > >=20
> > When looking at the lib.mk, I just followed the other variables and
> > did
> > the same:
> >=20
> > TEST_GEN_MODS_DIR :=3D $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_MODS_DIR))
> >=20
> > But later on, I jump into $(TEST_GEN_MODS_DIR), which is invalid
> > because of the O=3D that is used a prefix for the path:
> > /tmp/kselftest/kselftest/livepatch/test_modules. My first idea was
> > to
> > just remove the patsubst and take TEST_GEN_MODS_DIR, which should
> > be
> > livepatch/test_modules in this case, but it then returns another
> > problem:
> >=20
> >=20
> > make: Entering directory
> > '/home/mpdesouza/git/linux/tools/testing/selftests'
> > make[1]: Entering directory
> > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> > make -C test_modules
> > make[2]: Entering directory
> > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_m
> > odul
> >=20
> > es'
> > make -C /lib/modules/6.5.9-1-default/build modules
> > KBUILD_EXTMOD=3D/home/mpdesouza/git/linux/tools/testing/selftests/liv
> > epat
> >=20
> > ch/test_modules
>=20
> Nit: There are sometimes strange empty lines between split long
> =C2=A0=C2=A0=C2=A0=C2=A0 lines. It looks like somehow messed cut&paste.

Sorry about it. I'll double check the output next time I copy from my
terminal.

>=20
> > make[3]: Entering directory '/usr/src/linux-6.5.9-1-
> > obj/x86_64/default'
> > make[4]: Entering directory '/tmp/kselftest'
> > /usr/src/linux-6.5.9-1/Makefile:754: include/config/auto.conf: No
> > such
> > file or directory
>=20
> I see the same. It looks to me like a bug in kernel-devel package.
>=20
> /usr/src/linux-6.5.9-1/Makefile is from the kernel-devel package
> for the running kernel. It should try to include auto.conf used
> for building the running kernel:
>=20
> =C2=A0 1. auto.conf should be packaged in kernel-devel.
>=20
> =C2=A0 2. The Makefile from the kernel-devel packages should be able
> =C2=A0=C2=A0=C2=A0=C2=A0 to find/use auto.conf from the kernel-devel pack=
age.
>=20
> IMHO, this actually helped to find a bug that
> make -C tools/testing/selftests/livepatch used auto.conf from
> the git tree while the modules are built against headers
> for the running kernel.
>=20
> That said, I wonder why this problem does not happen when building
> external modules (KMPs). I would expect that they are using
> the same Makefile from the kernel-devel package.
>=20
> Maybe the external modules somehow manage to clear "need-config"
> used by /usr/src/linux-6.5.9-1/Makefile. Maybe we do not need
> to include it either.
>=20
> > make[4]: *** [/usr/src/linux-6.5.9-1/Makefile:234: __sub-make]
> > Error 2
> > make[4]: Leaving directory '/tmp/kselftest'
> > make[3]: *** [../../../linux-6.5.9-1/Makefile:234: __sub-make]
> > Error 2
> > make[3]: Leaving directory '/usr/src/linux-6.5.9-1-
> > obj/x86_64/default'
> > make[2]: *** [Makefile:16: modules] Error 2
> > make[2]: Leaving directory
> > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_m
> > odul
> >=20
> > es'
> > make[1]: *** [../lib.mk:92: gen_mods_dir] Error 2
> > make[1]: Leaving directory
> > '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
> > make: *** [Makefile:180: all] Error 2
> > make: Leaving directory
> > '/home/mpdesouza/git/linux/tools/testing/selftests'

Well, this maybe be indeed a bug in kernel-devel. I added some debug
messages to make (-dd), and I believe that I understood what's going
wrong.

First of all, if we compile an out-of-tree module, like this:

make -C tools/testing/selftests/livepatch/test_modules

it goes to /usr/src/linux-6.5.9-1-obj/x86_64/default, and everything
works. I printed the abs_objtree and it's in fact where it should.

On like 234 of the toplevel Makefile, ion the __sub-make target, it
executed the make passed -C to $(abs_objtree), and -f to
$(abs_srctree). abs_objtree points to /usr/src/linux-6.5.9-1-
obj/x86_64/default while abs_srctree points to /usr/src/linux-6.5.9-1.
Everything works.

But things change whenever we use the O=3D argument. Its value is passed
to abs_objtree, making the __sub-make to execute is a peculiar way:
while abs_objtree is /tmp/kselftest, abs_srctree continues to be
/usr/src/linux-6.5.9-1. That's why the include fails in this case:

ifdef need-config                                                    =20
include include/config/auto.conf                                     =20
endif

As we are calling the include from /tmp/kselftest, and Makefile include
rules try to searching for the file in the directory of it's
execution[1], it fails. IIUC, all include paths on the toplevel
makefile should have $(abs_srctree) as prefix, so it could work. But as
Petr said, we don't have the include/config directory packaged in
kernel-devel.

I would like to note that this is a problem with out-of-tree module
building, and not only kselftest related. If we pass O=3D when building a
module, this will happen.

For testing purposes, I added the include/{generated,config}
directories into my /usr/src/linux/include, and added abs_srctree to
the include mentioned above, and now it's failing with:

# CC [M]=20
/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_module
s/test_klp_atomic_replace.o
gcc -Wp,-
MMD,/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_mo
dules/.test_klp_atomic_replace.o.d -nostdinc -I/usr/src/linux-6.5.9-
1/arch/x86/include -I./arch/x86/include/generated -I/usr/src/linux-
6.5.9-1/include -I./include -I/usr/src/linux-6.5.9-
1/arch/x86/include/uapi -I./arch/x86/include/generated/uapi -
I/usr/src/linux-6.5.9-1/include/uapi -I./include/generated/uapi -
include /usr/src/linux-6.5.9-1/include/linux/compiler-version.h -
include /usr/src/linux-6.5.9-1/include/linux/kconfig.h -include
/usr/src/linux-6.5.9-1/include/linux/compiler_types.h -D__KERNEL__ -
Werror -fmacro-prefix-map=3D/usr/src/linux-6.5.9-1/=3D -std=3Dgnu11 -fshort=
-
wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -Wall -
Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -
Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-
trigraphs -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-
protection=3Dbranch -fno-jump-tables -m64 -falign-jumps=3D1 -falign-loops=
=3D1
-mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -mskip-rax-
setup -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -Wno-sign-compare -
fno-asynchronous-unwind-tables -mindirect-branch=3Dthunk-extern -
mindirect-branch-register -mindirect-branch-cs-prefix -mfunction-
return=3Dthunk-extern -fno-jump-tables -fpatchable-function-entry=3D16,16 -
fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-
truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 -fno-
allow-store-data-races -Wframe-larger-than=3D2048 -fstack-protector-
strong -Wno-main -Wno-unused-but-set-variable -Wno-unused-const-
variable -Wno-dangling-pointer -ftrivial-auto-var-init=3Dzero -fno-stack-
clash-protection -pg -mrecord-mcount -mfentry -DCC_USING_FENTRY -
falign-functions=3D16 -Wvla -Wno-pointer-sign -Wcast-function-type -
fstrict-flex-arrays=3D3 -Wno-stringop-truncation -Wno-stringop-overflow -
Wno-restrict -Wno-maybe-uninitialized -Wno-array-bounds -Wno-alloc-
size-larger-than -Wimplicit-fallthrough=3D5 -fno-strict-overflow -fno-
stack-check -fconserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-
pointer-types -Werror=3Ddesignated-init -Wno-packed-not-aligned -g  -
DMODULE  -DKBUILD_BASENAME=3D'"test_klp_atomic_replace"' -
DKBUILD_MODNAME=3D'"test_klp_atomic_replace"' -
D__KBUILD_MODNAME=3Dkmod_test_klp_atomic_replace -c -o
/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_module
s/test_klp_atomic_replace.o
/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_module
s/test_klp_atomic_replace.c =20
In file included from /usr/src/linux-6.5.9-
1/include/linux/build_bug.h:5,
                 from /usr/src/linux-6.5.9-
1/include/linux/container_of.h:5,
                 from /usr/src/linux-6.5.9-1/include/linux/list.h:5,
                 from /usr/src/linux-6.5.9-1/include/linux/module.h:12,
                 from
/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_module
s/test_klp_atomic_replace.c:6:
/usr/src/linux-6.5.9-1/include/linux/compiler.h:246:10: fatal error:
asm/rwonce.h: No such file or directory
  246 | #include <asm/rwonce.h>
      |          ^~~~~~~~~~~~~~
compilation terminated.

Which seems to be missing the asm-generic targets (?). I'm not sure
what to think now, if this is indeed a bug or if we should adjust other
configurations. As you can see, my lack of Kbuild/Makefile knowledge is
big, but I'm doing my best to understand what's wrong and how I could
fix it :)

What do you think about it? Thanks in advance!

(I'm not sure if the output is messed up again...)

[1]: https://www.gnu.org/software/make/manual/html_node/Include.html

>=20
> Best Regards,
> Petr

