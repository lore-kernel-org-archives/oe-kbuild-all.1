Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563220E00F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739364426; cv=none; b=ObuYeYDv/5oCm+oPE1oZLTyG3wZTD7FvZq0lKT6wYjkXmAu0z3oM7YFfabH6XLR0MiTEkqXK6OxDIUQ//vSN5vwYq8cCAHaEva4aTxcz3uWOnIN0poifg+/Miw27vGwHOCSh9UREVNDV/ozIuf+NtA/92YZAXWJ70sCez1F7Xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739364426; c=relaxed/simple;
	bh=tY5gwz0K1pH9LPERb3scr9O6bcGKY6gXL50Bkc8UiRQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cs4Q7SdWKidilHr7thOlYW3U0zBRsqsj6FBqolU1tW3/3qxuqZIWz68pLrbHi34iuHj/xZQL4loY/y81JVQIGZYnD5znTMDw+kSTiK3NFKuqKjozDSWTOB1uBCIH1lmYrxvgnUyHhgt9I9HvD+UqZXQaa4b4TM9OTfDStzLPvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcG3I0aW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcG3I0aW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1254484666b.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 04:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739364423; x=1739969223; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tY5gwz0K1pH9LPERb3scr9O6bcGKY6gXL50Bkc8UiRQ=;
        b=GcG3I0aWWpYfhSdnxNl9bIkrNTXwXd1nIumNpfNdpNcmWM1U7tZfk88MMnTGh7uI9r
         XOm7CVBfvHyp9GObcR52ln8Y6UFtOGt/4nRp4FwH2cmtTC0VOZFynJN+FQvCP3ejrK6n
         QmZumTqNz6gxkOmVxIsYQmImZzha2yOR3IZnMP8koTk8O6xApYDcoXqBDV/RkIk6uFhi
         ZuEbSUcHO+bsPq9yBVeIFl9wjIUbmQPhsf6BaLabE41XjPonMyaQi9TLOffFVXHhdatH
         W1JRPrO2wSvwaDjwvlBB8CFO0CPOI7QNO0A0BXZqp5CWv/51VqE3f6/xInIr0fQyiBi1
         tcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364423; x=1739969223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:reply-to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tY5gwz0K1pH9LPERb3scr9O6bcGKY6gXL50Bkc8UiRQ=;
        b=Cz0MHWYxpgABIPHptJSVxmkbi0N79lJazleTST7j9xnIMP1LA/jV0vYyUrJCJtFBln
         tfpYjTbbqs9kqXfeBifjR4MBh8+iGzxZfJSBsiV/71Nzp+P9LXr21avoFaHxAI9OtO4q
         hOn41f8XUJuojQ9i/BCPMrPc8oPwK9QG5RT32DmW6vSjKZWDxPuHGnfZDLAxmoW32BOm
         7/3TtvFX45aA2Zyj5dtmLmZnYe9IW1FFjjlZqxGvvFoecLGD3OIMLMsgvAVSAqX7Ld0y
         cYVF6Zss8Kk8l4bs1urEU6AhIh3Z2OVfGxz3Ks7cYlkrwy5whj35OjFlzzfLvb1qLLjP
         RlSQ==
X-Gm-Message-State: AOJu0YzzUeqXpPqkO13GcBVWM+dpJwBtB4nCaibAfi6gxuwRZjAlemmM
	OHh2pdxuHld0YP4r/X4fexxYqsv+rQfLxE++70ufjh+r2zHu1VCM
X-Gm-Gg: ASbGnct3Ypk2KuZSCgKmOOJixM7CTLYSY/wKCuqXzpfqR8mKBZcg0CpDrrSQpJ5iKn4
	wo4OEJqoq7TaOB8NaMvYyxjE6NNK9tu3J42Kia0I3gGOrsF3pL415HkvT8y3TwwLNpN3/k43Viu
	oAeKuCXoxLkAKmezcKK4fX+RaJvh/F8I7Gsk1YZP5CxZnizousEcm+werrkufI+cbDBplzQDEGG
	2647dxq5vHgNxhwBU2khlbwEcl/bzK/cMPc7wiWpYpqNMOQSNN8d99/Fb4N39CWf3laGt5bQRAs
	VJr7pvBJiYKM/fftNBTGprjdDiIgSMFw7N4I5WOvA1FDNA==
X-Google-Smtp-Source: AGHT+IEfERvoHB4iH1mmp4qy1uXP3e8Z6S8KEgHPkgkozaQ5CERnYM7uDu5mG84oDMZpogQPQ7Cmag==
X-Received: by 2002:a17:907:2d12:b0:ab7:a39:db4 with SMTP id a640c23a62f3a-ab7f34ac985mr255168666b.57.1739364422581;
        Wed, 12 Feb 2025 04:47:02 -0800 (PST)
Received: from abityuts-desk1.ger.corp.intel.com ([134.191.196.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de6e5880b6sm6685818a12.37.2025.02.12.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 04:47:02 -0800 (PST)
Message-ID: <b7ed8d0b07e82a637bfc8a3f4d592f0f15ba9688.camel@gmail.com>
Subject: Re: [PATCH v3] intel_idle: introduce 'no_native' module parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: David Arcari <darcari@redhat.com>, kernel test robot <lkp@intel.com>, 
	linux-pm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Jacob
 Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>, Prarit
 Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 12 Feb 2025 14:46:58 +0200
In-Reply-To: <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
References: <20250211132741.99944-1-darcari@redhat.com>
	 <202502121732.P7lZkbhm-lkp@intel.com>
	 <21e66060c13c6a3cc33592f71cb08975711a6adb.camel@gmail.com>
	 <9416ee48-a68a-465e-85be-89d5a53afcd8@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-02-12 at 07:41 -0500, David Arcari wrote:
> - #ifdef the code that doesn't compile
> - default no_acpi=3Dtrue in the !CONFIG_ACPI_PROCESSOR_CSTATE case
>=20
> I sort of like the second option better, but I worry about the=20
> documentation.=C2=A0 Specifically:
>=20
> "In the case that ACPI is not configured these flags have no impact
> +on functionality."
>=20
> I guess that is still true.
>=20
> Perhaps there is a better option.=C2=A0 What do you think?

I've not been involved into kernel that much for long time. In old days
sprinkling #ifdefs around was an anti-pattern. Most probably nowadays too. =
So
the second option sounds better to me.

Artem.
