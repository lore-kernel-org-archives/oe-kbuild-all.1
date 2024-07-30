Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20324BE5D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 03:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722311648; cv=none; b=otgZaSi8dtSYyJj2BVkX8G27PF2TvsmtqQPkjwBLwe1s2nhPorFbVfI4jTTjPMmO1Zvzu8vpEsmhyCyuRlCPmlwLSh7EkFA1D6+CTKv3Uyz8AJzakAZRQrLxexJ9hhAbmHxQEQFnshbtLfbRN9MaLsnClq7q/oBQLLdmnUApeQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722311648; c=relaxed/simple;
	bh=E1pEfdyR6kjbhVV3NfB4TZ4buDsY8BPr6TEvfS/3EXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VotCDx/DMcfdKJQLd/CpAphQbFHvYfDkXgGenoLmDpYAVz4l8POABYp9IBaPKXN3B/GZP1D10lyJzuwwzL6ogmjWfSSAg8qNVGmoGZNaGbp2iNH1u3ox49gogt4+QVueeqffnwPYdZ83HJoO63PPoD1CcdJ1Bz70fE6R0eR3uhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZLbKT1G; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZLbKT1G"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c667b28c82so2058516eaf.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 20:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722311646; x=1722916446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnDGx7qmklgbXgUTSkMGiYMoIqr1aBMkQxJCxk3Reyk=;
        b=TZLbKT1GLcm1/ALTl22kobaLzaEFrYPk+8wwSBq8OxxzO+sOeJ3WMf7cNCsjWzgxY2
         XnmpsgBOwfpPlvJ3QueWA/pm5KT4ZneP6UVR+KIRKiAtgz8hT8sUzN276bry6Ls3aOQN
         QvVDEjN560Z1mE0SHxkDpzNO9tQMQ8gj9GaMNBu/y8CYbnhCmSYwl7Cvuf2qlEtA75+G
         COBevdutUEJ39UJfRvVCLdvkOnXzpfliAFfCHyBVAUAnEb9ZH/a5boqu8HSyD9lzSS88
         mJ6sibe7cLlVGjxag6QWgBU5ScJB8ElUqkV/a8Ttxs9zCkkI50d6+EvANVx/fglKF3Oh
         r+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722311646; x=1722916446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnDGx7qmklgbXgUTSkMGiYMoIqr1aBMkQxJCxk3Reyk=;
        b=YyKKL8kgh9Cm4SOJztKlGbiu+YVcdl3Fh0Ybg7s/djG15BOU5LwZumluU+vwRTyJ7j
         /D9nbL/AYMkkZYLKtnGcJvtNMAtTJBWKLKNLeKa6X1EAoXpsW1K6JH8L4Z3ZhAGS5zQP
         UhMGlQtZWjXvUoV3PInE9/wBu9eBSvsQu8IuaRP1XVvKJDIs+rFc/uSaviGdi6dyHXSs
         jW2EtTTg7kA/HynQ0kPKnIcSEsFHiVMbeamJ/Ap0ir6EWfS007ICaSimOxQ8FTVVPbsr
         OYCaz6SMeIdkIzLzDMJ+5WtKeG7PM+77yu6R2B3dnUu2aP7keDbFcQir3WiOa8BuGvLj
         Inew==
X-Forwarded-Encrypted: i=1; AJvYcCUs6kIefGUf7rSzIZ99Yc/mFBbRHaqlXpIHKS9v/iVz0j6+C2IBmXNW5XffO/bCzwcQfpL/BX3AwKxelmXRYN3oeNcJEzcG+Kp3xC5SrQ==
X-Gm-Message-State: AOJu0YyE/xFuIsoIGH5OGJLhqYNQ2DMnaQE4FO12IAyGsQF0jeL68k5W
	BOhDX0Y6ACfhylbTKUwRCfVhnF9+Z4SI0X6CP8fqeMs6rPb+U/KrRD0kuyosna4K9AuHNYlVZyQ
	vYmW3xCoqhGxCFgtwYlVoEQL2Gr0=
X-Google-Smtp-Source: AGHT+IEix7+Kdd9xJYVjKhlzKY+sffwouAnzxFhKguuMc2IgGOzgB/BAXb5CFcn22c5gKtun4hEBqKw32D4j+TfoJsg=
X-Received: by 2002:a05:6820:614:b0:5ce:3ccb:2118 with SMTP id
 006d021491bc7-5d605e01115mr326090eaf.3.1722311646149; Mon, 29 Jul 2024
 20:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407300812.1VvDFdxD-lkp@intel.com>
In-Reply-To: <202407300812.1VvDFdxD-lkp@intel.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 30 Jul 2024 11:53:40 +0800
Message-ID: <CAD-N9QW=6CbbzM4G_hoB-boMazDR5MGm6D3thPe6y=F05cNdJg@mail.gmail.com>
Subject: Re: [lwn:docs-next 2/8] htmldocs: Warning: Documentation/translations/zh_CN/kbuild/index.rst
 references a file that doesn't exist: Documentation/kbuild/index
To: kernel test robot <lkp@intel.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, oe-kbuild-all@lists.linux.dev, 
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 8:59=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.lwn.net/linux.git docs-next
> head:   60666fbc81ac91af2cf2f511d60859288f7ea8e5
> commit: e6a5af90f0a24f08445e3b8a11b727ac84a9520c [2/8] docs/zh_CN: add th=
e translation of kbuild/headers_install.rst
> reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300812=
.1VvDFdxD-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407300812.1VvDFdxD-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt ref=
erences a file that doesn't exist: Documentation/devicetree/bindings/input/=
qcom,pm8xxx-keypad.txt
>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm57=
03-regulator.yaml references a file that doesn't exist: Documentation/devic=
etree/bindings/mfd/siliconmitus,sm5703.yaml
>    Warning: Documentation/hwmon/g762.rst references a file that doesn't e=
xist: Documentation/devicetree/bindings/hwmon/g762.txt
> >> Warning: Documentation/translations/zh_CN/kbuild/index.rst references =
a file that doesn't exist: Documentation/kbuild/index

This is my problem.

But curious: why does my local `make htmldocs` not report this issue?
I tested it locally again, but no such warning is reported.

I will send a patch to fix this issue.

Dongliang Mu

>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/reserved-memory/qcom
>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/display/exynos/
>    Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/misc/fsl,qoriq-mc.txt
>    Using alabaster theme
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
