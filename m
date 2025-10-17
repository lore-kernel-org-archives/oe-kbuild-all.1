Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BB33128BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760692868; cv=none; b=VEc1uVGlPj4Yz6TNrB6hE4/OZkdXnz7DQRm1ky1tvoKmudWuBi13Lcs5eb8gUxLq0kZKguzBJmN+yBPu7IwTn/kagQkkp1GV0kl012fuYi42W9y2Ra+zM7Yd2bDSHHMUGnpG/zNN0uEUWBcWS+OYNhD2+qOIfWRXHMHjb+RANM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760692868; c=relaxed/simple;
	bh=XwbL7/L7C9/nDL2/xmbaFiG9RcBj6a+Cj3r3ADzcpU0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A1SGj6wlfEdaZt/XfLWY9K2EeShUruA68G41TvD2HlatwySmabINiXk9ITwrR4vsrrUqQRjlL6gH6WEUc2WRd12B8XrN+oz+YV0KnlZRaG7PBlKEtB0OuZypPEUXfz529JD3mpedB63N3R54ovrnLf5L83YcPpxfA8Uc8c08sSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+qfbrn8; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+qfbrn8"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so31583a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760692865; x=1761297665; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XwbL7/L7C9/nDL2/xmbaFiG9RcBj6a+Cj3r3ADzcpU0=;
        b=V+qfbrn82i6H4zDSrAxTy7n4lIs+KkGUh/ayOrY+Ip292rXWOecCZeYa+ttPSM5LFY
         Dn7XzcHG+qSfqZPmlOEy2+RAlwXCuZuC6ETdifzTg1lONyTra/Cy890RL3F5ZQClJyr4
         ThCY3yft6jHFysjKQ3ud7Amld01xFK5cuVVJOA63JFsOftDyGWGPmnFBE5csBbpprphM
         +eJaRP0YbnZ4FHT7RVBoXkLn10v95S4jRw+ddTcXJkNezmzmfzmSMPJdm7JjohFKkfPR
         /p3doPZD6IJuovnxlq4k5R9k+AsWmzuSUQifJ6CUrQA4sLmOBAJJyAw6nV17zcdtKL5Q
         ewwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692865; x=1761297665;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwbL7/L7C9/nDL2/xmbaFiG9RcBj6a+Cj3r3ADzcpU0=;
        b=NMkgpzeoziJ+Fh2Mzldo/oStNQKc8/eNcx4z4DDozFOWuyr3wAPdl1+t0aK2B+yGYi
         HbW5qVBnGkCaaEN/qlDdFblemy+kWCde4skamKEFIgOo2P0LhcuvssOhRIEEImLu/PnQ
         1RxCjhKCx0cjLj4bCy5f0oHva8mExkl/ayQYz79HAbBgaOMnZua+in3lAdJFdPal/mgA
         ZcW4LQI2kk0R2ZZzBXLRB5DedjgPW8bAvhUPalTnVyYItKw5xGHvacvKtexQur/LVjc4
         z5FFpYiinHH1+fuqPTk6NM5EmcItfL5lCFJ/cLHBvSUWpb0/6A0NF/nwSJu9MsGDq8sF
         sMBw==
X-Forwarded-Encrypted: i=1; AJvYcCUKZnMqfXNa+MBd1izEzE9T5+7yjdM2xJE7V+FacLv9mHNb7+wvQ1DvKRFKPjGnXoXiDdwwO2oMSYm4wr9b@lists.linux.dev
X-Gm-Message-State: AOJu0YzYMWC+nsDQamBHHDM1U+sWgJP0sELDaM2W1C0R9Jvg8gMtuKep
	bwRp3FM2QImSUIi8CbQ8r40oE/nlehlCfijD3+4qinmCdMinZ7T8VnB8
X-Gm-Gg: ASbGncs5UcXPVhZd/z5mkfZbRZ4KuP4WDRQxeBq5ddFCfNKVnTZVSN6BcaASI9iTVL6
	WjjcZ8nywWOiVfpb9kD71qdVxD7uVUvFgi2jO8vf52K3hslEDToEFLEXBFr8AbO7/Npl+gfs9yt
	Qz5zyYY8Va8S7r/UmuGyaZrYc+kuelN5VLwjFbyoLWVMGAfEnAuuSgRRQp30Ap0vd1OdyHJ6+//
	XLG2w53nfIOmk04x77qfx262TngaAihCtjXE/9d8BJ45Xa4AvckHuQqgvrV428gLQbe5jgPudin
	CNdnOMo7sMwOezbxF/iLZeWOKz/hVNhqAM2ly7lF/SJ54pMo3eD9ZtA5H6BftEBiyb4r+a7n9dz
	0wMwGQh2SLhmF1oEPhoL+GmlOeqFggtPMQW6CRmsfcyYCcHVwOQyxyCYP1mTMSrS9dC8JyU0ObC
	7F8H/GHb0FGpDSma3MzAY3FtjZ7mgS/DDNZ/JQPbPrk1IlGR+YyXA1pnQ6AL/ggo39oRgBkA48s
	N53i7NKLGy2fYDIKHa7ay+xSoKLJ4Ja8SvGmLcdEA==
X-Google-Smtp-Source: AGHT+IE7BCFzUNiw2i4QfZjW5SFw2tnLjupBLrUZan9DS+NtJPOwUeqzaVj412XY3mXWNnoOXTZFIg==
X-Received: by 2002:a05:6402:2681:b0:634:ba7e:f6c8 with SMTP id 4fb4d7f45d1cf-63c1f6d5e1bmr2398533a12.34.1760692864549;
        Fri, 17 Oct 2025 02:21:04 -0700 (PDT)
Received: from p200300c5871d09695ffbc7296f39d3ed.dip0.t-ipconnect.de (p200300c5871d09695ffbc7296f39d3ed.dip0.t-ipconnect.de. [2003:c5:871d:969:5ffb:c729:6f39:d3ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c0eb3a235sm3458175a12.30.2025.10.17.02.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:21:04 -0700 (PDT)
Message-ID: <8dd21b9be370998277cdc014d7e5d4d333adf575.camel@gmail.com>
Subject: Re: [PATCH v4 3/3] scsi: ufs: core: Add OP-TEE based RPMB driver
 for UFS devices
From: Bean Huo <huobean@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel test robot <lkp@intel.com>, avri.altman@wdc.com, 
 avri.altman@sandisk.com, bvanassche@acm.org, alim.akhtar@samsung.com, 
 jejb@linux.ibm.com, martin.petersen@oracle.com, can.guo@oss.qualcomm.com, 
 beanhuo@micron.com, jens.wiklander@linaro.org,
 oe-kbuild-all@lists.linux.dev,  linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 17 Oct 2025 11:21:02 +0200
In-Reply-To: <CAPDyKFrsMxyD5ASGmsQ8658eBR0vHOSUqJ4axuSpAXuue6d5Uw@mail.gmail.com>
References: <20251008201920.89575-4-beanhuo@iokpp.de>
	 <202510100521.pnAPqTFK-lkp@intel.com>
	 <eccb18abe33299edde64f96e0c3de88c4183cb78.camel@gmail.com>
	 <CAPDyKFrsMxyD5ASGmsQ8658eBR0vHOSUqJ4axuSpAXuue6d5Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-10-17 at 11:11 +0200, Ulf Hansson wrote:
> > https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=
=3Dnext
> >=20
> >=20
> > do I need to add this queued patch for scsi tree as well?
>=20
> I have just sent the patch to Linus to get included in rc2. Sorry, I
> failed to send it for rc1.
>=20
> That said, if you re-spin a version of the series that is based on rc2
> on Monday that should work, I think.
>=20

Thanks, I=E2=80=99ll send the updated version to address the unique device =
ID concern.


Kind regards,
Bean

