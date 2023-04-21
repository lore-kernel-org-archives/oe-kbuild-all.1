Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB72379
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 03:42:07 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-51efefe7814so1754307a12.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 20:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682048527; x=1684640527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/sRJAtEd/uD1OOqv9s/og+8s+YNsRdKo/znPIbylR0=;
        b=rIUoEBc8XndLuA2ByBWs6ucycfZ9AyZ38X8Z5+iSAquwKaGfXYgA0IQQTjc+c7ZnFJ
         qm71Dw96maqElUswhvdvCjh/kiFl3Av4RR/gJor8N7QnhgY2RCjwX3ORaAtugDFObD7B
         YyP9EW7D3ehJUz34pUyCDQt/56b5fQNWz3pXue0LMz1THkUFoNwCie9T28E56gOiZziB
         AfIwx0ADJxptUUhNqqLAk9G6by4+wGrPM21nldAgWJyFaEx11O/VGx2lXaKJ4EnvLNWM
         aqrfmD6Xqnfj4DJv5AbL6i4aCn59QfQVLdavzhEmgYuB5tABcfHCFxeVWK76lIlOq8UA
         +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682048527; x=1684640527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/sRJAtEd/uD1OOqv9s/og+8s+YNsRdKo/znPIbylR0=;
        b=AeP0HEv2OEnug9gVVGIMSvWTI0JItsTl1+t1A/U9pYMwMzLjffBqwECVJlt1vxGXLx
         bHlXTA7/LzNievv6tIzEi0OfRaDEn3sO3AN4TTCS4lAT9/rjrPiPSJHq58Cme94BCgCO
         ikBScC36gZUOVzH8Gdnq3VL163Qvtpoe86m5Bt8g+w23EZPcYhk2DhZJB4Lgo9jfJ6Rm
         i2KboBP4tIymj6PjjPdKI+1TmByetWwt3XVUi8P6cUI48r1d3+jeL7R6IsCp6GbWVdDe
         xiQCHGeBCMW6/3wVZkMz262osAcMXJK12BZJoZlssNAIib6xdGC2CqDuAAXqPJ4pMIch
         NwkA==
X-Gm-Message-State: AAQBX9fd0VJ3S6JyiNktoykDAHyyz6Njsj2irnrfK8lj47tt1xJOMs1T
	OlKxt53lOIb/GOyCVWYIqLQ=
X-Google-Smtp-Source: AKy350a2fOKURicCVwpAoIzbsgabuKHf58wyDxP3sEYVCAwk5j7ErM/0SJZgl5bUzW1LxfDGKYLaEA==
X-Received: by 2002:a17:902:ec8c:b0:1a6:9f9b:1327 with SMTP id x12-20020a170902ec8c00b001a69f9b1327mr4605882plg.45.1682048527109;
        Thu, 20 Apr 2023 20:42:07 -0700 (PDT)
Received: from Laptop-X1 ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id iy1-20020a170903130100b001a65258011bsm1795671plb.26.2023.04.20.20.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:42:06 -0700 (PDT)
Date: Fri, 21 Apr 2023 11:42:01 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jay Vosburgh <jay.vosburgh@canonical.com>,
	kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Liang Li <liali@redhat.com>, Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
Message-ID: <ZEIGCaLWKIY3lDBo@Laptop-X1>
References: <20230420082230.2968883-2-liuhangbin@gmail.com>
 <202304202222.eUq4Xfv8-lkp@intel.com>
 <27709.1682006380@famine>
 <20230420162139.3926e85c@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420162139.3926e85c@kernel.org>

On Thu, Apr 20, 2023 at 04:21:39PM -0700, Jakub Kicinski wrote:
> On Thu, 20 Apr 2023 08:59:40 -0700 Jay Vosburgh wrote:
> > >All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >  
> > >>> ERROR: modpost: "__umoddi3" [drivers/net/bonding/bonding.ko] undefined!  
> > 
> > 	I assume this is related to send_peer_notif now being u64 in the
> > modulus at:
> > 
> > static bool bond_should_notify_peers(struct bonding *bond)
> > {
> > [...]
> >         if (!slave || !bond->send_peer_notif ||
> >             bond->send_peer_notif %
> >             max(1, bond->params.peer_notif_delay) != 0 ||
> > 
> > 	but I'm unsure if this is a real coding error, or some issue
> > with the parisc arch specifically?
> 
> Coding error, I think. 
> An appropriate helper from linux/math64.h should be used.

It looks define send_peer_notif to u64 is a bit too large, which introduce
complex conversion for 32bit arch.

For the remainder operation,
bond->send_peer_notif % max(1, bond->params.peer_notif_delay). u32 % u32 look OK.

But for multiplication operation,
bond->send_peer_notif = bond->params.num_peer_notif * max(1, bond->params.peer_notif_delay);
It's u8 * u32. How about let's limit the peer_notif_delay to less than max(u32 / u8),
then we can just use u32 for send_peer_notif. Is there any realistic meaning
to set peer_notif_delay to max(u32)? I don't think so.

Jay, what do you think?

Thanks
Hangbin
