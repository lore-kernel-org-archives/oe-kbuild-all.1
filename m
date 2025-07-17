Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461E0207DFE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777823; cv=none; b=ewf+Wa55UUuopjqWs0N7Y5voqYIm38HoNsWjnizOA5D7U9dXwiEUk9+hsIF4SQlP0kwcm+jp9mK8QcJa/WeiRRpW00PO+KlXmO8CNR3dyxzgrsTtd2IhhUAYHtY4iflK7UoRJqZSMf/4jh3oPZ+YphAMYQQqoAXDwfSKamh2NjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777823; c=relaxed/simple;
	bh=2rlUu0OfWYLMMk5E5C0WMmAOCUWyzBpXvXXud0P7wiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+j3fSQXN+zcDDMIj9CPFnXR3FszvO+QUv5oJY897ZvYkJS4SLJZ0Vn9uVOPpbUs73XWbRDtRtd7U3OoX2sXnBbpzhqNtPQJrbcBkd5Ld6lmLZCSdmcNt1P46W/+XwI9+sogiklnq8BeZIxFNnm/MihFH6pi5w7mwXSomz/80MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X3cnXG5t; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X3cnXG5t"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so18140226d6.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752777820; x=1753382620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ThZUcaE7cELL9+x2yCkYIW367w/7LCL9CkjEF+QZYI=;
        b=X3cnXG5tP3/nem8oOWYx+LvZNRprPKCycMATw61NZqQA9Vgetz4Sf3CaFth2IPNVSF
         dy1C5hrsN//09whxpJmnXqieIn85soh+8eHhGFt+xwJEDD5/f9LY2xDgHxnsOyVG/tTl
         sVADwtAhaY28gZX2Mp763+L6D9AqNmrfrueOYQduEbBuDHH7pRuqRoCkZlSZ35POntl0
         dYKSyciI25qNHYqwnWeOurpy2nMymk6sajNpqckMmf7KrAqgj8ap/nSq1qphGiu4242t
         /DD/2FpiqUcIq63UgSD0DcDSii3l37ZXCEme1FiZH4XLhUlzcUWke4BDb0jkMcirn9uS
         eT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777820; x=1753382620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ThZUcaE7cELL9+x2yCkYIW367w/7LCL9CkjEF+QZYI=;
        b=jHDiw6B02Y5lHaTc2jbt3xnyFw3vwmLuwq/CvOwI0ti0ExSukb1jHd1BqRwe5Jq4QQ
         0wTF1FT4EmUTHlC5NFHPDIMwO+VWgbsnuFIMHCZ44hYpwL6Ls+VQDYElOLWwpKcDVSbk
         SYLldKD+hXmsfUKpf7I4fjp1SYEfLNHRU27gpc9FWJio/IIgkSUuDHUJjUcj7Z14jZK6
         tUzW+kdp9asuo0NFa5Sn7a+DzUNXYz5gZ1ftsi5iPK3ioONueUUAeGfBnHg7r4wQwyR7
         hdHcLpJ8sFZ62LKyxEYVQS/EyHDJeWdv7WX3HNU/z0QuAy1sBni4ofJn2KyqNdgFV+A0
         E0FA==
X-Forwarded-Encrypted: i=1; AJvYcCW1h/gveiTSEtfaTHNrEIhSu1DexsCP39Iu6uHz3WyCgR9BFrNgBf9WEaVg0c6fC+r4sj5BprKs06qU5vzB@lists.linux.dev
X-Gm-Message-State: AOJu0YzI2VTHiNNcG6wZyiIrGXaVqVYivF/swziiRXGZSutmew32MfLn
	Swj/pdcTNH8NrMitLhvCUSoJTnWdNjAlWW6Ud0spVYwQ0DDYaWtHH1USlct2DVGE5Tfebf/5Vve
	rYaEjQof3koJhOAqFMGHUEi4qWReeHKXtm0E3O41G
X-Gm-Gg: ASbGncs+NLcI522wUd5cFtxSQXv4oyx++bPkYQAaCBTg8HLqk8cYIB66jNZg1VYraiD
	jcktLCLJks8qH/fusI8b1f7/crL+YxC2/wjL4UyRFtpg/h3XRsv29dfEJvVnQOUIj9F+OGNXCfj
	z7F2GSODoAuOP/tVPH3bNy7q7xVbYURZX9SJn7uvXCHPCBO63LrVYtAZ7mdCFcDyw3Am/qGFwgN
	LbXw3DrX/JXV1ssLCBdzPBw/G2zloXzZOSOmXwwcg==
X-Google-Smtp-Source: AGHT+IErgUnPZNW5DTf24XUOU8ykTnxXG/uEOChv5A5KapAzEGlZz/dsjZwvHFyRV1DWdqxFwCi/2pfA+fFoM90vKmk=
X-Received: by 2002:a05:6214:5985:b0:702:d837:617e with SMTP id
 6a1803df08f44-704f6ac8088mr104372466d6.4.1752777819793; Thu, 17 Jul 2025
 11:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com> <202507151942.94dhYylY-lkp@intel.com>
In-Reply-To: <202507151942.94dhYylY-lkp@intel.com>
From: Jonathan Denose <jdenose@google.com>
Date: Thu, 17 Jul 2025 13:43:28 -0500
X-Gm-Features: Ac12FXy84paDZryxjZlQufmfIxp0QfVSXImTWCfW80dfNjKxtiRYlI8eV8MMgtk
Message-ID: <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
To: kernel test robot <lkp@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, oe-kbuild-all@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 6:36=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/HI=
D-add-haptics-page-defines/20250714-231444
> base:   86731a2a651e58953fc949573895f2fa6d456841
> patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v1-11=
-71c7c05748c9%40google.com
> patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch suppo=
rt
> config: hexagon-randconfig-r112-20250715 (https://download.01.org/0day-ci=
/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151942=
.94dhYylY-lkp@intel.com/reproduce)

I'm having trouble reproducing this build error. I tried following the
steps in the linked reproduce file, but when running:
COMPILER_INSTALL_PATH=3D$HOME/0day ~/lkp-tests/kbuild/make.cross C=3D1
CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited
-fmax-warnings=3Dunlimited' O=3Dbuild_dir ARCH=3Dhexagon olddefconfig

I get the errors:
0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown C compil=
er
scripts/Kconfig.include:45: Sorry, this C compiler is not supported.

It looks to me like the hexagon-linux-gcc compiler is correctly
installed at $HOME/0day so I'm not sure what to do from here. Can
someone please assist me with this?

--
Jonathan
