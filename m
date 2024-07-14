Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A97F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720968599; cv=none; b=YcjZhNYFU9wPw3Xap3xFuVTojWZyjTvePGxcWvAYEScoZQVEf6SVPl6Tt6RHQ81PCKBKCu9yYZUVXjC3d1EDs0wzp5/wpaPgrHhllv+FbrCHEeez65kDmmCLE5BkvODBWrc+m0eRP+ajPGWSbPqqoHUlvpqimeGIL3x0sgz77Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720968599; c=relaxed/simple;
	bh=49EmKanopSgeEd3W/oTjnQhdxpb1mXogFyglqwxM8+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rfy2ss2vyl2BQ75LRBLoakeConk/S3COVIVnKdMBtwxBZ4p1vhtUVxkYJNeQiKtU5IUkvJ+EF4FsRT4pXCbXUrKovnjjh3YbSruHckKeWG5ZVU3ysJrmOjbRfPRradz8k9QEApuJoFYfZv4lqBbSkEnrlF3FxeTQF6fq5SNywPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bu91vzYG; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bu91vzYG"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df4d5d0b8d0so3349548276.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1720968597; x=1721573397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49EmKanopSgeEd3W/oTjnQhdxpb1mXogFyglqwxM8+Q=;
        b=bu91vzYGm0doMuNmZfaYGKmA+9kW9lnZ0IWPMp/rmOYTw/9jH3+h2dAZoJlj/CFDj9
         sWky8xU0V2O+y5U487/qctlznX++mG6qsn2POvaqzVRYCBa5KqhRig0068fuMWTqfzgb
         6StdVCRiKG+CeH65nFQfnsip12yYH8+RnUW5da9q254JyfHe/JZEf0Rq9cNvQzKRi+bZ
         6T4gK4VMJZoR81HiAePSBojPFQ44zZJb6IQWpVEsgnKiy+Ra/WZNcbnumI1o8L0ka6Vg
         +aiJuIQdtMJha4VgWZirX8TpzfU53tAD9Vr9qxcg23E+d4ArOXJOT2+e5kgYxeIOfcte
         yl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720968597; x=1721573397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49EmKanopSgeEd3W/oTjnQhdxpb1mXogFyglqwxM8+Q=;
        b=wu9yoa2if3734wp+09l7WdY5Sq662JQqz/yB9+Tn7UwmUxwXVlC1OJeDTTPibaKd/e
         JBRePhxiRorIRny7EQlv96PxwzJ/B0FxTVD6GpZI6558KwIJ0dhSopZpNflTblDKuFgj
         Xp6E3Lc/Bto5It7+Zm75/ZoSN155bEeNHMtCxGR2litu/zrPR62/h6WlTcsklvIF2nTb
         iIESS933ZcTaGBAFeU2w2yqkEhQpxHASjtI7BcejbLPEAvn+AYjOeFQ8p9FGGyGHsgZv
         PGj/RZJMjub7aXUj3V9j/DI23TsQVit28yFOZvsPvB4t5wtNgLjC5QSU+gKL20dIYB0b
         vdww==
X-Gm-Message-State: AOJu0Yw571WX0jAZV6FditxTwnRfEQq9vIa5mu44BEJlvdCPh0JHujm+
	TeVvdBMVT8FqHhqCeLr5/q5rNbOqi4aiybLH3m7YW+gsJNi7eDWyr6dPSFoA2x93WrBa8tZDVLu
	sHbX9Yor4aB+BJORMtN6JJXsyvIkd7Xb4abn9
X-Google-Smtp-Source: AGHT+IFFO0FzjtExtqCZVTUmnHJJ40kkDefJkRXsGzQwJHId1l7qsRru2rQyAdPIiNT2UeS3mcUWwRNjKu0c+p7Z53M=
X-Received: by 2002:a05:690c:3813:b0:618:ce0e:b915 with SMTP id
 00721157ae682-658ef24b386mr217441127b3.27.1720968596956; Sun, 14 Jul 2024
 07:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZpI3oi+XKDkqU0Nb@rli9-mobl> <190abe6a978.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
In-Reply-To: <190abe6a978.28a7.85c95baa4474aabc7814e68940a78392@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 14 Jul 2024 10:49:46 -0400
Message-ID: <CAHC9VhTpCB=gQ9y3o--eZw1k443heLxjHLLNYBS-JSXD9hXRZQ@mail.gmail.com>
Subject: Re: [linuxsecuritymodule:dev-staging 11/11] include/linux/lsm_hooks.h:
 linux/jump_label.h is included more than once.
To: kernel test robot <lkp@intel.com>, KP Singh <kpsingh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2024 at 7:44=E2=80=AFAM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Likely my mistake while resolving merge fuzz, I'll fix it when I'm in fro=
nt
> of a computer this weekend.

Fixed.

--=20
paul-moore.com
