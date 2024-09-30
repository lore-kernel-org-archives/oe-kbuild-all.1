Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F318E05C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727698145; cv=none; b=Pnd/h9kadEy+mtHrhS/IX6uWIVIJaVYvZohcUu53l68vI6XbFWfKcJNlR9T8YjtdNVwV70R7Jh45Ey4xKd1EzI0HuXTzRzXGwM8N+VEkyXjv8y10LxmFh5mkVg6m0jknfw6D93Ey1saQQYxGR7wIaaOiAiPPMxvPB+3UsL3w4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727698145; c=relaxed/simple;
	bh=v9q3x7z8QvhX052EYW3xZ+X0Rw9aY0rzg99yCATyEtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOfPCpIFFQQGdct2prJzi/pWmDiUSS0BBTkvkjMkGBrLK+xfV7wP+W0223Cv8sQp9dgprRMaeuPdr7lMXRndpG+HfKSmJmtVezaAYIpwRl7mXoi8ymDcvH9BRZamMQiZPDm8yCtXt57ypx8ZJtrlc03D4tJnXkMs3yicR23NqRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goUqaRUS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goUqaRUS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e09a276ec6so3570655a91.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 05:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727698143; x=1728302943; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLCfsAOM/sf8jX6lMsEq45E9J6koxN4fTvlUf2fHSJk=;
        b=goUqaRUSCVAH39MzCypS7RMjIVQ25EKujqKIcSzXdktdNNrOTUtxSnHMobeyq/kZ5q
         dduhL1N73tQxZM/pE0kR20gMTRZKN4T82ai9Pn3CoWMXSibmNV1t866Qh0ZUO+i7vpih
         piLanLkNYGLJybMvpeG8KmuKlqObMjZiZJwz9zpGwfm/f24bew/iw6E0rr0IgzsFc4ub
         JX3gGGAoJY9A4czH4cYtxFkizHbWldRfIzx+L7DibYsxlLwpH50k6VjBRsvugG//2Mn5
         fAhOLPulgzdgAcWG/R6a1/FqqQKxsLTWLjrAXSX3IYjmz55tgyOrcAOqe9nOR9hOqcyT
         XLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727698143; x=1728302943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLCfsAOM/sf8jX6lMsEq45E9J6koxN4fTvlUf2fHSJk=;
        b=UwwJc6ShN/vYrLLF/k6LDBenN6eTyLfjl1pm3BxW3gXKxCjITFnHlQP+6L73l7MBgX
         1lLcS2iTSFdXiDWXDeFF06ll6OqkJOyGN69VMQdyW/YyobFjXcrPp/BJSLSb2kfb1Fvi
         ttgkERi+QLPmqlvtEnooNSAQKxJeGxZ4uj69nY4qQkom0bfqDPLgf8+8w+Z805RGzN+R
         +3KIaY33qqxzqwt9c+qwzOVrvDRumFzaPqJbRkiSQpPX/bSzZV3A4wdNZUH2SG1bzN2+
         DUKXk+f4arNyIN8C2URzYZ1KIwbo2khgEfI3AktFXThsJrM0fMCFtmMt8mNFN/5NbYa+
         Rquw==
X-Forwarded-Encrypted: i=1; AJvYcCVHqYUr+Zfh2MmQTC9GnhlhkuC82zXlPdeDITYQV0UNwveanKQD2aUfFak5FWHjcrfsNQSafOJ+/Ago8oxQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz673y+XPxe8MkZYtVxXrLC2dAtVdNZMILGGDYrMAkoLJPUXwpN
	2pAwDKqO/049JMnJbynzBSn/BSDMcSj8pGuFutXVFdroCGVDjg1uJ6SG58+SWkZMT64y0nW4oaZ
	c5kOPVzrdPm1/BIRryKDvkU63smg=
X-Google-Smtp-Source: AGHT+IGVtNKUzCfcnZJqltrJXhGmWKupIdnDAgKWSurVkc3n976IsCMk9heB4JmhBC5qqsWzjb/F2Hjgwcy9W2a8kfs=
X-Received: by 2002:a17:90a:8a17:b0:2da:d2a2:4a71 with SMTP id
 98e67ed59e1d1-2e0b8ee9508mr11239187a91.40.1727698142969; Mon, 30 Sep 2024
 05:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917100432.10887-1-vishnuocv@gmail.com> <202409211318.ZsE7JGOi-lkp@intel.com>
 <CABxCQKuya7HUWPPw+3vSigddHa84hGZdtuN-02mxvNdfieLXZQ@mail.gmail.com> <nycvar.YFH.7.76.2409272018370.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409272018370.31206@cbobk.fhfr.pm>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 30 Sep 2024 21:08:26 +0900
Message-ID: <CABxCQKvWsKVoHtz3vkuwePSpQuJpWCkCch5RxXdYM7b0_sY-Zg@mail.gmail.com>
Subject: Re: [PATCH] hid: hid-lenovo: Supporting TP-X12-TAB-1/2 Kbd Hotkeys
 using raw events.
To: Jiri Kosina <jikos@kernel.org>
Cc: kernel test robot <lkp@intel.com>, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you.

I will resubmit the patch rebasing on hid.git#for-6.13/lenovo.

On Sat, Sep 28, 2024 at 3:19=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Tue, 24 Sep 2024, Vishnu Sankar wrote:
>
> > Sorry for the inconvenience.
> > The base I used was the Master branch.
> >
> > Should I resubmit this patch again with the base as linus/master next-2=
024xxxx?
>
> Please ideally base your patches on:
>
> - topic branch in hid.git for the particular driver you are touching (in
>   this case it'd be called hid.git#for-6.13/lenovo)
>
> - hid.git#master if a topic branch for your particular driver doesn't
>   exist in hid.git
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
