Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CEC54BD4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709042228; cv=none; b=m2rAQ/kuSeB3wS1ccJry9lEyqDNIGBDdQtpqRloloQemhkdc+aK6Iv301YGd1qzAhvoolWBalse7Yu+mjtO3wiTXn813TIBtKCq1bVi+C0jaldZ/6XHXhdJ13Jzn47cPn3OOs6Z+FkAG3PbGgLEfcyXQ6LTmPr4jNCkcqvEAnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709042228; c=relaxed/simple;
	bh=+RjOUgYjKnIUtG2s2YFwgRBlRVOcgqfyXjAz4yz0ezM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSNoejTTpRWndqijMEO3m0ymJflGcQ3E74xNdg+yQT0UpXNtHE4NXaFoa8aYoKgDQMY9VFkoNLXqL3kBMiu3Ne2RcvjAH5GRMIFHuHuxB3dhxUI/7EcTKa+8FJ9h6yXPB94RXH7VHkTV+sgNyyZKNoWG7hC7GIhYjZJyOO2iTUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0jyrqFb; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0jyrqFb"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so3548300b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Feb 2024 05:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709042225; x=1709647025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMYVBRfhTAHbrURmbpLRn/22okr8t995Gn/qPB8STJ0=;
        b=A0jyrqFbY9yUjHM1gAaUp2d+YKzug2IXXf+oYdhKdVchyX3XGE4yHML7OOtpJNUG2e
         W/IBtdR335/6o0nIVSxduL95o43J9j9nE/LIiBsliFWoHxDIaxmBPpN8tUwCzaay6uVK
         1RpAGAAJQ+0S1omi/ZI9AjHqUGyuC0iBK11SYyhvfqJ+yFlbVRMU1O1UfWML9KQcHpw9
         qPq2XG738DAWQ9ZaGPwZOCDtMUliZYcK6KFxSrGDqp2zefwIbomhaP7UZovYNq+MkA+o
         VcmxZy2Sa9AD98HI3Ach+U+D0zsLaz/OBuD1iBLnS+aUlnq11tghhZ58TJTc2kyrUmKL
         3h0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709042225; x=1709647025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMYVBRfhTAHbrURmbpLRn/22okr8t995Gn/qPB8STJ0=;
        b=QT58bPfYYLBfebe51Hea7a/0Umy89oFPZDoS/l2T3Xj3nlv/Sbv5I5uvcZgFDhqW7C
         zhwPyc7tqbjLBiUyh2yhrtSvauQxneop2zZRy1Hhc2QdyuqOzqZAvITkJzBp7xrSwuIe
         0OQZ1VQ8o+4VIL6aeA/gS4eixfwjkPufB3hv6W9l1IiL0HBCsKGQ46Qoa4pno8mWc7ru
         iQTnSWhwvyPcGJ7R5gbrwv/WOzltr2lPBWQv0nauFBDJkiSRzMi/e9A4GlLCS3kpu7F7
         KzlPU9tY5n2sC14yextHnyWkDar7D5BMiBi/tiiF4tPmuxg/twZPw6lXBVx9BNumWu7N
         gaUQ==
X-Gm-Message-State: AOJu0Yz87uUMjPmAEWLMlvYOk5j9RqyUYearJ4gBC4tbg7ul+8HsFw++
	WoAvdafJ9AjNOVx0axp0x+Ot2ydNTTpqL3F9y2LbAQRqndISc+mEhQIiK6x0Xz+f4GPYlac3bb3
	xtub8okinOHbAhxnzuIsrlKUGU1U=
X-Google-Smtp-Source: AGHT+IHtPpA9qAPloqzzNWI0I87XEJ/ewCp6S0DGuTOBZYBkIpeJvopoik092bzY2yvlS43fu3orpQxnxCYVwCBk1os=
X-Received: by 2002:a05:6808:1889:b0:3c1:b09b:40aa with SMTP id
 bi9-20020a056808188900b003c1b09b40aamr1133771oib.6.1709042224626; Tue, 27 Feb
 2024 05:57:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202402260556.0rujs05e-lkp@intel.com>
In-Reply-To: <202402260556.0rujs05e-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 27 Feb 2024 15:56:53 +0200
Message-ID: <CAOQ4uxj-PaBHNjYYVAVc=an3BZTt-C9p9etWAmhZc1udU7PN5A@mail.gmail.com>
Subject: Re: fs/overlayfs/copy_up.o: warning: objtool: ovl_copy_up_tmpfile()
 falls through to next function ovl_create_index.cold()
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	overlayfs <linux-unionfs@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 11:25=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   70ff1fe626a166dcaadb5a81bfe75e22c91f5dbf
> commit: 5b02bfc1e7e3811c5bf7f0fa626a0694d0dbbd77 ovl: do not encode lower=
 fh with upper sb_writers held
> date:   4 months ago
> config: x86_64-buildonly-randconfig-r001-20230616 (https://download.01.or=
g/0day-ci/archive/20240226/202402260556.0rujs05e-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240226/202402260556.0rujs05e-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402260556.0rujs05e-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> fs/overlayfs/copy_up.o: warning: objtool: ovl_copy_up_tmpfile() falls =
through to next function ovl_create_index.cold()
>

I have no idea what this is about.
Does not seem related to the regressing commit.
This:
https://lore.kernel.org/lkml/caa4ec6c687931db805e692d4e4bf06cd87d33e6.14607=
29697.git.jpoimboe@redhat.com/
suggest that it might be a compiler bug?

Thanks,
Amir.
