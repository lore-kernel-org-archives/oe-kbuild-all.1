Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2C17F6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 04:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728189357; cv=none; b=pgoQd2A1MDrRh2rYFqHYUBzHH3oA2lMRIor4gmIfW1cdUpryKn/dmB2qdTUGBf9ZFhJHOOlJ78TiVP0FvqAVVQqwvmZC4KjkIZmw6sckRXdrnan9EQO61y5LxOwdK00zypUOtgvpvg2c2++XZyNSm8HlRlsnOt9SNwAcJZkz8Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728189357; c=relaxed/simple;
	bh=S6ZASsw1UbkwNCy/qT2cst33QvKpaMRTJ+1FEJnQDeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pe5qx3DWs5/Y1daRlG1u1vx0jH9Vy/LvlH5QW2KO5EarMgfUVR2mkcGOTkXEpAuQmXEa0Ct7MamD26NjrKVdSdM4Ihqz3WoPDB+517DBZY/TjROrrn3ke4rRj9+pAcetZmcWCNS4sv+oOMjYeJRWVbgDOBxhGRlh7tvaKMBMq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=Q2i/vHB0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Q2i/vHB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEFDC4CED3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 04:35:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Q2i/vHB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1728189354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S6ZASsw1UbkwNCy/qT2cst33QvKpaMRTJ+1FEJnQDeE=;
	b=Q2i/vHB0rHXvc8Y8akcBMoHY90zuud2F2YVmcSRV15k5TGl9Y7eeIqQ5IT2oFJ8RkLsXcs
	Cwc3ZQCsoV/kAOf/9Ew0WjVTi3KLAtY/QI3sK58Vl+rw6GM3jWoAx6okM9QQrgXNOdlC1q
	gqbSKZ/tRAcxjNBxbaec+JHsAjxCNuE=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7172d18e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <oe-kbuild-all@lists.linux.dev>;
	Sun, 6 Oct 2024 04:35:53 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2689e7a941fso1769883fac.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 05 Oct 2024 21:35:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfmrgCuJOJuzcrlJacse+aoj8JgWwjuJ126vIQud4Aq++0n0vKhN3R/GLJ+Z/+bbLeQNczHdBvEUMsViWq@lists.linux.dev
X-Gm-Message-State: AOJu0YyJhVxzQwBy55xaJwQxaL9kUDrUbwdbyLrxCtUDoyjj4bpB90Yi
	YqafBqaF8KqJEjv3og2gvLljWA44Cm2H8lzxB7T2WdKIa7GOg+WMONNsoub304HR3M6Qw6aQxlQ
	pbzfSRsrahaNRvXBwVY29vkkvZ44=
X-Google-Smtp-Source: AGHT+IHmmlNVfDVgKfoHgHGXP4e4P1j3dDWAH6HdIBvDuclwvTe95zu1Nuzoefn4l/yJV2kG5vGvqWoH5E0rgIXaeRU=
X-Received: by 2002:a05:6870:2191:b0:277:eea4:a436 with SMTP id
 586e51a60fabf-287c1d3f145mr5983709fac.7.1728189351962; Sat, 05 Oct 2024
 21:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241003031307.2236454-4-Jason@zx2c4.com> <ZwIFjL7yb+7JpTS2@rli9-mobl>
In-Reply-To: <ZwIFjL7yb+7JpTS2@rli9-mobl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Oct 2024 06:35:39 +0200
X-Gmail-Original-Message-ID: <CAHmME9qEp8Emg88wWR_oOT39hSaooLDd2L5YPetFrH3O-CgkBQ@mail.gmail.com>
Message-ID: <CAHmME9qEp8Emg88wWR_oOT39hSaooLDd2L5YPetFrH3O-CgkBQ@mail.gmail.com>
Subject: Re: [PATCH kselftest 3/3] selftests: vDSO: improve getrandom and
 chacha error messages
To: kernel test robot <lkp@intel.com>
Cc: skhan@linuxfoundation.org, greg@kroah.com, linux-kselftest@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I'll send a v2.
