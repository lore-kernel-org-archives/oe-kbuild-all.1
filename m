Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7008B37D12E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424652; cv=pass; b=kA60W6KRMVjw5yQUKWR6+CGg9jaT6zuP//WvspUt83rbpunLbmgUvtlovt7Ni5bK34rBn1JGE4iZjIjR16y91Z0hEA1iTK12xn57QYxNDw/q1JHy/Vm2gFvhOTbS4jNRZDmelXWuMIxHvUZcbweTq4HC5YreXMhezhCuiJdQO3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424652; c=relaxed/simple;
	bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geZkqFIc4I4T9jcbVBMIJpEpg2D33SIf2RW4LlsuaadNgqdnncJ26P9EEQz5orarzw5awAyAZyeVxRLrVwPedkLGWPn5VCtoVcFbehlXIkNiljpmII9ZIijcvGAoNrs5NgApiPmnLT+hV60VtDGhjNyk0Zpq4ejXobjv6E8MtzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZt14qAn; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZt14qAn"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7dbcb505578so35418407b3.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Jul 2026 04:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783424650; cv=none;
        d=google.com; s=arc-20260327;
        b=l89bzBRI7C9Fs+Rdwd8lLNcwsBFBq5Uo1Q+egMWlb0Rx1ifuKcQmF5NK0Dw/07hEzu
         y+mSmcNki/7REZehAUGGX8JnaLT8dAg1Z8w2PHXZTS2oJm9/MeYeZ7nUbqDnJE2OwNxi
         p+JWxAlw1QtlXrV+k5pkC9VKhN6GKj5DhRP98ZMOiSupPpeFNFwUfHAha8vXvlViwqLf
         ok36wA83okye/PgoSm2rYgKbIpp08T1S8M1drPADL2iGSZnS639+vTeDQT7inoRhEqNj
         7qwqkp/ePuTp1g9gcxf/YFGjWDAh3vC2D2cO0jco+Cp/SNuPbqjU8n9gym9ZQ3gG/eBe
         0DyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
        fh=Gc5aODKx7OWJKG1z9QciE0//S9VTp0DmGXO7HklMpoo=;
        b=VR6AyLUVAFD9QKxmiCboddfiDxo9s16dtWzEOydDqVxMX5mIihIqmRxwjT2GJOx78L
         TOlVsHJ34FYkt+Cz7giE9N8YHu3PW4IQ79B6KCUtqvRXTkWLXGO+PkzYwWHxJuMCcdHF
         QYtyZyukriIOLeWrXoq6rLSIITRL1YTdqHXXGrlSvYYHJA9Ofbxd5OMHSUKSKiDm4pU7
         71gqzW52kAsonDXKjwQnsdb73n+Dys1i3ER3QG7LnuvMdvhOh+C3pl8ZtwOW21MnYv1R
         SVI8z/3WZ6X05ZmOG63+0WL7i+o6Pxx71xpL2gAqIvYa7FsmR+6qkFYyRmIJbiPMHkX/
         FwEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783424650; x=1784029450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
        b=VZt14qAnjTH/rG1xtpu7haVLOErUg3n4Nufo37Tq4rd4tlsCxbwMqH6COUfpe3JBYp
         gcX/fBy3nwLz5RoWMq7EPdiSVZD80abNl1jXtZ0bM1ovEKp+U1kT9NZQD8sbtAJKoWeE
         l3MVvpDBJ1g4wu7vnGCZdIf+/Zf15TjfcIbWnsBQe0J0OKpbBA6+nrSUN4ogyVOeUeuN
         Z7gMwdlkhNpLITXA/GejPoN6l3aRDGhJIWM6XcPVzkJsCVTz+V5zlwu7WEsekI3+MwCJ
         JL/pIm7s6SilRLMusq7im5SxPGlX20EPuHmM8EuI5A7EA1tj7Dgj0l9OXpAyVTx5GGOc
         RsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424650; x=1784029450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67hEAJ0W8TbXP17az7LLoVoZORX8tOcszaeupEwlAiY=;
        b=gZNlyHri/LIHbJcOskojqhRAohyrA1OZ+iOn+6NDyOzfJcRdC7NpXZ/xSE1m033dKA
         9J8jewhtITbrbvvmVOweb6OYEFbcnHxf6lcKz0+RNujTBYIy6CkzvOX6EuF+UzHKnZXz
         Qk1HGKr6NgMNbOycPidN2fil7IlToy9iZuk9CO9TCeJl3U6B5+Es/qeNg1bRcoYPB1TY
         lgOPS7ac4tcksuW3dGreXGL9oO9kGsBD4gt4XMNSHXrV7E3L6frhPTqTSQHryAB9BlLG
         13iLIdS6Kh1pXRynSK0NqSKMiLwZrTO/9bUmwTR/1+a8anOyQbu7BKQC1PZhWgcOTjLh
         52Cg==
X-Forwarded-Encrypted: i=1; AHgh+RrI6/JoZTngzaHoS4o/wXwUrCqaawYc6wpmHZMzoLhXszCWy3im/YQoeFCUbhxAll9lzTLGFjvbr/iHd9Gu@lists.linux.dev
X-Gm-Message-State: AOJu0YxPEwwpj1yuqGCSUjhDp9kJHjYZFutmoI6NIDu1EnW+AmPkAMhz
	yqTUbZ7lBXnutEqhbNoX7lVrXlJEc0WK4IigP2ncZD+SK0GFqRl4psMDMqAco5FvaMKvd2iyono
	abj/QT8O76n9Anv9AZ7uOx65M4otlfsA=
X-Gm-Gg: AfdE7cmdLIi2v7B9sctGhAauv7UUc2g1F4admd5DmgqpHrqi7/1sgjkiUFkb9vy+fkY
	dzxb8BtR4syW9PcJHG3PMvLP+aTs8+CSFxA0xapL6Ekbk0AOjyG0k++jtORVPhwGR4mkBr0ECho
	m3V4RTx1M280JwssRbG6ZraqccBMyEZiBtvHAGwvKGY3UZeq7aCtTJCgO/1ooJFI9FzJwbsIk4i
	oJXMc2Os9MBVNkr1rW0I48i9rO/6YAoDhUA9iCC/UbFVRCPCWBqEcxwR5bmsjiEZpbymjhwCgba
	NremXabOH+0/3jqoMuuACLj9mGIlAlKYeNVjIprsfrKWfB46EakN0Zp6xw==
X-Received: by 2002:a05:690c:47c4:b0:81c:bd45:478a with SMTP id
 00721157ae682-81cbd455201mr8632077b3.41.1783424650492; Tue, 07 Jul 2026
 04:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704084133.122053-1-christian.koenig@amd.com> <c575453f-d798-4745-b67d-4476825dfa64@amd.com>
In-Reply-To: <c575453f-d798-4745-b67d-4476825dfa64@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 7 Jul 2026 21:43:58 +1000
X-Gm-Features: AVVi8Ce7O0KwC_YSOIzySDPamgDjtTYnQvuH_iwtOUZsxhnymDAqU3HCRhQKPB8
Message-ID: <CAPM=9tz38o_p--FGjgkcDCV43jwmbx_zYDyc8fyHKBteiHDRrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_exec: avoid indirect goto
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: mikhail.v.gavrilov@gmail.com, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, peterz@infradead.org, jpoimboe@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Jul 2026 at 19:11, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Adding a few more people to comment and review.
>
> Thanks Mike for the pointers, going to add them to the patch before pushi=
ng it to drm-misc-fixes.
>
> @Thomas, Maxime, Simona, Dave can anybody give me an rb or comment?

I don't like it, but I also don't think the thing it replaces was
spectacular, so until we can figure out a nicer way let's go with it,

Like I was wondering if putting the label in a macro would make it
more explainable, but I don't think it would help much.

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
