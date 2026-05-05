Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869F3590C3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 May 2026 01:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943378; cv=pass; b=D+V2YDvQAJ/5/+385DLYMWT/7+gUAi8QNFc/tZlWsc6Vni9BxGRRyvhTkLmMSXxIjEgnAi+hPy3xc1VfrIfMmNfNpaQdvAq34eRlTL4r8QtRy84A0OLa4gtcadLR6PfRQ9nyW9uvDUEAVB6T7qvcD1wfzXrzgjd4I8beSWTvrnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943378; c=relaxed/simple;
	bh=yrhSLKaa2QeaWDT1n9VW0NMC4Y38i52sMx4Jmnj00zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjXYnqEhHx3AdFyqebHTqIGXLUFYywsMsAzeuWz8dNx77j3bOuBAEPVLviRRpYXSvWO1Bzoa9kqTUPiN2XfrZrTtnO0RkSddBi9DJJHWHpxkHVNJTa399SQRsSb1FnIIhOwbe0xR3vu68H/l/9DObc6zW9QRGpOb2TChdIXrM0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=h64ZxD6Y; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="h64ZxD6Y"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651bf695701so4632919d50.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 May 2026 18:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777943376; cv=none;
        d=google.com; s=arc-20240605;
        b=OlPxHhRTS9Vav68SkAUpndoQUE+58VA/pLtQ1rqeEyo5IyqHfvhR4BW+eDR85avGUX
         Kr59y1QVZv2g9LeTJ4lpEGllfXlbU4zqx9mMx5x0XWpYj4I8RybslTaFqyMfChnIezlk
         uiN45Yl8mpeQyx1NpvFTMqN+4cUsVjUdwWZzIofvHUq+hogOkNdllt52uZbmUeWZCxJc
         MflldqfHxmkMo95luEGfi2Q7861eT+cTBPxazs6ivCV/TALrp2CMQ/jOIF9JBJ7sipC8
         eFVeC8LKvQEYM0TuZPgxzAt3VRwMr3q34pcSjI6iXaiXsz0jjIeXPtWGVHw9BQ6lIED5
         T1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrhSLKaa2QeaWDT1n9VW0NMC4Y38i52sMx4Jmnj00zE=;
        fh=J2iPitDlVE18SsmxM+JWIYhTdL3oEOMuqA2b1h1SIgM=;
        b=KZxwgDJcDvIah30UKvJ25lP+CUCYrNc3c/kThAJeUezwlIRfyGa89GkAYNdU1VW5Qt
         0R+ZmYph475sZa0djhcRqvo6On8xFfAHU0TCp/E2pABqrNeq/b6ExXISfCWLzscezyLL
         ELe2/Z82yaeZ2ZwfXR7xg7c5J8HEx+BXT+U46HJkpdJAKD2gVnRwTrRGjCJ0WPcAX06a
         aa80V9jiNs6a+nqBTmxcodle2v782WPjKl8SvmF5EnaHrLZDrBkZo5ZUukWt1pRjmRe9
         +UkRqdQTkfPJjqHVHGhE2mVdJ+Y85aoyXp/sdhZqjak8qu1uEezvr+vcZVMlMdQH+MvI
         /F2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777943376; x=1778548176; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrhSLKaa2QeaWDT1n9VW0NMC4Y38i52sMx4Jmnj00zE=;
        b=h64ZxD6YVFIdALYinSeIcta1kCMUlyPY0fzHRryTaBxWBA3r6vTPxPtxDlWa0CHhhh
         3Is4Ys1XFiI69AWqS1EhgRDBsm/Lh6LgGYyvOHl0EPDP4e4AHn8a7VtfFIm8MzQBTUkn
         vWZv3G+NUp3XEJaThnd5M5vogL/s/oo0cmoqysEMYSvFEC+QC/eoZClb1HQLoHxvRKXL
         YHvUo4TSwv2idpepoAqaCWv0rijq9e6PKwK/cUf24+8O706fEKrBk6eVFBsAGMRx1y7V
         vKQ0GHG71ZgJgKLnxvoEBnGe4cNjNvOR4mwmODNtCdpgCga6agBsDd+uNcWWjxXaJGy9
         P55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777943376; x=1778548176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrhSLKaa2QeaWDT1n9VW0NMC4Y38i52sMx4Jmnj00zE=;
        b=YQ4VsiX3N44LUzNq8wW4sZpbf+HwrEzWFzr88Whx5ci+StpisdwLNKQhLcOpUHUg13
         qX07r0l3zGDXHuWEDl/UcP3afxwLEW48uzPbDyEB8idDWygxu7TWkyohX+SdLji7SJk8
         E8PZ6naOyS/2yZnpM+OLouBa7X/AEG76mu0TFDVFRZKNuySbtGpWlCpG2m66nNs4jfxV
         iqf85jnBr95LqVO1tZD7Rqx/SxVCldq2eGBwGn7ZLt5w7a6NhfSZIgELxOy1TKUZgroA
         LscX+PYBxWe2qWVw5qolyvcgnaIvJHjkBLt4RZ5UN3LpYoQxrkZ+hCMyEHisK9bSiqCv
         Hh0g==
X-Forwarded-Encrypted: i=1; AFNElJ8QFGKr00R4zc6PXYKOO7S9QJOhYDLsfjh/kYMTpo9nc27xqnkhJb7BcOn43fK1dSsCivrja7RvRratTa6W@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi96+wNUmmIXe0x39Ho0Rb7yeI0cf0iFRNUIIJkfZtNrDoo20m
	Tv6O0CI3bQpIq+6tyoAaqnkAaH8S+9ObyR+zmK7lJl1OeMrnjLHWh2eTxZ6yzDvqhYITcpOYlNy
	QfAd7cmvdWm8NZgoSeulXL7pjqS2XUZOvsCuU2dXnifK8XCvf4NstJkHpAQ==
X-Gm-Gg: AeBDievwFMQ1Q0PmIU4U9vdBmtzVLQWnT/7ceCx3rIa9NFSpkbY3iOU6XSuf9mhoVFN
	tguNRqjDzA1MnXqtdFmJvJlOEiLImhvYZKbmr9s0peuqGzJ2Hjbg7zzwIIaDuB083ugwcJ0x4Vy
	IMr9MOuKePMUm7pM6vSRVJmGlQlyziwRvzNOa2u39VCr3yMpdoc+ZvN4GJPKPqCBUQ4x1FNnvpD
	0ZiRYKoS+027qV7vX3wHBsEQsxCZWzCUw/ImwH4NCduteoMz3rWc686RVBDypCinoa4LNe0dFkN
	5of+Hx904HLkjSQt82XY6HbSMDrHthKjZgJLu4JXA3VVoEjc1sa4WfadDUGP8Y0vwoI=
X-Received: by 2002:a53:e3c2:0:b0:650:1cf8:f608 with SMTP id
 956f58d0204a3-65c69ef155amr904239d50.45.1777943375786; Mon, 04 May 2026
 18:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605050317.Tf9j487w-lkp@intel.com> <5da3b012-80df-44aa-bd32-e5336a222899@riscstar.com>
 <aflCpEYKjO64ECFW@sirena.co.uk>
In-Reply-To: <aflCpEYKjO64ECFW@sirena.co.uk>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 5 May 2026 09:09:23 +0800
X-Gm-Features: AVHnY4J0gFQSyZGZI4All6-0O22QjtbN5MUWMUeExbjSEPTRARevCBjLJgOXzzs
Message-ID: <CAH1PCMaqzC6Hw4j1JaxcXkJpQg1Z3KU3EJvrKZOkho6Yixhh7Q@mail.gmail.com>
Subject: Re: [broonie-ci:spi-7.2 9/9] drivers/spi/spi-spacemit-k1.c:393:38:
 warning: integer overflow in expression of type 'long int' results in '-589934592'
To: Mark Brown <broonie@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 9:06=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, May 04, 2026 at 04:40:10PM -0500, Alex Elder wrote:
>
> > Could you please submit a correction to this (by which I
> > think you need to post v11 of the series).
>
> Please send an incremental patch, I already applied before I saw this.


Sure
