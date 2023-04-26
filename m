Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805396FC7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 21:15:32 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D62B841871
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1682543724;
	bh=WO2c3QM9J7axXEQOngfO/arhgrhg0yjzoiVitFexdWg=;
	h=From:To:cc:Subject:In-reply-to:References:MIME-Version:
	 Content-Type:Date:Message-ID;
	b=it5PWQFw08L88qZC5chfmTwfVsYoQViZxNxavXSPLvjZNEl9tqnRi1hI0EHHaIlvY
	 B9sATXWC97VCsFuhWtTfI4S1zCtdz1/FCOtO61sfK3aTMitYCXHvgoiu9sRiingoDW
	 B/2K0XSe3KgdxncaDRsiNmdpbnC0njUCE2pXDnywNvzaEIUfX+39t1BqAmYn/QJDQi
	 nKNchkra8hh58FyQURoLsm7OmPYsX8UdoKTSPualeKAiAfIPTvknuKOsi9S5RYsnYI
	 Xztzu7PXoS3IYkkj8EUDDX8Qa35zel6tAfyZ9DFqYRhOR0vFwuFaQoBzIV7qHxct1e
	 3EozeaZT4D9Hg==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-63b5465fb62so5520913b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 14:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543723; x=1685135723;
        h=message-id:date:content-transfer-encoding:content-id:mime-version
         :comments:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WO2c3QM9J7axXEQOngfO/arhgrhg0yjzoiVitFexdWg=;
        b=ZqHvJCNZIoRYsR5TATBzHjQndTwQfawssbJUxfaIf9E0gbMeCWIL48mUDhEX1lwZvZ
         Cr0PshyhLbUD5YsZbGsh/u1rUT0l4YNGEX4kchSsE7UdYGeZCTVWlxh9/1398kLbJOud
         ebJQuQOYi4WucsvhsdiJUD2+fkYSM9/hqmWSgjGaMrUCU2S8kBJVpVn6GxDVB1YXZg9y
         znK1e4HFkB1UQ5BgzdxeITn8PFqaiWBD1GkwlK3tyWSr1dmnltWP+QJ89szc/lCj8ob3
         hwjE+Mh6CyYq4JR1SPxTZaWjalZYOahrULplvS8C7Z5wUxuyOxs4D7x+1nGSE5XuWgCV
         ESFg==
X-Gm-Message-State: AAQBX9eyUjY+VZUDNcALZ1q8SJQennBteWx26x3Ai6tFP+BNclOF+7dT
	b2+J3XANOfCDtA8muoVk0EWWObvkAtLVHL1tBtxELgihKnQ87E9Q+tJ0a8cYeelSEf3U6iicXbo
	cpEGEn7X9P8CPuJKjGmfUHAFv6ECdsrJoV6L5uGV2kQI=
X-Received: by 2002:a05:6a00:ac3:b0:63d:2382:4948 with SMTP id c3-20020a056a000ac300b0063d23824948mr29162871pfl.25.1682543723398;
        Wed, 26 Apr 2023 14:15:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLFPMOcznpmw39PtHH5ZrOjpUuKLVNM0kgS7r7e2/TF4bx6EP+Zr6LN5kX9ocQOqXnZ0Am2A==
X-Received: by 2002:a05:6a00:ac3:b0:63d:2382:4948 with SMTP id c3-20020a056a000ac300b0063d23824948mr29162829pfl.25.1682543723027;
        Wed, 26 Apr 2023 14:15:23 -0700 (PDT)
Received: from famine.localdomain ([50.125.80.253])
        by smtp.gmail.com with ESMTPSA id h8-20020a056a00170800b00571cdbd0771sm11752872pfc.102.2023.04.26.14.15.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2023 14:15:22 -0700 (PDT)
Received: by famine.localdomain (Postfix, from userid 1000)
	id 062D761E6C; Wed, 26 Apr 2023 14:15:21 -0700 (PDT)
Received: from famine (localhost [127.0.0.1])
	by famine.localdomain (Postfix) with ESMTP id F2C509FB79;
	Wed, 26 Apr 2023 14:15:21 -0700 (PDT)
From: Jay Vosburgh <jay.vosburgh@canonical.com>
To: Hangbin Liu <liuhangbin@gmail.com>
cc: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>,
    netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
    "David S . Miller" <davem@davemloft.net>,
    Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
    Liang Li <liali@redhat.com>, Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
In-reply-to: <ZEjM0aTEyxHgAcwa@Laptop-X1>
References: <20230420082230.2968883-2-liuhangbin@gmail.com> <202304202222.eUq4Xfv8-lkp@intel.com> <27709.1682006380@famine> <20230420162139.3926e85c@kernel.org> <ZEIGCaLWKIY3lDBo@Laptop-X1> <6347.1682053997@famine> <ZEJdfWNwzfjpTXom@Laptop-X1> <ZEjM0aTEyxHgAcwa@Laptop-X1>
Comments: In-reply-to Hangbin Liu <liuhangbin@gmail.com>
   message dated "Wed, 26 Apr 2023 15:03:45 +0800."
X-Mailer: MH-E 8.6+git; nmh 1.6; Emacs 29.0.50
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8352.1682543721.1@famine>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Apr 2023 14:15:21 -0700
Message-ID: <8353.1682543721@famine>

Hangbin Liu <liuhangbin@gmail.com> wrote:

>On Fri, Apr 21, 2023 at 05:55:16PM +0800, Hangbin Liu wrote:
>> > 	I'm fine to limit the peerf_notif_delay range and then use a
>> > smaller type.
>> > =

>> > 	num_peer_notif is already limited to 255; I'm going to suggest a
>> > limit to the delay of 300 seconds.  That seems like an absurdly long
>> > time for this; I didn't do any kind of science to come up with that
>> > number.
>> > =

>> > 	As peer_notif_delay is stored in units of miimon intervals, that
>> > gives a worst case peer_notif_delay value of 300000 if miimon is 1, a=
nd
>> > 255 * 300000 fits easily in a u32 for send_peer_notif.
>> =

>> OK, I just found another overflow. In bond_fill_info(),
>> or bond_option_miimon_set():
>> =

>>         if (nla_put_u32(skb, IFLA_BOND_PEER_NOTIF_DELAY,
>>                         bond->params.peer_notif_delay * bond->params.mi=
imon))
>>                 goto nla_put_failure;
>> =

>> Since both peer_notif_delay and miimon are defined as int, there is a
>> possibility that the fill in number got overflowed. The same with up/do=
wn delay.
>> =

>> Even we limit the peer_notif_delay to 300s, which is 30000, there is st=
ill has
>> possibility got overflowed if we set miimon large enough.
>> =

>> This overflow should only has effect on use space shown since it's a
>> multiplication result. The kernel part works fine. I'm not sure if we s=
hould
>> also limit the miimon, up/down delay values..
>
>Hi Jay,
>
>Any comments for this issue? Should I send the send_peer_notif fix first =
and
>discuss the miimon, up/down delay userspace overflow issue later?

	Let's sort out the current send_peer_notif problems first.  I
don't see that the lack of upper bounds for miimon or up/down delay
causes issues for any reasonable configuration, so it can wait a bit.

	-J

---
	-Jay Vosburgh, jay.vosburgh@canonical.com
