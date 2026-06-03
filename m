Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E661D38B7A1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520201; cv=none; b=FKoiNmEJBpEPXMo41gV80T3Z6PRA6A78jkLqvmduTk1JVt6ZRc5cX9i4hTloGuLUVVR7/KSPjLxV3fgJS9z4RnZwRj2OZk7VGnkLu0ya9JsM+4o9kLzECumAeUjIdhZx/sq5iUxxCUpr7SHhkKCPtSrP6/7uYQHFR25xe1uFXiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520201; c=relaxed/simple;
	bh=tgyYRh8fYgVxXQ0epzfpU/masWipDS77ialkU/H0Dv4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xs7sK1xwxXHu0vwXA3ZqiPO+zXgcU/d+qoF/KCVFmgKPPAp68p5Y7KAX4eajAWUxba3e+Wx1GyvQMGFm+7vQrq/w8R5QrI5YS6fX3bsqyEMCLcU8u84I+oCxe8f0hphJCpAWdREYLdklzr2hCwzgsbJfSfvkTnBDIJQk0ijSYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ImlQckbJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ImlQckbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780520198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tgyYRh8fYgVxXQ0epzfpU/masWipDS77ialkU/H0Dv4=;
	b=ImlQckbJNwmPOHRrZrlKQZOa9TKxQGehSfWyyMgG/bwppV0QgoXZTRqyWTUQpCNOq4O3bi
	wwsLF8Ty63a2EVHI1FtxkKmi0zEovMonRbEbWvTYFLF+yq2i5BLxDLYeGMxsu/CQZxWGEe
	tZn1JK8vZx4Y7UEhNxwLNkWNJLAMYCE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-qaaNY3EsPfGLHNBYTMs-wQ-1; Wed, 03 Jun 2026 16:56:36 -0400
X-MC-Unique: qaaNY3EsPfGLHNBYTMs-wQ-1
X-Mimecast-MFC-AGG-ID: qaaNY3EsPfGLHNBYTMs-wQ_1780520196
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd77414afso91470966d6.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 03 Jun 2026 13:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780520196; x=1781124996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tgyYRh8fYgVxXQ0epzfpU/masWipDS77ialkU/H0Dv4=;
        b=m3CAHuQu2rj3Q8fH6fvYXh5YHzWIZJgAQOt1b6BZurtBaw3EqgGWXDHs0tPxwg+6FO
         THghvFjmy03Lu67V3dteiMRGa2vIZpmI/IxI2AGIgp/vnNQQBKgRNkd3ZXjX7vXU+LF3
         zbAI8OJl08UADO0RCZiF5vJM0Erp/VAfwG4NadFon5VU2MdEnlMaIxM6hKJm8t0VvpBi
         TfDfdydZtBMUDYKv3XU7GQ1y/hExDm2UThAi+X3FvJWr1cIsqbdf0PAx1f9jdcE20kd7
         BZ0UjEOrCj1u6xpgIkOdym5vtMQ409TKjzA2Pcxc3oeSxFCCkttl8pclfIqVgjVfXrvq
         3BmA==
X-Gm-Message-State: AOJu0YxosKOQHRunm21Q+1GDchlZoYM8irq8t1VzB7pSkgXGIB56/L22
	rl6HH7nhctODw7zK/h+kaR4lQhzBCIhahs0qU6i5CjYawe2LRP6MRGI2u9cBtXrgwY6mK6B4t/T
	bX6Jt9VKkQLy/l3FK9BupkS/Gh66gGxHhzUay/9rA08GWNu4wtHikd2TXxHH+Uf6F/fY=
X-Gm-Gg: Acq92OHtG08yp6SlyVsAzPfV6eTKdm6fIIhICuQKBJI/AXnh7IXmn0W+Qk8rYjlEk+e
	HYqsYalyAYABXHXz7OUXn4YQ3xejN+LpglIp0KQdZ3btD9CpFlLK5YHDXv2bmh7b5QF6N/HoBXP
	3neFvDDi/XM86Phs7F7nyydbJP/AxBbmRUGDf93gXMTeRimbYYFdpGnwlOXYoPWGEWzKMPWbdFc
	POIUMejai0hQ8jMUR2qgcFfe8wI39fR786/Dl2T+DejBzuSFIfmMyNxXgzaqRKKrYL8u+yGCy7V
	2W4+BprNhOB7Ph3XWCVzdddILGdODmsqatz/WSr6JtoJJLx+RL6kjwWojOSDiKNffMri/O+4hOV
	FOUKUyrA5y+r/Oi/K+O0UT4c2jGiK
X-Received: by 2002:a05:6214:4348:b0:8cc:e158:fd98 with SMTP id 6a1803df08f44-8cecdc247eamr78802566d6.12.1780520196076;
        Wed, 03 Jun 2026 13:56:36 -0700 (PDT)
X-Received: by 2002:a05:6214:4348:b0:8cc:e158:fd98 with SMTP id 6a1803df08f44-8cecdc247eamr78802076d6.12.1780520195558;
        Wed, 03 Jun 2026 13:56:35 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm31238926d6.28.2026.06.03.13.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 13:56:34 -0700 (PDT)
Message-ID: <72d886c09a54b7263967c212cccd43d4b52a9461.camel@redhat.com>
Subject: Re: [dakr:drm-lifetime 1312/1329] Warning:
 drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for
 __drm_gem_shmem_release_sgt_locked(). Prototype was for
 __drm_gem_shmem_free_sgt_locked() instead
From: lyude@redhat.com
To: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:56:34 -0400
In-Reply-To: <202606040434.JoDqxPvu-lkp@intel.com>
References: <202606040434.JoDqxPvu-lkp@intel.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MqgVJ6PN1XgR_jPjRVraKITzaFs92tgaAhN8bObSzpM_1780520196
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



I am extremely puzzled at this, I have been running all of my compile
tests with WERROR=3D1, including one I ran about 30 minutes ago on some
patches against drm-rust-next and haven't seen this.

I can send a patch out for this immediately, but I'm not sure which
branch I should be applying it against since it looks like this has
made its way into dakr's branch.

On Thu, 2026-06-04 at 04:29 +0800, kernel test robot wrote:
> tree:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git=C2=A0drm-
> lifetime
> head:=C2=A0=C2=A0 305b04e26f0cdff2c8c0db208dbec0d9c9984a48
> commit: b78dab829760aee9b83f5cf15550a0fe36c6f4b0 [1312/1329]
> drm/gem/shmem: Introduce __drm_gem_shmem_free_sgt_locked()
> config: powerpc64-randconfig-r071-20260603
> (https://download.01.org/0day-ci/archive/20260604/202606040434.JoDqxP
> vu-lkp@intel.com/config)
> compiler: clang version 23.0.0git
> (https://github.com/llvm/llvm-project=C2=A0e5ab4f8a1f766febdc65ce89c00dec=
8
> 5393cfd68)
> smatch: v0.5.0-9185-gbcc58b9c
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-ci/archive/20260604/202606040434.JoDqxP
> vu-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202606040434.JoDqxPvu-lkp@intel.c=
om/
>=20
> All warnings (new ones prefixed by >>):
>=20
> > > Warning: drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting
> > > prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was
> > > for __drm_gem_shmem_free_sgt_locked() instead
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

