Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46B1F8BBC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741908556; cv=none; b=VLfGdEi2CsVqfO4V9RFSFo45CHToyrtglWImstYUCHDArAbBP4ph8e+vCdV/KdeAO7j36qPDvnP9zJJ9knEvUXRBwpDqazSrSABPiE0ql6CkAbX0tb+BCxwMumwqARuEJf2U46nTd14pTmgr29N9LpNuOXCccf/2RJlIMLe0yI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741908556; c=relaxed/simple;
	bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhUuAkyQJV69KyINboULBBe88iVV8q28NGnDzxix1Q2x8MYqXtVGs8Ke9azGvo2JEoEG7n6ibE/gePJExDzcOZZ1WczmBPE7DpBSEPdUvPGkfCogRa1ZbuYCtQmMMo/CnyGbtQ21opdxtRoQHLQcZObHUyEV+y70HCEeT+Nyogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zHtzot47; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zHtzot47"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab771575040so494465466b.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Mar 2025 16:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741908553; x=1742513353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=zHtzot47hIPMbQPGzLkn0w/rsiAxkwMFYWxNoP1e0pc6cglUgGWB9eVG7RJfkVqZC9
         TtHGWzWWDl27Buxq/IsXimQyZ3jKWb0NboWzj/4iU8TXe5Ihiv9Ffx1HxJD+r6UHS5Y4
         uxbKr1eboyjf7ZaC10uFj+9fuCcZGytc+fShpiW1DH8uM8tv5Z21zVIVH2ps+N3ILJZV
         h6xNUsmmpNuIkxlWuHgOciXKBkQvAKaDCONuQacxpAcfnK+smlWlVyi42Uwwv30g7l2z
         vOfZBc5kyasfQh4LwhjlPyMxZggukrhaxuI+9QSenVVTQ1g9JbKWzMF+raiCbtJIR6bK
         aOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741908553; x=1742513353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLmgjAemiovWofaWjxUzmEbQJocXHzEtlxZq33BB5yw=;
        b=qmWKzU8/iJZUR9rQ6I32X7xKWSg5PwgnOfHeoO5kuHQkfQWkSfazYlUKrIo+1iqC+L
         mevRCRdRVVWg/xbtlcEp/xih0AciJHFe0A34aSNCPahOkRLbQwYBs9D4nCunwpqwdfRr
         a2DkNVrEQwGvbJ/Jrpp14K18YAlEjB3kqckeGdrcy9d91HV8Ltk8lHFshZ2uoK5TaWKg
         kyO6T+ZK0BqlPC8Gnf7wZOjNJkZJr2JZKQ9qNImGRJ4SxIh/vV5G/K5d41zk0wTvHWAT
         26lI5C2Tvr1H06JQ+cBN3y53vnrPqj346Q2n8KmKH+egLwqBx15LItJ/CkeynovNKgbD
         b/4w==
X-Forwarded-Encrypted: i=1; AJvYcCUSyAgQqT7ux+qNWIJoDRMJNPuQVppkIU+Xfv/bRFKF1k2swcQRDJEkpgEIY9WiH3TF4Mh4bMClh4016EH7@lists.linux.dev
X-Gm-Message-State: AOJu0Yyru/kBwxjpA4k+VnXniFexi+yTiqImJAmhrEhK/ChIclpnpu+P
	y3fxEMNjfognsEM6CW/nxuxo/Cp5BROigMImIT2PrPMlLOgc/OXkxeR4YN8baWw0EEzglUJVxbN
	EgE5U0ny6EbK8H4llcwKIEVmRIUNG2PNAdyrs
X-Gm-Gg: ASbGncsfaJpYg2oBvAI4qhYpWBZ5UhAyzgqhEbIoFD7aYshkypN8DRtEOgSN2Ftzf3w
	ufX1N7qIGlvdgZMSn59PseXqYMk9hlIdeuYlV7E0GddWulq6YiXASioFLua8y4+b8knxeD3tavY
	wSS0HDEGiGBPFhSOs6sTRMnyEE8CSPHdZqE/HcXefqAxEzCW2yx2ZucZHhE4Noz/bYZg==
X-Google-Smtp-Source: AGHT+IEhG6Uj2ZgXODFDQkPgzEVnFaKEkMeOMCOgSAKxsS7ffAl3Oika6RfeExnwIHlB01YBUlfrm+cZgMXZ8GfGSBI=
X-Received: by 2002:a17:907:6ea9:b0:ac0:4364:4083 with SMTP id
 a640c23a62f3a-ac330de660fmr24794366b.0.1741908552998; Thu, 13 Mar 2025
 16:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250312195951.1579682-4-jthies@google.com> <202503132357.RnlF5A0E-lkp@intel.com>
In-Reply-To: <202503132357.RnlF5A0E-lkp@intel.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 13 Mar 2025 16:29:01 -0700
X-Gm-Features: AQ5f1JrveV3I6ofpSQly6Maa1d3lFcNQ3Xq7VBo9SbjQm6kMIPtOwMRmVpnj6fw
Message-ID: <CAMFSARdJgVQitDWmszbhSiVfu4hCoyyNVj3LPHb+7wq64C1BiA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: kernel test robot <lkp@intel.com>
Cc: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Echoing my response on patch 1/3, thank you for taking a look at this.
I=E2=80=99ll follow up with a v2 series to address your comments and resolv=
e
the build issues. Additional responses below.

> > devices will be created automatically. None of parent devices should
> > ever check if the child exist to create a child - it makes no sense.
>
> This is still valid - none of parents should be poking around to see if
> there is a child or not. The core handles it, DT handles it etc.
>

Understood, we can remove this for DT. We need to keep part of this
check for ACPI because there are platforms which need this driver and
haven't defined proper ACPI nodes in their FW to load cros_ec_ucsi.

Thanks,
Jameson
