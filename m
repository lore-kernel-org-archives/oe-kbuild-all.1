Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0517FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 06:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731998722; cv=none; b=CL4qO0eBruoLU6RfeN5/4WxNUtNhTYfCVBDpHpb/fRJ3FPotCLeUGQjLvjGg2yuPmCWYqe73q7K89v1tOvI6jEL5YLFL1VD7OkEWMFzj4M+hhqAu7T3aVc6AjLo1PjTtmjA+79yrXiDMw/vAsRuNI5YmH3cSaULbhA78C9MNDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731998722; c=relaxed/simple;
	bh=eMMP5rz2BE42egv5BZe9LSGHOhRMuAI1yJxJ1dG22wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLXkMsKUS16HMA4hlgx97ZV7Ya0aL8r7tPtPbutpArRIOlP2uI7w8ppY4AmnX1AOWMjGWCaByT1uH8jjtgM1ykNL/JL2pzW/0HZ76Ft5ce7xVP7ucqx70mrx+GIIzkH1NnbjBiX37A3mKHjlGcC/5/OHsh7yZN+PBoKfV0kyebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpE/gsU+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpE/gsU+"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa1e87afd31so399376566b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 22:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731998719; x=1732603519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDmRB5ClgJpHFr+fT43VEyIex40kGdWvjXQFf2Qtd4I=;
        b=PpE/gsU+vH69G9TuElkeGyMs28LobQdPba95COeboH+lDDyIn3UEMl+1Oighb/wpfQ
         8qfy9EjDV3wJEl3GQRyT/S6iNPzo9ENjaE/V27eatEer3+NLyWTQ1ctKUf/glsEcD9/d
         cP0VhwUqFSHxMt5UJoB1tg2dUu2xUEY2pIjmPB37Bz5esigOAmzL1u9JZ8IhbEqkLzmu
         MNazfMaSi4DoQW5dzPlhc8qRnVXEvrvdpuAIg3uFFK4kdYephXQ+qgRdAcN7l1b23Qmt
         Ry1iA0EZ18A0LcNsxrRAHiJy264ar+8k+cmm/TE5X47hwnAXlPkf/wCG9iH8pxuNV/2G
         otwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731998719; x=1732603519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDmRB5ClgJpHFr+fT43VEyIex40kGdWvjXQFf2Qtd4I=;
        b=Ie5gSTDXXvD3quW1w2fkE0yJZXmmJnoOzjWb+8GU0FwdZ5ScZnGtjbkr0Qp5tMSVNw
         IK8ZkC17Xi8l9SEjF8vRygWz9v8YOkxHNEWwDSf9j+2LlN9A1eptqOueuCNQNEvZpt52
         idQa4Mue/2JLp+RSQ/i5fU/fEWcTcJDKdnfsecGFs05jOpDt8qK2MDxujqy6bV6UhRxp
         uj+BoX077NOG2CiD09QbOA9Tce2YXi5XB+FyZlRXOzTlIGgzllTVavaZdOdKCT31J/5Y
         N+0B1GxeS1gdctmgk5RfE3Oth5OjjV1wjVNZJ9Dz8VLHCdzAaQIUBlAfwlYNZkTamG/9
         pnUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjkvwqrnBxzsr0AJrTO6yvhVGA782Vc5Ous7ahl7UXixQcWJ/o/OkJCeW5FIvAL0JSH4hSJWUL9n2OObOR@lists.linux.dev
X-Gm-Message-State: AOJu0YxXBYAIVAmJnpUcBZkPbeTTIP4d738BQLi5WAFXhdIn4+NsaWQa
	90CpFISHqB1py/uyZNFnFTzukYurUbb87qX4+UUCmcR8Ezi4ff00BjQr+D8cE5025Y/vIuFVtrD
	5+7IzxfZBL3k/G5nd3WJlYdlGLrAVsZV6YQA=
X-Google-Smtp-Source: AGHT+IETr8ZW3iGSUCpNPmZjIUyx01m4KQKrxOLyiCOAZZMrYeYdHbDlG7UwmhPFIsJrU4mdGlPKR83UaJJmZp2OueE=
X-Received: by 2002:a17:906:ef08:b0:a99:3c32:b538 with SMTP id
 a640c23a62f3a-aa483528a6fmr1391898666b.42.1731998718649; Mon, 18 Nov 2024
 22:45:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411191423.eEl9yEsr-lkp@intel.com>
In-Reply-To: <202411191423.eEl9yEsr-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 19 Nov 2024 07:45:07 +0100
Message-ID: <CAOQ4uxhsyuyd9=iJ1GLYXPrtfUqsdWaxObLUGngKV8bwhbK1-A@mail.gmail.com>
Subject: Re: [amir73il:fan_pre_content 19/21] ERROR: modpost:
 "filemap_fsnotify_fault" [fs/xfs/xfs.ko] undefined!
To: Jan Kara <jack@suse.cz>, Josef Bacik <josef@toxicpanda.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:25=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://github.com/amir73il/linux fan_pre_content
> head:   a2b4aa2a63d555f7b7d22f6f54583dff35a1f608
> commit: d3e0f4f0a419a7012bcdc60530619ba2cdf96e85 [19/21] xfs: add pre-con=
tent fsnotify hook for write faults
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241119=
/202411191423.eEl9yEsr-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241119/202411191423.eEl9yEsr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411191423.eEl9yEsr-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "filemap_fsnotify_fault" [fs/xfs/xfs.ko] undefined!

Jan,

We need an empty implementation of filemap_fsnotify_fault() for
!CONFIG_MMU to avert this warning.

Could you add it on commit?

Thanks,
Amir.
