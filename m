Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A721D3E6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356390; cv=none; b=Dgn9JCtRypxwFc99WXJOb4cbmyO5PSB7Hjdkv4Os7HsPZuB54BltV1L8JvFPknVKDYeBn5utTuBJg7Ek1L1uAeMYFZUvXc5FKzebGtbEEPofKab4Kb1wA2xKMNUhmfSJa6r4b/qBEjcTqP0YI5hT4miwE6D/UH4d50yAnt2NSXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356390; c=relaxed/simple;
	bh=RFz0HdzmVVUtlAL2YIcAz5OmsHY1vYdhkjChbRV7Q9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=goDqFIMUMOT/uJqXTbDpIXdCc5GOCTeKWgttmwwoYUva9r+jcEhbsWw0apdmnNwRAw6CEFk8iT8xUAr1mcdNyl+VOvIsKYqyTfj5SNi2m9dJpcc7PX3T38gROYYC+yX/WnAatJqigh2Yj6IpWMK6Fm8JK/mVOSUXMCCOFpccKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVP+sX8D; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVP+sX8D"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b472842981fso476097666b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 21:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763356387; x=1763961187; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLj68r+HP4hgUScOTww7dJJLSGhpNeyhKtXx00Sgp90=;
        b=cVP+sX8Dw0stoMS1Cug3wXFKGwZMESUYprCVWxP26HU6NUNo4nFSDRqMvfaImfKILr
         0XW3jfs2ZnSL1SH2/IXGap9s5TW4Mkooibw60HQtUYNcwTgbE0uXmhji0bITr4fdCCdo
         JoLbyIDL+Ws0aJpBbsQ5QZRL6vVJyzrTla2Q48veR+lyGg2PE2R6oNI0taHjBPYPdluM
         y18ATioDtIJZpaZhOORCTGlVjcIW83hNtsYQJha08pJjCiPIhAlr68GU+E/E4dvZdCf/
         TBUlhjuKZ7D20n1lJnLjnZ5JLSHUk2c1z6xU4kpagJPHPJmn4oHanbVd0sjMFEeLHnZU
         WYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356387; x=1763961187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FLj68r+HP4hgUScOTww7dJJLSGhpNeyhKtXx00Sgp90=;
        b=b8uBZ+xvpOhmkDqDCGJbXNfsiRGKjAbAHyPouyQVSXnm/rCLlGcYr699VWm/stMoZU
         zS6vmLod7HBiJXHSWTKRk+twThqWTA3t41Ch3vDsx7bdHn516VnbLW75w5khb9Xl+1TM
         BcmTSR3Az7n2eV2tTb7tEYYP7UsiTlLuOLan2r2Wf+SbJ9BvdTXCcv6MLA6BG+husAu8
         +EstaScLBgyUTR6NXKrWpyvSJXn8uoHhbtZDOFOwzQjfAna2RIRvdBPKx76dAbTYYTSh
         cKM+pOeRaGjSnMBo5neG16wT+WiHMWTv7y/VBXbwBat4wRFnqv3Ld/OMk7/pNXovnkmo
         YV6w==
X-Forwarded-Encrypted: i=1; AJvYcCX4G9hOQiru3woZ1E5IdFhJqThUizylAVZ19xH7o7xRh7VV9AnXY56x1Z5/xYlSjfsNmbTjert2ZWMyhipm@lists.linux.dev
X-Gm-Message-State: AOJu0YyLl7Vrj5mzz4/nChXRyZ0GwXk8CTbEt8GwVj73qzv8cBJp9SIY
	lA34qPhWgvco757+Kr8J89zxHF0xnIlmuPKMyU0ZE/31A9KsjnFuGptEUFAWxO22m5ECBPCmu7P
	5yCp+jnYmA2604cyjmwwunAA94N758cKWUAeI2pQGgA==
X-Gm-Gg: ASbGncuniOZT6nClZpHSDEnkZvvLJeEZHnjQSABIAV8H2jJG88BFdefhGRSYeNzPv9e
	vuCmecBN2UJ92CzIeI2UzMF0Ta/8550kOUg8Oeoiul1x6Ya5iatFAXlZcSo34Ej6K3P7ZP5k5vB
	7BTeXMRuh6Ldblocvi2hqo3FqSQd3F4AjSFHBzuNFthgbqNGUo4APX7pIvc/1c9cyPeSf00B4lE
	BXbAN4li23Qla1IN+/scMaQ40cYKPra8o8TmfS/4bkP5ocPGRslqi0TnJ5QCsexiwdN3u4JpSh4
	lFgiwg==
X-Google-Smtp-Source: AGHT+IHYFghBSZFHmg6O2CoSdakpSASZQH8y1KtfV6zUprIfSEAkNUdFA1XHmtb3qEKkdJWZ+4jISl4bCapTnv5VeFg=
X-Received: by 2002:a17:907:3fa4:b0:b73:8bcd:66f8 with SMTP id
 a640c23a62f3a-b738bcd699dmr567086266b.10.1763356386591; Sun, 16 Nov 2025
 21:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511130032.gevVvSte-lkp@intel.com> <20251116091814.1791491-1-kezijie@leap-io-kernel.com>
In-Reply-To: <20251116091814.1791491-1-kezijie@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 17 Nov 2025 13:12:30 +0800
X-Gm-Features: AWmQ_bnbCq3uOtooE_uSC0FVfKMBtGZwP_OvHk9hWJwPAbpDxFZYmq6gFnpNMOw
Message-ID: <CAJy-Am=rhawqy--q_2dmbwKteiAneTsLUZiJHVg21mrozGjzdg@mail.gmail.com>
Subject: Re: [PATCH] docs: zh_CN: scsi: fix wrong reference to Configure.help
To: ke zijie <kezijie@leap-io-kernel.com>
Cc: lkp@intel.com, alexs@kernel.org, doubled@leap-io-kernel.com, 
	linux-doc@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ke zijie <kezijie@leap-io-kernel.com> =E4=BA=8E2025=E5=B9=B411=E6=9C=8816=
=E6=97=A5=E5=91=A8=E6=97=A5 17:18=E5=86=99=E9=81=93=EF=BC=9A
>
> 0day CI reported that scsi_mid_low_api.rst references a file
> Documentation/Configure.help, which has been removed long ago.
>
> The documentation text should wrap this filename in Sphinx literal
> markup (`` ``) and avoid producing a broken file reference.
>
> This patch fixes the incorrect reference.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511130032.gevVvSte-lkp@i=
ntel.com/
> Signed-off-by: ke zijie <kezijie@leap-io-kernel.com>
> ---
>  Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst b=
/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> index f701945a1b1c..30ac3bb5b57c 100644
> --- a/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> +++ b/Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
> @@ -1144,7 +1144,7 @@ struct scsi_host_template::use_new_eh_code=E6=A0=87=
=E5=BF=97
>  =E4=B9=9F=E5=B7=B2=E7=BB=8F=E8=A2=AB=E7=A7=BB=E9=99=A4=E3=80=82
>
>  =E5=9C=A8Linux=E5=86=85=E6=A0=B82.4=E4=B8=AD=EF=BC=8CSCSI=E5=AD=90=E7=B3=
=BB=E7=BB=9F=E7=9A=84=E9=85=8D=E7=BD=AE=E6=8F=8F=E8=BF=B0=E4=B8=8E=E5=85=B6=
=E4=BB=96Linux=E5=AD=90=E7=B3=BB
> -=E7=BB=9F=E7=9A=84=E9=85=8D=E7=BD=AE=E6=8F=8F=E8=BF=B0=E9=9B=86=E4=B8=AD=
=E5=AD=98=E6=94=BE=E5=9C=A8Documentation/Configure.help
> +=E7=BB=9F=E7=9A=84=E9=85=8D=E7=BD=AE=E6=8F=8F=E8=BF=B0=E9=9B=86=E4=B8=AD=
=E5=AD=98=E6=94=BE=E5=9C=A8 ``Documentation/Configure.help``

The warning still exists after picked this patch. and also there are
couple reference issues in Documention dir
Could you like to fix them too?
Please send out your patches as a whole thread.

Warning: Documentation/doc-guide/parse-headers.rst references a file
that doesn't exist: Documentation/userspace-api/media/Makefile
Warning: Documentation/hwmon/g762.rst references a file that doesn't
exist: Documentation/devicetree/bindings/hwmon/g762.txt
Warning: Documentation/trace/rv/da_monitor_instrumentation.rst
references a file that doesn't exist:
Documentation/trace/rv/da_monitor_synthesis.rst
Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst
references a file that doesn't exist:
Documentation/userspace-api/media/Makefile
Warning: Documentation/translations/ja_JP/SubmittingPatches references
a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
Warning: Documentation/translations/ja_JP/process/submit-checklist.rst
references a file that doesn't exist:
Documentation/translations/ja_JP/SubmitChecklist
Warning: Documentation/translations/zh_CN/admin-guide/README.rst
references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rs=
t
references a file that doesn't exist:
Documentation/dev-tools/gdb-kernel-debugging.rst
Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst
references a file that doesn't exist:
Documentation/userspace-api/media/Makefile
Warning: Documentation/translations/zh_CN/how-to.rst references a file
that doesn't exist: Documentation/xxx/xxx.rst
Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst
references a file that doesn't exist: Documentation/Configure.help
Warning: Documentation/translations/zh_TW/admin-guide/README.rst
references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rs=
t
references a file that doesn't exist:
Documentation/dev-tools/gdb-kernel-debugging.rst

thanks
Alex
>  =E6=96=87=E4=BB=B6=E4=B8=AD=E3=80=82=E5=9C=A8Linux=E5=86=85=E6=A0=B82.6=
=E4=B8=AD=EF=BC=8CSCSI=E5=AD=90=E7=B3=BB=E7=BB=9F=E6=8B=A5=E6=9C=89=E7=8B=
=AC=E7=AB=8B=E7=9A=84=E9=85=8D=E7=BD=AE=E6=96=87
>  =E4=BB=B6drivers/scsi/Kconfig=EF=BC=88=E4=BD=93=E7=A7=AF=E6=9B=B4=E5=B0=
=8F=EF=BC=89=EF=BC=8C=E5=90=8C=E6=97=B6=E5=8C=85=E5=90=AB=E9=85=8D=E7=BD=AE=
=E4=BF=A1=E6=81=AF
>  =E4=B8=8E=E5=B8=AE=E5=8A=A9=E4=BF=A1=E6=81=AF=E3=80=82
> --
> 2.25.1
>
