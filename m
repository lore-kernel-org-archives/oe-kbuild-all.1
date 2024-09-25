Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35391A702
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276466; cv=none; b=X2VFXkdndDsDdSfr5HNsYFaYY082eV9+UsgVvm0N9Lrz2bnsSmima65dEcDw2m8DaEaUj13kz32Fq7CU2npGyPTbsxLnqgqk67NDMfzqrZ6AKrDrkmWf9VrpZDulpUj4L1WkkvhRaasRAso35/Ch5OkvN/k/oB8DsuCd1Vt1KY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276466; c=relaxed/simple;
	bh=1jc+pSWqIGg4sdAMIp0BE6UyNagjlvMpmDe2YucAOwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SkldEMoZY5mTP6sxB8D7Pza3ALj3NFWLe0pwr4Mkhxso5NiDSk52UJaAbIR4q+RMm27h7YqJOuLr3v7gQBnVkRKBirb4nLTKmGgE5RQHwJL2eeK6IbSQDH+dLDdE+Pnu84FMqyfqOsdIvVi3mSepF4DhkRzEUjl/HXJBJ6LT1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jw3SOzeh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jw3SOzeh"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3787e067230so4760760f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727276462; x=1727881262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFwaEjEcGbmOpy8y/A32031iEzvAr4b+8vGYpFCTIAQ=;
        b=Jw3SOzehV5oYyK12BSW/kCycaayJViuTZNfp8spBvB8oWFZB+8RDPtjb2VJQw0kFLx
         GSLpT2XpY6gghhXllMTwwk3ylVrEIUirv7ytEVjxFZAcU/ie7+CeTP1fj1dwxwX5bvHz
         7eE2ZEwuMkwpMydxCqJlj1/ahLV2K4p3KV7tME9AkNBLeaBTbB++9hjS8N+V0AeY4SAT
         hsCGk7APfy+fUxphJ4YR9BUPHRZjuebxgaKGqJwd7f3+x55pU745qshmNrHrS0SoDF9i
         lp9nlxgGGtw4FsI+/NSqhe72nOBvItlYKouxe9eQnHOc1pedPjnYhAryHRpxTLDtMjkA
         6ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276462; x=1727881262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFwaEjEcGbmOpy8y/A32031iEzvAr4b+8vGYpFCTIAQ=;
        b=xIwK+yTdEdcb7zCnUsAvBGnjTKLopqhKgvCXQRFbrrrSTQ2n7HrEPz+UN9UHFHMhZK
         n0hYxIxoyGr/47DiWG/oOSRQ5RJFVlryh+g1jb6i3Dhn63ZEosyyHg0mW3dOH/eaUdQm
         PSHQzMx4rCKwXo8kGTA0Y5VlLynKeM32xD6cXuG//Te7Mf7MWX6NtxKGNtVs+zBbDMuu
         hj+BATVB2uT4XNwNGGNzGa9BZGrreAZbvnnMzvSlaUOHwaHWZc2reTaoa3cdYWfTHtL3
         wnKwksFyjjMFPgb3+wUq9Bdv0NcJ0PtbFF4BhvbTy+OhfsWrqYnYn83/3zF0lFca+0LY
         GiEg==
X-Forwarded-Encrypted: i=1; AJvYcCWFQfJ4CauHtMz1dmG09RHKHOvwdd0+5aQ0ZoDBQcl9J3uLg1PWT5pqkI1hhJ+BxoBsnHmnlF6I9AIbt1F2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1b4LhuVQc7DYCTsufDtGGmsLgOlEIGX86xAM3WVu4k7Pu+LGu
	wyE0VFpj75hLF9Xr0lzf23DDOxCkFCUncNd1IxkGx+/0gGOwSj1wreZXywOOFxc=
X-Google-Smtp-Source: AGHT+IHD8vU/W6x0vrnctzoX3ajNrBx9dJukfD8SQWCnX830UdEgKBVYfapZ8BfJfjKWlfB6ECZW5A==
X-Received: by 2002:adf:8b92:0:b0:374:c0f5:79f4 with SMTP id ffacd0b85a97d-37cc245ba71mr1926279f8f.7.1727276461732;
        Wed, 25 Sep 2024 08:01:01 -0700 (PDT)
Received: from localhost (amontpellier-556-1-151-252.w109-210.abo.wanadoo.fr. [109.210.7.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2f9811sm4220353f8f.86.2024.09.25.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:01:01 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:00:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: axi-pwmgen: Create a dedicated function for getting
 driver data from a chip
Message-ID: <eodnwb352qkwukz4sgh3frk3e4porpzoz3wj3wqrp4t5wbxtqs@hkyjvxhdm4aq>
References: <20240923125418.16558-2-u.kleine-koenig@baylibre.com>
 <202409252009.ZbXikiQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ktev3ljfllbas3ib"
Content-Disposition: inline
In-Reply-To: <202409252009.ZbXikiQJ-lkp@intel.com>


--ktev3ljfllbas3ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 08:41:27PM +0800, kernel test robot wrote:
> /202409252009.ZbXikiQJ-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409252009.ZbXikiQJ-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from drivers/pwm/pwm-axi-pwmgen.c:25:
>    In file included from include/linux/io.h:14:
>    In file included from arch/s390/include/asm/io.h:93:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val =3D __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_=
IOBASE + addr));
>          |                                                         ~~~~~~=
~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from m=
acro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
>      102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
>          |                                                      ^
>    In file included from drivers/pwm/pwm-axi-pwmgen.c:25:
>    In file included from include/linux/io.h:14:
>    In file included from arch/s390/include/asm/io.h:93:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_=
IOBASE + addr));
>          |                                                         ~~~~~~=
~~~~ ^
>    include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from m=
acro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
>          |                                                           ^
>    include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
>      115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
>          |                                                      ^
>    In file included from drivers/pwm/pwm-axi-pwmgen.c:25:
>    In file included from include/linux/io.h:14:
>    In file included from arch/s390/include/asm/io.h:93:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBA=
SE + addr);
>          |                                                       ~~~~~~~~=
~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmeti=
c on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    In file included from drivers/pwm/pwm-axi-pwmgen.c:26:
>    In file included from include/linux/module.h:19:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/s390/include/asm/elf.h:181:
>    In file included from arch/s390/include/asm/mmu_context.h:11:
>    In file included from arch/s390/include/asm/pgalloc.h:18:
>    In file included from include/linux/mm.h:2213:
>    include/linux/vmstat.h:504:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      505 |                            item];
>          |                            ~~~~
>    include/linux/vmstat.h:511:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      512 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/vmstat.h:518:36: warning: arithmetic between different e=
numeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-c=
onversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip =
"nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
>    include/linux/vmstat.h:524:43: warning: arithmetic between different e=
numeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-=
enum-conversion]
>      524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~ ^
>      525 |                            NR_VM_NUMA_EVENT_ITEMS +
>          |                            ~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/pwm/pwm-axi-pwmgen.c:58:9: error: returning 'void *' from a fu=
nction with incompatible result type 'struct axi_pwmgen_ddata'
>       58 |         return pwmchip_get_drvdata(chip);
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/pwm/pwm-axi-pwmgen.c:64:27: error: initializing 'struct axi_pw=
mgen_ddata *' with an expression of incompatible type 'struct axi_pwmgen_dd=
ata'
>       64 |         struct axi_pwmgen_ddata *ddata =3D axi_pwmgen_ddata_fr=
om_chip(chip);
>          |                                  ^       ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>    drivers/pwm/pwm-axi-pwmgen.c:108:27: error: initializing 'struct axi_p=
wmgen_ddata *' with an expression of incompatible type 'struct axi_pwmgen_d=
data'
>      108 |         struct axi_pwmgen_ddata *ddata =3D axi_pwmgen_ddata_fr=
om_chip(chip);
>          |                                  ^       ~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>    16 warnings and 3 errors generated.
>=20
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>    Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
>    Selected by [m]:
>    - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 || COMPI=
LE_TEST [=3Dy])
>=20
>=20
> vim +58 drivers/pwm/pwm-axi-pwmgen.c
>=20
>     55=09
>     56	static struct axi_pwmgen_ddata axi_pwmgen_ddata_from_chip(struct p=
wm_chip *chip)

There is a * missing as the function returns a pointer to struct
axi_pwmgen_ddata and not the actual struct. I remember having fixed that
after a compile test, but it seems I sent out the change before I
squashed that in the commit :-\

Best regards
Uwe

--ktev3ljfllbas3ib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb0JZ4ACgkQj4D7WH0S
/k4zHQgAld2KQZJoIhEG+Pa15lWXnqRx71awdY67dtiBuM8JA8y3KJWskxR7hw2N
CCJXvmFCoqtawUoS9LxA3agkw5nF/cTU3NA+Iev27k0/msuPpi34fGULu6kkjQuh
vLT8wjkqVN66evmG0aF7NuvPf1Ulias6L+SUbBlTNFN2Vczhtk5sx0oQRBrKYBIi
ZPnWC2Qrk2TTBciSs3LyoBUxrGCbAIsAhOD1yVmDuqOFnbsUyorqIRHFurpqEgx5
wKeccBlMmkXrFtPenKvWxG5JeOU7dtcuXL6JWd9jRJKs8F4xPgBv3sNZFDmqSxIm
Ap8BpEwUTLPgs1HXHAdwvktw3BrNew==
=zrim
-----END PGP SIGNATURE-----

--ktev3ljfllbas3ib--
