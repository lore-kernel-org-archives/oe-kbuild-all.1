Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D991E1DF0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 21:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749936107; cv=none; b=mrscXHPLXgnmdH9O4ZZ+ZfIsVB6QpM7xj7V/6eqq+KO8Nev8NOraThKbSFjUnjq4I91ScZaggxTOVIqPiCV8Vi79Go3vClYV71ybUZjPxCsF9KifxsFj2mI0UP+xUVq+X0x7z0ArINrCr2ztXlI5ULHLYLaMBtNv6DHIa73IOaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749936107; c=relaxed/simple;
	bh=95m61qIV6ZpSVPIOwauck0utYq1p5pnDlxVw9fZPoUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GcjL6r3yc/F0/33dP4HXeNezeZYftcvFLtMRJ0yjfskU6NAq6FMIWEjspx8+GvnnTmGzWyfk5zh7gkVbFQzHr4dGdaF2+ct04V/j3XbQzDANrTAnbzlor1wHT3VBE82HW6511JmfK3MeV4gkUXEe3OpRg1UU2IOYRw0wZqHwZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxAGwqgy; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxAGwqgy"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e7ade16082so950164137.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 14:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749936105; x=1750540905; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK467agQBl7b1tY2wypHrza4wnliO7LxjWcV6PEgN6o=;
        b=mxAGwqgyT8P0mvLjojsSdBMSYMrKxfpB0RggejXISu4XTM9PjYSYQ+i+sO9BG4xt5e
         Zrm3t5zRRERPnKkyGqAnJUe0s1D8QHFcrwBG1t93WZi7a8FcLFP1RAVDDvopvjP7cYT8
         /4bhzU6TEagSGuK/uuZ0nbPONvOUO6p4xpSlAWMaAgI4bUpyLaIeLrtUv+l6lpJRJYFs
         3RrViBVtjt/KLNNUp38ATEyLUaWugvcN2iFXO0k351++qYifKNX5TNhgd3b0+oXayoRD
         zokDO6A7jINwVOQ2Dypv8S4y7A37MNKWkbuC4Jnhf9xupR5LUORvj213dZY6H2dELWXX
         TEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749936105; x=1750540905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK467agQBl7b1tY2wypHrza4wnliO7LxjWcV6PEgN6o=;
        b=GpW/sigPkADMUpZp2YpmhV1xW6uDVQod1HFGBk7tupk0hzixlS061B0R8bhvlC20QL
         BbECVxT03YKhvaLr2sP201H+bjc/jOcXYDPc0TD8U7reaBUpkF3Utry1pBJ7ZLyoEscm
         sHU3j6B6yxcY3XF82FS9Ug09A4Y0hbFYecO0JxaNwixZvbISZuDu9JHJRiamQejKq4xS
         bELfr5aEe5T17Kg9GAS+8DZ7Af7QdRgSTOab9NBd5OQmU1/sj/JIPSMhDqX5mznY8mLu
         A7swGgdfbW/UyCpg3LSlQ5XsMc+ybbPGvcOtBq6Q3kwfnyILjaK3HKsXFhWPdxeuqv13
         WvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZihl88sH52OMBrWV/e1x6eXRsLYhC+dJ4o9J8q+wcIkxLHb99hGuo/hsRbL89kBZ2q/UlAOf/XUukEhK2@lists.linux.dev
X-Gm-Message-State: AOJu0YzbW1nryepamTA2u7ETHccaMPkSJefdmJ4TfDvaGeijLq3I72oZ
	Rn4OIQlaViPO8LI3dm8bsc4oyeRvZ9bC9yavb3Wi5f06vk3IId8vMHiDl4PJrB+Fv8rFt0y3EZj
	kAoDVAAmzGnzM5eCFDskSSd41q2pRyYc=
X-Gm-Gg: ASbGncvC26umA0ORR7/Ymxl/H7tf0b7uUDCshqknXNwjmlYA32t4M5teBmrFksOUhwL
	uUYmO9wLtZOC8MQGrzXLHan7eBNI50W8IviLi7d4zT6bndwZ+1mnowXhCUCHnd20DL9rNpU0RyO
	7ehJbdAtJGZqde6t6SOUtHtUei+XIDtmwFPXSvuVtfFgmQs+j4IDV+Arlrpw==
X-Google-Smtp-Source: AGHT+IH0tdFLXLY6jlKXLxCkkQ5OlCmVQ9/IMNkj5MVlcXZf4aDR7L/tSB4T3vCPQaU9jj/rvROsVYOur+PnsJBnBII=
X-Received: by 2002:a05:6102:d8f:b0:4e7:bf04:413f with SMTP id
 ada2fe7eead31-4e7f648cd19mr3019968137.18.1749936105288; Sat, 14 Jun 2025
 14:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611194648.18133-4-andrew.lopes@alumni.usp.br>
 <202506122309.FvJPaMhh-lkp@intel.com> <1c1c2888-be50-4578-8afd-bfbe4bd9cbae@baylibre.com>
In-Reply-To: <1c1c2888-be50-4578-8afd-bfbe4bd9cbae@baylibre.com>
From: Andrew Ijano <andrew.ijano@gmail.com>
Date: Sat, 14 Jun 2025 18:21:34 -0300
X-Gm-Features: AX0GCFskZ6scvwqCQ_LUPZh8XidRkwo3cx6PRXx9bYPaQ-64eMfzIP8pKcRdwss
Message-ID: <CANZih_TWMx2d=8FGRLdHdvQDRQxoYar0v+YpeiogdQOWTnLHpQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] iio: accel: sca3000: use guard(mutex)() for
 handling mutex lock
To: David Lechner <dlechner@baylibre.com>
Cc: kernel test robot <lkp@intel.com>, jic23@kernel.org, oe-kbuild-all@lists.linux.dev, 
	andrew.lopes@alumni.usp.br, gustavobastos@usp.br, nuno.sa@analog.com, 
	andy@kernel.org, jstephan@baylibre.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 1:06=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> On 6/12/25 10:52 AM, kernel test robot wrote:
> > Hi Andrew,
...
>
> These error messages aren't particularity helpful, but what I think
> this is try to say is that you have to be careful with guard() in
> switch statements.
>
> The guard() macro is declaring a new local variable, which shouldn't
> be done in a case: statement without enclosing it in a separate scope.
> Some compilers complain and some don't so even if it worked for you
> locally, we need to make it work for all supported compilers.
>
> So the code needs to looks something like this:
>
>         case IIO_CHAN_INFO_SAMP_FREQ: {
>                 guard(mutex)(&st->lock);
>                 ret =3D sca3000_read_raw_samp_freq(st, val);
>                 return ret ? ret : IIO_VAL_INT;
>         }
Hi, David! Thanks a lot for the explanation. I'll make this change right aw=
ay.

Thanks,
Andrew
