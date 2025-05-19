Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF461C7005
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 02:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747621500; cv=none; b=WnwGXDWnU7HbealBwB3O9YVhbbYCLcp/aDa4xVbi+JKMOk7Ac9dtN9DKopJkmk6HZlRTcBIOl651X5n29fGqKCKaIlR1qDM4uJpO7NUOSxp0pDC9KJ41/NOIC1vUWcjCOt/y0OVhlU0girLhzVbbcP7DS0o+PECyhyiphg4t0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747621500; c=relaxed/simple;
	bh=F7HGraiKV0mF2w5Qamd6RAnQdl94gERga2deOiTZdRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuxQOSW8AcIf0chp5U3aEHMSN2BhVBnE+F00/CZ5i7pHM1aOgZ5+Dh/9aRhcDQ6dh0PBNjrxG4IG2ccMpcYQ+kQRsP4eDsLsDwuSgMb3MjsDNSbA6n9FJVAXb3v3lLDUy9NVWvA1u4ohxknpNyWNEy5u2kevtHm8FKCH7L8fDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDVlYntj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDVlYntj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so673130566b.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 19:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747621496; x=1748226296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7HGraiKV0mF2w5Qamd6RAnQdl94gERga2deOiTZdRE=;
        b=bDVlYntj3uJRwHSzfUWXF2lCIo1iKC4OjANhcGLi/MFna/vXzsa6IuEHlvNpmKCjwl
         EDsmd7Glp0RFantgdJKvf3XVDgmx8rQCnK6eY9PLhojM2ZGhpw8DwQgyNCQVmc53KnP/
         qqzUi340qR5rGvLpWazYVz3jI0bOQQKqSlmMflkFJPCBkacKg+imLQFGiGBhXItk8VTy
         YzgW9rU9PFu+lefTmCTBOq8rBkqkVe+AWD7z0gEl0/YNbPyYAVP272CPIKp+K8AdDxmc
         F/hdcYWevowbcEFHaw9MF3UqOxFQ6503jE/xhAAxMFiNzoCuvZHCrE7WC0hoaHvZPYQF
         pLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747621496; x=1748226296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7HGraiKV0mF2w5Qamd6RAnQdl94gERga2deOiTZdRE=;
        b=WN18HIYSOMIm2C1tmGUU9ddpcM4idtdXPL/YMcHrjYPxzuV+SuTHtyuaOPVSFa1qiw
         xMu8/NCNrX0+nxvg0TPlMDl56wyYMAFcE57ApC8cK/bl0Bn5/QKSZ4x3Emq4cEb8ggsV
         wDbK1Ve+LGkupW7/aOD267q+9gaGyND+UplAxx9262rC2u3VSv8H9oJsXwlsFSB+BUsE
         pLM4IOyyH4a6OCxM56roZ6qPhFDb0b/1vhE8bE9FyXoU+B1RCJ0Nc/qDneQRie6UZYcE
         fmCHFEtyx45WnjiR+XE1LaDj7pVC4Qk9CcrWmgRHH9mAYecSd4EwwPT1qlT6SptDGLdP
         s2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYnQoqXKhn2DpK5q1HvYgtycWeFYLDQq7lw4SKKXjFnsgk7qZfKtaUiv+vha0mi/VLp+iin1m/Yxy+6Y5y@lists.linux.dev
X-Gm-Message-State: AOJu0YwHIV0YtY9gVBurSkAdV1HVi7/2IcEY3tzSY+gut2zXqWsDXoj3
	YwOwq9HPV+PVfJcC0Itd/gYv00TU4ZKzV9o4RD8fmUMiDP3DvLlgCLjo61/ZPTyByjxCqNPAZJQ
	WR1JRjoxBGTFdwOGWDxA3o98Lo4vyRgc=
X-Gm-Gg: ASbGnctJMP+Aif8Q5URbiSA/HW0oNkbFXAmYi+wsi1FNslhENc2t4g2Vjzrc6l6nqQq
	E3z/6Kh4K+dpwvY98F33nUsCQrOhjhaumvMMBO40lVTIIyZJUUGdzJJPmB++QP46UD2b5cgj6OT
	Q/xY1QCiBdSqsg7OxNhFQJd/k10rz5q9pb
X-Google-Smtp-Source: AGHT+IFJfVGkESUqblOSRmzdJO+rvgq/miFLrld4r20pD/RshgydmTRA+HZ1m3Zc9HBZFNEUupn0/U+ojqSfZbgTXUE=
X-Received: by 2002:a17:907:7f20:b0:ac7:805f:9056 with SMTP id
 a640c23a62f3a-ad52d518183mr1040886366b.32.1747621496419; Sun, 18 May 2025
 19:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505160627.WtzIIpL6-lkp@intel.com> <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
In-Reply-To: <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 19 May 2025 10:24:20 +0800
X-Gm-Features: AX0GCFsh3W4Dxs7R_bRftXTDUXVSKjWZElATVMc2GXugQQeZuHfJDCqSKpBhlKA
Message-ID: <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning: Documentation/translations/zh_CN/how-to.rst
 references a file that doesn't exist: Documentation/xxx/xxx.rst
To: Yanteng Si <si.yanteng@linux.dev>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org, 
	Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yanteng Si <si.yanteng@linux.dev> =E4=BA=8E2025=E5=B9=B45=E6=9C=8816=E6=97=
=A5=E5=91=A8=E4=BA=94 18:02=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi robot,
>
> =E5=9C=A8 5/16/25 7:04 AM, kernel test robot =E5=86=99=E9=81=93:
> > Warning: Documentation/translations/zh_CN/how-to.rst references a file =
that doesn't exist: Documentation/xxx/xxx.rst
>
> I didn't reproduce this warning locally. It seems to be a difference
>
> between different versions of Sphinx.
>
> Could you please provide your Sphinx version?


I can't reproduce it too. My sphinx tools version is 7.2.6.
And it looks like a incorrect warnning.

Alex
