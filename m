Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBCFC2DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 07:03:52 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1a9253d4551so53546325ad.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682492632; x=1685084632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/K6jf3IUKohCoKEjM6W4piUg6fKB3MX+lx1N3YCBQ4=;
        b=JtjIGPfq0iWxZ5HKLanRb+RKUUH/QKkTV62GT9xcchUvZJzvxhxerm10TjYzctNGqd
         i+4vlOEWZ4s+3gbcEQo0Dt4Cu7SLJV8MVZjm9vXcWrCLQvwfCgvk9SfhadIZHbutQ3eD
         Owgj2BDg0I56J1V3+sxyshg3qyTYagdfnBmeO/NGd85k3D5gi91BfzN8Lssl5QjybccZ
         nv91IFPRN+ibs6Wd0vki8AsUwkc5gqx2i7HUHzbsPNKAUwGX8ezjt56CzYMIqDGHwIBe
         CpwkeJOR5tQ0nD2AyNbrzwbhrb0qY0AG2eviykzX/FFatGPIF141gIXgXbnkfFSVabY+
         a85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682492632; x=1685084632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/K6jf3IUKohCoKEjM6W4piUg6fKB3MX+lx1N3YCBQ4=;
        b=XjTp8gbayZMegsqT3kgL6EWNuCpnrVvWcGbUwp5pfuidaKi/8BAUR0My2G3I0jSGD2
         T2jSTBgtNynZySKoKxgxXSrOGWYC9DD81cdOQ7/gLWMkYUXs1KzPI6q+Q832hR0bEt7b
         AZGHs9qYf7ZTl4oBi0JCgv99n9QcixCM7USEabk/DZ/h57d5pHl63/wY8bDSPRUsqlRj
         xrYGLdKLRNpeK2/tgNCJ+VvK8qz9f3uFqGOWk0AZ2ze/PXpn+/uDzJJZZ0doqcIUrODN
         ZDvNDnAXfMeItdwqvQuHAM/NUf4ae8p3x9ZZ5yPf65giamzl/x7GlDiTuGJoYRLtdIvB
         OoRQ==
X-Gm-Message-State: AAQBX9fSXtv0CObLbCm8mC+DS7nmsPdAPdq0On7KqnaCNikWS8zAC6gc
	yM+NOp/VjrQESu6+GNbii5g=
X-Google-Smtp-Source: AKy350b06EZbEN9pQoAwczOn6r4APSrlETtrgjDGOtIk2DbP2zrNyRCXqgAsfvrZIWWTDXwa7kwVDg==
X-Received: by 2002:a17:903:32c1:b0:1a6:a375:cb44 with SMTP id i1-20020a17090332c100b001a6a375cb44mr23816141plr.39.1682492631976;
        Wed, 26 Apr 2023 00:03:51 -0700 (PDT)
Received: from Laptop-X1 ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id ij8-20020a170902ab4800b0019c93ee6902sm9229819plb.109.2023.04.26.00.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 00:03:51 -0700 (PDT)
Date: Wed, 26 Apr 2023 15:03:45 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <jay.vosburgh@canonical.com>
Cc: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>,
	netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Liang Li <liali@redhat.com>, Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
Message-ID: <ZEjM0aTEyxHgAcwa@Laptop-X1>
References: <20230420082230.2968883-2-liuhangbin@gmail.com>
 <202304202222.eUq4Xfv8-lkp@intel.com>
 <27709.1682006380@famine>
 <20230420162139.3926e85c@kernel.org>
 <ZEIGCaLWKIY3lDBo@Laptop-X1>
 <6347.1682053997@famine>
 <ZEJdfWNwzfjpTXom@Laptop-X1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEJdfWNwzfjpTXom@Laptop-X1>

On Fri, Apr 21, 2023 at 05:55:16PM +0800, Hangbin Liu wrote:
> > 	I'm fine to limit the peerf_notif_delay range and then use a
> > smaller type.
> > 
> > 	num_peer_notif is already limited to 255; I'm going to suggest a
> > limit to the delay of 300 seconds.  That seems like an absurdly long
> > time for this; I didn't do any kind of science to come up with that
> > number.
> > 
> > 	As peer_notif_delay is stored in units of miimon intervals, that
> > gives a worst case peer_notif_delay value of 300000 if miimon is 1, and
> > 255 * 300000 fits easily in a u32 for send_peer_notif.
> 
> OK, I just found another overflow. In bond_fill_info(),
> or bond_option_miimon_set():
> 
>         if (nla_put_u32(skb, IFLA_BOND_PEER_NOTIF_DELAY,
>                         bond->params.peer_notif_delay * bond->params.miimon))
>                 goto nla_put_failure;
> 
> Since both peer_notif_delay and miimon are defined as int, there is a
> possibility that the fill in number got overflowed. The same with up/down delay.
> 
> Even we limit the peer_notif_delay to 300s, which is 30000, there is still has
> possibility got overflowed if we set miimon large enough.
> 
> This overflow should only has effect on use space shown since it's a
> multiplication result. The kernel part works fine. I'm not sure if we should
> also limit the miimon, up/down delay values..

Hi Jay,

Any comments for this issue? Should I send the send_peer_notif fix first and
discuss the miimon, up/down delay userspace overflow issue later?

Thanks
Hangbin
