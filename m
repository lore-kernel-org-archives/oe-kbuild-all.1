Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE027F16C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758539940; cv=none; b=NTlI2TVkdeJeVEucr/SCknx+ncpxLv1rSWvasH0FG9JM/ANSYBoNxh4jD40P3m4VAymZHuEWnGuibTlbHNpipirKgE6JMc4hbd3zfNmRc7lAH02NJHZxgHAmnxLJGUF+i8wdU52il22vyaja/nC3OOE4GD3DVJHjd8AQZfXK6yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758539940; c=relaxed/simple;
	bh=X+ZJREUqhMxBQzS4/TKXnaEPHdCQAyZQ/L+UMLjkhEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHu9I03Rd1Yw7hnPajTHo85+rdPe/Y3fb1gBxXmoCOmvgPIpmkRqHghGtWHmQhOISNxarUnh+LWOAFsH4UBJCZ+9KgVw5CIpSd6ffNbu/zQi7r4aJqHICk4xPQp5+MCQSObY04jaJdfqpmvyZnokcLDvxqhbv9ZHvyUUeM1GeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VsQ2lzrS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VsQ2lzrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758539937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRryt43zmpkEymQiUCRte39npN+h7hPhKyYULQoFjgg=;
	b=VsQ2lzrSmFceWFz29U5VIN/BC/AShVXSSShpbS3Jf86oPSLz3Uks6Own3J1W/b2jibjtht
	rMhUY8xc2wG7aUoobrnIWeo2C4yDIyJ8WEaJGOBu5ccywYqbbWs62/daev4zAnfgTdyE1F
	8zfPb47pyK1mxPs5f60vvMIKDYDS9to=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-MuEykQ3rObaampSq8ZiiiA-1; Mon, 22 Sep 2025 07:18:55 -0400
X-MC-Unique: MuEykQ3rObaampSq8ZiiiA-1
X-Mimecast-MFC-AGG-ID: MuEykQ3rObaampSq8ZiiiA_1758539935
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7357d0fc6baso43820607b3.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 04:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758539935; x=1759144735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRryt43zmpkEymQiUCRte39npN+h7hPhKyYULQoFjgg=;
        b=W+Og7/kCE/1kATA7Aqk63iAZmABnqLugkLyy6dKQgrNjzxKAY/KiEHfDponU6mlfB9
         e6dytExCTMlPfnvwqKuTT36l9nLpLXQJsTFoelTtmzrynGasJTMKP5lJMno7Vy8gAn5k
         3Ecf/GwA6REnIsp/v2/1vt6wwkd1pbA7+R2TbVigdvhrdCPvhWOGPrxSC2mu2WqUBRE5
         e+3aEmpiFxNUog38Fsopml68OrFTK7HrHUQdj+ZqrekKulzDUI1fo/Bw5KNNxkaBQHP5
         MMfbL2vpcjm7kuNfyBNUqFuMeCuetZjdoIg4EVrWR2XIUNNFILsYrpLOyXFiqr1fxdUM
         ovaQ==
X-Gm-Message-State: AOJu0YweRd3Bq08qTiOl/L/7CNlXewOZBW8hcqmJmXqDljFcIDRSPnFU
	UwvfI6C790jYikLOBwiCREvQfL3Mfm/SsUzV6ew+zPzT+X3e8BvzG3w0WEGtvUZccIHjiPgkIAD
	3VRp5djK76HFDXAZ6XZiOOzO3/BLnq8AVjbhm2NOmjQhcwzD/o3nd3VEIw8WCkdWdVUVbmcy9iR
	trZ00hoMSyBzY0Q5+Dpl/1dJh7XDTFt5cSfDig7deVdg==
X-Gm-Gg: ASbGnctubqse0qwYaT4EOz0dyf9V9fSuJWvxb+OWTdJ89RudqUeCNAq311eBBNBeeRz
	wUEyehd7p/WVIx9qsRgCJQx9oUqlo+PQ6GplS3t0Ri/CZAjQD9HyJoQPIURCTMVV9gsDObEXvSB
	7ao3WgrojIBcigzXPxOBVeYFlo8oy3XDcmLjBLiCiV9xlYgaxGCpX8u/73k9wG4bo/+lLyj5+FJ
	MYnaL7k
X-Received: by 2002:a81:ee04:0:b0:723:b92e:ed56 with SMTP id 00721157ae682-73d32a346e0mr81269137b3.16.1758539935071;
        Mon, 22 Sep 2025 04:18:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG26EmnxQnpVTiPFcznZliCYJCjPDiPtQdzF6kvDv+jfcrUXL+1TEef9xvDutmPEIEvEiPTd+k4aN95X31ttcA=
X-Received: by 2002:a81:ee04:0:b0:723:b92e:ed56 with SMTP id
 00721157ae682-73d32a346e0mr81269017b3.16.1758539934558; Mon, 22 Sep 2025
 04:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250919093359.961296-5-eperezma@redhat.com> <202509212126.UafwRleh-lkp@intel.com>
In-Reply-To: <202509212126.UafwRleh-lkp@intel.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 22 Sep 2025 13:18:18 +0200
X-Gm-Features: AS18NWDSgHmIKv-xhivlLO5QUscJGU950YOya2r8YEnXe0zVqW8bwW31ICYS-vA
Message-ID: <CAJaqyWcP6gzenoCpD1XNWo3TRE0SWX3uYHMJQ31HFeudna0JRg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] vduse: return internal vq group struct as map token
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fNg3KvHzPvXdE7AXOx3nyPOwKuOqwRwj4YJjkoaASHE_1758539935
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 21, 2025 at 3:56=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eugenio,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on mst-vhost/linux-next]
> [also build test WARNING on next-20250919]
> [cannot apply to linus/master v6.17-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vdus=
e-make-domain_lock-an-rwlock/20250919-174108
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git lin=
ux-next
> patch link:    https://lore.kernel.org/r/20250919093359.961296-5-eperezma=
%40redhat.com
> patch subject: [PATCH v3 4/6] vduse: return internal vq group struct as m=
ap token
> config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day=
-ci/archive/20250921/202509212126.UafwRleh-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509212126.UafwRleh-lkp=
@intel.com/
>
> smatch warnings:
> drivers/vdpa/vdpa_user/vduse_dev.c:634 vduse_get_vq_map() warn: unsigned =
'vq_group' is never less than zero.
> drivers/vdpa/vdpa_user/vduse_dev.c:634 vduse_get_vq_map() warn: error cod=
e type promoted to positive: 'vq_group'
>
> vim +/vq_group +634 drivers/vdpa/vdpa_user/vduse_dev.c
>
>    627
>    628  static union virtio_map vduse_get_vq_map(struct vdpa_device *vdpa=
, u16 idx)
>    629  {
>    630          struct vduse_dev *dev =3D vdpa_to_vduse(vdpa);
>    631          u32 vq_group =3D vduse_get_vq_group(vdpa, idx);
>    632          union virtio_map ret;
>    633
>  > 634          if (vq_group < 0)
>    635                  ret.group =3D NULL;
>    636          else
>    637                  ret.group =3D &dev->groups[vq_group];
>    638
>    639          return ret;
>    640  }
>    641
>

That's a good catch, thanks!

