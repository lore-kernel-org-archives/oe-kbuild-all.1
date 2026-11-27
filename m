Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801991;
	b=t966chk6GKzRw7hU+TQ7NB/4h5VRF5ZmpIIJroGs3/3a2VoNCHZcBvswXEQKeKWNPZ54
	 NgFet9QC5muG6w5pz96dGhRQwQFQ+HLxgTvnQ805p5CM00MHUg8octvHE8tKuLwXxiOh2
	 ywxamp2RsEgQVcNw9w2Ez6ckt5/x3env85neewsPKC8TrRk+LltZQh8j5pscuhIeYZtaf
	 bNiDNTmW2XVleWhlw18MnF4ZjPCqYytzBDeagKmIgdFZ1MwEb5G8UysPyXcSrbqvNhFaC
	 bamb3dKItVZy2MH2Kn/f4rFhCzRi/GsVGlw20Rtx0u5IkgpVadP0fYAwnr7948tVhkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=YbrJuZEMhARstEupCVWU0DhIXaBmHViQoAYzcKNfsOM=;
	b=Q99pmeUpL9LRQJwnu0tK2VPlXjYbVKsijPNjUmQyFOgRVxMedwbgl0h1+TYCOGeB+gPT
	 LCSjJWGSoZNcfw2ePA0RazdvQoUlLOn6Ilw/n51srjc0EQZ3jngjZT0jRP89kqvk5CTHY
	 fpic0tGBq7ezu4lvs+hztSEqmpuNB9t6scVECc2lnnzgYqnbgHQAZq2GyrlO2wSz0TjjA
	 vlDvvjA6JFfsDO07D1mqeGBYOGBHvUn06H4QCEOfr0nnUOqPEMEHSzuxbEwk5oon4WmyN
	 Eb1KrGjEdCtFrQTls6CehAFpBHhrwIWjeKpl9Y+nm4KMP/TVruolUhQs7rfjCz/9saw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KNm5iGmj;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F13606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 17:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KNm5iGmj
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4cc793704so65811187b3.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795801990; x=1796406790; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbrJuZEMhARstEupCVWU0DhIXaBmHViQoAYzcKNfsOM=;
        b=KNm5iGmjEdXd29ee+/+rm7NaIdtLK7/ZqEvJzBeKPmszWnLkfBnqVQrrHTEK2xMQx4
         4fD6V2LJ4ZSbdG0awm+6CBSQeOs+rETVlGK+BnMSwRX6JEUEoZUdlPy/tpbfcZ1xRLhL
         JY8VqTuPlqKGginUsmURfCCUybRGphf8DP7TLhckjETazdzixGyL1PkZUhf0qNky3MOx
         +TBoUZD32GysfueKh9Yxejh8EE44xoJa3xIZeVy+QB5Eiury2NOeka2twb2wD73XbFbi
         QWZVqxFUdy4oXop8XrIElXpxhCaKdIWMRcauAeJtEmGac3Qq1GzRfiRfxeB++MSGJ4Jl
         oh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801990; x=1796406790;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YbrJuZEMhARstEupCVWU0DhIXaBmHViQoAYzcKNfsOM=;
        b=mLvoiHA6DwsL2PiilHUa/d40nnjg4nzBXpb4gDQk7yPy18mCMFNm0U+0AaFqlqPke1
         3JgyINhvY6ALNJxxAP58sgy+5uGB1fh4MCLfbQZdt7dkEljhaNF8bPT8OF1xWS0UEPfj
         7zEjV46Y5P9bsZe61qpHnk+5SBOd8KQTZNIDKmhy23FqhiSQl11ycnxGZGqnkxqrS/+I
         oIQHU+TqQA+gan3XvHesudhphXjA+JMbotF1THCwFHyHT8zXo4+jhfXsgDYslUXjYxvb
         DooRNG1eu8+zXgsqCPnfSdMIj8TGy0XGmsdFQtuJDOeWs+mgk3cCMw5Z3zUaq/OwnDmE
         Fivg==
X-Gm-Message-State: APuU4Z8mdOb2Y8Qj1Fk8iGpVyTwgfuXT5ui+Qs9R0dS9rckM3xCYezrk
	P0GMGLK5C/vXIeUCELHuTWvxRXJb3xgqjP2H0RUH5i5VATeJsMUoXrbedlBPMz8pnJ4=
X-Gm-Gg: AZFdTZc41f1hLzebdTzP+bC3IlfRJxixJYl+PTIdhDnkOrOLcbkw8lds8PHdp80ZcQF
	YyWUZF6gpW+X+6yZbzFFoj8UuHlPhkIhvKbqTS/0PorkRL60KNT7I/gXvunn9u5vhH0vQcWZyNf
	izzjFOgzeF+JswVS+NqyHLyPxMAa1VYquT0qX5Sl+E9YFmXDy5n7pz46IYTyhUYTToMAos5M2WI
	YkPKBPpwdZrl1cdYamPupzXioCCNbFDcz2DmT/yiLUk3nB8lOiW2lhtovch5D+ABL0/B6/TSHjj
	gehYi6l6CuOIXgc/myD3SJ0QEor0CG4ZM27EZfh7b0t691jAU4depTqoFHPDooDHeru5HN0ldaV
	mnuLUELX0/7ha+rrsn64fd1vjVnBJD5HkIVh6g685mDeUk3JISh1EXky7U1gN5qgHZriIz/jRhc
	MSjBrZfPocX4Mepl4c73dRKyhCuPoXwIlz3oT4t3+0YEPBKhrESa70IwC2PoxA8GxIEaW0ll3I5
	a30VvLN+8ERmqnbCncoWKCi47tLjUhQX4c41O0RJNPWMXoRfVjs/tK6Z4iV3E5efKnr/wfSoS4A
	K36yAxaF2CwG6W3x7xIewsdYBpHXP1tfSDuBwj/++EZh3ztLYAAMxldbtfCYYX/z0+Ck80k25Qm
	7pGtstYIO3jSV7hAk4otC15wmRf+TsBozRFe59DxhrbabCSlnM7qpGVp5No/A0+MES7GhgZ2F
X-Received: by 2002:a05:690c:dc1:b0:8b3:23f3:134d with SMTP id 00721157ae682-8b5204ba154mr89112077b3.42.1795801990329;
        Fri, 27 Nov 2026 09:53:10 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1a5a:d5f7:70f5:514b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b56fc6131fsm35622287b3.34.2026.11.27.09.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:53:09 -0800 (PST)
Message-ID: <0e5898598e12940f4b33aebccabb6bd3a42565f2.camel@dubeyko.com>
Subject: Re: [PATCH] hfsplus: reorder complete combining runs for dentry keys
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: kernel test robot <lkp@intel.com>, shaos <shawnq1@163.com>, 
	glaubitz@physik.fu-berlin.de, frank.li@vivo.com
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 27 Nov 2026 09:53:08 -0800
In-Reply-To: <20261127114353.IlT3o2gb-lkp@intel.com>
References: <20261126160720.3007837-1-shawnq1@163.com>
	 <20261127114353.IlT3o2gb-lkp@intel.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Somehow, I don't see this patch in my email client. Please, fix the
issues and resend the patch. And, please, double check that you are
sending the patch in plain text.

Thanks,
Slava.

On Fri, 2026-11-27 at 11:52 +0800, kernel test robot wrote:
> Hi shaos,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on brauner-vfs/vfs.all]
> [also build test WARNING on linus/master v7.4-rc4 next-20261126]
> [If your patch is applied to the wrong git tree, kindly drop us a
> note.
> And when submitting patch, we suggest to use '--base' as documented
> in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/shaos/hfsplus-reorder-comp=
lete-combining-runs-for-dentry-keys/20261126-160720
> base:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git=C2=A0vfs.all
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20261126160720.3007837-1-shawnq1%40163.com
> patch subject: [PATCH] hfsplus: reorder complete combining runs for
> dentry keys
> config: arm-allyesconfig
> (https://download.01.org/0day-ci/archive/20261127/20261127114353.IlT3
> o2gb-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20261127/20261127114353.IlT3
> o2gb-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/20261127114353.IlT3o2gb-lkp@intel=
.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 fs/hfsplus/unicode.c: In function 'hfsplus_compare_dentry':
> > > fs/hfsplus/unicode.c:747:1: warning: the frame size of 1456 bytes
> > > is larger than 1280 bytes [-Wframe-larger-than=3D]
> =C2=A0=C2=A0=C2=A0=C2=A0 747 | }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^
> --
> =C2=A0=C2=A0 fs/hfsplus/unicode_test.c: In function
> 'hfsplus_dentry_combining_reorder_long_test':
> > > fs/hfsplus/unicode_test.c:1547:1: warning: the frame size of 1680
> > > bytes is larger than 1280 bytes [-Wframe-larger-than=3D]
> =C2=A0=C2=A0=C2=A0 1547 | }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^
>=20
>=20
> vim +747 fs/hfsplus/unicode.c
>=20
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 721=C2=A0=20
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 722=C2=A0 /*
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 723=C2=A0=C2=A0 * Compare strings
> with HFS+ filename ordering.
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 724=C2=A0=C2=A0 * Composed
> unicode characters are decomposed and case-folding is performed
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 725=C2=A0=C2=A0 * if the
> appropriate bits are (un)set on the superblock.
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 726=C2=A0=C2=A0 */
> 6fa67e70755930 Al Viro=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2016-07-31=C2=A0 727=C2=A0 int
> hfsplus_compare_dentry(const struct dentry *dentry,
> 621e155a359196 Nicholas Piggin=C2=A0=C2=A0=C2=A0 2011-01-07=C2=A0
> 728=C2=A0=C2=A0		unsigned int len, const char *str, const struct qstr *na=
me)
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 729=C2=A0 {
> d3fe19852e96aa Al Viro=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2016-07-29=C2=A0 730=C2=A0=C2=A0	struct
> super_block *sb =3D dentry->d_sb;
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 731=C2=A0=C2=A0	int ca=
sefold
> =3D test_bit(HFSPLUS_SB_CASEFOLD, &HFSPLUS_SB(sb)->flags);
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 732=C2=A0=C2=A0	struct
> hfsplus_decompose_iter it1, it2;
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 733=C2=A0=20
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0
> 734=C2=A0=C2=A0	hfsplus_decompose_iter_init(&it1, sb, str, len, HFS_REGUL=
AR_NAME);
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0
> 735=C2=A0=C2=A0	hfsplus_decompose_iter_init(&it2, sb, name->name, name->l=
en,
> 897c2beb4a7799 Viacheslav Dubeyko 2026-03-23=C2=A0
> 736=C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 HFS_REGULAR_NAME);
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 737=C2=A0=20
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 738=C2=A0=C2=A0	while =
(1) {
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 739=C2=A0=C2=A0		int
> c1 =3D hfsplus_decompose_iter_next_folded(&it1, casefold);
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 740=C2=A0=C2=A0		int
> c2 =3D hfsplus_decompose_iter_next_folded(&it2, casefold);
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15=C2=
=A0 741=C2=A0=20
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 742=C2=A0=C2=A0		if
> (c1 < 0 || c2 < 0)
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0
> 743=C2=A0=C2=A0			return c1 =3D=3D c2 ? 0 : (c1 < 0 ? -1 : 1);
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 744=C2=A0=C2=A0		if
> (c1 !=3D c2)
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0
> 745=C2=A0=C2=A0			return c1 < c2 ? -1 : 1;
> bbe5ebcbc006ac Viacheslav Dubeyko 2026-09-18=C2=A0 746=C2=A0=C2=A0	}
> d45bce8faf5551 Duane Griffin=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2007-07-15 @74=
7=C2=A0 }
