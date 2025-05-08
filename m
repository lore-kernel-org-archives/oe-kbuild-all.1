Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7B7274655
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718245; cv=none; b=AltJhm6Hh8lX7cissLkf63uyLDb+m98dGVk6Pw33fxwdOJtLDOxEBkrwoh5caK1epCeOPmdw8M+D9fcjUd8g4TaE7LsOvAz/EvRWQlmwQV8YGQW5ABxis2qQYAmw5quEW/97opZBmqsWOy6l0BZmw5ymA/8mtcLz5V9HbIwkQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718245; c=relaxed/simple;
	bh=uhQvp9WCPff1pqcCLJ4XswGJ3RxMU2XJRgqdUNXRyVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fu2GRC5fYbcj1RRtXtBTNTbB3hXoxv2kHiU0iG75tmAum1v72Q+UXzvxgqcaWNGj00dC/Zv3NkGXc6tEMpliyC93LBvVp04zJWC1Qxg2cAKHJZgEXkl/XEJPj0kAfKKR1t8iWpqDf9WUKRDOZhdcrgUx/JgS6jmmiKqWuzw4XuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzEbOqxt; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzEbOqxt"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3106217268dso9848851fa.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 08 May 2025 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746718242; x=1747323042; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQjzfkiPY/mQYrchxkE0D0BYClorMNWbaJFsccheq+I=;
        b=gzEbOqxtFA0v2jq83jhXkx76v+Kh+lBPoo0vVwMgTgblUoef1odIyiGX7KfbjvwFfQ
         KsdVt/axnd3CFqbXFgX0JY9QoQHONOpHgXosQnI2SZcclQgYUQ++cnuDKbc0dAciaXmV
         9rjwZAavlUk9uYj6r5b/frEzX2n0oEsEzBOZGiVtOkmDOB/mp5pBeAV3jD3sjR7mG/z4
         LkpZS0WCOeEEyPhYfdHJ9TcYmfmPm2ZJQBFNcKWjZBusNil+MmlttYPAYwKgvWWooizY
         YK5qUgXV/DeB7J+byigSF9bgqXmpEykvtwWVsqsNGm1G8JvZ/DLLaarrkNr9F78Xfibk
         f9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718242; x=1747323042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQjzfkiPY/mQYrchxkE0D0BYClorMNWbaJFsccheq+I=;
        b=J6tXIJ8GcSSLBP8UJ5VoRrGVbp1k2BgL2clhCAVx4aQYw/9FR2SnKCHA1+yL8fLdwQ
         xBAT2N7qFl2G9McmYNxCUsTqulun1tvjyz5Z/RjNKz+XS0stk6j0vDKdqahvGYMB/2rH
         n/VUJj5POCVh4G7UTs/uOPN4giDqsuPsUMA4xOLZ4i7PwTKb6sKFSkATRolL/3gLzpLV
         /iDjfmO+1f/CZS4S/iYJOh6g5oHRJdyE10PWnWck/PQPqfUAqOYgh4dC/j88JfJMwiS+
         UVVZ3WRINrF+sG3unPaU7Mu+kHZrWc7ZMgcVbN5O2SCflfNNjHqLX33Nm4zVRfHUK5A+
         DU5w==
X-Forwarded-Encrypted: i=1; AJvYcCW96s8Ev0/dj/9WzK/sxFstT5fobTqw94kc7xDdjs5+DOYYZGZ9y1yVDccOL9SeYAdsaO4gXtgKyayTFVc+@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9dGVxiTapznrb7egvPtvp1TtzqfKuy3QWoOt9G9lV8lyBd13m
	AnZOX8fiZqbEu0kV6466Q0B8V0RjLVh709SvpMbpecPcgK+vmVRSRGpfg045osu3t2Zjkydz3et
	WsFCDiOazdoR5LuaTXpwFV1HLufs=
X-Gm-Gg: ASbGncukqPswB2YECC+8SzuIrwL5nmnmvHxCKy3idEKYGg1YhqQLlbgn+271gUNPL0y
	9KTmYJdJqlh6VZz/1tiQQzF3BQ/lxi7xJczHtUz33q29DvfE86UgO3jVHoabTvtV8aCt3RCq0oc
	VFmjGRY4OQ5+IMzRaNcv/x
X-Google-Smtp-Source: AGHT+IF/61wqEt/gNK9h/BFue8pEMVVs+3WwaDDUV5ZgMtO8p13iaJh7NeacXgRZn557ZpoAf4I6UX8O9Cp1YbR3BlM=
X-Received: by 2002:a2e:a596:0:b0:30b:d17b:26aa with SMTP id
 38308e7fff4ca-326b87cf07fmr14365951fa.2.1746718240194; Thu, 08 May 2025
 08:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507-iso-v1-1-6f60d243e037@amlogic.com> <202505081427.1Y3wyo7v-lkp@intel.com>
In-Reply-To: <202505081427.1Y3wyo7v-lkp@intel.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 8 May 2025 11:30:27 -0400
X-Gm-Features: ATxdqUGPfxuIy0MdHoQ0PVbw6pgnv1cWGOpJhgK1DoiY8DK67Jpr4Z0Jh949-eo
Message-ID: <CABBYNZKfz1J8YY9Atj935NJ7KoyHpUgPpUNGz_CytffNBXJfRQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: fix socket matching ambiguity between BIS and CIS
To: kernel test robot <lkp@intel.com>
Cc: Yang Li via B4 Relay <devnull+yang.li.amlogic.com@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	oe-kbuild-all@lists.linux.dev, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yang Li <yang.li@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 8, 2025 at 2:54=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Yang,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on f3daca9b490154fbb0459848cc2ed61e8367bddc]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Li-via-B4-Rel=
ay/Bluetooth-fix-socket-matching-ambiguity-between-BIS-and-CIS/20250507-153=
347
> base:   f3daca9b490154fbb0459848cc2ed61e8367bddc
> patch link:    https://lore.kernel.org/r/20250507-iso-v1-1-6f60d243e037%4=
0amlogic.com
> patch subject: [PATCH] Bluetooth: fix socket matching ambiguity between B=
IS and CIS
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/202505=
08/202505081427.1Y3wyo7v-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250508/202505081427.1Y3wyo7v-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505081427.1Y3wyo7v-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    net/bluetooth/hci_event.c: In function 'hci_le_per_adv_report_evt':
> >> net/bluetooth/hci_event.c:6469:60: error: 'ISO_LINK' undeclared (first=
 use in this function); did you mean 'SCO_LINK'?
>     6469 |         mask |=3D hci_proto_connect_ind(hdev, &pa_sync->dst, I=
SO_LINK, &flags);
>          |                                                            ^~~=
~~~~~
>          |                                                            SCO=
_LINK
>    net/bluetooth/hci_event.c:6469:60: note: each undeclared identifier is=
 reported only once for each function it appears in
>    net/bluetooth/hci_event.c: In function 'hci_le_big_info_adv_report_evt=
':
>    net/bluetooth/hci_event.c:7055:60: error: 'ISO_LINK' undeclared (first=
 use in this function); did you mean 'SCO_LINK'?
>     7055 |         mask |=3D hci_proto_connect_ind(hdev, &pa_sync->dst, I=
SO_LINK, &flags);
>          |                                                            ^~~=
~~~~~
>          |                                                            SCO=
_LINK
>
>
> vim +6469 net/bluetooth/hci_event.c
>
>   6449
>   6450  static void hci_le_per_adv_report_evt(struct hci_dev *hdev, void =
*data,
>   6451                                        struct sk_buff *skb)
>   6452  {
>   6453          struct hci_ev_le_per_adv_report *ev =3D data;
>   6454          int mask =3D hdev->link_mode;
>   6455          __u8 flags =3D 0;
>   6456          struct hci_conn *pa_sync;
>   6457
>   6458          bt_dev_dbg(hdev, "sync_handle 0x%4.4x", le16_to_cpu(ev->s=
ync_handle));
>   6459
>   6460          hci_dev_lock(hdev);
>   6461
>   6462          pa_sync =3D hci_conn_hash_lookup_pa_sync_handle
>   6463                          (hdev,
>   6464                          le16_to_cpu(ev->sync_handle));
>   6465
>   6466          if (!pa_sync)
>   6467                  goto unlock;
>   6468
> > 6469          mask |=3D hci_proto_connect_ind(hdev, &pa_sync->dst, ISO_=
LINK, &flags);
>   6470          if (!(mask & HCI_LM_ACCEPT))
>   6471                  goto unlock;
>   6472
>   6473          if (!(flags & HCI_PROTO_DEFER))
>   6474                  goto unlock;
>   6475
>   6476          if (ev->data_status =3D=3D LE_PA_DATA_COMPLETE &&
>   6477              !test_and_set_bit(HCI_CONN_PA_SYNC, &pa_sync->flags))=
 {
>   6478                  /* Notify iso layer */
>   6479                  hci_connect_cfm(pa_sync, 0);
>   6480
>   6481                  /* Notify MGMT layer */
>   6482                  mgmt_device_connected(hdev, pa_sync, NULL, 0);
>   6483          }
>   6484
>   6485  unlock:
>   6486          hci_dev_unlock(hdev);
>   6487  }
>   6488
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is probably already solved by:

https://github.com/bluez/bluetooth-next/commit/f3daca9b490154fbb0459848cc2e=
d61e8367bddc

--=20
Luiz Augusto von Dentz
