Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6799271A94
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792245314; cv=none; b=SjgLoqTnuuw1IqzMB9f1EQ+t7hekeazEmtdSnOj9fZdQSYfGrioRvSVLbseKLBPyr7FeXXrSDVh4x1buSJAzzDxqlutAOgru1XW7Vtg5OAlfZBe9z9XL1sNHfQhfHPmitjTq4WFLWFNxA7lMfbMyp8B2ahvlsE/tesqWH8+IMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792245314; c=relaxed/simple;
	bh=4vjgZxzNPTAZHH02uX5JMn+P9yfz6UWbm6ZGNahBpXc=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=D4VDItBp/MjTKkIbbYaQL7IwUC+iWZPoa94HlbLL8AWAQBRVGBz3yXT3Fid1l3yk9EPwzMOL4ScW6IQuQkJILLOGzpD1PhekyPqtMtrpFJiMBCpNOTz9gnK0QNtR6qHWJvkqZBo3prGhOqNuPwqKIRZO4lX/8F9gwJ9UTqz8iXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKHuFgeP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKHuFgeP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso8203095e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245311; x=1792850111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:in-reply-to:references:from:subject:cc:to:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BRTQKQ5kOU9+3bYuMCJgO7+zXnOskPhFNRjGsPpvAak=;
        b=nKHuFgePsZm7PZh5vqZvDWEw1mGf8T7+b7SjEQCo/TAffPd+kzz6HnwSD2AyRHsyOM
         lD9gSZISIT2sPmoinJJzrn55xbNueewX+xQRa4KhJDftfpt3VeMA5aAHcHuUqlJzGe1l
         65rZJWwkID5Ld4Debw9fsA6qXp/xNAs5VA4Ap4apuIKJnSZ5B7ONOCoUDhcs8INmL0XU
         DIh+C8JtEljYdRmC3AXo8AJ8Oi5ZLrHGlmFg7S7T/ln3vi9VY4m27StRPg4K36mnkfuh
         bSlt8YWUPonWzJeYUV4bZFVPEhOg/mkywaVcq8W8bWPMT0CvX4AR6J1NkyIMTafJy7u2
         zvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245311; x=1792850111;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:in-reply-to:references:from:subject:cc:to:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRTQKQ5kOU9+3bYuMCJgO7+zXnOskPhFNRjGsPpvAak=;
        b=pYxUy3sNwvVhV8UsqqVQnvOqdcrnO4OizSJxZ1IL/jYJK27WFLOhmfPhnYtF18j9dD
         u1lPqAkSZiH4craTnhVX931LOoP/uUA5TCAoADHRV/7x5wn8N5YobmcqOI+3PSpTVvtn
         hCGtp08ojHGiZTiiQptXCuf/PtUG9q6UJYz6PupOXeIsKzZWEWwvy+lJ/CSJZc3ckUk1
         mq3Q3to+7VrPoG7IdpA/a8AvyMl3rguKx40g/7sh/r2O9ekT7jQlSMxAu1N04rAJb715
         mZfpEKRA+RBynghwzAS77D6QMq27FqRyqdOEKxK9zt3f0rj3qWXSK582+4Na+HGuYshK
         1UYg==
X-Forwarded-Encrypted: i=1; AKwUvBxgXaJyqxbxB7xvmactlztAhf220mobV+NbvDbqhHxF+IY3F+ts81LUPS34NuclZab8mIuUoOovRJR0AzsY@lists.linux.dev
X-Gm-Message-State: AFq9FYKtusI7EpkxlIASmQ5Mqry5RzG4Flz9CCQcHb1unO4j+DGlqiAF
	7Kq7HpAp5o1qqSVEkz4MHbBg0Ol3c2l1IbBl3CGfVQBHw8/dHASDAvpt
X-Gm-Gg: AYBFou1X4DOtxOP7Is5ih3hgBpuKIKnZ5AnOLFMH3ACB9iCh/Ht904FWkFBlTUEMN7t
	q/EcQ/A28uzH4EvaUCO8T6ayScgVD5f2IzA887PwE29zHwgis2V3B2kKfviixpC/a7A/tHn+9Fp
	gRHVnlMA1ABWclZw4NXRq2Atnvv70V1G9BDzustWGYJu1Px7MA4c2nLSAUIYkl4MAxa0pyRXYQ3
	RvdiNm4mPNIavLEFDeoBQTclBa577SDQDAJOoRZOcj1zo2TmaV2GUsqQr1K8SQx98qqD5wv1Gqg
	tiVMskoUAzBMXf0QvRip2llelyDOCdqBPYdlpC0lkCETudRTcG5eZCs007f/aAZgyVpCadMM9fb
	Bk+Cnr943V9eJRykzBHIOZmBuDk2M3Kd8I5aoFrd0NMqg5dEMise1fDRbhbYBfec5pvssoci4R/
	AEFL633yd8liKwT3BPIFjGJkkVvolxgROC796CJAiO0XuTKox/Cu6kasAM/m19MUN2iM1wqPuR
X-Received: by 2002:a05:600c:3508:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a1d762251bmr59162435e9.32.1792245310684;
        Sat, 17 Oct 2026 06:55:10 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm52702875e9.2.2026.10.17.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:55:10 -0700 (PDT)
Date: Sat, 17 Oct 2026 15:55:09 +0200
To: Jiri Kosina <jikos@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Vicki Pfau <vi@endrift.com>,
 oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [hid:for-7.4/nintendo 2/5]
 drivers/hid/hid-nintendo.c:3993:undefined reference to `hid_is_usb
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <202610171559.gZ0QBMFv-lkp@intel.com>
 <3HN3VLNWTGRM8.2HVANQO7V2MPM@homearch.localdomain>
 <8q2ss5so-r679-247p-o8q3-pror0844p3nr@xreary.bet>
In-Reply-To: <8q2ss5so-r679-247p-o8q3-pror0844p3nr@xreary.bet>
Message-Id: <224MMXDV49Y20.3OGRUP8M1CBFH@homearch.localdomain>
User-Agent: mblaze/1.4-3-ga04b747 (2026-07-03)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jiri Kosina <jikos@kernel.org> wrote:
> On Sat, 17 Oct 2026, Silvan Jegen wrote:
>=20
> > Heyhey!
> >=20
> > kernel test robot <lkp@intel.com> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git f=
or-7.4/nintendo
> > > head:   77c7155e2707ba5b1d56f3dc1acead48cf17f98d
> > > commit: 9417132df63e5cd7230433af05198538e759f3ae [2/5] HID: nintendo:=
 Add preliminary Switch 2 controller driver
> > > config: i386-randconfig-1001-20261016 (https://download.01.org/0day-c=
i/archive/20261017/202610171559.gZ0QBMFv-lkp@intel.com/config)
> > > compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20261017/202610171559.gZ0QBMFv-lkp@intel.com/reproduce)
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202610171559.gZ0QBMFv=
-lkp@intel.com/
> > >=20
> > > All errors (new ones prefixed by >>):
> > >=20
> > >    ld: drivers/hid/hid-nintendo.o: in function `switch2_probe':
> > > >> drivers/hid/hid-nintendo.c:3993:(.text+0x6cd7): undefined referenc=
e to `hid_is_usb'
> >=20
> > I might be doing something wrong but I have checked out "for-7.4/ninten=
do"
> > from the https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> > remote and my build finished without errors ...
> >=20
> > So I'm not able to reproduce this issue locally.
>=20
> Did you use config from
>=20
> 	https://download.01.org/0day-ci/archive/20261017/202610171559.gZ0QBMFv-l=
kp@intel.com/config
>=20
> ? I am pretty sure the culprit is that USB_HID is unset.=20

Ah, I missed that this config was used.

USB_HID is indeed unset in this config.


>=20
> We'd need 'depends on USB_HID' for CONFIG_HID_NINTENDO.

Yes, that makes sense!

I'm not familiar with the correct process in this case. Should Vickie
write a patch based on the

https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/nintend=
o

branch or will you fix it up on your side?

Cheers,
Silvan
