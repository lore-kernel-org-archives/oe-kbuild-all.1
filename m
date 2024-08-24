Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5841C72
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724481690; cv=none; b=UUCFRaLPjmuZyf+dsGYrzOr7+oSWHWPFSYqZFIfv/F7m9JeTDY1Eki9Dam4E2TpYJZb455Nv1ppxdlQHfheKHLAL8UBu2mmY5ol7GQKmDBeMAObxRDni6plQB+iTKaJ3y77SP+DAAtKSp6mNyvbuNQkaxcgrK1QGZrrWujy04rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724481690; c=relaxed/simple;
	bh=Dc2oA+rQ8miBH34Mh6BzgnuxyX5VWuTkY98HeeGLLFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAtXUQ9U5D5E8gyaggJLQGLQMKrIhPDrHK9yrX2Uf6AEYS96ofoMxQxdesDESVHohcICTwhl7biKG3T9/PxCo90b3KX7ekXhyvPmzw0RYqEvrVsGfN/XPT9vw7eVAGmaqG+RypCQyaPgrqxeYl1udj2ApW7103dYmpjnlaiG1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0/7Tpgu; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0/7Tpgu"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7cd8afc9ff3so2624179a12.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 23:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724481689; x=1725086489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLgAkkCBaXoGirDhhKnzRXuj0CxXS9rHgzxSe9Wjab4=;
        b=G0/7TpguI6vf2yoF5jhkYYvk86OPAx81O365PiQgf3QRNStX2S7jQG1xLq0+Xj4qB8
         i0BxUD2EyyFXrcwtI0PfY45mofyQQzEU9NYnaBV2o1UUiXrah2i/SZ4VskJlmtE7+HDw
         GM/8Pzk7dpp6Zh2yvpI5kvZotb4vh5Qs0Gh0v6O/p/O735PQrAe7vHrnLJ3Ense5gwlt
         qqkFwGysZKyZqaaFZHIFdq0sj4hQATutZfpRmBuaE+5IbXuVYAjXdBvZjM926fjMGMaP
         GjOiOT20HWPrdvoPocODoZftGbR1vRIyPOkEgAwr/TCN8TOb7vNtCMdljupPVBoahPDZ
         Oyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724481689; x=1725086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLgAkkCBaXoGirDhhKnzRXuj0CxXS9rHgzxSe9Wjab4=;
        b=I2hjc1LCEkhyiPcdO7mIWQVAx+ZhQ6U+FpdiFoEWiHPuSw2T65nQZFTZHuL2CkKcEQ
         ++hdk9mXtnqchv9V89rUd78p8LxuZMlH/SbdoNHSg4s2IW6g6jLjB9d9AeyKIYHx8tTA
         XjSYfrhuvl9B88ERkvCrISTAmNAHcgSU7Noq7FfoWsbtJ2LZ/1edzm0+QSH6/JZJtjiO
         RxI+wJ1zf0lYW5ukLzXnwexVDsmaSdoBAWx+1Ama5ncqTytOhNu5ZmwuBNR0zeedQ2P8
         nUavhM93MBpZtcrmAwqvrxwvVh8uo/ZIuNCIURXdtvCnOyi4p9TDvOj13N01iAzs3F5Y
         JSew==
X-Forwarded-Encrypted: i=1; AJvYcCXNMWgmiLIBlEXp465yTn9F+moIYiBpw7o/Yu/bYEzeSvCYmxcPxykZd4g2acTyiOYOHYTxGnbCPLImXeZ1@lists.linux.dev
X-Gm-Message-State: AOJu0YyF20RuCTuVYpYcQ9zWx55CGJrifwIbcwEX1+7oWfF5mpC1I/Bb
	c4MPV3LGLu6nmxYWTzqQaf7CcO3ohnoFPy2RZs7Sd/xw/6uwIunoQsD5ajP0kX3tOxtAZsjMJn1
	xqu6r9qZfI7kwtuVARcwg9zBhJOY=
X-Google-Smtp-Source: AGHT+IHpVnut0KgCccnCub4pr8gA7C8vdcD165fpWrPmQYnEl7CcYwuL6lIAjHnHR8x73vrE6gxEmEEFH2ZoBhsjHmU=
X-Received: by 2002:a17:90b:33c4:b0:2cb:5829:a491 with SMTP id
 98e67ed59e1d1-2d644af966dmr7824484a91.20.1724481688651; Fri, 23 Aug 2024
 23:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408220755.LlaA10C6-lkp@intel.com> <3ba6caea-654e-4dcd-a4a4-bfdcf808f0e5@intel.com>
In-Reply-To: <3ba6caea-654e-4dcd-a4a4-bfdcf808f0e5@intel.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 23 Aug 2024 23:41:17 -0700
Message-ID: <CAMo8BfJOPNaHb0f3Rf2GyhApCDg5bFfCGETWU9-LBJWiJpLeFw@mail.gmail.com>
Subject: Re: WARNING: [xtensa] modpost: vmlinux: section mismatch in
 reference: ice_adv_lnk_speed_maps+0x14 (section: .data) ->
 __setup_str_initcall_blacklist (section: .init.rodata)
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pawel Chmielewski <pawel.chmielewski@intel.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Paul Greenwalt <paul.greenwalt@intel.com>, 
	Simon Horman <horms@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Przemek,

On Thu, Aug 22, 2024 at 1:23=E2=80=AFAM Przemek Kitszel
<przemyslaw.kitszel@intel.com> wrote:
> > WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
> > WARNING: modpost: vmlinux: section mismatch in reference: put_page+0x78=
 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
> >>> WARNING: modpost: vmlinux: section mismatch in reference: ice_adv_lnk=
_speed_maps+0x14 (section: .data) -> __setup_str_initcall_blacklist (sectio=
n: .init.rodata)
>
> I have spent just half of hour on that and I'm clueless.
>
> For reference, the driver code is:
>         static const u32 arr_name[] __initconst =3D {
>                 SOME_CONST,
>         };
> and core kernel has:
>         #define __initconst __section(.init.rodata)
>
>
> @Max Filippov, you have authored much of xtensa arch for kernel,
> especially XIP support, and touched .init.rodata back then;
> perhaps you have any idea what is going here?

I see the following:

static struct ethtool_forced_speed_map ice_adv_lnk_speed_maps[]
__ro_after_init =3D {
       ETHTOOL_FORCED_SPEED_MAP(ice_adv_lnk_speed, 100),

that array goes into the .data, but ETHTOOL_FORCED_SPEED_MAP
expands to the following:

#define ETHTOOL_FORCED_SPEED_MAP(prefix, value)                         \
{                                                                       \
       .speed          =3D SPEED_##value,                                \
       .cap_arr        =3D prefix##_##value,                             \
       .arr_size       =3D ARRAY_SIZE(prefix##_##value),                 \
}

so the first entry of that array quoted above above gets the following
initializer:

  .cap_arr =3D ice_adv_lnk_speed_100,

and ice_adv_lnk_speed_100 is defined as

  static const u32 ice_adv_lnk_speed_100[] __initconst =3D {

so this array goes into .init.rodata.
That's a reference from .data to .init.rodata that upsets the modpost check=
er.
I see that modpost incorrectly deduces where this link points (it's
ice_adv_lnk_speed_*, not __setup_str_initcall_blacklist).
I also see that this link is not used after the init phase, so it's harmles=
s.

--=20
Thanks.
-- Max
