Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F257F376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 05:13:22 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71BE73F0E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682054000;
	bh=0ZWdwZVUwF013uFLMuS9WbfgW7Pd46zHaMAguRZiuqI=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=FX5OL3KyeNj1pW8jmRPDtubE2GDPKJXivAW5yQXlAZV9wNrutAsKhxd8JlaUeqwp6
	 X3nozFcdqZuDhTjP1R92UP99qx+jGfwW5lrK4UKluNxj6jbQT2V3TKXF3QnSGW3ett
	 zc3T6NGnR/QZ28HnJjjzVyNTfHVnUNv5sLYhgTOsT1nx4KQFaBAMURRgtKyDuHgFEc
	 Ia5AV2w+3I3EGjTShxgyQI22g16CiSMXi2rAtxElC9VIGMNPXQB1R8a64vvJsepI+f
	 NUsSAKpSyapTha0snpiXWOFzJKmB1tKvBmeSl+HwOZ5euIhXdFmDlBWWqe5zCv1qig
	 V0dBWKPgoa7nA==
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-63b62529864so2146588b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 22:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682053998; x=1684645998;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZWdwZVUwF013uFLMuS9WbfgW7Pd46zHaMAguRZiuqI=;
        b=OwOxfi/7pdqgA4Q8a1MsCFdKXkljr32ftulpObvLgZSvHoQ0U0t7QgCNmUReMVlexM
         DcivVS+/BI6v/7abXxcaCnnCiF75x5195Aw0ZQ6UXF9z87JHr91V17v//zcAwgdkH9Rc
         6J5G2uIRbmUxJYwBdC44k8rdU7xwOBDS4KCWySzDxdB08YTiIvbzJ661jWotBSveeSMQ
         WF+qdzrrSkJ8SuFp1kN74iOlF80LY+QkmKvjjj9ieDap+21oTxlgjOmlidPqgj4l+77z
         lI0tuJqi5RWPwbIIPC5PsfBQyS78RaupWGvgmhCu9X+UQTC9ZPXAk3bPs5ymOOPGSXiR
         0mSQ==
X-Gm-Message-State: AAQBX9c1GOgsabyNjAhn1c++Z4dBtz8jVsfGaMur25EUDmYUl6IlToDZ
	y8x7hLwIEBqcvc06bz55fMAYpcT91eXw0EwxITLie5iLZUIc1Mb3fo/L0sbHTTgz0uXVGNJRjmM
	z51lPAtpTOhzmYenhzWgrxtU1KO7UKcsJgTXnNZEoOmU=
X-Received: by 2002:a05:6a00:1141:b0:63d:2d8c:7fd5 with SMTP id b1-20020a056a00114100b0063d2d8c7fd5mr4971247pfm.12.1682053998742;
        Thu, 20 Apr 2023 22:13:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bIsHSsiAOoth0Bzgn0DG/KDNuE7jdwQtGvKadnqO1+wkJN6bAAnl6MMR71iv8FnQ3T43gQFA==
X-Received: by 2002:a05:6a00:1141:b0:63d:2d8c:7fd5 with SMTP id b1-20020a056a00114100b0063d2d8c7fd5mr4971220pfm.12.1682053998431;
        Thu, 20 Apr 2023 22:13:18 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id y5-20020a056a00180500b0063b733fdd33sm2112099pfa.89.2023.04.20.22.13.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Apr 2023 22:13:17 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 6AB3E607E6; Thu, 20 Apr 2023 22:13:17 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id 6376B9FB79;
	Thu, 20 Apr 2023 22:13:17 -0700 (PDT)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: Hangbin Liu <liuhangbin@gmail.com>
cc: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>,
    netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
    "David S . Miller" <davem@davemloft.net>,
    Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
    Liang Li <liali@redhat.com>, Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
In-reply-to: <ZEIGCaLWKIY3lDBo@Laptop-X1>
References: <20230420082230.2968883-2-liuhangbin@gmail.com> <202304202222.eUq4Xfv8-lkp@intel.com> <27709.1682006380@famine> <20230420162139.3926e85c@kernel.org> <ZEIGCaLWKIY3lDBo@Laptop-X1>
Comments: In-reply-to Hangbin Liu <liuhangbin@gmail.com>
   message dated "Fri, 21 Apr 2023 11:42:01 +0800."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6346.1682053997.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Apr 2023 22:13:17 -0700
Message-ID: <6347.1682053997@famine>

Hangbin Liu <liuhangbin@gmail.com> wrote:

>On Thu, Apr 20, 2023 at 04:21:39PM -0700, Jakub Kicinski wrote:
>> On Thu, 20 Apr 2023 08:59:40 -0700 Jay Vosburgh wrote:
>> > >All errors (new ones prefixed by >>, old ones prefixed by <<):
>> > >  =

>> > >>> ERROR: modpost: "__umoddi3" [drivers/net/bonding/bonding.ko] unde=
fined!  =

>> > =

>> > 	I assume this is related to send_peer_notif now being u64 in the
>> > modulus at:
>> > =

>> > static bool bond_should_notify_peers(struct bonding *bond)
>> > {
>> > [...]
>> >         if (!slave || !bond->send_peer_notif ||
>> >             bond->send_peer_notif %
>> >             max(1, bond->params.peer_notif_delay) !=3D 0 ||
>> > =

>> > 	but I'm unsure if this is a real coding error, or some issue
>> > with the parisc arch specifically?
>> =

>> Coding error, I think. =

>> An appropriate helper from linux/math64.h should be used.
>
>It looks define send_peer_notif to u64 is a bit too large, which introduc=
e
>complex conversion for 32bit arch.
>
>For the remainder operation,
>bond->send_peer_notif % max(1, bond->params.peer_notif_delay). u32 % u32 =
look OK.
>
>But for multiplication operation,
>bond->send_peer_notif =3D bond->params.num_peer_notif * max(1, bond->para=
ms.peer_notif_delay);
>It's u8 * u32. How about let's limit the peer_notif_delay to less than ma=
x(u32 / u8),
>then we can just use u32 for send_peer_notif. Is there any realistic mean=
ing
>to set peer_notif_delay to max(u32)? I don't think so.
>
>Jay, what do you think?

	I'm fine to limit the peerf_notif_delay range and then use a
smaller type.

	num_peer_notif is already limited to 255; I'm going to suggest a
limit to the delay of 300 seconds.  That seems like an absurdly long
time for this; I didn't do any kind of science to come up with that
number.

	As peer_notif_delay is stored in units of miimon intervals, that
gives a worst case peer_notif_delay value of 300000 if miimon is 1, and
255 * 300000 fits easily in a u32 for send_peer_notif.

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
