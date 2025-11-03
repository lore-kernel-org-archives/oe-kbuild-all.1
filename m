Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A962874E4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762144152; cv=none; b=MnjedPe5YJ/D+fyHy0XbzxVLNK02VrA95OGgKBLr7esu//piB2PNi+H/h9/Xs2Pd7byE/OdnZ868pGXul0jDIceD6uoNriYIxrlHQ2sejGgr1m8f96Zs7j+Xn5Ksa739VHDptfIm4hLLz/lI/3r7K3aLScyD8OamwfpXaSUhtXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762144152; c=relaxed/simple;
	bh=BRyq2xvMBfZJNr2slPuwGEUwckfTGKdksrZ8m6uaT8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HeqvgShhxetOWSH+MGwKjwxPOLDFwHi8IhH0xv/2z/eqeFpRXBn+10kfql5gUdcPwNRTxYsZzsCObVvNbtaoc8rnhdYgPbJyiRiss0C5VvZr1BMGyIkmxNbyJakgnFbanEcaj1NK+q3qZK5jCGLlIDotwf2dZoQZkB/D2l4F5s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vj7KJIBM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vj7KJIBM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2951a817541so38659035ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 02 Nov 2025 20:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762144149; x=1762748949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zejBsmGw8Dammq1NbHzRkUXu6Tc3VRpWHGPbCKlc5tw=;
        b=Vj7KJIBMGaMtD39bN6pRxJTec+xfG4LSxnVQqSdeobLTcEAusX3+Aetvvd4snWP/Q3
         z9KnBlNjAOoqAy2yUSpmHl9tWN8swDGToB2277mEjJZNY6XJ/qOoBMT5Nce/TRSITALB
         244Sljvpzh4MWSf1FhMLirXWA7UoPz7QQPWaPmPkd5cAPWBdmkscTNdFz4wfs69m3l9E
         uuAnnre6gpri1DyvNuABfUMGpJqTaxf7NXbABP6t29hUKk3pXo6CoaVqJQOKJILFH97T
         Mawuw/Ram1FijdT+bI0jQPhZMkAQOOcsMpnLIH1Q3xsWwUZsi3FuwbuThoKK3UCBgrx3
         J+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762144149; x=1762748949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zejBsmGw8Dammq1NbHzRkUXu6Tc3VRpWHGPbCKlc5tw=;
        b=NbRaa581Aj4oBCwTMM4sOclRtzqBhcTNFyDCOox4SVrlz6WCYk4+QC5y2JAp7x5Owq
         9xKSMDPJvSUemwJJMCmmBwfxlDYY75yadivFaYcU7uOQoPPugAdbY8UIw52HY3DY/9WE
         DAvGITiaDiCQlBM/02px3VlEg2WlCEC3+t2W0N0KMxqTF+pM9CbpUkQ7C0LxIzPSni8n
         Pt0D1H5ecrpn6/H/Cmpe1Qv2xRiRlUVIF4L13/uT50WzWCx8URxOa6oTP3PAKp2snv3N
         u7ZBSUSgljU7bNay9nUJLKtpS1HPfsp4fcR8bRXtZR31e0ApeVHTxQf3q2ZixgW3eDcw
         aMIg==
X-Forwarded-Encrypted: i=1; AJvYcCW68OKd+KlYjI2ReMbu8CxHTm7ysxr2EzXa35JEskrOiXwXksQyl7v33eKxogV8KYzFVD4+/rCK//1SaUsW@lists.linux.dev
X-Gm-Message-State: AOJu0YyqT1Wxx5kR+2qwAWLRSi0b1SDFDHD8BdkNV5RFYrexLmndp6ed
	Pzy14Ipw9uDs/wF8nXSsk52T6O6236j2cJ8UqDdbgRnXp+HlVgnuX7Ow
X-Gm-Gg: ASbGnctikWfo4NumS67nd5RfoiH66AeWzU2P8Dql8o5rFijDGv7LzifndoZ3YHuMuf/
	2FDzh+Rvxx/Ctf7cQWnxqgFQpzgqInzvd3V4PX+pAccaxEt5HUx2J/4RzdiKafrl1NXSwRZsxdR
	g0/hhGCC6XoKxmDFxLRjrS7elcMfPw7ekJRB7cemw6vY9xWRcTcu/hSqLJfVPaJzd96+YvsGQsM
	E+cwe4pq1fkUcFCTleBrafIPnq8qJDU7nTVOgzoq/9CBsum2kWdvKzg8CcyUJuReUOXcCsdW9nD
	T5eiryzjLJZqiv0si6dRm1PbrFL/mi7OJn/WM1fBfcShct7Lhk0CKewJ9YLhQOgm92mhJ7Vi+dz
	FKc30mJ2ido9AwvGdlrvOL3uoe6NeAF4Trji0r/DPH+7kdRWmZ4bdX7K0fp7HZGl8g4YmAkkP3I
	BTBnwcQ10JJbZMY90SbVZq/H4GqrwDf/OEggNYVHrUCh8MMdG307VarHth
X-Google-Smtp-Source: AGHT+IFMAMIRr2XRxTxO6CYjUyJFceUddY16xeDxgm+N4RkpDVMPqTEsA7hTMjJvGq6jveVSi+he1Q==
X-Received: by 2002:a17:903:32cb:b0:295:f1f:65f with SMTP id d9443c01a7336-2951a4debf5mr127576615ad.31.1762144148913;
        Sun, 02 Nov 2025 20:29:08 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268cbad5sm103047725ad.45.2025.11.02.20.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 20:29:08 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	kernel test robot <lkp@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd led handlers
Date: Sun,  2 Nov 2025 20:28:48 -0800
Message-ID: <20251103042848.9302-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
References: <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
>>
>> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
>>
>> > >   1589
>> > >   1590  static void kbd_led_update_all(struct work_struct *work)
>> > >   1591  {
>> > >   1592          enum led_brightness value;
>> > >   1593          struct asus_wmi *asus;
>> > >   1594          bool registered, notify;
>> > >   1595          int ret;
>> >                               /\ value should have been an int and
>> > placed here. It can take the value -1 hence the check
>>
>> Thanks, that needs to be fixed before the final merge.
>>
>> > Are there any other comments on the series?
>> >
>> > The only issue I am aware of is that Denis identified a bug in asusd
>> > (asusctl userspace program daemon) in certain Asus G14/G16 laptops
>> > that cause laptop keys to become sticky, I have had users also report
>> > that bug in previous versions of the series. WIthout asusd running,
>> > keyboards work fine incl. with brightness control (did not work
>> > before). Given it will take two months for this to reach mainline, I
>> > think it is a fair amount of time to address the bug.
>>
>> One thing that is not clear to me about this -- is this causing a visible
>> user-space behavior regression before vs. after the patchset with asusctl?
>>
>> If so, I am afraid this needs to be root-caused and fixed before the set
>> can be considered for inclusion.

>Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on
>ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
>confuse asusd. Since the devices are the same as with hid-asus not
>loaded, it is specific to that program.
>
>
Hi Antheas.

While you have previously expressed to me directly that you wish InputPlumber
didn't exist, it still very much does, in fact, exist. I also know that you are
explicitly aware that InputPlumber is a consumer of this interface, so your
comment that asusctl is the only affected program is something you know to be
false. This is not even the first time you have renamed an input device that
you knew InputPlumber was a consumer of without notifying me[1].

I can't abide you outright lying to the maintainers here and I'm sick and tired
of having to watch your every move on the LKML. Either become a good citizen of
kernel maintenance, or get out of it.

Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on ROG")
Nacked-By: Derek J. Clark <derekjohn.clark@gmail.com>

- Derek

[1] https://lore.kernel.org/linux-input/Z74vZD7ZtKBTDlwy@google.com/

>We can delay that patch until Denis who took over maintenance of the
>program can have a deeper look. I will still keep the last part of
>that patch that skips the input check, because that causes errors in
>devices that do not create an input device (e.g., lightbar).
>
>Antheas

