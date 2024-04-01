Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A0A43AD1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 23:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712013781; cv=none; b=BPc0qqAwkpzNNj6DYreoNMXWvBAvsyBVjMEh8p1ouaI4GLizv6+9nUDjqCKdU/Id/UnJcU0WOIa5a0/acE7jJuGzNebyYdLM9h/+lQNSqYyJSs4PLoj+xa5LVqReaDWquPoA2q7hfSylbnuuKTeSUW/ZszqSyoaeCj/CPyz/YZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712013781; c=relaxed/simple;
	bh=5P8d/r/BoVw4Oa6ynxHa+kSNOrTt6GCTrKGlP5BMwuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NzUICoUwix6b68b0GTDB8vmjHr0B3xZ2WSGttRIvwUWJtCwNt2e5kTI+17WXuFa2/eQL4WPELDbG7ogwShQ9EbL8oQh+Iie3vuU4cggtdVQRf2RfqED35dVT5EkZisYe8ROceh70q7Fuz2sOzdxIhxgwuuE1MD+G8roDOl3p7Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lK6mtk2L; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lK6mtk2L"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso4142085276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 01 Apr 2024 16:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712013778; x=1712618578; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmDExLHPetBlj71YsBEElhTCPTwdlxD6er48VBd3ewo=;
        b=lK6mtk2LZRA9onp4PnPyEIT1YDcGJ9dDrMnjN9Mk+FUMcE65LJz1U437vCHemO+O2t
         PtcTaCNDsbU8yGw7hNj6D+DmgIxkD41LTUxdOA7TGBKS0SNn6xWK8B5/6/CgI32RsP4O
         WxsxTrskPbQaAFbBdfnmv8WKWP2/bZsMNNkPvOjnXBXYPUgvTF8W4qEnDbGekkaXxsYu
         t7I3UwQco540Iuz5UdLzOUxo3OnIn5Bj2TSqKMeVGomXHH6ITXWe+nrtccboFxzaX5wt
         uwPti8EUlsE0vrjmbAoCxHNlITfIdh0fYy0/OYO8TbydLOMdRHMk+w4J2KztplpJjkQf
         IW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712013778; x=1712618578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmDExLHPetBlj71YsBEElhTCPTwdlxD6er48VBd3ewo=;
        b=UJO8JjFBLGHJL/IoZM79yf63+Zw2wpFIwr1yqO6Ie3HBWbN7d4tBpDESLjS+8JzlFp
         I4qN2eYknbJzKLwMXH2Yy+5HPlcxl6Ak369XkOwlq+JFeeplMFux/eMtOb3IYajY27/E
         rzpLT2tkLN8FagDKT6GIwiY8PEutNHv1WGpkw0Jh5jMJ+3tn6xJRqjegMU5D0gkqt7Ru
         acVeylR9ykDptmJ7/ExtFxTL7iTp3zjyJNaGGJJ+XgucXDByx02UPsQjPZ681WJKhxpD
         bBDbuqOLU4GTk7216mxFkODs8zN8ShP1YrUxq4fTiZCL0n44t2GqJpXL9JmfjdB7FOC/
         UR4g==
X-Gm-Message-State: AOJu0YxAeVGqW4Mr/iL37VlT+G87bqmkx94nqnNLVyPjGslYBd43dcNS
	+dSdGvwrlA2RfKoTXjLRPvR/O7nUKiklxNAUwAYQ2esFtyU/U750i8laFvvV3oGKJUsxOBCRwrI
	CKucVNp42YZKugNxqcNq/y5or/goa1o5jSKlDCA==
X-Google-Smtp-Source: AGHT+IE7W33XJtOHycwYLTDjAhQzEGA5aAS4snSRR2F2mQp7U6D2wfzXYWPdZ29cRbSKMf5UOMBV+YapP7ToStevg1k=
X-Received: by 2002:a25:144:0:b0:dcc:f3fe:19c with SMTP id 65-20020a250144000000b00dccf3fe019cmr3380575ybb.59.1712013777822;
 Mon, 01 Apr 2024 16:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403311826.SNOu8jAt-lkp@intel.com>
In-Reply-To: <202403311826.SNOu8jAt-lkp@intel.com>
From: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Date: Mon, 1 Apr 2024 16:22:47 -0700
Message-ID: <CAKPbEqq93G8wrijC+hTFRaYpiBNWLy540rTusqY9etDQmuuQLQ@mail.gmail.com>
Subject: Re: [External] [akpm-mm:mm-unstable 263/270] mm/memory-tiers.c:769:13:
 warning: variable 'rc' set but not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Hao Xiang <hao.xiang@bytedance.com>, 
	"Huang, Ying" <ying.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will fix it in V10. Thanks,

On Sun, Mar 31, 2024 at 3:23=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-un=
stable
> head:   0cef2c0a2a356137b170c3cb46cb9c1dd2ca3e6b
> commit: fbc8b54896eef0b4d9aaa793523867c7eb86e788 [263/270] memory tier: c=
reate CPUless memory tiers after obtaining HMAT info
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/2024033=
1/202403311826.SNOu8jAt-lkp@intel.com/config)
> compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240331/202403311826.SNOu8jAt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403311826.SNOu8jAt-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    mm/memory-tiers.c: In function 'mt_perf_to_adistance':
> >> mm/memory-tiers.c:769:13: warning: variable 'rc' set but not used [-Wu=
nused-but-set-variable]
>      769 |         int rc =3D 0;
>          |             ^~
>
>
> vim +/rc +769 mm/memory-tiers.c
>
>    766
>    767  int mt_perf_to_adistance(struct access_coordinate *perf, int *adi=
st)
>    768  {
>  > 769          int rc =3D 0;
>    770
>    771          mutex_lock(&default_dram_perf_lock);
>    772          if (default_dram_perf_error) {
>    773                  rc =3D -EIO;
>    774                  goto out;
>    775          }
>    776
>    777          if (perf->read_latency + perf->write_latency =3D=3D 0 ||
>    778              perf->read_bandwidth + perf->write_bandwidth =3D=3D 0=
) {
>    779                  rc =3D -EINVAL;
>    780                  goto out;
>    781          }
>    782
>    783          if (default_dram_perf_ref_nid =3D=3D NUMA_NO_NODE) {
>    784                  rc =3D -ENOENT;
>    785                  goto out;
>    786          }
>    787          /*
>    788           * The abstract distance of a memory node is in direct pr=
oportion to
>    789           * its memory latency (read + write) and inversely propor=
tional to its
>    790           * memory bandwidth (read + write).  The abstract distanc=
e, memory
>    791           * latency, and memory bandwidth of the default DRAM node=
s are used as
>    792           * the base.
>    793           */
>    794          *adist =3D MEMTIER_ADISTANCE_DRAM *
>    795                  (perf->read_latency + perf->write_latency) /
>    796                  (default_dram_perf.read_latency + default_dram_pe=
rf.write_latency) *
>    797                  (default_dram_perf.read_bandwidth + default_dram_=
perf.write_bandwidth) /
>    798                  (perf->read_bandwidth + perf->write_bandwidth);
>    799
>    800  out:
>    801          mutex_unlock(&default_dram_perf_lock);
>    802          return 0;
>    803  }
>    804  EXPORT_SYMBOL_GPL(mt_perf_to_adistance);
>    805
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Best regards,
Ho-Ren (Jack) Chuang
=E8=8E=8A=E8=B3=80=E4=BB=BB
