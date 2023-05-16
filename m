Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422034CEB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 11:31:29 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6436e004954so14451024b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 May 2023 04:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684236689; x=1686828689;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8TUSfB//uZ1XbD3kWB/ksx9maJk04w48+oSOx5pWns=;
        b=YXPudcoEnaIuqLR9oLD+E6YMvpFsyH9ZonQ9qjuaIlnN+I8k82aGuZhpdTg2LQBMik
         jlW1pbd7vWhARto46cVuarQnoBIelTcRoGuoQHmt5szTKBYXxh3fasgpdL/al7f75R5k
         ytPbezXxBlKtshokgXzGMf4ZGcOshdGipfteUPncL0RhhbeXzbh3Ij9qGt4bbOeS82ct
         AfFwAqzLmDib6/eft6pzF/T9xcaWtuJA5Ne7Y7XVg5cBBKnjoXC2Rjp9j70N4MkHPkY+
         erfjt7grl8WzDKmEVYWBtrX2Y2IxuEZfRsmVvP8TS83PtduLoJJipNYBzW4gFtEOm+gB
         CjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684236689; x=1686828689;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8TUSfB//uZ1XbD3kWB/ksx9maJk04w48+oSOx5pWns=;
        b=jkBptZPuyixhF4L7ME1SDSXD+Q1tYe668JcjCGCD7rjf8WSo7x90skce4uOOE8HsjI
         xOvUyyyakRYBLxcsxPLWehmMv1I2o7Bz8gdhi2+jww989KGhvg9hA9zgNT9HQjIBucQm
         brqRDaMfm9LPBsRQ13MLZnAvjawQye6xewWk8LEWTozzaVuC1s7PkB9Trl11k6OhDR6y
         3F557y3U9cO5jIfkmADWMw59TLAq1cDW2gyXgneFbayUVn7zQHGU7cCKNXuFdOsUEh2O
         LX9jAlmw2OaBwdOrLFmbXLt+bJMGqv4jwzM7gJhxdib3tr7Q3JbSm/+NKssCu5g9DVNe
         DAGw==
X-Gm-Message-State: AC+VfDyXc7hp0p0yUIiTW6qoXy1qFDuV48kCEWpmCCDLF5AxdE4M8WMY
	5SZuLranDjh2vxuTV5oKucs=
X-Google-Smtp-Source: ACHHUZ7ixXKxfkDoBbRda0hUU7DawudKYghZqKxSvd9v66SwfBpxLon0QQK+DKL+aGEhjxePEqQ/yg==
X-Received: by 2002:a05:6a20:8f13:b0:101:2160:ff89 with SMTP id b19-20020a056a208f1300b001012160ff89mr34991239pzk.38.1684236689424;
        Tue, 16 May 2023 04:31:29 -0700 (PDT)
Received: from smtpclient.apple ([220.253.28.180])
        by smtp.gmail.com with ESMTPSA id c19-20020aa781d3000000b0064ca1fa8442sm3957252pfn.178.2023.05.16.04.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 04:31:28 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: drivers/platform/x86/apple-gmux.c:276:15: sparse: sparse: cast to restricted __be32
Date: Tue, 16 May 2023 21:31:16 +1000
Message-Id: <D62B0A4F-6A2E-495D-B3AE-4CEAEE172E39@gmail.com>
References: <56f2f65b-150d-3cf6-95f9-2dd8232d2717@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
In-Reply-To: <56f2f65b-150d-3cf6-95f9-2dd8232d2717@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
X-Mailer: iPhone Mail (20E252)

Hi,

> On 16 May 2023, at 8:27 pm, Hans de Goede <hdegoede@redhat.com> wrote:
>=20
> =EF=BB=BFHi,
>=20
>> On 5/16/23 12:16, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
>> head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
>> commit: 0c18184de990e63f708b090bcb9fc6c0fbc427cd platform/x86: apple-gmux=
: support MMIO gmux on T2 Macs
>> date:   9 weeks ago
>> config: i386-randconfig-s001-20230515
>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>> reproduce:
>>        # apt-get install sparse
>>        # sparse version: v0.6.4-39-gce1a6720-dirty
>>        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D0c18184de990e63f708b090bcb9fc6c0fbc427cd
>>        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git
>>        git fetch --no-tags linus master
>>        git checkout 0c18184de990e63f708b090bcb9fc6c0fbc427cd
>>        # save the config file
>>        mkdir build_dir && cp config build_dir/.config
>>        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 olddefconfig
>>        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/platform/x86/
>>=20
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: https://lore.kernel.org/oe-kbuild-all/202305161712.5l3f4iI4-lkp@i=
ntel.com/
>=20
> <snip>
>=20
>> vim +276 drivers/platform/x86/apple-gmux.c
>>=20
>>   265   =20
>>   266    static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, i=
nt port)
>>   267    {
>>   268        u32 val;
>>   269   =20
>>   270        mutex_lock(&gmux_data->index_lock);
>>   271        gmux_mmio_wait(gmux_data);
>>   272        iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PO=
RT_SELECT);
>>   273        iowrite8(GMUX_MMIO_READ | sizeof(val),
>>   274            gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>>   275        gmux_mmio_wait(gmux_data);
>>> 276        val =3D be32_to_cpu(ioread32(gmux_data->iomem_base));
>=20
> Ok, so sparse does not like this line.
>=20
>>   277        mutex_unlock(&gmux_data->index_lock);
>>   278   =20
>>   279        return val;
>>   280    }
>>   281   =20
>>   282    static void gmux_mmio_write32(struct apple_gmux_data *gmux_data,=
 int port,
>>   283                       u32 val)
>>   284    {
>>   285        mutex_lock(&gmux_data->index_lock);
>>> 286        iowrite32(cpu_to_be32(val), gmux_data->iomem_base);
>=20
> Nor this line. But this is what we want (convert to/from be32 to CPU
> when reading/writing).
>=20
> There is iowrite32be() but that always unconditionally swabs
> the byte order independent of the CPU byte-order.
>=20
> Now this is an x86 driver so always swapping is fine, still
> I wonder if there is a better option here then using
> iowrite32be() and ioread32be() ?

Thanks for finding those functions. I can't think of anything better unless t=
here's a simple way to change sparse's rules so that it will be happy with c=
ode like this.

Regards,
Orlando

>=20
> Regards,
>=20
> Hans
>=20
>=20
>=20
>=20
>>   287        iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT=
_SELECT);
>>   288        iowrite8(GMUX_MMIO_WRITE | sizeof(val),
>>   289            gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
>>   290        gmux_mmio_wait(gmux_data);
>>   291        mutex_unlock(&gmux_data->index_lock);
>>   292    }
>>   293   =20
>>=20
>=20
