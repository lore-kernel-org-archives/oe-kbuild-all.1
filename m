Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C97C0A5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706625606; cv=none; b=GeWbkThZB+U0grDrAqQBbu7TjYOTSTGbjrUVXO2QkmoUO6YiawgFSmbt4AQ2mLJevc+2ibjwqt9Uffsb29o8PwbG6WW1/0bYANbPzqHhcdSOGsaDlEOrtrhdTPxM9cdF/CL7Sal17aRc5BZO2yxFFNIV6Q15E6qqRCgonx91ijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706625606; c=relaxed/simple;
	bh=bWLUcFSXZ/29WBR4oma2KkNug1Ec0bsmqjUejaO3zcc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BaRD2Q7HfBEe9QkwyksHtOCUJ0RvbvYRuPahFAW9wprCfWVlqwHwJOwHPPrcODt3pb6DacPIfocQru1RkjIdK0nn3lfpWxofh/vUJ6WTuEYaJmQWugwNNB5lddV5oAqV3AnE5up9y8+fj+zgWvSR4n4CIxhPI9Rt7mOlwyS72Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pgb7Furf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pgb7Furf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40fafced243so2655555e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706625601; x=1707230401; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xjg/+I63d+U5R7fMeF2LHmu1bxnHKSa/MzaASLqBPgk=;
        b=Pgb7FurfrPEJLTNtCg5kijdYpf/7MXUa4P78g43jXWLnF2EyUl+UNXVNoM3QC0hpPi
         8PCVKHweYWNz4cNupvvmOzfTVyfVDQ5KFrgDx0QLuuRRjENnnQMndBk+JIU+PjZn61rh
         /1elCIqRw++/rp5012Tsa3XVjEUAkH9FY+rbeQpnXbnU3qbyhrNNOkyv8PSlzlk3EHag
         8kpyzN+11vY3RYfb9PopkGMf5pe4kUCHbQnCBGG9txVzXzf6zZEzOr6ilsnR/IcMh5pu
         nFeQeVwEKvcMA4iBtXvqRCu7kgyP8a2QYx/yFbF9gqpS2BxD6iWyVa6d3FR3bW3Au6r7
         F0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706625601; x=1707230401;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xjg/+I63d+U5R7fMeF2LHmu1bxnHKSa/MzaASLqBPgk=;
        b=mkrrBfF+/9fbs8y7+6z1QQSedITMN1icJFG6mEQ5lft/MS8kt0DhAO07zeI2gYVwmR
         cSv1bUYeKon/N4lCBQ2nmOq921PH9u2B1+CCQy4MjrlOMN6eRmnb9pPXFQ6KrViO7wFY
         6lyH0m3ISBk6uC67aN4HFbPchxkagVQCSqsQQuwELcl2zr+p/+esyFuvK03SbK+zUJG1
         +PNqyIVa/RDX1mP9luHDouKfgwSdwEa9BcjpwG/+Hz3AxFKipwIfbd3YN5G6CrlFaO+Q
         cHEkNhUsWf89hXUeBysB3yk4ex13xzztBnJNrawMoSkvRjjJ+AauANFTsjoBcpFkaYRa
         12DA==
X-Gm-Message-State: AOJu0Yw9qar36YsPoMvb7+HpOMO+sMmoyzzsx+ekZ1h3iuL4nTqzL5hd
	1r9UydtMIdSvJZDLWKOfFz63UYzpjF9zzu7fmdNTKzSjkfl6RkfyOUj1O19wGWE=
X-Google-Smtp-Source: AGHT+IF3+8yHkJs+n6cTUrF2xQwJyUGXBrbuO4QiL7evEkyyqnc3tEFHGlHjkGdaA1l38Tc6Xa0F3w==
X-Received: by 2002:a5d:598f:0:b0:33a:e358:55c3 with SMTP id n15-20020a5d598f000000b0033ae35855c3mr8033763wri.4.1706625601320;
        Tue, 30 Jan 2024 06:40:01 -0800 (PST)
Received: from ?IPv6:2804:30c:1f49:9200:d29b:2478:179f:fbac? ([2804:30c:1f49:9200:d29b:2478:179f:fbac])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d5291000000b00337d980a68asm8575906wrv.106.2024.01.30.06.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 06:40:01 -0800 (PST)
Message-ID: <ed54875555c282ad3b09503020a7aa978a80bd60.camel@suse.com>
Subject: Re: [linux-next:master 1016/2825] make[2]: ***
 kselftest/livepatch/test_modules: No such file or directory.  Stop.
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
	 <linux-mm@kvack.org>, Shuah Khan <skhan@linuxfoundation.org>, Joe Lawrence
	 <joe.lawrence@redhat.com>, Petr Mladek <pmladek@suse.com>
Date: Tue, 30 Jan 2024 11:39:56 -0300
In-Reply-To: <202401300736.GkSZoSrA-lkp@intel.com>
References: <202401300736.GkSZoSrA-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2024-01-30 at 07:08 +0800, kernel test robot wrote:
> tree:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=C2=A0=
m
> aster
> head:=C2=A0=C2=A0 596764183be8ebb13352b281a442a1f1151c9b06
> commit: c4bbe83d27c2446a033cc0381c3fb6be5e8c41c7 [1016/2825]
> livepatch: Move tests from lib/livepatch to selftests/livepatch
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20240130/202401300736.GkSZoS
> rA-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202401300736.GkSZoSrA-lkp@intel.c=
om/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > make[2]: *** kselftest/livepatch/test_modules: No such file or
> > > directory.=C2=A0 Stop.
>=20

I had problems to compile the bpf tests, usually resulting in errors
like this:

$ make W=3D1 O=3D/tmp/kselftest -C tools/testing/selftests/bpf           =
=20
make: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests/bpf'
  CLNG-BPF [test_maps] connect_unix_prog.bpf.o
progs/connect_unix_prog.c:28:15: error: no member named 'uaddrlen' in
'struct bpf_sock_addr_kern'
        if (sa_kern->uaddrlen !=3D unaddrlen)
            ~~~~~~~  ^
1 error generated.
make: *** [Makefile:619: /tmp/kselftest//connect_unix_prog.bpf.o] Error
1

But, if I simply feed the livepatch selftests as target I'm able to
trigger the problem:


$ make W=3D1 O=3D/tmp/kselftest -C tools/testing/selftests/
TARGETS=3Dlivepatch                =20
make: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests'
make[1]: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make -C /tmp/kselftest/kselftest/livepatch/test_modules
make[2]: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make[2]: *** /tmp/kselftest/kselftest/livepatch/test_modules: No such
file or directory.  Stop.
make[2]: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make[1]: *** [../lib.mk:92: gen_mods_dir] Error 2
make[1]: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make: *** [Makefile:180: all] Error 2
make: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests'

When looking at the lib.mk, I just followed the other variables and did
the same:

TEST_GEN_MODS_DIR :=3D $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_MODS_DIR))

But later on, I jump into $(TEST_GEN_MODS_DIR), which is invalid
because of the O=3D that is used a prefix for the path:
/tmp/kselftest/kselftest/livepatch/test_modules. My first idea was to
just remove the patsubst and take TEST_GEN_MODS_DIR, which should be
livepatch/test_modules in this case, but it then returns another
problem:


make: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests'
make[1]: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make -C test_modules
make[2]: Entering directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modul

es'
make -C /lib/modules/6.5.9-1-default/build modules
KBUILD_EXTMOD=3D/home/mpdesouza/git/linux/tools/testing/selftests/livepat

ch/test_modules
make[3]: Entering directory '/usr/src/linux-6.5.9-1-obj/x86_64/default'
make[4]: Entering directory '/tmp/kselftest'
/usr/src/linux-6.5.9-1/Makefile:754: include/config/auto.conf: No such
file or directory
make[4]: *** [/usr/src/linux-6.5.9-1/Makefile:234: __sub-make] Error 2
make[4]: Leaving directory '/tmp/kselftest'
make[3]: *** [../../../linux-6.5.9-1/Makefile:234: __sub-make] Error 2
make[3]: Leaving directory '/usr/src/linux-6.5.9-1-obj/x86_64/default'
make[2]: *** [Makefile:16: modules] Error 2
make[2]: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modul

es'
make[1]: *** [../lib.mk:92: gen_mods_dir] Error 2
make[1]: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make: *** [Makefile:180: all] Error 2
make: Leaving directory
'/home/mpdesouza/git/linux/tools/testing/selftests'

Joe, Petr, Shuah,

Any ideas? I don't understand why we have that

make[4]: Entering directory '/tmp/kselftest'

I would expected that Kbuild would just spill the resulting module and
object files into the O=3D dir, instead of "jumping there". What am I
missing?

Thanks in advance for the help,
  Marcos


