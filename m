Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9FE20ADF8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762887706; cv=none; b=ePOn6zAY2rfmuEuHrJ02/Cdtd+3+5UIeeBJw9vkbIDjPUbo4mYEe1QoODWj0kfTyBe+ZnH0RGSH5NRm7vj3RiXvpar+EPKBJ5Bp7WVcOygkE5Wg5dUFiRSVAwa8i/pm5NM0BJMiuJXz2/ChgDteWEOxaDT47ZYAJKq37g4bwxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762887706; c=relaxed/simple;
	bh=i4X2LpZZdhk80MzP/t6BWGEPr1CEtiObreGWtc743vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+07dgpVX8jMsbwCM25opLt334ZV/8UZoLaKZxWmYOBLDBUW8bkC55ChOLMbdYz9sr+4QL3jQPcczJcxm9heHeCfQHPU9Uylyg6mLJHuubsfQc47WGexpo0DHB58qD9fmrODaFs7J9nsiH1FclJAEpQfsSbBFybmliEqNG8ruqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=VerI3w8q; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="VerI3w8q"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso16909a12.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 11:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762887703; x=1763492503; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnaiHd4DDY2ICTnxeCXWQ5hasVJ7ETSPBgIDK8OAdfA=;
        b=VerI3w8qRFYCn140PGrUxzwjuF9Y3UPbq4A9a92zr1AJU9CB/xSEkHBEp4d4+zsb6i
         Lt8TmggqXMFgvAuawsP/0o7tzwQVD977AgVW6vpe9WEAPfDbvvVA5/g8XPfifzWlqAjz
         iIF34fq9FFRfAVnD1PdYny68W1sfgPK3WTDIemGD3vYAW+plBMnDAtghhTnM/s6IzVua
         xLmiSvnqqDgng/fS5BNaNJpxVkIJkSc585Jh3Yg/euJy5bnnzW2M3aMI5UuzbJXyNfAy
         vXsR6MjCCs27mi1kShkxHSd4n4bGphWGeZ3eI+B7lgsQaKMdjJ42zM/TJHP2I3jkqYrh
         DARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762887703; x=1763492503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnaiHd4DDY2ICTnxeCXWQ5hasVJ7ETSPBgIDK8OAdfA=;
        b=NAz/BqD9NXApHFZDcwYTjwcVzoU5QPdoAUfZzbUzCzO3zEMSzjk1M9H9G4HAM0aeYe
         TzLAJSE9s/LTYR8Vsh8dK/rh4/0hu3lpSTZrwvLH3J26YUP5uYtJOFOjW39oz4jzriJQ
         46PMHKrFAe8YyAUZZgvItGTghbDPL9MT4TD4lLqVd67BB89AQldc1b4s3i3FEKAJDnAv
         6VKP9Yz6XABeYOoHw4ujgub1r+Fra2sjG1zMJnQaZ6Xjr6pCTlWhKOhzwdjPx9XqYyvx
         iRa576u8v7erXR6OK2uE5rOvbUO/KOyVMyjBeQG0ro7Qeq0U4/7dPgARa7YwZm6bD9HH
         DIYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaj0XHhbU0+zFKaBCPnt1dvl9MLaJ++o5gLyorrEwXM/gsQ5f3zYUH86S4J+UIe3aVwEWbjmQy0NbxNRw9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc4S2c/ROLVCqdtazneP+v4RTKVe22w1BpgBIoL34RP2sWml0y
	2V+YS34swqxgNnA2e+10CvIlrvVZpLFr14m+OALwAtqhYUwtO7hq2C+0JlS0a+HW4yNN+lqoLvU
	TkAGkImXlkrCDig3TvqDCqC54U1Kn68kf48g5lOwing==
X-Gm-Gg: ASbGncvCXxWGhzrckglLwBPsd12ZHOt/62cC5cXK9GZ/1mjnkpietzkUXABhGUowvbh
	IkFc6s8ZzHfBGJUwBDwrC5IvAsSgQfZuqA9BIqCBE+BYOmZl0r+8xOBBPOiR/9lOHftgCeDweV+
	pELKvAGTPzVsUYRxrOT1nUxczC1T0KJVMEE+rFAxPWX2iTQIuprRUlt3cDE3btQCRs3tyNBJAKs
	kqi+RjighnjesDLB3zErQVq6XdJqNhhybN3d0MtL9b35beJJKHi+EK/YmxQkbgIex88
X-Google-Smtp-Source: AGHT+IGCOWzuMocQkFvJE6yoxZ9KHVliFvFPtTKGmyQFHgSP/UIfCc27ftLwlu29m5483oFVeYxmHJnt2JFe5uDACnM=
X-Received: by 2002:a05:6402:5186:b0:640:9e7f:675c with SMTP id
 4fb4d7f45d1cf-6431a4b3bb6mr252981a12.10.1762887702747; Tue, 11 Nov 2025
 11:01:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511120222.vMZm9rD4-lkp@intel.com>
In-Reply-To: <202511120222.vMZm9rD4-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 11 Nov 2025 14:01:05 -0500
X-Gm-Features: AWmQ_bkoQg7cvgViaXIp5X24hcN84LDYjKFKP5IT037YI5GxQ_pfvCjDN4fOrRE
Message-ID: <CA+CK2bA93HadQzDh4La2Qh_3CaMO_BnyET-PhkLsnvu7qrgK9A@mail.gmail.com>
Subject: Re: [linux-next:master 7210/7661] kernel/liveupdate/luo_file.c:571:3:
 error: call to undeclared function 'get_file'; ISO C99 and later do not
 support implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 1:20=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   2666975a8905776d306bee01c5d98a0395bda1c9
> commit: 74602408d6248999ca8a567c46ce0f78204d6e89 [7210/7661] liveupdate: =
luo_file: implement file systems callbacks
> config: x86_64-buildonly-randconfig-001-20251112 (https://download.01.org=
/0day-ci/archive/20251112/202511120222.vMZm9rD4-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251112/202511120222.vMZm9rD4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511120222.vMZm9rD4-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> kernel/liveupdate/luo_file.c:571:3: error: call to undeclared function=
 'get_file'; ISO C99 and later do not support implicit function declaration=
s [-Wimplicit-function-declaration]
>      571 |                 get_file(luo_file->file);
>          |                 ^
>    kernel/liveupdate/luo_file.c:584:3: error: call to undeclared function=
 'get_file'; ISO C99 and later do not support implicit function declaration=
s [-Wimplicit-function-declaration]
>      584 |                 get_file(luo_file->file);
>          |                 ^
>    2 errors generated.

Thanks, the fs.h header is missing from the luo_file.c:

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index d5197149b3b7..adc411dbfead 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -97,6 +97,7 @@
 #include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/file.h>
+#include <linux/fs.h>
 #include <linux/kexec_handover.h>
 #include <linux/liveupdate.h>
 #include <linux/liveupdate/abi/luo.h>


>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for OF_GPIO
>    Depends on [n]: GPIOLIB [=3Dy] && OF [=3Dn] && HAS_IOMEM [=3Dy]
>    Selected by [y]:
>    - GPIO_TB10X [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && (ARC_PLAT=
_TB10X || COMPILE_TEST [=3Dy])
>    WARNING: unmet direct dependencies detected for MFD_STMFX
>    Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
>    Selected by [y]:
>    - PINCTRL_STMFX [=3Dy] && PINCTRL [=3Dy] && I2C [=3Dy] && OF_GPIO [=3D=
y] && HAS_IOMEM [=3Dy]
>    WARNING: unmet direct dependencies detected for GPIO_SYSCON
>    Depends on [n]: GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && MFD_SYSCON [=3Dy=
] && OF [=3Dn]
>    Selected by [y]:
>    - GPIO_SAMA5D2_PIOBU [=3Dy] && GPIOLIB [=3Dy] && HAS_IOMEM [=3Dy] && M=
FD_SYSCON [=3Dy] && OF_GPIO [=3Dy] && (ARCH_AT91 || COMPILE_TEST [=3Dy])
>    WARNING: unmet direct dependencies detected for I2C_K1
>    Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && (ARCH_SPACEMIT || CO=
MPILE_TEST [=3Dy]) && OF [=3Dn]
>    Selected by [y]:
>    - MFD_SPACEMIT_P1 [=3Dy] && HAS_IOMEM [=3Dy] && (ARCH_SPACEMIT || COMP=
ILE_TEST [=3Dy]) && I2C [=3Dy]
>
>
> vim +/get_file +571 kernel/liveupdate/luo_file.c
>
>    519
>    520  /**
>    521   * luo_retrieve_file - Restores a preserved file from a session b=
y its token.
>    522   * @session: The session from which to retrieve the file.
>    523   * @token:   The unique token identifying the file to be restored=
.
>    524   * @filep:   Output parameter; on success, this is populated with=
 a pointer
>    525   *           to the newly retrieved 'struct file'.
>    526   *
>    527   * This function is the primary mechanism for recreating a file i=
n the new
>    528   * kernel after a live update. It searches the session's list of =
deserialized
>    529   * files for an entry matching the provided @token.
>    530   *
>    531   * The operation is idempotent: if a file has already been succes=
sfully
>    532   * retrieved, this function will simply return a pointer to the e=
xisting
>    533   * 'struct file' and report success without re-executing the retr=
ieve
>    534   * operation. This is handled by checking the 'retrieved' flag un=
der a lock.
>    535   *
>    536   * File retrieval can happen in any order; it is not bound by the=
 order of
>    537   * preservation.
>    538   *
>    539   * Context: Can be called from an ioctl or other in-kernel code i=
n the new
>    540   *          kernel.
>    541   * Return: 0 on success. Returns a negative errno on failure:
>    542   *         -ENOENT if no file with the matching token is found.
>    543   *         Any error code returned by the handler's .retrieve() o=
p.
>    544   */
>    545  int luo_retrieve_file(struct luo_session *session, u64 token,
>    546                        struct file **filep)
>    547  {
>    548          struct liveupdate_file_op_args args =3D {0};
>    549          struct luo_file *luo_file;
>    550          int err;
>    551
>    552          lockdep_assert_held(&session->mutex);
>    553
>    554          if (list_empty(&session->files_list))
>    555                  return -ENOENT;
>    556
>    557          list_for_each_entry(luo_file, &session->files_list, list)=
 {
>    558                  if (luo_file->token =3D=3D token)
>    559                          break;
>    560          }
>    561
>    562          if (luo_file->token !=3D token)
>    563                  return -ENOENT;
>    564
>    565          guard(mutex)(&luo_file->mutex);
>    566          if (luo_file->retrieved) {
>    567                  /*
>    568                   * Someone is asking for this file again, so get =
a reference
>    569                   * for them.
>    570                   */
>  > 571                  get_file(luo_file->file);
>    572                  *filep =3D luo_file->file;
>    573                  return 0;
>    574          }
>    575
>    576          args.handler =3D luo_file->fh;
>    577          args.session =3D (struct liveupdate_session *)session;
>    578          args.serialized_data =3D luo_file->serialized_data;
>    579          err =3D luo_file->fh->ops->retrieve(&args);
>    580          if (!err) {
>    581                  luo_file->file =3D args.file;
>    582
>    583                  /* Get reference so we can keep this file in LUO =
until finish */
>    584                  get_file(luo_file->file);
>    585                  *filep =3D luo_file->file;
>    586                  luo_file->retrieved =3D true;
>    587          }
>    588
>    589          return err;
>    590  }
>    591
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
