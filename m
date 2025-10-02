Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE50126F0A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759445436; cv=none; b=Yci/b8VNN1fXXiiv9G4SSzciTkHlgbkj5iS+l6cgMMwW4ylhffvFYX8Po87qQMLC0Hz42cM6/h1pQbKPKqXzF4su/Oayld/nnv3MrIdUXRJsTTH3UfU73RFrTjK9xwQ81suhaDhrUHPVBW9MZCjt9cJfj4czA17Oby0TlN9pSxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759445436; c=relaxed/simple;
	bh=BCUh+3y9oWcGOLJYRgcUnoLdgWctAgE5Oi5walHuFOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RH5KPTKbGAzu0hLOgwsAn8Xem61YEXW/cAjkge0fjFk21/SyMyGuS8hEiG/tjcKSUt7NemM+ZLQzLdiiL73IBKtRqchggpA7SfsSRbbdJb2mq4md0Xg27nOLOoS+DykKYEaUVyE8GwUmrBSNdo+2bSVXHgfmsG5jtnShRRI8Bm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjlidrOE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjlidrOE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27ec3db6131so2345815ad.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Oct 2025 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759445434; x=1760050234; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCUh+3y9oWcGOLJYRgcUnoLdgWctAgE5Oi5walHuFOo=;
        b=CjlidrOEKjwlW8JEhjk5KG10w8QcoYGSKe4Q5m3JHRiNZ/9HN6V95F1LpoFAbJf/mU
         oNEmjG3CF9BwmFBGNkR+jFD8FXcI0dfDHrYFktbTCsGZSuiValAOutLEzxZE30LSHlBx
         W9k4V0yXPeiPmO2bmCZ4jHLtyDYCC32++7eSZja4VY7allvYoxdK+Qbysto2Lgt6Md9F
         MC3TMZ+f9NRiQb0NtpIcqT5yxRbJ8/MH3bFLsNjpQkSv18SUlGJWPgzjdTHAP96XDK6P
         AHYM43LIGT6+Wgc6+mC/bqJR2L1vyfEETVkPIoffEWUlWLq4f0RyEi12RSx2VpoeZ9pw
         6VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759445434; x=1760050234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCUh+3y9oWcGOLJYRgcUnoLdgWctAgE5Oi5walHuFOo=;
        b=ts+cszFGstDDxtoPdP4sGz4C5JOEo0DVta5n8WSyuzRVKWJYMKjQ03/IvAhpb3b4La
         iorO5RrrUhkeZpa+6BGJ3kdi7uvUrhu9w4/EjrUCOHLSeNDUnGIXx8/uVki9uDauuxrY
         jyEfwKBI+Fs1ZY1GjVZmtV69M6KiQd5VU6cVCHlEb1UdLLc7VhFFkWC6Nvag9bpz1Uel
         jojT/t3AmxmH3sZ1AQgJjUfl/VuI35tmh6ZjFNW8RTwQkC4ZHyB6l1UI06dykkutBekr
         5WhwEmkb2y3TldJf9PxHvM/oz2PPO7Gu1OOnCMxMhppU1spt6aV+A2N+Cnq/HkLJd1m5
         eoEw==
X-Forwarded-Encrypted: i=1; AJvYcCUsTy0MQM/Ohnpp/scQiBPZNd0NGsUXDib2iEKdSI+2YjBDt+NALksPJakGiEWUjwmMNLwnDV0rActH3hcB@lists.linux.dev
X-Gm-Message-State: AOJu0YxKOLASSP4OgzfUDtMp3c8BCEcZ2IINaXYLWsI3e8NCCbE3L5n0
	Osr7AiH375+zVF2CvHpe5IMbxtXL9fUtTYdlzaj16WdS9DgPhb1+LVS8KJLJVUIqY9iEhFRSh4N
	nsmR3f8TCylHfGALzmuvdfmpfe4HmilY=
X-Gm-Gg: ASbGnctJ80u3TpDCk55lzjKXLjx5hXuC99EHa+rbIwPqF3GS47Mbt9oG3O6oBVigRim
	q9iwBffrIhGrj5A/NFNXmrcdARNd0Vb7L8n8Puqyo8kldihg2qYxkhr8HHuZHG+HX/Nmtt2hi8F
	5bZ+o1moVHk0WgKAd0plOC1TbRbNCSrtgf6l4Gj4ezH7+R373LcSaTTN6nL8Y0T+edKCPKmPjbV
	7D7A6zkencYpXMjPUp/bt5KfIjioVBx+24MUC2Fzq5sIOVfhMxfry3MJ53YHRb7hUtbFTI365BC
	ZaS40FPUlt9lFhZC5J7etXKnbXNugkDc3V+DAtdM5/55Qkc6TQ==
X-Google-Smtp-Source: AGHT+IFV4Wfa8o9I+3qoUvKZUb+LJ0mJzlOW+f77CCPCebEjpFDzi/h/XE2fti4OE3uAE5/ckhQ5s/wz69kA9mqMIR8=
X-Received: by 2002:a17:903:234e:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-28e9a6de147mr5355555ad.7.1759445434467; Thu, 02 Oct 2025
 15:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com> <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:50:22 +0200
X-Gm-Features: AS18NWABBmYLu0f9tJYY4He7LPAqs167ZupYqHiSSMsWv0t6_x72VaAKmUard0M
Message-ID: <CANiq72=5eDXfq02FXUBpEpe5Ke9kxhT2CUQU5hsMkPMBL5QWbQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> It would be nice if someone were to test it!

I did...

(but on a different branch, by applying your diff, reproducing the
issue, and then my diff)

Cheers,
Miguel
