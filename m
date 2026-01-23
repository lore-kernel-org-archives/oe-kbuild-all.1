Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB01264617
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198566; cv=pass; b=KMkI5uvhEo3eGsxeo/bNMJlY0Oe7JYd9xxCfYYUe2L2tP+c+E5RhpsrDOX5kwuwDCXPupNNt9/FsZ9UH02B6DELd3dYBkLkG7x16O0nnq8VcAzZjmjZ9V2S5NKDwWlBH8u4HylbfJPlxY4IJTcwgmwYgEVm3AHnrs/dobmD63jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198566; c=relaxed/simple;
	bh=N1WNpGhp0sNZGbNcGRXlb7uViIb7gYmd7lExA5LKlZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R78p+Y9f7m65+DM/b2oiz7raYFuorQdgqIDof8e7ZFVD/dndGsJgzgsXMzcis0pf9qhM3ovL5DAffGJt1dZv2B5Me7wv3hB3ZS7Uv99A4GcbKxU69728VXKckylhYeJbAZ9wLnkCbB1h19A1Z4ULtYhSlrHqbw0MsJIz6RrXY3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z95udger; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z95udger"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6495d592c10so1282121d50.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 12:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769198563; cv=none;
        d=google.com; s=arc-20240605;
        b=F75K4ZLEOCCLFCTMq5pcSIHotnQjim74IjvINR44ZVAlZZMV5/0wqa9GzCPtl6n/PQ
         nImExW4dW0g7tbPYT5hPzb84Upo+yB9blUvev6Pd8XgrLAFDAPzWv6gBZ2EurSLNLVQd
         Dw/XmdWD0h9EG6gxSYFfW8WT+TszCA1rGYS1iqCVdp5QHw2T8KLCFz61AhKcF7uqbZHM
         WsG8fTee22U3Rzsjaqsdbds7FOWtcm90+ZweONJJAt++cZ3U27SneiE/nWQZjRTViCxi
         6HXJ4KQTvmximTIgtj1B0DIeoHRwmgSCiFHl+5eJzWFLWs3ysthiUUy/dfNybp4h9e6u
         oO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EkhChGP0ZbklSidP8dLmcPOAubIdgw7SaaHGflOOdLg=;
        fh=QhlxYfmfh+SOEHEqrqcESGaUiJFayzTwrR97FcYBYyc=;
        b=h+50c3Fe6LrguOBN/2r0+oL9fwdRpP725ZEkniVM03oZc9D/jb2JVLKlwGquavPzlF
         7WNrNPeACG10D4N45YwXgYfO63ATgkwyKCFsj7eSXoCYm+RxReuF3k9ryPpkYREEAIKn
         rl0mZ2jpVmEbkm2EKU3uR8fvLzsTddx+5iYuGcn8dYH3oUCAeEpAEcOEKPkISbDm+1um
         /HPlb9AvrFGlX5/abgJhEABySBV1uKaIEksKfBNDRDajz1uTnorIBM4lQp/5XT+LXH1K
         HTjY7hMa69Rto4C0C8fHvaM4O6JqflGq+QIKDZZkaKqJ1c+EbIjqwoHFJ0XRBAILx94c
         VxvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198563; x=1769803363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkhChGP0ZbklSidP8dLmcPOAubIdgw7SaaHGflOOdLg=;
        b=Z95udgerkRIO4l54EYbPjx4SxpWDcl2bhA/h8NcwToWraNREa/exRUHDjl/n7NSyWK
         KXrUIn0by9YDemNdU/OcY0vNmHpzLVDljMqZNr6BnKnefzSWUT2bwwkmMtIGw4Aa92Q3
         wMl08F6orRgZ7XvhJOeIiFlCVsu2Xs/6aFhqxN/6y22kkT+ArHl/AB+XMscEsRYHvUkj
         C9RjMHoH17OyqcblDGuWJEvdBdVXUC5kwqyAs7Lzhf/rB46SN48qDxWfxavyqy7v0qRX
         HjnLT3sYPyXlcXqGD57TNFh1CLIAxg/f4tcDeSrqve34sXFkm0CkRgFVQ/PE3bliL7AH
         MRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198563; x=1769803363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkhChGP0ZbklSidP8dLmcPOAubIdgw7SaaHGflOOdLg=;
        b=wPTr3PMs95TPOcCARGgdJ4V/7muwkR/w3kX/3QmrKONbr9gs9mc8rQvrey832OHHXf
         OF1EZ96/lt7MfUCO2DtVEhxv5ypLJ5tanpJGBSv40KzkOcyBGo3uHOm8M0KpynLOUoPl
         RVLpKP2hTxaf4iJ6E4tsN4P0291ZHmzaCYyshgaQw1xR2PC+J90ozP8d0UTSOegh9t3d
         dlMpX4i7dP7Pd35aHloBnnr/fcSojz/2kdDGvD8WEiHO734QlfDeF9kQGlEN7+qnBCyW
         DR76vxpuu2Gj5pxL60VB27ymWv9snvLo6fPa+elSGbQ+5A8AWmRA2pImUh3BPaIn0/oQ
         OypA==
X-Forwarded-Encrypted: i=1; AJvYcCVdrryMGRR1N2t5fB+2V3TxHFc+s3LBLV5abSbxuQ1dFi6te20QyJKnCR8zkPl0bMX5F6v1KT3pMu89K6Ok@lists.linux.dev
X-Gm-Message-State: AOJu0YwYie/kIkTz2qMK8a4nq5a/1eWPJSKbfUTICB/sn2HUeOgctRBr
	DatUTb+1aW/fsuoHdF/mjhxSsFdudWFfoSe4PMFm/WtyXOFI8X60u7qWjI5//vA0IfFFWrFYZAX
	Hyv6lbut3a+LX6frivvykxAzfhE0OYh8=
X-Gm-Gg: AZuq6aIbNVTK8sDbaKLCQWOOWPtmDeO//FFT9eqvjNxedPKumB1gyyz1CKumPSsLEJs
	5/prMY+sIUiCPL/p2+yQSQW5zDdyADACNGdo9j8HP2BdLR49DAgCeNhVfCbDITKzE3RZOIe+Dj5
	g1MQVTtXmWfH8sBZfFKAArSGqQSsCsJuEWmaTAXPs5XsjRW9L1jEN38f8SY90SN2wvd+uRRc1CE
	HLVsphKJQXqomH2a0p6nU24qho3kQosQ32929oTu+7xLkIDCMDXwLP+/UneKOohDPkyRlr3EOru
	u5Q=
X-Received: by 2002:a05:690e:4186:b0:649:6658:ea91 with SMTP id
 956f58d0204a3-6496658ec17mr650331d50.0.1769198563454; Fri, 23 Jan 2026
 12:02:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601222139.VGTZ3L94-lkp@intel.com>
In-Reply-To: <202601222139.VGTZ3L94-lkp@intel.com>
From: jim.cromie@gmail.com
Date: Fri, 23 Jan 2026 13:02:17 -0700
X-Gm-Features: AZwV_Qj-bAHPt6tT84B11EMQjzpJT4i2sjpSnGjweT0wpJIk5iaoOOr7vENW8Z8
Message-ID: <CAJfuBxyv4kXHv_YbddhwYxSA_mk-BTH=FFK7qTg2JcgZVL24xQ@mail.gmail.com>
Subject: Re: [jimc:dd-drm-fix 45/75] lib/dynamic_debug.c:1844
 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:27=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   https://github.com/jimc/linux.git dd-drm-fix
> head:   354f9423ffa1fb2a31f8410ddeea96a7a8471ec1
> commit: 37e1c3e5c714f09a36daac2b5c3c55b3b7f9fae4 [45/75] dyndbg: cache th=
e dynamic prefixes per callsite.
> config: arc-randconfig-r072-20260122 (https://download.01.org/0day-ci/arc=
hive/20260122/202601222139.VGTZ3L94-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 12.5.0
> smatch version: v0.5.0-8985-g2614ff1a
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601222139.VGTZ3L94-lkp@intel.com/
>
> smatch warnings:
> lib/dynamic_debug.c:1844 ddebug_drop_cached_prefix() warn: passing freed =
memory 'prefix' (line 1843)
>
> vim +/prefix +1844 lib/dynamic_debug.c
>
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1833  static void ddebug_drop_cache=
d_prefix(const struct _ddebug *dp)
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1834  {
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1835      char *prefix;
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1836      unsigned long key =3D dde=
bug_prefix_key(dp);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1837      unsigned long lock_flags;
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1838
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1839      spin_lock_irqsave(&pr_pre=
fixes_lock, lock_flags);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1840      prefix =3D mtree_erase(&p=
r_prefixes, key);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1841      spin_unlock_irqrestore(&p=
r_prefixes_lock, lock_flags);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1842      if (prefix) {
> 37e1c3e5c714f0 Jim Cromie 2023-10-02 @1843              kfree(prefix);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02 @1844              v3pr_info("drop c=
ached prefix: %s\n", prefix);
>
> print the string first, then free it.

oh yes.  thank you.


>
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1845      }
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1846  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
