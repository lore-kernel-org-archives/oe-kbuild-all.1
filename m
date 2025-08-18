Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230427E048
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755502950; cv=none; b=DB0VDc4XSxARUpQHd6zKHrlZCiP5u9koJXlBv8lkBcGamTSzGdQZEtYA0yr1E/Kc6iL0vuNSpw7Lv4mG2k3vlA+OcNrL7ax6EbpwzToIK0TCizDcVnUzrDFaQ49rnQkCTrasj9HqD3xKXaERq3Yhyu/zPx58vOTzs7MAkPFzV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755502950; c=relaxed/simple;
	bh=7woM1c358O/hcbTU2E3Rcu2TiLoSakRylf5EWIaixkw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/xoVD7OBB9y7AoJ4wEViBKNVp0dB8HAf20jX4ErOrTnYxh/anWZW24f+BuQ3FzsMSxkgUgGyXDUCV7CaP3ZLrPNaBw6swseaKf6Nz1IQVhesUSprZM7DCPzOBQtaaOKevuqjkUE+EB8HqBBXRZcXkRH2oU/CTsC3K6w6puhGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UIkIcA2C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UIkIcA2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755502947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7woM1c358O/hcbTU2E3Rcu2TiLoSakRylf5EWIaixkw=;
	b=UIkIcA2CQCxRuHi+nTEwtC+gIIjK7CH6RNqfoHQvG3iZBLgig7Haw9YuJo+gveIkM3REhb
	eh+P7KKer7noDz5Yyhr5+X+/WcBzyLcssJP8c+/9z3Q3jC+L+yczEdt7wTE2RIQTlf6C51
	OuC2nSOoyvXpmB31CLXu8oi1Ild3XCc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-SSnaaFhuNnS4b_8YVEtBeA-1; Mon, 18 Aug 2025 03:42:25 -0400
X-MC-Unique: SSnaaFhuNnS4b_8YVEtBeA-1
X-Mimecast-MFC-AGG-ID: SSnaaFhuNnS4b_8YVEtBeA_1755502945
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8706c668cso1167363485a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755502945; x=1756107745;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50iptxgF76lSBHlPJpOAe74hdT1ws8yqI6TSKvItRkU=;
        b=Gy6mIK2RHpr27x55FNaZ51ExFqmM4nVct+DWfcZ8BSsCO8QXGbKvjxtV6NHuFg57Xa
         4Pz5lmqsHhKj74Vy7f4ZPn7o0PNKwsZ3DSd8XuQLqDiXbF6xdMl93CzCEObu8OxYAcd5
         TW0vKOX78SOHVb/ta/WUebtU6r30CUcyMGD7ZDPUOC59uy+fkA3JudYpsQtYnfxlaqbB
         P6mZxxPNuBrE2lHS1NKjYT18O0RvsWHl3cZGaFANAFAD45EV2Rtb6I9zjGH8GBl/k691
         gvQ1izWvfmOx8N35xbbhwe5tBtuFuZy1Cv54aSo4BYk8R06y/UHBefBaxLUqHBAJmJ1a
         yqvg==
X-Forwarded-Encrypted: i=1; AJvYcCXw4H5HZcYjoXJQza32RasCiS+kjl9bQUsQLopzrcUcJK4JB7n+6NDDOEAyCx26LrWV2E+48dT/FqQEmwj5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/5EML0ylxM4+AOvsk02eJEAUq7eZuMdewsK/d5tmLLA/RFHPT
	68qBFJuMMYAOYiAQ2oAp0pnVc18DvBGLYr1FHosohUJQ/Ms6GoXdKRTaq9Jws+9u7LMVbLMJHMg
	mLZfR3xsiIOqhGln8JWp7oDJctWeo4nDhO4xtBFRNaV8InE/dSMWjsEjGjMZeTsIt5GY=
X-Gm-Gg: ASbGnctD+Y8FKsOLFgCdTcbSRm71f8529RPvHnU3m+3lNpZzK2s+9c0zdgaXc99Nnqf
	n5v0GLfWdm9VdWSg0/U3z3JaAomZGrZhIli6Y2//mckuTaCJASrNfFIF+eVZF0UanmX082beOrL
	bDRbkkLN5n0nhSzcH9Ns7irq317EN9LXJIzNZbAjTowC8VpfMDLtDXbmFhH4h5TL8Ev2jDH6DnK
	Qb1Lfubq8Y/QQIU4zP72o6RvPuYXZhU1PM6MCtYCUgx0ZdINGsUgshbjW/8ViBt2pdfYdomZbRj
	EateJ1pCW4uMI36Vng/v4p6W9gz+nPJObonJzQIpcmpspIASOc03SC+/wSshV+bW7A==
X-Received: by 2002:a05:620a:4091:b0:7e8:468e:67e2 with SMTP id af79cd13be357-7e87e022174mr1377493885a.26.1755502944529;
        Mon, 18 Aug 2025 00:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRXC2JR+1fI/my+9nPQsowb81rzv2FE65uoh0btXxA8YD6B27KnuUhBXdc6IplAFVmGWA78w==
X-Received: by 2002:a05:620a:4091:b0:7e8:468e:67e2 with SMTP id af79cd13be357-7e87e022174mr1377491885a.26.1755502944042;
        Mon, 18 Aug 2025 00:42:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de17cb4sm48380871cf.43.2025.08.18.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:42:23 -0700 (PDT)
Message-ID: <9ee2ad87e78a87d0d4ff0aee6fc7cf01c21f7cf7.camel@redhat.com>
Subject: Re: kernel/trace/rv/monitors/sleep/sleep.c:130:7: error: use of
 undeclared identifier '__NR_clock_nanosleep'
From: Gabriele Monaco <gmonaco@redhat.com>
To: kernel test robot <lkp@intel.com>, Nam Cao <namcao@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)"
 <rostedt@goodmis.org>
Date: Mon, 18 Aug 2025 09:42:20 +0200
In-Reply-To: <202508160204.SsFyNfo6-lkp@intel.com>
References: <202508160204.SsFyNfo6-lkp@intel.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eo2powlD_lsM8V6ezeSbtk2b9KTQ_NwCwsdSEq4M1NM_1755502945
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-08-16 at 02:37 +0800, kernel test robot wrote:
> tree:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=C2=A0m=
a
> ster
> head:=C2=A0=C2=A0 ee94b00c1a648530333d9734200be7a45e6e00cd
> commit: f74f8bb246cf22f27752977da62079cb615f55b2 rv: Add rtapp_sleep
> monitor
> date:=C2=A0=C2=A0 5 weeks ago
> config: riscv-randconfig-001-20250816
> (https://download.01.org/0day-ci/archive/20250816/202508160204.SsFyNf
> o6-lkp@intel.com/config)
> compiler: clang version 22.0.0git
> (https://github.com/llvm/llvm-project=C2=A093d24b6b7b148c47a2fa228a4ef315=
2
> 4fa1d9f3f)
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20250816/202508160204.SsFyNf
> o6-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202508160204.SsFyNfo6-lkp@intel.c=
om/
>=20

Palmer, this issue is what you fix in
https://lore.kernel.org/lkml/20250804194518.97620-2-palmer@dabbelt.com/
, right?

> All errors (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:804:2: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0=C2=A0 804 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 insb(addr, buffer, count);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 arch/riscv/include/asm/io.h:104:53: note: expanded from macr=
o
> 'insb'
> =C2=A0=C2=A0=C2=A0=C2=A0 104 | #define insb(addr, buffer, count) __insb(P=
CI_IOBASE +
> (addr), buffer, count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~~~~~ ^
> =C2=A0=C2=A0 In file included from kernel/trace/rv/monitors/sleep/sleep.c=
:2:
> =C2=A0=C2=A0 In file included from include/linux/ftrace.h:10:
> =C2=A0=C2=A0 In file included from include/linux/trace_recursion.h:5:
> =C2=A0=C2=A0 In file included from include/linux/interrupt.h:11:
> =C2=A0=C2=A0 In file included from include/linux/hardirq.h:11:
> =C2=A0=C2=A0 In file included from
> ./arch/riscv/include/generated/asm/hardirq.h:1:
> =C2=A0=C2=A0 In file included from include/asm-generic/hardirq.h:17:
> =C2=A0=C2=A0 In file included from include/linux/irq.h:20:
> =C2=A0=C2=A0 In file included from include/linux/io.h:12:
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:812:2: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0=C2=A0 812 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 insw(addr, buffer, count);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 arch/riscv/include/asm/io.h:105:53: note: expanded from macr=
o
> 'insw'
> =C2=A0=C2=A0=C2=A0=C2=A0 105 | #define insw(addr, buffer, count) __insw(P=
CI_IOBASE +
> (addr), buffer, count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~~~~~ ^
> =C2=A0=C2=A0 In file included from kernel/trace/rv/monitors/sleep/sleep.c=
:2:
> =C2=A0=C2=A0 In file included from include/linux/ftrace.h:10:
> =C2=A0=C2=A0 In file included from include/linux/trace_recursion.h:5:
> =C2=A0=C2=A0 In file included from include/linux/interrupt.h:11:
> =C2=A0=C2=A0 In file included from include/linux/hardirq.h:11:
> =C2=A0=C2=A0 In file included from
> ./arch/riscv/include/generated/asm/hardirq.h:1:
> =C2=A0=C2=A0 In file included from include/asm-generic/hardirq.h:17:
> =C2=A0=C2=A0 In file included from include/linux/irq.h:20:
> =C2=A0=C2=A0 In file included from include/linux/io.h:12:
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:820:2: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0=C2=A0 820 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 insl(addr, buffer, count);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 arch/riscv/include/asm/io.h:106:53: note: expanded from macr=
o
> 'insl'
> =C2=A0=C2=A0=C2=A0=C2=A0 106 | #define insl(addr, buffer, count) __insl(P=
CI_IOBASE +
> (addr), buffer, count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ~~~~~~~~~~ ^
> =C2=A0=C2=A0 In file included from kernel/trace/rv/monitors/sleep/sleep.c=
:2:
> =C2=A0=C2=A0 In file included from include/linux/ftrace.h:10:
> =C2=A0=C2=A0 In file included from include/linux/trace_recursion.h:5:
> =C2=A0=C2=A0 In file included from include/linux/interrupt.h:11:
> =C2=A0=C2=A0 In file included from include/linux/hardirq.h:11:
> =C2=A0=C2=A0 In file included from
> ./arch/riscv/include/generated/asm/hardirq.h:1:
> =C2=A0=C2=A0 In file included from include/asm-generic/hardirq.h:17:
> =C2=A0=C2=A0 In file included from include/linux/irq.h:20:
> =C2=A0=C2=A0 In file included from include/linux/io.h:12:
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:829:2: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0=C2=A0 829 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 outsb(addr, buffer, count);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 arch/riscv/include/asm/io.h:118:55: note: expanded from macr=
o
> 'outsb'
> =C2=A0=C2=A0=C2=A0=C2=A0 118 | #define outsb(addr, buffer, count) __outsb=
(PCI_IOBASE +
> (addr), buffer, count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ~~~~~~~~~~ ^
> =C2=A0=C2=A0 In file included from kernel/trace/rv/monitors/sleep/sleep.c=
:2:
> =C2=A0=C2=A0 In file included from include/linux/ftrace.h:10:
> =C2=A0=C2=A0 In file included from include/linux/trace_recursion.h:5:
> =C2=A0=C2=A0 In file included from include/linux/interrupt.h:11:
> =C2=A0=C2=A0 In file included from include/linux/hardirq.h:11:
> =C2=A0=C2=A0 In file included from
> ./arch/riscv/include/generated/asm/hardirq.h:1:
> =C2=A0=C2=A0 In file included from include/asm-generic/hardirq.h:17:
> =C2=A0=C2=A0 In file included from include/linux/irq.h:20:
> =C2=A0=C2=A0 In file included from include/linux/io.h:12:
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:838:2: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0=C2=A0 838 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 outsw(addr, buffer, count);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 arch/riscv/include/asm/io.h:119:55: note: expanded from macr=
o
> 'outsw'
> =C2=A0=C2=A0=C2=A0=C2=A0 119 | #define outsw(addr, buffer, count) __outsw=
(PCI_IOBASE +
> (addr), buffer, count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ~~~~~~~~~~ ^
> =C2=A0=C2=A0 In file included from kernel/trace/rv/monitors/sleep/sleep.c=
:2:
> =C2=A0=C2=A0 In file included from include/linux/ftrace.h:10:
> =C2=A0=C2=A0 In file included from include/linux/trace_recursion.h:5:
> =C2=A0=C2=A0 In file included from include/linux/interrupt.h:11:
> =C2=A0=C2=A0 In file included from include/linux/hardirq.h:11:
> =C2=A0=C2=A0 In file included from
> ./arch/riscv/include/generated/asm/hardirq.h:1:
> =C2=A0=C2=A0 In file included from include/asm-generic/hardirq.h:17:
> =C2=A0=C2=A0 In file included from include/linux/irq.h:20:
> =C2=A0=C2=A0 In file included from include/linux/io.h:12:
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:847:2: warning: performing pointer
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0=C2=A0 847 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 outsl(addr, buffer, count);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0 arch/riscv/include/asm/io.h:120:55: note: expanded from macr=
o
> 'outsl'
> =C2=A0=C2=A0=C2=A0=C2=A0 120 | #define outsl(addr, buffer, count) __outsl=
(PCI_IOBASE +
> (addr), buffer, count)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ~~~~~~~~~~ ^
> =C2=A0=C2=A0 In file included from kernel/trace/rv/monitors/sleep/sleep.c=
:2:
> =C2=A0=C2=A0 In file included from include/linux/ftrace.h:10:
> =C2=A0=C2=A0 In file included from include/linux/trace_recursion.h:5:
> =C2=A0=C2=A0 In file included from include/linux/interrupt.h:11:
> =C2=A0=C2=A0 In file included from include/linux/hardirq.h:11:
> =C2=A0=C2=A0 In file included from
> ./arch/riscv/include/generated/asm/hardirq.h:1:
> =C2=A0=C2=A0 In file included from include/asm-generic/hardirq.h:17:
> =C2=A0=C2=A0 In file included from include/linux/irq.h:20:
> =C2=A0=C2=A0 In file included from include/linux/io.h:12:
> =C2=A0=C2=A0 In file included from arch/riscv/include/asm/io.h:136:
> =C2=A0=C2=A0 include/asm-generic/io.h:1175:55: warning: performing pointe=
r
> arithmetic on a null pointer has undefined behavior [-Wnull-pointer-
> arithmetic]
> =C2=A0=C2=A0=C2=A0 1175 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return (port > MMIO_UPPER_LIMIT) ? NULL :
> PCI_IOBASE + port;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ~~~~~~~~~~ ^
> > > kernel/trace/rv/monitors/sleep/sleep.c:130:7: error: use of
> > > undeclared identifier '__NR_clock_nanosleep'
> =C2=A0=C2=A0=C2=A0=C2=A0 130 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 case __NR_clock_nanosleep:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~=
~~~
> > > kernel/trace/rv/monitors/sleep/sleep.c:141:7: error: use of
> > > undeclared identifier '__NR_futex'
> =C2=A0=C2=A0=C2=A0=C2=A0 141 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 case __NR_futex:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> =C2=A0=C2=A0 7 warnings and 2 errors generated.
>=20
>=20
> vim +/__NR_clock_nanosleep +130
> kernel/trace/rv/monitors/sleep/sleep.c
>=20
> =C2=A0=C2=A0 120=09
> =C2=A0=C2=A0 121=09static void handle_sys_enter(void *data, struct pt_reg=
s
> *regs, long id)
> =C2=A0=C2=A0 122=09{
> =C2=A0=C2=A0 123=09=09struct ltl_monitor *mon;
> =C2=A0=C2=A0 124=09=09unsigned long args[6];
> =C2=A0=C2=A0 125=09=09int op, cmd;
> =C2=A0=C2=A0 126=09
> =C2=A0=C2=A0 127=09=09mon =3D ltl_get_monitor(current);
> =C2=A0=C2=A0 128=09
> =C2=A0=C2=A0 129=09=09switch (id) {
> =C2=A0> 130=09=09case __NR_clock_nanosleep:
> =C2=A0=C2=A0 131=09#ifdef __NR_clock_nanosleep_time64
> =C2=A0=C2=A0 132=09=09case __NR_clock_nanosleep_time64:
> =C2=A0=C2=A0 133=09#endif
> =C2=A0=C2=A0 134=09=09=09syscall_get_arguments(current, regs, args);
> =C2=A0=C2=A0 135=09=09=09ltl_atom_set(mon,
> LTL_NANOSLEEP_CLOCK_MONOTONIC, args[0] =3D=3D CLOCK_MONOTONIC);
> =C2=A0=C2=A0 136=09=09=09ltl_atom_set(mon, LTL_NANOSLEEP_CLOCK_TAI,
> args[0] =3D=3D CLOCK_TAI);
> =C2=A0=C2=A0 137=09=09=09ltl_atom_set(mon,
> LTL_NANOSLEEP_TIMER_ABSTIME, args[1] =3D=3D TIMER_ABSTIME);
> =C2=A0=C2=A0 138=09=09=09ltl_atom_update(current,
> LTL_CLOCK_NANOSLEEP, true);
> =C2=A0=C2=A0 139=09=09=09break;
> =C2=A0=C2=A0 140=09
> =C2=A0> 141=09=09case __NR_futex:
> =C2=A0=C2=A0 142=09#ifdef __NR_futex_time64
> =C2=A0=C2=A0 143=09=09case __NR_futex_time64:
> =C2=A0=C2=A0 144=09#endif
> =C2=A0=C2=A0 145=09=09=09syscall_get_arguments(current, regs, args);
> =C2=A0=C2=A0 146=09=09=09op =3D args[1];
> =C2=A0=C2=A0 147=09=09=09cmd =3D op & FUTEX_CMD_MASK;
> =C2=A0=C2=A0 148=09
> =C2=A0=C2=A0 149=09=09=09switch (cmd) {
> =C2=A0=C2=A0 150=09=09=09case FUTEX_LOCK_PI:
> =C2=A0=C2=A0 151=09=09=09case FUTEX_LOCK_PI2:
> =C2=A0=C2=A0 152=09=09=09=09ltl_atom_update(current,
> LTL_FUTEX_LOCK_PI, true);
> =C2=A0=C2=A0 153=09=09=09=09break;
> =C2=A0=C2=A0 154=09=09=09case FUTEX_WAIT:
> =C2=A0=C2=A0 155=09=09=09case FUTEX_WAIT_BITSET:
> =C2=A0=C2=A0 156=09=09=09case FUTEX_WAIT_REQUEUE_PI:
> =C2=A0=C2=A0 157=09=09=09=09ltl_atom_update(current,
> LTL_FUTEX_WAIT, true);
> =C2=A0=C2=A0 158=09=09=09=09break;
> =C2=A0=C2=A0 159=09=09=09}
> =C2=A0=C2=A0 160=09=09=09break;
> =C2=A0=C2=A0 161=09=09}
> =C2=A0=C2=A0 162=09}
> =C2=A0=C2=A0 163=09

