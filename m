Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2F3F9C5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 09:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714554960; cv=none; b=dXQaM2LS/oc9QyanS1Oqf9ZZKqEC1YfFtiySkNzyFP8GVoGeOrjvnQL2oyPEuvOiSqSdVsOkOSd8tjIfTNHYS0/fiatPWsbvfKkJbk8FY9/k6p7mqbWvH4SHNmbfRFTjMqwIx5VS6kw0AJMuywrc2Wle7daBLZjf7wU6YRTtCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714554960; c=relaxed/simple;
	bh=vs4zkmhUUGpE6OwL6AvyOgxRm4GZZtcKmnRABnF/FIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hotKVPx/n9m/H5egTVTkKfckPf0w2ZgTRgyX5orPwG4vKRkXuqzuNpADGF64HcvCOlap//ywVqXYvsVgfsyp1D2sJzA0/4cfDeJqcJ57hEf+4t+7UhodqX0zrpzQw63fnhB7dlWLqykvON5/WDZVuEMEjHd56sRCMdI0xBXOMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aE0szIEc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aE0szIEc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572a93890d1so855251a12.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 01 May 2024 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714554957; x=1715159757; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJFG7cHoAr/M0L/z6uR6byCHHi8FTTDaufw7UAvWhx4=;
        b=aE0szIEcmoEuGRAMHdGBFd7bPoVuVCqRikykePszwKKRmp/Q8UDnYu0PLn6UTK18z/
         95nSOE5x71o7XkBC0FtMww+7M9EnGlUr1YN8HtMizhpgPJkRSC6T7lrc23HebRXwMRZ2
         fsGK561nHaGn7srVUYcpV2X1C/LjIsOZwTHT8Og+t8AKQjmQkzchA6tZnaye60vaKgQd
         DeR+7JY1zdP8iru3CRMijd7kBR8iFSXGBFKRzhsF6+9eXx2/k4eMd/PE0EZoB9XOukGQ
         hmuPSoRO38P81xynUPspX5lWjSNMPimPk+ZlvdTeWXYiIVvhXs14jbPpUYket0JgDRpD
         emOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714554957; x=1715159757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJFG7cHoAr/M0L/z6uR6byCHHi8FTTDaufw7UAvWhx4=;
        b=GL5nX3E4+7tojVNohweze1SAESBvHtjhV6kkiEAj43uqh35/95zYien/m8/okRmb33
         xCnkWhOoSdJgozqN0v2hxGDoTKPwj3cjk1jFcCaq2CQflRgy0Trzx8UBDcyAIBbEfzIv
         wJQgq8WKaf8chvqzc8K3qJV7kIM+dQ9m4MqpCaXnvHC4Kbd7OH9dbsbLNm3veMfNWGWm
         tQ2KHK5W+u9DXG1YeLCiqLOC442WYGbuNrIu/GbH8hE076+/VxxnPziWzTb6TodGe3nR
         ulaCLmtt9ZEJq9iMLdZCF/6Xt5gqH5n34JpzZWuSOwuffBxJudUHjB43aDrSc7c9YRKj
         2YUQ==
X-Gm-Message-State: AOJu0YxC5YFsfXK8hfv+uRxR/mgS1j0GUNHRYwDLIDi7/+3A29StjuYa
	Ugb7enU5heMZenGE1k7jCa6JdKLFLcD1Oi5F36xQGS38qan26Bp9RTO39xNTV+qgepQl0q7Cvup
	XrMeijgRSQe6TfqxX7j9vX8SPXSk=
X-Google-Smtp-Source: AGHT+IFYqT+ZKNHhZfOo4WGw2tmPx4p+j9C2aIdQSlm/haa/u7qMlfAMs4F+PZHlaboxH+IUKA38P80bSBrFlIjiM64=
X-Received: by 2002:a50:c053:0:b0:572:a748:d46a with SMTP id
 u19-20020a50c053000000b00572a748d46amr1666077edd.42.1714554957189; Wed, 01
 May 2024 02:15:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405011728.yuc8zquM-lkp@intel.com>
In-Reply-To: <202405011728.yuc8zquM-lkp@intel.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Wed, 1 May 2024 17:15:46 +0800
Message-ID: <CAK1f24mHUM+n2OnZR9YuTZihsZctZJpKK=L-9jMzBNwDjc=XXQ@mail.gmail.com>
Subject: Re: [linux-next:master 9312/9709] sh4-linux-ld: rmap.c:undefined
 reference to `split_huge_pmd_locked'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This bug was also introduced in v3[1] and has been fixed in v4[2].
Sorry again for any trouble this may have caused :(

[1] https://lore.kernel.org/linux-mm/20240429132308.38794-1-ioworker0@gmail=
.com
[2] https://lore.kernel.org/linux-mm/20240501042700.83974-1-ioworker0@gmail=
.com

Thanks,
Lance Yang

On Wed, May 1, 2024 at 5:12=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   d04466706db5e241ee026f17b5f920e50dee26b5
> commit: 6ae76ae5b2e07d4eb6b3e4fc594856d6500ade54 [9312/9709] mm/vmscan: a=
void split lazyfree THP during shrink_folio_list()
> config: sh-defconfig (https://download.01.org/0day-ci/archive/20240501/20=
2405011728.yuc8zquM-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240501/202405011728.yuc8zquM-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405011728.yuc8zquM-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD d04466706db5e241ee026f17b5f920e50dee26b5=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>    sh4-linux-ld: mm/rmap.o: in function `try_to_unmap_one':
>    rmap.c:(.text+0x2468): undefined reference to `unmap_huge_pmd_locked'
> >> sh4-linux-ld: rmap.c:(.text+0x246c): undefined reference to `split_hug=
e_pmd_locked'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
