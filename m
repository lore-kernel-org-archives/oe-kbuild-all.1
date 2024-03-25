Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462712C553
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376112; cv=none; b=Xcyd+0UYCJ8Z/NeU1oiwZOVxhElNWfQc5SKbluJikkGY5dUmim2aWPNu7AWZqnE0oC6OpIzYHjV+FlA503FkyrrZ4sx1vqdKHeQyJ/aEnBJQGEXPmXDicmKukfW+qIMVlot8xxvddz29fg6Zr4HpT6OzWH7o11oXzqDUH4G3/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376112; c=relaxed/simple;
	bh=4EEhsPErlxPMi2Yswv9ncrBhoz5O7lC9W/nqo0hkB8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XhP4uPfi/s9PGQcQXTPL9+MQag5OxhjcO5vmA/KBIi+UmlKiLxMYB5PTPH/Qgi6Zvzb0GGu5ykU4Shz6p9SC6J4ypB2TMnodHTlUAsqhWQi1w4ftqG1mZtxM9RriipycGSIr5T4aEHIb2+CR2Fzcd3XpeFBbJ1HFd9bbdxS2iYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jKKWcXuu; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jKKWcXuu"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-69682bdf1d5so9440626d6.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376109; x=1711980909; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COUKaK9QwWldaIvCztGeS1zsFehu8RXDmIJB95LB/cQ=;
        b=jKKWcXuuUQ0vbwbmK65O9fFQk1FkEhZNyvEMvMueebh6tF8t4LVPt/gbGVJoldvDmi
         byz6v2lhTc9hlIpzKm8fgygaRgUzbhBWoRT29FvKpwxxUi1I8Oo9T9h9lQP5zav4X4oL
         nnRkB3fW7wzZmLLt+5ZEGBJTEi2izpc8DnHVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376109; x=1711980909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COUKaK9QwWldaIvCztGeS1zsFehu8RXDmIJB95LB/cQ=;
        b=twxsfZ4RIgMmSR8DgTilM7YdXeE7TZFhc/sJ6jK3bC/5LRBfK0kxJreD1PynVYM8d8
         JuYPfsXcLyCt6JfitcH1XoX5QmN3q4QkpaBVLGriEhiic4LQ/VrIsyxsOkKnYa2SxuYZ
         TsZCqEpbSzE3+wnTMs4Ir8JvzBd7QcacLNGerXtLBFwy0kO6nIHV1RbSmA9z/+KGQBG0
         iaw35jA4EwMsr+rO0e0EzSptv/nlZvIJvlg1whc4G0tnStG7PTwfvgRPoUSPEIVFTH+N
         boyBdLoVshQOcWUwnH+DPz3pmkEsygG4DRQPwp/+ieaIvz6jlHO6EyD5WbQ6jEkwkztI
         1lNQ==
X-Gm-Message-State: AOJu0YzRaEl74X84O6P7z1TbtyqPiKFbVoCN+GgfrlC/UD882zgLaxXp
	NEPBsHPDE0I1NPXBGGiK/b+oK2J4REReFQNuECWCzDIrKO/t3nxSJMW1UCJSB/xhUI6KvVqGB0I
	=
X-Google-Smtp-Source: AGHT+IGP4GuO8ISIH/0UbtVayL5EGZMzoGJhwagCV3xy4PLm3fFW245PbnHCZcCflvoBPTMvWuYI6g==
X-Received: by 2002:a05:6214:1d0f:b0:696:4867:1349 with SMTP id e15-20020a0562141d0f00b0069648671349mr8034174qvd.20.1711376108724;
        Mon, 25 Mar 2024 07:15:08 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id gh14-20020a05621429ce00b006913aa64629sm4103804qvb.22.2024.03.25.07.15.07
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:15:07 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-428405a0205so485751cf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 07:15:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2444:b0:431:4e0b:d675 with SMTP id
 bl4-20020a05622a244400b004314e0bd675mr354653qtb.18.1711376106720; Mon, 25 Mar
 2024 07:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403240115.1lAo588s-lkp@intel.com>
In-Reply-To: <202403240115.1lAo588s-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 07:14:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V91x_Vf=rkT_Q29eTsa13XDKZHXYYgX1of3JsE2OgxHQ@mail.gmail.com>
Message-ID: <CAD=FV=V91x_Vf=rkT_Q29eTsa13XDKZHXYYgX1of3JsE2OgxHQ@mail.gmail.com>
Subject: Re: [drm-tip:drm-tip 4/11] drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73:
 error: '.bin' directive output may be truncated writing 4 bytes into a region
 of size between 2 and 31
To: kernel test robot <lkp@intel.com>, Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>, 
	Veerabadhran Gopalakrishnan <Veerabadhran.Gopalakrishnan@amd.com>, Leo Liu <leo.liu@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 23, 2024 at 10:15=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> head:   657dd8fcd2f1d1205c6f98fdb8b60915228991d1
> commit: 0885186926a13c697d78f5af03f32445414b6ad5 [4/11] Merge remote-trac=
king branch 'drm-misc/drm-misc-next' into drm-tip
> config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/=
20240324/202403240115.1lAo588s-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240324/202403240115.1lAo588s-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403240115.1lAo588s-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c: In function 'amdgpu_vcn_early=
_init':
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:66: error: 'snprintf' outp=
ut may be truncated before the last format character [-Werror=3Dformat-trun=
cation=3D]
>      102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.=
bin", ucode_prefix);
>          |                                                               =
   ^
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:102:17: note: 'snprintf' outpu=
t between 12 and 41 bytes into a destination of size 40
>      102 |                 snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.=
bin", ucode_prefix);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:73: error: '.bin' directiv=
e output may be truncated writing 4 bytes into a region of size between 2 a=
nd 31 [-Werror=3Dformat-truncation=3D]
>      105 |                         snprintf(fw_name, sizeof(fw_name), "am=
dgpu/%s_%d.bin", ucode_prefix, i);
>          |                                                               =
          ^~~~
>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:105:25: note: 'snprintf' outpu=
t between 14 and 43 bytes into a destination of size 40
>      105 |                         snprintf(fw_name, sizeof(fw_name), "am=
dgpu/%s_%d.bin", ucode_prefix, i);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
>
>
> vim +105 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>
> 95d0906f850655 Leo Liu            2016-12-21   93
> 69939009bde70c Mario Limonciello  2022-12-28   94  int amdgpu_vcn_early_i=
nit(struct amdgpu_device *adev)
> 69939009bde70c Mario Limonciello  2022-12-28   95  {
> 69939009bde70c Mario Limonciello  2022-12-28   96       char ucode_prefix=
[30];
> 69939009bde70c Mario Limonciello  2022-12-28   97       char fw_name[40];
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06   98       int r, i;
> 69939009bde70c Mario Limonciello  2022-12-28   99
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  100       for (i =3D 0; i <=
 adev->vcn.num_vcn_inst; i++) {
> 69939009bde70c Mario Limonciello  2022-12-28  101               amdgpu_uc=
ode_ip_version_decode(adev, UVD_HWIP, ucode_prefix, sizeof(ucode_prefix));
> 69939009bde70c Mario Limonciello  2022-12-28 @102               snprintf(=
fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  103               if (amdgp=
u_ip_version(adev, UVD_HWIP, 0) =3D=3D  IP_VERSION(4, 0, 6) &&
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  104                       i=
 =3D=3D 1) {
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06 @105                       s=
nprintf(fw_name, sizeof(fw_name), "amdgpu/%s_%d.bin", ucode_prefix, i);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  106               }
> 69939009bde70c Mario Limonciello  2022-12-28  107
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  108               r =3D amd=
gpu_ucode_request(adev, &adev->vcn.fw[i], fw_name);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  109               if (r) {
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  110                       a=
mdgpu_ucode_release(&adev->vcn.fw[i]);
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  111                       r=
eturn r;
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  112               }
> 6a7cbbc267c0ca Saleemkhan Jamadar 2024-03-06  113       }
> 69939009bde70c Mario Limonciello  2022-12-28  114       return r;
> 69939009bde70c Mario Limonciello  2022-12-28  115  }
> 69939009bde70c Mario Limonciello  2022-12-28  116
>
> :::::: The code at line 105 was first introduced by commit
> :::::: 6a7cbbc267c0cafa2b027983a40276deb673c066 drm/amdgpu/vcn: enable vc=
n1 fw load for VCN 4_0_6
>
> :::::: TO: Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>
> :::::: CC: Alex Deucher <alexander.deucher@amd.com>

Not quite sure why this came to me and not the people involved with
that commit. Adding them here.

-Doug
