Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6F3A8746
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557885; cv=none; b=c8WEhntl6Lmvr+2ykVGdmzIGlbXD49Qh1sn6Q2Xy7PiovD/WGXoaw0jLLb7/tJ02Wxl4JtXIUtzXDw8vKvrNqumyPc5mO1v1D+NpMOundp5PQjgCkf6eiKbLtV2NASzIWd6xfxDp7pQCOMfCj2Wwy8FYv4njRJvFRgFKhHiAD5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557885; c=relaxed/simple;
	bh=fse4/mw7XTsgfuHVVQjRFWJVGp1/Euz4A7xNtKxpkIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W/O7X22meUCGewwDUXeTh9q0twOkoteuBJzW5kc8CFgW0XA++kFqDmTS4zv2qpfU6TUycA6pc9x7AcqWK1IrU+mk9ZEbR7EBnsuz8DmtmbkZAPsUnDMChzNMH174deY/Per+BBpUKBkgL9M+1cAhWNvKZ03yLqba7gIO9JQOWjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVOsyp5y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVOsyp5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775557882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lD99YtIEAbiLQ1CDFnTyDVFUE3DC9IG6TDfPBqmULE=;
	b=MVOsyp5yugBaZFxy6UqnVhfKE+tbYrWQHLmrmSosEXcH9aReUk++hhAU0wLQaz0rzr+W//
	WnLwR3T/jSsHJJwxutrbofGPc8dGSM0PD1LkyS9oUYESaqKVdJQ4P2fx0HQCuUc+TEsVGP
	TeMrBxoqYFuu98SV+/wlyhaMTpmh2pA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-KHHppBGsNUyBIpmPnDKqbg-1; Tue, 07 Apr 2026 06:31:20 -0400
X-MC-Unique: KHHppBGsNUyBIpmPnDKqbg-1
X-Mimecast-MFC-AGG-ID: KHHppBGsNUyBIpmPnDKqbg_1775557880
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7900fc7033bso103613207b3.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Apr 2026 03:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557880; x=1776162680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lD99YtIEAbiLQ1CDFnTyDVFUE3DC9IG6TDfPBqmULE=;
        b=mkroxedSzXQPnYbUidogNoVwFpj6mG4kHqz+0U27jJHYoO+cR5AX46W2PWBKcabNlE
         M26k3qS2Jt6DxkMitNozGA67Zv6Q4mxIGcQ/5D4PWcN7MBIDP5U8IVIFV+OxbvTl1D+n
         NBb8E/h7wPqxFGpUZzy42+zHUUK0yYm1SKR6SGMDEbAnNROrCIRb9tDnU9pj4X8v/tKi
         oL7xk6qR6qVH9OMC5/YgwtCRmyoVpgIVZNdS8HvVfr3EZ9N1mexxC10f8IIfN2NIyPmT
         eXcuyMLuJ4ASYqDsqUoCAl1esordpvILYmU1bpmsImfJzOY6Pu/VjwbdwW8d8CpSuTPg
         PEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXE0utItgHgg3KJhNR447fpA9kK+N9OuVBIurdkmDYdmD/9pXm22bQ2PxoDnB9fsCYJYxYn83JJcuN9GnNa@lists.linux.dev
X-Gm-Message-State: AOJu0YzUQC8nRlUPWZK/fPq+aqo32fzBFk0zB7PBbUVWld+3WavKmiSu
	DB9EVRub3c8gT/0PJFr8H72o6bP8HqbrnUyBVNjopLL04RtXiuPeBo+II3TU4asptYNc+puHcjZ
	HVT9Je01Q0EwLeDYrhqDW3YCUAak6ehPZLXAB4l6sLG8uNoDiVoVLX0TFiFcZo37rcRmk3Axvwx
	6Pfjnd1JWe7EvyAmGaVoQpMI5Ggxh0QWIuMzLl4pZGEA==
X-Gm-Gg: AeBDievOAiNIi/RTDch2+7DTDsh+8BePax9pKJzzk+fkMGrr8+Bsfbcws4PkwkPlXIO
	MmtMQMXdcwmg2ZeXXGrGj2YA2qb7fj8gPHM3MbpZqzlRM4WedACey6BXPfvSNQzHN79BE+YznSn
	fY0YIgmFjS/wha7GMMfpGyhp3DKasNspRSl7B9iATLDdTmzEtywM4Hrqc1oDUVGyd1VFuBuoyXW
	kEhO44iN6GaKxjklGovB1I25y/og4mKf4LIvLCwCX/1WtMyO7zszj4BceswR9qg5A==
X-Received: by 2002:a05:690c:6e85:b0:79f:2e53:85f8 with SMTP id 00721157ae682-7a3bb91637cmr145977537b3.3.1775557880345;
        Tue, 07 Apr 2026 03:31:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:79f:2e53:85f8 with SMTP id
 00721157ae682-7a3bb91637cmr145977377b3.3.1775557879897; Tue, 07 Apr 2026
 03:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604071139.HNJiCaAi-lkp@intel.com>
In-Reply-To: <202604071139.HNJiCaAi-lkp@intel.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 7 Apr 2026 12:31:08 +0200
X-Gm-Features: AQROBzAHSmuavjKTfJb18h0s-6xEF8CD_wSRMBk7UvJQqkGtY5MxkpNgeKukvoI
Message-ID: <CAHc6FU4OnGCUYjcdPB-d84wn074TTgPbt35e63s+WvnbDXcanQ@mail.gmail.com>
Subject: Re: [gfs2:for-next 13/17] fs/gfs2/log.c:1183 __gfs2_log_flush()
 error: we previously assumed 'sdp->sd_jdesc' could be null (see line 1136)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	gfs2@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GZED8UVdvwem5J17muS-bO37TjTaqMuQADBoxTNxFUg_1775557880
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 7, 2026 at 11:16=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.g=
it for-next
> head:   80d71795c17ec98352d1059af856ac084a06109a
> commit: 47af62bd5b63da799ea51f53ff93b5f1a3d19046 [13/17] gfs2: add some m=
issing log locking
> config: csky-randconfig-r071-20260406 (https://download.01.org/0day-ci/ar=
chive/20260407/202604071139.HNJiCaAi-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> smatch: v0.5.0-9004-gb810ac53

this isn't related to commit "gfs2: add some missing log locking";
it's a pre-existing bug. I've pushed a fix to for-next.

Thanks,
Andreas

