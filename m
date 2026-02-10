Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F13433556E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715226; cv=pass; b=JU3tJDIppIfQk+C1Hf3rjadrEYT4wPFJTnwIFu7iucGeDR0tk5BqtG8pTEoNvOTid48O4x5TqR03QV6DVLKn+/V/JTfWUmlHQIBdqWMV7rRqrfnsaw1AQKyA0Ziyg0OMYElKRhaUdnQfX9JzpDFfHB4XbOm7IHQShScNl20T/cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715226; c=relaxed/simple;
	bh=wQoaqtXuX/Kf+Z43yj8ETb11ourWZOQsRzD1IJzHmz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onsIpxI4IuoSN8xOl5Z0oziFg8nrtLb9/dvIshp17rS8uInstHQfmxMOIRNsLM6nuHx9KXFHWfnnjISh/rjTwl2uURV12vlHNlnYKTL8NVxwBPnPlklvLzSCUSPQwSey0yNMisOGn5HX1pkIidF/aukQCxOSAiWY6c9P+SsM18U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSnk3s7i; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSnk3s7i"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so133030eec.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 01:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770715224; cv=none;
        d=google.com; s=arc-20240605;
        b=lGK1lvo0h1DqSGS40YbMsJhr2f9NB8X/7560pXPTLBlYyPEXsGXk1Q8DRQagODKDfG
         2eLYqSPW9GlamNBIiRdN+1MtVkCyoi65GOlzxqFY2RF1ylhvMuSvW6FwrcJ6oIhI/a/A
         VlmrYnn/1GkU/zqqa32dR5T87eZj9z+0tFHAwhs0YuVgCoqXYDpb6Iyn4dpqCTu95J9p
         GR6JxkgZY8khAfcStM+KUE+eLN/JdqQiKK0/Fw/x9CnxXwwiRIdPKWHXV0XlKCh2Fj//
         4qqs7Xpqbl9qDrRxNwev38wz1TvxbuNjznCrlEVwbLsEeMqXLdK7lOsnkAqkZ3XGJVxI
         8xZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ljmK7rOu6WZboSs6rbQYdN20qWF3HgHYq5GskzDfkjE=;
        fh=3cJPwIA09eoZER1X8YirGEi5PDrtdSad//pVcDQ62LM=;
        b=dapOpt+Y2YPeF/yMYglk2qJOr8pGpDpocW8VR7FF7qt6wQVUPRCXlaCILaqFQqNpR+
         f1JRd7R/oJiHPooBxb6YU2trW6fbECMbK1seRjvC3KWKwte7iq13cjR8ej2xVajVG7j/
         8rXmq1STsEm1yugyFTSjjs+t0hVf5eeG2uXAFnwjSTxP6ooffxwAG5XyNVBFw5np0MTP
         vbLIw2i99oSR036Bc59tImdvwD3XIxiWXGsvSt7WvAd5NuJO+k0/ENSqr3QGGXmUwSe4
         /mZnS/8rIgmvVkFt5WCxf8Xy/x7Py0EAMxjkxz1gftCGRzUUTkCcgyBmuDnUY1+iqP44
         0WgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770715224; x=1771320024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljmK7rOu6WZboSs6rbQYdN20qWF3HgHYq5GskzDfkjE=;
        b=TSnk3s7iesmc20cqGcPR1mIB73w+b1UafQCxkXIyLsgnrUtYsrsLNckLY4Fb9gt23c
         mrgEB2/e4++iozlv5hPcVzcZ/ezu2ZFHYLVQAx5Gxn1iVB5PgXZxwpGMvNGi6rPraJmJ
         8Zv/pUSs8GVIBmC0TLDvC4ugavbW4ULB6d4aAOeYAWloFBxzkszB+Y9giapq99YSde9u
         k1dVVyAfIZAGZuBmr7Z3IFoP1VJQ5G6VWWo7GKZwsNHEHWXqkeeWVu2lFuXiVMPqLmGk
         xNL5bZhB0amK8sgrqieiZHuDby2afibgDwFujznGe6bjJAQy2FfBce+zj1YTpsOCE02Z
         ACQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715224; x=1771320024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljmK7rOu6WZboSs6rbQYdN20qWF3HgHYq5GskzDfkjE=;
        b=JS6YchrG65NKX4JpWbnCwwlGpstiV63UW/tEUzHfw75TTTkzANa2Y19gRn4NLB5Jwr
         Ochi5uQMI3a9SQw2oIl3JM2NzuFXwW9LbluEXgTc04LvNMCPEApW7YCOtBpFZ63I4dJO
         CUz3dqWWWhmcXoacxb+QW4nTVwn5a8RKLnNMdIn3Ny34FAp+GLuKTnNP7LOmWJa6gA8y
         /xKdTCyS89al4d0DbgCI3Zpj2L2+IvF6YWtzUymKRKxVhIYeXDyntdDhXpUXTAArFy5R
         RGkiVVCnskN6jEniEU45pfF4jqQnRV+4BfwQzBLSywzZI8mKQyxq0W5VM4psNoW7KNi5
         d3gg==
X-Forwarded-Encrypted: i=1; AJvYcCVuNIQOWZyzz8hYab1wejZ+4bDr2ONR6IVBzedF7tSmKYHYEpFXAvB6jMICQLS2xJoxYR7GlyDf61yVmqTT@lists.linux.dev
X-Gm-Message-State: AOJu0YwLzklJunROHJP/S7ZVpWCzcX0Wyl3k6ZFrd5FGppL8FGIAKKT/
	01+aJUI62w7JkD9v6KzwqhwPoXkgRfMxUIKlaS4vMEulJMPAOT8TwRx+qoh3y0bCXw/x8qRmG5O
	3ALQqGGa5BXW/9IpkwVgTBwJXbClBAPU=
X-Gm-Gg: AZuq6aIC2L3dMWU56gN959bs89O9CbGM23+N59XApT/EvmWDTZlWXTkYNk8PoGS3Cmr
	i4MUulea8eFKOpCiLtSs6P9yI9BZexAR2zilP2DJ6JVaZmvXGRU5FzqZAfiQtshruC3T+wtDwGu
	+y3tdJs0wpMUBIUAFscKJxLT18S6Exwvc9eD3UITojdz91Rbs1Zb+8gsCISxC/VxDZS/lInnIQ9
	6bwlMvoIvNoqANxFFLxpEp6EBR7JkdFpOQRc46tTunZuQ187qZCE/w2EtPqb2qAa5adLbTx2y1Z
	a/Ewe9h9rONfIrw+Ek68n7DvQSdSbZ4X9fZMrJ+BAc+2GmajgJNbgAp/hIRS22aDbjoomS+E8mP
	Fw32WyGyi11LOIlygkGTFqgTI
X-Received: by 2002:a05:7300:fd03:b0:2b8:2eb6:fdb with SMTP id
 5a478bee46e88-2ba8cdb148emr186479eec.4.1770715224089; Tue, 10 Feb 2026
 01:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260209214246.2783990-2-joelagnelf@nvidia.com> <202602100751.ldfRitCJ-lkp@intel.com>
In-Reply-To: <202602100751.ldfRitCJ-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 10:20:11 +0100
X-Gm-Features: AZwV_QjrF8Zu1PtJ_a5TFxTmCkE5OZvy8zD84W1dv4Cg0yxAq-4UL8rMbDhszTk
Message-ID: <CANiq72nvRynLNe-E+CHyfS=rwK7qRfd7nNwHyffkgd1YGmmcng@mail.gmail.com>
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with C
 linked lists
To: kernel test robot <lkp@intel.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 7:52=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
>    Diff in tools/perf/tests/workloads/code_with_type.rs:10:
>
>     #[no_mangle]
>     pub extern "C" fn test_rs(count: u32) {
>    -    let mut b =3D  Buf { data1: 0, data2: String::from("data"), data3=
: 0};
>    +    let mut b =3D Buf {
>    +        data1: 0,
>    +        data2: String::from("data"),
>    +        data3: 0,
>    +    };

This part is an independent issue that sadly got into the latest
linux-next tag, so it can be ignored here:

  https://lore.kernel.org/lkml/CANiq72mW=3DhcvUGt=3DWENRiYVeVbb2bnYzizE00Eo=
-MW3b_MwRrg@mail.gmail.com/

Cheers,
Miguel
