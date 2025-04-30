Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425151E8331
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038843; cv=none; b=I/ZU6h8QdUsL2bfClot4i7uxbeac9zA7LH4EoXOIKO2T092MTi1nRayD0wPE6NjbUKhvkq1GxZeuGxUF5vmB4trH9ylT73IdIIkJ9eIHQiiV8cVDkPyRq74HX2ofZTJjKEfKybV+ybMMB+iMxeA2El4TA5kcnaJ0orAJwqeVft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038843; c=relaxed/simple;
	bh=kX9RrO9cv9xhfG/paXyteB+lzW1VcQQfL23l0+9gANE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWSOOpz8ATxdT30iXx+rIWqt+dAhJYwX7i16d05BSvc44oASS4uJE+6ZstzDm3bemRqYvN9ShWuVh+fDtVh/cSFfmjf7EGwkLJ8GJYpCNUV7Neu9DqinduWyAzVtZoi3R31cq3TSB1hsCe0dszMlIs6aqrZry3LojdnFMNo05TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AAxAeywS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AAxAeywS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so1039365e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746038839; x=1746643639; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kX9RrO9cv9xhfG/paXyteB+lzW1VcQQfL23l0+9gANE=;
        b=AAxAeywSfkFkZZ5vgP3vmNS9Pn1h2/Sif7ex1cUHAwOLLDjTCQw11xurJUzwOH99+C
         OnWhC2lAqi7/yPwNur8EQOvzn4Rb1YS0VudrvtG5D4thzOkinfrY3Wj2mkLGbjIllb5s
         qMv4c2ERt6o/cpLW2tvBlSOT0REN0USV1OpupkZE32SG1BRAMKBIpwGE+oJBYlsWvJOD
         7QJR9a3XDB7d5b2wQ4iV1pQXrTA8xlhmNyjDHHkavJFBe5ZbGdeWtb5VDjJf71TDZ95H
         YWtEuY2qq99ByiBJ2ZqitAjqoj+NJDssBVGshaXBo1H+Da9iaHNkBVo/VibWpGUCPzXI
         w7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038839; x=1746643639;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX9RrO9cv9xhfG/paXyteB+lzW1VcQQfL23l0+9gANE=;
        b=esYGbPigXU6tQvlZS1+W4yS/C+a9iDeKga1zvQsu+YpSB0DnjkB+Oli7DBh4SULByl
         uYX3FB+m34YyJa/fnztXoqlj/oRcTdC2/J1I8jtX0By9FjpDQA8ZA075r+H6mwfoskeM
         wMK5GKNh+pZH6RIaj4m8EH22rsXgmDvjD7L0tPfxvNvOx/QsPyUkySKPAo3AUcRlluwE
         0wlcB8as0zIhPi1WrsGEzj+egYPd5PZX05Jv6OjM+OpSH5sYpm8E1vKmSgT2URNF1PyT
         TIwbaWKSfA6+GRWNXHq4a4YNauTC9cni0wVLk1UeCpPn/gS3LnX2fBY5ck/8L3UEL/hQ
         Q6Sw==
X-Gm-Message-State: AOJu0YytNwyfQRot5zyImZ36+R7G+RGFsHqzPQiGCU31VaFLZorP6Myn
	nkFq7lLC2E+lNwjpI6rbodE6jIOpr2sdIKFDpPK6rtAkaKNkYaDscHmJ4pXx9dA=
X-Gm-Gg: ASbGncuqBP5FFzQ5IwrEXXNw4hHyI+LplZ+0aNmNrDJTYWqPej5i6e9BT3wgbIqOPY7
	tKvqGEHYtBECfKgzbtL537L1vZbasgpMjhNbBhQuH88gbMJNM+3igUuGO/EyvxBRQSQ/+XeCCPf
	PjzFoBR389+EhfutrL6C8LOZ+lNWMdfsLgmMlKZeepVb8UK3OAgAEGcfwVRjCbGEmYqnAe2XpNr
	cx6bGqJWs2nf3nnOX+Xqb3Y9YU4mYJBZmu/nphUDu42fhSEEuWmwUTryqQRDoYtoB31McU8gSq/
	khIhHPZXABsAz/yWVd4RO6bZGsTb1pHDxFGiPaZHKDkI
X-Google-Smtp-Source: AGHT+IHGJApHPyojTTdKcJaQCXvH/tX/pQbeA+RkLhaQA3Opj/wdMIz+ma15+m0hrMYJzt0IV4WQlg==
X-Received: by 2002:a05:600c:1f0c:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-441b1f31004mr44295095e9.2.1746038839506;
        Wed, 30 Apr 2025 11:47:19 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b972a0sm34463945e9.7.2025.04.30.11.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:47:19 -0700 (PDT)
Message-ID: <fd11ee67a3d51aef6305c477b140d911da0b2af4.camel@linaro.org>
Subject: Re: [lee-mfd:for-mfd-next 18/50] drivers/mfd/sec-acpm.c:346:16:
 error: implicit declaration of function 'devm_acpm_get_by_node'; did you
 mean 'devm_acpm_get_by_phandle'?
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Date: Wed, 30 Apr 2025 19:47:18 +0100
In-Reply-To: <202505010115.ssBCiBac-lkp@intel.com>
References: <202505010115.ssBCiBac-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2+build1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Lee,

On Thu, 2025-05-01 at 01:30 +0800, kernel test robot wrote:
> tree:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd=
.git=C2=A0for-mfd-next
> head:=C2=A0=C2=A0 566b001ca4f65878d5e9b0e9d23ba2d55bf4c630
> commit: 690f145503fe1e4d31a1f0250122b3e04876ee90 [18/50] mfd: sec: Add su=
pport for S2MPG10 PMIC
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250501=
/202505010115.ssBCiBac-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250501/202505010115.ssBCiBac-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202505010115.ssBCiBac-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> =C2=A0=C2=A0 drivers/mfd/sec-acpm.c: In function 'sec_pmic_acpm_probe':
> > > drivers/mfd/sec-acpm.c:346:16: error: implicit declaration of functio=
n 'devm_acpm_get_by_node'; did you mean
> > > 'devm_acpm_get_by_phandle'? [-Wimplicit-function-declaration]
> =C2=A0=C2=A0=C2=A0=C2=A0 346 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 acpm =3D devm_acpm_get_by_node(dev, dev->parent->of_node);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~~~~~~~~~~~~~~
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm_=
acpm_get_by_phandle
> > > drivers/mfd/sec-acpm.c:346:14: error: assignment to 'const struct acp=
m_handle *' from 'int' makes pointer from integer without a
> > > cast [-Wint-conversion]
> =C2=A0=C2=A0=C2=A0=C2=A0 346 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 acpm =3D devm_acpm_get_by_node(dev, dev->parent->of_node);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^

The commit replacing devm_acpm_get_by_phandle() with
devm_acpm_get_by_node() exists in linux-next
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?id=3Da8dc26a0ec43fd416ca781a8030807e65f71cfc5

https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log=
/drivers/firmware/samsung


Cheers,
Andre'

