Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF4231A2A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575138; cv=none; b=fGVBXu/Iu34aCqC9tye5PI4LTdhW+LYyhb4O508UfGnigBVrkZ5qWG5OrH3GheFKRSFqB2I0J7jmu8WequeWU+FILklwaZgsCQ3WM84t0mNJTwLulcZ9hMpdI0ON7yTq+6DomOKH5X1nZJXR140jif3b2L/LWQUGp6q+yZ34cUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575138; c=relaxed/simple;
	bh=3NsDwcBbr2jcVYXYtmGA0Uo912W09NmkE06iL1oliOo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gf4rzBsbbhQChjuz6/TsITT1y11t1SGlFiAI8jiBwp/XTibDiMEO0jV/2WSLqZ1AJiZxKhL8eXVuBB+qMSUwrbdrVpsPGDyT3xmjOoTsEJUhzuWUc8fvOG6shMK12Io5uNs2zM15OA5rRL+XdCvmdSFDZ9HvCsomasdJvRaMQJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UYHog4mn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UYHog4mn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743575133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NsDwcBbr2jcVYXYtmGA0Uo912W09NmkE06iL1oliOo=;
	b=UYHog4mnJgVRNa3O2V+ovHtl997xbN8rXF2e6DqUhTzAXhSHw26LBj6RmJ9hiQ8MlvHsXa
	MZI2jnFQJjrpBsZFdJafcFu6kD+j6AV1MwjYA8tX+rssLONQtmx8SKk8MivxaEHL3ZhQDf
	Ih6fZWiu58c8W509f5LoDzp7av1sQxM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-09pjspZZP3aeMuv9xSWGBQ-1; Wed, 02 Apr 2025 02:25:32 -0400
X-MC-Unique: 09pjspZZP3aeMuv9xSWGBQ-1
X-Mimecast-MFC-AGG-ID: 09pjspZZP3aeMuv9xSWGBQ_1743575131
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so37003005e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Apr 2025 23:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575131; x=1744179931;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvV1YhVY5dvLsPQdy2Zi4rEWCEocbwVNJGT6HPwCUqY=;
        b=Z0n+djYrUCYQzLehJAn8lq2tOyf0eA4A74LkNV+3maa10AHTE/D5+isnXESgRyzWIs
         NYGrz2hC3yQEHXsXijDg6PLxgeRonLGdUWBBheLfZRHN39jD+NeW2Tb3Wz5qijz3l/QI
         DGbb9my1QAtp7xUcchYpJ1jnmEJMHb0MExzzgrN5bF7pL+LPvp48pICmcUjrU9oUICsK
         p6FzIeVqRC2L8a1+mb4H5TDdiMkNRv7lrrS3cjL3dpeY+bS9Xa2uVhB46vtWOqVUgDIp
         XOQsRJbfa542/cgGZqfdjkNbb1YeKVgjFyL5ULwWrac5O98vNx57FMmXzSowEZyuI4O/
         Huxw==
X-Forwarded-Encrypted: i=1; AJvYcCWe/dRXdYtWHYx8ymR/1KJFicFW8PdECYXdLJMP1HEvZURNRUnMYyoeSNFlVN0R+xrGyGNTbHPtK98eZUKs@lists.linux.dev
X-Gm-Message-State: AOJu0YzP9pbVTI7GC9N6OKcEbj069RTH4pfXzu9IGfQIvkUaPMYb3qYB
	sa4hNY9PB/dv8BB3CaGoijrbrlq5FhGnEpKrMHVokowpl6XiefFQgO+jh4cjdTwENBE4ckIEXzp
	xghQSEoMIV9UYZviLtmBNUjRfcB7ecEZtun9B94XfTmCcuhVbFGyySxjzGCDjRAk=
X-Gm-Gg: ASbGncsnjO89vc5bPYy0wuBygIBr85uWQeU/QNPyNa1nGWrn+hEwJzIpSXWxT1Dtm5b
	5YnuIwwCnB9rEi987NhT8LIXKyw5mwS0GIvDCkohqzy770Yulhdoe7lOb4G/Iu+f56fmRUF/8Wx
	F0zUMvtAHWYow5ulwZqZuzYm7aIhtPHs2Z8IEIauznJtz17Its6EmFk+nLmIfqgpMAO/eAn6CuB
	jo9FyaFytwWNXU5vMXd1xGSmTqdgV8p6KntN/lGIWNxTSz+DbJjC6qdZp7WPdf0lE2Ee3/Lm8qW
	8A2Jvy9fib/16Z7l2mSqJHN2lBlvUTaJmLlb4L/kuA==
X-Received: by 2002:a05:600c:1e21:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43eb5c70cc3mr10367355e9.26.1743575131360;
        Tue, 01 Apr 2025 23:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPAzxHdlEpnGzGgTqA+vZ1NUCwpIrUUVvSWK/I6PRmRH3CslgeHNanASjsRfkoY169xiAy8Q==
X-Received: by 2002:a05:600c:1e21:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43eb5c70cc3mr10367185e9.26.1743575130954;
        Tue, 01 Apr 2025 23:25:30 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e31csm16248786f8f.68.2025.04.01.23.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:25:30 -0700 (PDT)
Message-ID: <b728fb6ae53531e23ed068c5572b70041abb51dd.camel@redhat.com>
Subject: Re: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790 (fwd)
From: Gabriele Monaco <gmonaco@redhat.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Date: Wed, 02 Apr 2025 08:25:28 +0200
In-Reply-To: <alpine.DEB.2.22.394.2503302037080.23941@hadrien>
References: <alpine.DEB.2.22.394.2503302037080.23941@hadrien>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7YbepI0tt9U7KaeSrXTY4lVMUl-4bXZ6oSXI2QzbQZ0_1743575131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-03-30 at 20:37 +0200, Julia Lawall wrote:
> Please check on whether line 812 needs an unlock.
>=20

Hi,

thanks for reporting!
Indeed that needs an unlock, I missed it after moving some code around,
preparing the fix.

Gabriele


> julia
>=20
> ---------- Forwarded message ----------
> Date: Mon, 31 Mar 2025 02:25:17 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Gabriele Monaco <gmonaco@redhat.com>
> CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>=20
> tree:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=C2=A0m=
a
> ster
> head:=C2=A0=C2=A0 7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
> commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for
> nested monitors and include sched
> date:=C2=A0=C2=A0 6 days ago
> :::::: branch date: 17 hours ago
> :::::: commit date: 6 days ago
> config: loongarch-randconfig-r061-20250330
> (https://download.01.org/0day-ci/archive/20250331/202503310200.UBXGit
> B4-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > Closes:
> > https://lore.kernel.org/r/202503310200.UBXGitB4-lkp@intel.com/
>=20
> cocci warnings: (new ones prefixed by >>)
> > > kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790
>=20
> vim +812 kernel/trace/rv/rv.c
>=20
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 771
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 772=C2=A0 /**
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 773=C2=A0=C2=
=A0 *
> rv_register_monitor - register a rv monitor.
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 774=C2=A0=C2=
=A0 *
> @monitor:=C2=A0=C2=A0=C2=A0 The rv_monitor to be registered.
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 775=C2=A0=C2=A0 *
> @parent:=C2=A0=C2=A0=C2=A0=C2=A0 The parent of the monitor to be register=
ed, NULL if not
> nested.
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 776=C2=A0=C2=
=A0 *
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 777=C2=A0=C2=
=A0 *
> Returns 0 if successful, error otherwise.
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 778=C2=A0=C2=
=A0 */
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 779=C2=A0 int
> rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor
> *parent)
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 780=C2=A0 {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 781=C2=A0=C2=A0=09struct rv_monitor_def *r, *p =3D NULL;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 782=C2=A0=C2=
=A0=09int
> retval =3D 0;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 783
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 784=C2=A0=C2=
=A0=09if
> (strlen(monitor->name) >=3D MAX_RV_MONITOR_NAME_SIZE) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 785=C2=A0=C2=A0=09=09pr_info("Monitor %s has a name longer than %d\n", mo=
nitor->name,
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 786=C2=A0=C2=A0=09=09=09MAX_RV_MONITOR_NAME_SIZE);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 787=C2=A0=C2=A0=09=09return -EINVAL;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 788=C2=A0=C2=
=A0=09}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 789
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29
> @790=C2=A0=C2=A0=09mutex_lock(&rv_interface_lock);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 791
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 792=C2=A0=C2=A0=09list_for_each_entry(r, &rv_monitors_list, list) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 793=C2=A0=C2=A0=09=09if (strcmp(monitor->name, r->monitor->name) =3D=3D 0=
) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 794=C2=A0=C2=A0=09=09=09pr_info("Monitor %s is already registered\n", mon=
itor->name);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 795=C2=A0=C2=A0=09=09=09retval =3D -EEXIST;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 796=C2=A0=C2=A0=09=09=09goto out_unlock;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 797=C2=A0=C2=A0=09=09}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 798=C2=A0=C2=
=A0=09}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 799
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 800=C2=A0=C2=A0=09if
> (parent) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 801=C2=A0=C2=A0=09=09list_for_each_entry(r, &rv_monitors_list, list) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 802=C2=A0=C2=A0=09=09=09if (strcmp(parent->name, r->monitor->name) =3D=3D=
 0) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 803=C2=A0=C2=A0=09=09=09=09p =3D r;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 804=C2=A0=C2=A0=09=09=09=09break;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 805=C2=A0=C2=A0=09=09=09}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 806=C2=A0=C2=A0=09=09}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 807=C2=A0=C2=A0=09}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 808
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 809=C2=A0=C2=A0=09if
> (p && rv_is_nested_monitor(p)) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 810=C2=A0=C2=A0=09=09pr_info("Parent monitor %s is already nested, cannot=
 nest further\n",
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 811=C2=A0=C2=A0=09=09=09parent->name);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05
> @812=C2=A0=C2=A0=09=09return -EINVAL;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 813=C2=A0=C2=A0=09}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 814
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 815=C2=A0=C2=
=A0=09r =3D
> kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 816=C2=A0=C2=
=A0=09if
> (!r) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 817=C2=A0=C2=A0=09=09retval =3D -ENOMEM;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 818=C2=A0=C2=A0=09=09goto out_unlock;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 819=C2=A0=C2=
=A0=09}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 820
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 821=C2=A0=C2=
=A0=09r-
> >monitor =3D monitor;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 822=C2=A0=C2=A0=09r-
> >parent =3D parent;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 823
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 824=C2=A0=C2=A0=09retval =3D create_monitor_dir(r, p);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 825=C2=A0=C2=
=A0=09if
> (retval) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 826=C2=A0=C2=A0=09=09kfree(r);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 827=C2=A0=C2=A0=09=09goto out_unlock;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 828=C2=A0=C2=
=A0=09}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 829
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 830=C2=A0=C2=A0=09/*
> keep children close to the parent for easier visualisation */
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 831=C2=A0=C2=A0=09if
> (p)
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 832=C2=A0=C2=A0=09=09list_add(&r->list, &p->list);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 833=C2=A0=C2=A0=09else
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 834=C2=A0=C2=A0=09=09list_add_tail(&r->list, &rv_monitors_list);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 835
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 836=C2=A0
> out_unlock:
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 837=C2=A0=C2=A0=09mutex_unlock(&rv_interface_lock);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 838=C2=A0=C2=A0=09return retval;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 839=C2=A0 }
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 840
>=20

