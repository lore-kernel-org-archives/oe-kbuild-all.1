Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8DF1EB19B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 08:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002603; cv=none; b=EN5Ux+sqUsU2ol4JUb3RyGwE9sMVDV9oIu5eCQOwvd7CNWo3Z6CazribPaaiCDw0mx9rOhiyk3sCV5+pdEHYOJOcnpByOPiLBFuOioxgCWVhdDCezuWVK8w8gxVaR/l5z6vLeQyrsB/8GdIWP7FFxGsnvOrK6y+G8JwuwQ3WNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002603; c=relaxed/simple;
	bh=KNpuHzwTaaTYpf7LfrnyBa2FI4gDtfLAyiquhlf2Pro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iI4Lghr5CRTEhSOYpOObxwKvvvj1UscQjVNCZ+9jz0xusDqPlAbiS3v/luP7zCGZZBpYNluXFm9NyTvuhnW7eqfFdG+LSLzOkca1fZVeR88kJe9R4puqIP5AAhwqpg2WSJFVpmbht9bjTFHBdWZB1spV28EiHk8WO946mFuqda0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=qMrhzKgN; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="qMrhzKgN"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bee278c2aso8051471fa.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 01:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1746002600; x=1746607400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1qs81RVT7WGaI5EEDOkNWrLzSI42G5tmDul/p84+M0=;
        b=qMrhzKgNMz2TPueEdcUSQINt70tqnBzVthALNDO/1CmJMeDUHAVhNS616pT8P6irus
         CO6Q/1FW1wq4IJEYw4re94QlAUvxPTz0jEu+uB7p0/A5unFJX40tt3gDprAbfLQHregZ
         wK659SIIlIxHQigJjoPnOfAWX64C3O6yW1RMHuVRyhLDgUq5d7JAOlN3fFLFantTx3rY
         1hflen0QKelh5QnaQFgbTHpN6JNExmHdU/M/6UlUfdCw7mgdCOg0G4tWhkj2b2XCKVpz
         +gJeqlcVsEpAW3DxOjjvr9kjZnJWX8gu/zCqTPGGoZ5XL/QyAj4vQyQAHDvE9A6QPZSN
         Yh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002600; x=1746607400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1qs81RVT7WGaI5EEDOkNWrLzSI42G5tmDul/p84+M0=;
        b=XAxzI9BocRfljhRq63exT0Fzil8vKwAT5/FIzTFmoTU4K2gliMyTasuUDrnCeX62B4
         xldLfFfWJwYJE2DdQqfPfGC+xBLtzZQzjhlDyxfltMY83KQHq+PA8MpKSOmrUT72eB9c
         fkPU/388RfP2gU83d5tR6W8mMYeqTRYc9dVtZn0jATxb2xTjY/UNJfKy6aIzFop1I5Zu
         G4p1rpUiakmFqgPtbotIm/C4NM0qQLCga9mIEekHOFBXbMBL5h/TJal8ijMKiXzJYfBD
         W7+8SNFk0Y4Ej2S0swrXFaoQAgSeUEpgL+/KE2Yod1eEntW3hEznpVFu+7nEJuMeg7Gr
         l9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCX1uBIWjhQu23mk7Z2NTbf8RlJrv8Ng9oA2gM7UiMy8CASpysnBxAsXB4gwtuP0plMj4CP6+XEUub+4Xj+d@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7RAgyAcKFSweo2OkA6D3g+1Q2JYEkm1Z2PTAr+rohw9JJcT0o
	X5ScbrXHgSErsmNGx867kXontM6MDxjrf7qPEQj4vXfQic9wByLYih6V2hbcNcshd9bY84Zr+Dj
	8rhurLfNhliKDct3ju7/pMobrt4931gdNi1V9vA==
X-Gm-Gg: ASbGncvRtrCbRmsWon/9d8IwsLwz+8GY4VRzRjbFWNi2ISUVtgQeAdHepUPX7uylNx1
	rZC3JhrzldOdZslNOB4ePCPgKCJG7jHdPG1EcKJnbBfHRkmsbcfQIneoDMbVKEHeyCyJk1+wUAo
	Gk1ttoH4yX4FFmJHZ3O6AT6BltJ8ocBdS32AKY+x+yqUWLl2Q=
X-Google-Smtp-Source: AGHT+IEj2xNmii2aVrB0HPnZcj1cS2DilF+s1D1CmUyT4TXXlXak86RbcnaZ+lF+p2b/bE6q5sm0vkwf9XHDx/ezzxg=
X-Received: by 2002:a2e:a808:0:b0:30b:a100:7fec with SMTP id
 38308e7fff4ca-31e7d4d6977mr5091471fa.12.1746002599538; Wed, 30 Apr 2025
 01:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPXr0uxh0c_2b2-zJF=N8T6DfccfyvOQRX0X0VO24dS7YsxzzQ@mail.gmail.com>
 <aBHgOsqA4qfe7LbN@c757f733ca9e>
In-Reply-To: <aBHgOsqA4qfe7LbN@c757f733ca9e>
From: Ezra Khuzadi <ekhuzadi@uci.edu>
Date: Wed, 30 Apr 2025 01:43:08 -0700
X-Gm-Features: ATxdqUFr52ls8iRfGl3SJa_g3FJ8AF-6Py3XE-3yWU18Haruwxmc1FYYj3yD3U4
Message-ID: <CAPXr0uxJg0kMu_N7Gxb14kVdhkFGXO_KbK5RxfAcY9dEA8vrEA@mail.gmail.com>
Subject: Re: sound/pci/hda: add quirk for HP Spectre x360 15-eb0xxx
To: kernel test robot <lkp@intel.com>, sound-dev@vger.kernel.org
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	alsa-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sound/pci/hda/patch_realtek.c: add quirk for HP Spectre x360 15-eb0xxx

Add subsystem ID 0x86e5 for HP Spectre x360 15-eb0xxx so that
ALC285_FIXUP_HP_SPECTRE_X360_EB1 (GPIO amp-enable, mic-mute LED and
pinconfigs) is applied.

Tested on HP Spectre x360 15-eb0043dx (Vendor 0x10ec0285, Subsys 0x103c86e5=
)
with legacy HDA driver and hda-verb toggles:

  $ cat /proc/asound/card0/codec#0 \
      | sed -n -e '1,5p;/Vendor Id:/p;/Subsystem Id:/p'
  Codec: Realtek ALC285
  Vendor Id: 0x10ec0285
  Subsystem Id: 0x103c86e5

  $ dmesg | grep -i realtek
  [    5.828728] snd_hda_codec_realtek ehdaudio0D0: ALC285: picked fixup
        for PCI SSID 103c:86e5

Signed-off-by: Ezra Khuzadi <ekhuzadi@uci.edu>
Cc: stable@vger.kernel.org

---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 877137cb09ac..82ad105e7fa9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10563,6 +10563,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
   SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPI=
O),
+  SND_PCI_QUIRK(0x103c, 0x86e5, "HP Spectre x360 15-eb0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_EB1),
   SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_EB1),
   SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_EB1),
   SND_PCI_QUIRK(0x103c, 0x86f9, "HP Spectre x360 13-aw0xxx",
ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED),

On Wed, Apr 30, 2025 at 1:33=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://urldefense.com/v3/__https://www.kernel.org/=
doc/html/latest/process/stable-kernel-rules.html*option-1__;Iw!!CzAuKJ42Guq=
uVTTmVmPViYEvSg!PiCmDJsbkP48HY6ady0rbC21rGusuY-IjJ61JqQnp99GdHsbc5uEQDwV-Q9=
TeKK7R4THFV7fXQ$
>
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to ha=
ve the patch automatically included in the stable tree.
> Subject: sound/pci/hda: add quirk for HP Spectre x360 15-eb0xxx
> Link: https://urldefense.com/v3/__https://lore.kernel.org/stable/CAPXr0ux=
h0c_2b2-zJF*3DN8T6DfccfyvOQRX0X0VO24dS7YsxzzQ*40mail.gmail.com__;JSU!!CzAuK=
J42GuquVTTmVmPViYEvSg!PiCmDJsbkP48HY6ady0rbC21rGusuY-IjJ61JqQnp99GdHsbc5uEQ=
DwV-Q9TeKK7R4SyRLIbeQ$
>
> --
> 0-DAY CI Kernel Test Service
> https://urldefense.com/v3/__https://github.com/intel/lkp-tests/wiki__;!!C=
zAuKJ42GuquVTTmVmPViYEvSg!PiCmDJsbkP48HY6ady0rbC21rGusuY-IjJ61JqQnp99GdHsbc=
5uEQDwV-Q9TeKK7R4QdTQyPmg$
>
>
>
