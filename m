Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE41366056
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885410; cv=pass; b=ukv8Pom8D2a6XLYihUdZCt7dVyr132Oj06TaQWSa4WMfZcoTkECjfxgNUjoqXa+VJyFmeJvmabMC9OIgLD1p1aXz1JBoTwZ3NjF06HqFolEqe+Q4e7VoeFCY2/DY8DtaudXS5aF0rbQKqLv25sMqNDPPmGsEPxMDY5bHQAhV9y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885410; c=relaxed/simple;
	bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdAL6s7iPy5Vbk9Uxpmgd38nujOuD5rYajCwqov+i5sNbf3sHsE+FeycHbbdi4HuG98yAVa9E7fX3ESfnk5kjDj3PRWoenSHLgvniUj7w6CWPUBAQtv+i1O+zQrNttbOC3w2R2TSUQRxmffsACIHzZvuIjuvgemaN1pzGse00LU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKdVsPzd; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKdVsPzd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so847773f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 08:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774885408; cv=none;
        d=google.com; s=arc-20240605;
        b=VqBnZ/jKsHx5w0h9fI9cfNVcWEex0hfTh1iXX7Oe3ExwJJjncQ6Efx2ggE/qgWTive
         51IIwUZWm1XIMtP77OywUCVEp8gFK8UoJOWg9SYCdPz2SttrgO+dJYZDMZc/jTJNDJja
         8lXmdstDiHh72wjpW97Dg67wFTd1uJSP7I/DqWH1PNVValz3q/AHSItIJWIDYSP5dd0D
         zGDXSbVcfynaaAaCI7d+q0qj+V4Tw0okctWdpvnqdRuoqkFzhYT45lxk9D2MoSag0fWM
         sFC63DYRJhxv50rzPW183lfcTO5Wn/+64gE6RzXv7BPStdjANor9P9EJ+tEZJ5aChFM/
         TuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
        fh=/30dS63523RzGn7VYcCVdkw+hY8ApTy41WA+pdUnPRY=;
        b=c/wh3BMDwwcbR1DixPuDNHHNMp45r/kB7M5tkHtiuRI/zYjBjm/NhCWnXjFzLbrgWQ
         pkSzGOFpnR6H5qGuRa2FqGAThQuskmjRnoLWGHgwDCYU//tzVAcPqlxbRPwFYZPnlDgm
         aKc5pZpKGAZcd8Vv5so+Q2IYci1LMH5TJahCcDafw0Hoakl2oPo59MzVi5Rk0gsq+urY
         84yY1oiYZJywyQ03nq9+SxXYJqCLSuzokPa/xnP2eDhOx2jcs7DJWsnX2eKFJBZWJ++e
         7IioEw0vwNduH017u27yNMr6dTrr/BQxawHSCrTf6k2I6MfdSYjtuARNg04ih5ABy7DW
         IXGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774885408; x=1775490208; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
        b=TKdVsPzdjHqSOyTGDl9NqACNWLxmaxcLzD0FMDtIpRNYlOk35MfwJR8KbeZwGYLJBo
         +ODcP1sK/vgoFGZk+rgOk649KyjhZLI6xhxzSbwChvcPDnTp2W4l1IEFuztGx73b7G4a
         X4VBIYifaAwqXQje3iRmsobs/OuH5motTEoAaxENhoRFbhGW8ESXp6Y/QLvAPP7HYdA/
         Uw5Qnvm2YT/nQxqiE9i50ABo9yQHJytU046v1i1CLO2SW4DW+GwRsm/GnppuFDc0ZqSK
         ZfY/jHP9iDK/tiw8qggn0FYpLZ9rWEU144DINwjurZNNc6izSXftZ3TIZnCbTi3zTu6a
         zoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885408; x=1775490208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t0esJnrDuRx8CALG5EiUG9NulCzrC+rzyK9Xog7c1xc=;
        b=jPi6/L8thUZTx5wK0/Q2dsygP8d7YhsPEmjb49QAmgZKcvFlBYBQGF8iXkF/5hN4qG
         /aXyqRaB29rGF8evOweWdIPJsZhA8RkOAd4J+2pFI0Dsv9w7GWdQa+lrcYbQOq1zkUGT
         0k1lrU1HULGsRzIfrp0xTUlMDWyMKftXNcV9QYrp9FgxF6XZmmPMeoaAZYGOBWQEVH+o
         roUykKlgWl+uIwNagl/seboVe7lIgljAmrqM4kykgfQ+dr4n9eOQcfMzyYkB/4kKwftP
         0mwVjlgT+Yv7a6+InIfls03q8pz7/CONJTRQ/b81Z6bJ/ARxIwp7aDGS90vjEefo0iRi
         fa3g==
X-Forwarded-Encrypted: i=1; AJvYcCUW0gWSwSo2B1eNcj1B/bQ+08n/x94dwoafgCy1Bcr3Kurje4YV+Z4B+bKhONO2IlStB2OwWXD1m4kicjnu@lists.linux.dev
X-Gm-Message-State: AOJu0Yym7fmysnkuvpv9YfCGxxsQYTg6ux+la3VYYzqIoJaWi7sR3zXM
	T5DaK3oA2X3GkLZes5VVdieoBrGnwVSuNrEl7JLaJ2vVSe/bmU72154o+iKDb6xoD9hDwVQFj0h
	ZIjfnay0wM7fyD3ImF2ozDcLzFUTGwzijS+ypjOY=
X-Gm-Gg: ATEYQzz1Zqdh+4Rg3pbPFOAgJgPs4kD9OqK4PRM6eY8W4tFA/Jn9dQ3WsaN4lFstanF
	9eviOBDVyMy1VHoNcpwFIDqBCuE1CYRHGh08LtflPj5DdIPXl3c3x4FYDVVV+sKDNXshhSc3vCN
	Q6LREtcCv00ycRCZ9sNyyqTxgtdnDcz8fCHp0qLQ1W47ECIPSiR17BqUM6Cn8uohEirTOGcMD3+
	U5IsXDBOtQf052JYFgo5iJtGWEUtA0WP41WRyHL2FX1vcJoN9fLTkbff4U3kSmV6qoYyoH9uVl3
	AhN6oTbtJEMLfSkI
X-Received: by 2002:a5d:5f96:0:b0:439:ca9b:1f61 with SMTP id
 ffacd0b85a97d-43b9e9e8366mr21373296f8f.17.1774885407741; Mon, 30 Mar 2026
 08:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324224532.3733468-9-joannelkoong@gmail.com> <202603281401.HP3uX5G1-lkp@intel.com>
In-Reply-To: <202603281401.HP3uX5G1-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 30 Mar 2026 08:43:16 -0700
X-Gm-Features: AQROBzBlRnEc1XLiqyDMwQ1GSgp5676iHS2GTSkOtDm3v-siK_erACaW3pkAlq4
Message-ID: <CAJnrk1Z=yMy3FSt7wvCDgGCr-NQD4M=na2sAGsRM=KoTH2Nazw@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] fuse: add zero-copy over io-uring
To: kernel test robot <lkp@intel.com>
Cc: axboe@kernel.dk, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	miklos@szeredi.hu, bschubert@ddn.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 6:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Joanne,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on mszeredi-fuse/for-next]
> [also build test ERROR on linus/master v7.0-rc5 next-20260327]
> [If your patch is applied to the wrong git tree, kindly drop us a note.

As noted in the cover letter, this series has a dependency on two
prior patchsets submitted to the io-uring tree. This series is for the
io-uring tree, not the fuse tree.

Thanks,
Joanne
