Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8021A290
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 13:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHTWBXfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697721149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=barqOmA/SQxO6U0jPws3Gbb0YFu10fiYYunptNSgLxc=;
	b=IHTWBXfBVOsL+7ojiSOlR64r6PbLtDQmHs0UuPFrbFlwZibi42ax9n/AxYuqt0V1V5u6YC
	zB7cKEYcM0WbWUV+3Q5x7bBR796zzPQXJYwe3aBy3Wq/fwk7jcRkCnisaq+7svkj6AD7o9
	/nHq3Z9Ua24cMLI87kRSlxCKNdHkuLE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-3NH_YcSiPsmHmqp35pcu9A-1; Thu, 19 Oct 2023 09:12:28 -0400
X-MC-Unique: 3NH_YcSiPsmHmqp35pcu9A-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c9d7dc2b36so60750675ad.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 06:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721147; x=1698325947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=barqOmA/SQxO6U0jPws3Gbb0YFu10fiYYunptNSgLxc=;
        b=or3rioOwCwwJDxPMyGlsqdcie0sI5eM9taigGA/hjrD2JCO8z81oLSKVl+HQIC/D3c
         Y3m71V+WEj4dK3XS3FoTvTZIqtAKDDRYq3VzvY+NZdIDxC7aiaJc3vT7EcHvEBH32YRB
         kafZ9CajJIkefBnuZGCYKBaH35xpBlYqfFqOWzOJ76BmDE3Jeddicp70lf4BqNre4dnd
         bUqoT4G3VxxVpvz0YvyyXSI9ILSMAkh8g2bWvUBdh1KGk39zfkTCf0zJ1X6wmFMWmI96
         q1n7SKK+AIU1N9dwQ6mHhRZRalK92i9NQ0sRCQvuUBOPzeaecrLhukwQWuJlNO/geqfj
         2osg==
X-Gm-Message-State: AOJu0YzpFaQedexhkU9WUNdZMa3MOKT5Hkf+T4gbW3ROgbqEhniCJu1N
	wVYatOl+tOXB/I6L5EIK0qmxj8fQoJemOdfzxmPa6NXRt8gEc5DkwgnU3glShz68XSmbf0mwf48
	ikywv3OLLiBnJzY21c99dvBijHWoxmuo2CFy15THpRw==
X-Received: by 2002:a17:902:f312:b0:1ca:8b90:1cbd with SMTP id c18-20020a170902f31200b001ca8b901cbdmr2079989ple.0.1697721146987;
        Thu, 19 Oct 2023 06:12:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfcYxDrJRl9Hw2YCkxmlS9Ekn3Uum6GR8tBCcFh8z3W/F9rriGpLEWzwJ3lK2JvpHz9hBjrJfbbVgdpRoK3Yw=
X-Received: by 2002:a17:902:f312:b0:1ca:8b90:1cbd with SMTP id
 c18-20020a170902f31200b001ca8b901cbdmr2079972ple.0.1697721146674; Thu, 19 Oct
 2023 06:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a8791f89-ed7b-1649-3b53-72349899c5d@inria.fr>
In-Reply-To: <a8791f89-ed7b-1649-3b53-72349899c5d@inria.fr>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 19 Oct 2023 15:12:15 +0200
Message-ID: <CAHc6FU4+Wv1YZUDmU_oHaEe2bY7-uAzbKj6UMGem9kcw55qfaQ@mail.gmail.com>
Subject: Re: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
 flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
To: Julia Lawall <julia.lawall@inria.fr>
Cc: oe-kbuild-all@lists.linux.dev, gfs2 <gfs2@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 7:28=E2=80=AFAM Julia Lawall <julia.lawall@inria.fr=
> wrote:
> ---------- Forwarded message ----------
> Date: Thu, 19 Oct 2023 05:56:44 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
>     flexible-array member instead
>     (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-=
length-
>     and-one-element-arrays)
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: cluster-devel@redhat.com
> TO: Andreas Gruenbacher <agruenba@redhat.com>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.g=
it extents
> head:   86474c69cac46872bd311318c02fb8e9e25abd10
> commit: 86474c69cac46872bd311318c02fb8e9e25abd10 [14/14] gfs2: Add some i=
nitial extents-based inode code
> :::::: branch date: 9 days ago
> :::::: commit date: 9 days ago
> config: x86_64-randconfig-101-20231018 (https://download.01.org/0day-ci/a=
rchive/20231019/202310190541.0impmnL4-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190541=
.0impmnL4-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202310190541.0impmnL4-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> fs/gfs2/extents.c:123:23-27: WARNING use flexible-array member instead=
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-lengt=
h-and-one-element-arrays)

Thanks, I've fixed this.

Andreas

