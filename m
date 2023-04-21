Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DBF2561
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 09:55:17 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-51b33c72686so1514007a12.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682070916; x=1684662916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhQ5d2eoF+4cNA1x8a8CdobJpCrUwblLyQkyozMENwQ=;
        b=pgYcnT7MudjSjpCCx6y6T5OZlGcCkndQ+umKWw5rwzWd/gZeMir2EhkmXETxu+oGt8
         C2AEkSjnE93ZkWOKfs5cbnn4E9M8y2pKUPVW1ZcZBiiI34OPf23DlHldso+pNgYYhFAN
         j/dimAiDbHXPbhL+4sOrGYS3mnrH4FIdjaccjyG/RVg5FKPjPGwHdzigNc3ibSoRPlCy
         2XjmBFPKjS8v4rbuOZ5hNwGUetgs3bkchD2tVgv90XLOFkG+8VmhxPNfKcHrvLN69M7H
         K6Bjq8iEbWxujruL+mykSBcHFMQPdmv2Px+54sqPFG/EjpQg4z0TAp7c6De/FqzhPkaU
         6K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682070916; x=1684662916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhQ5d2eoF+4cNA1x8a8CdobJpCrUwblLyQkyozMENwQ=;
        b=Tr7Rdq2rPhFlH3RYp9qs6+loX7i7A+tAj/puumfqrT/IHQnsOktRBsOGkvI1dLRVMt
         /TrO+CDWIlRrS79hE/AQPj/DKc6UWt60ldY6dtEFs67UNOY5VPfnx27aez2mZSyKh/gw
         1WydjIScsiC5jyQTVgPkgu/gOItjt27cZUiqcYWAmi3pv8hpWg8IDnoFnoSDfTl+RRW4
         KBILyxcQ1Vkw8W52ubUR3DFyst0NT6kPWDpAMuOsDfRs9KazJI95eUAQUYOiLP39GUSP
         Dcvo0LwwLMEdwKM5XQVWd90JPV/6Cob2tsw4omG1cozeI76TpyW7VimxP1nCbKD+Mj54
         YP5g==
X-Gm-Message-State: AAQBX9esZv9D3OlgQONonoJwdarMqGev/mcCJH3Dtat4KN9EDZZhBpk+
	NqhNGcnAWdxdjBzJ00Bv6xg=
X-Google-Smtp-Source: AKy350bSCKg6ntFRD3Dz5CrQc9Rk7OvojA27TcAhvOBg5dHCvHPpKnGsz4zUonxjB+Qk4dVFJnHddA==
X-Received: by 2002:a05:6a20:8407:b0:ef:9115:c718 with SMTP id c7-20020a056a20840700b000ef9115c718mr6288972pzd.26.1682070916484;
        Fri, 21 Apr 2023 02:55:16 -0700 (PDT)
Received: from Laptop-X1 ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id j3-20020a635503000000b0051b72ef978fsm2342777pgb.20.2023.04.21.02.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 02:55:15 -0700 (PDT)
Date: Fri, 21 Apr 2023 17:55:09 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <jay.vosburgh@canonical.com>
Cc: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>,
	netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Liang Li <liali@redhat.com>, Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH net 1/4] bonding: fix send_peer_notif overflow
Message-ID: <ZEJdfWNwzfjpTXom@Laptop-X1>
References: <20230420082230.2968883-2-liuhangbin@gmail.com>
 <202304202222.eUq4Xfv8-lkp@intel.com>
 <27709.1682006380@famine>
 <20230420162139.3926e85c@kernel.org>
 <ZEIGCaLWKIY3lDBo@Laptop-X1>
 <6347.1682053997@famine>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6347.1682053997@famine>

On Thu, Apr 20, 2023 at 10:13:17PM -0700, Jay Vosburgh wrote:
> >It looks define send_peer_notif to u64 is a bit too large, which introduce
> >complex conversion for 32bit arch.
> >
> >For the remainder operation,
> >bond->send_peer_notif % max(1, bond->params.peer_notif_delay). u32 % u32 look OK.
> >
> >But for multiplication operation,
> >bond->send_peer_notif = bond->params.num_peer_notif * max(1, bond->params.peer_notif_delay);
> >It's u8 * u32. How about let's limit the peer_notif_delay to less than max(u32 / u8),
> >then we can just use u32 for send_peer_notif. Is there any realistic meaning
> >to set peer_notif_delay to max(u32)? I don't think so.
> >
> >Jay, what do you think?
> 
> 	I'm fine to limit the peerf_notif_delay range and then use a
> smaller type.
> 
> 	num_peer_notif is already limited to 255; I'm going to suggest a
> limit to the delay of 300 seconds.  That seems like an absurdly long
> time for this; I didn't do any kind of science to come up with that
> number.
> 
> 	As peer_notif_delay is stored in units of miimon intervals, that
> gives a worst case peer_notif_delay value of 300000 if miimon is 1, and
> 255 * 300000 fits easily in a u32 for send_peer_notif.

OK, I just found another overflow. In bond_fill_info(),
or bond_option_miimon_set():

        if (nla_put_u32(skb, IFLA_BOND_PEER_NOTIF_DELAY,
                        bond->params.peer_notif_delay * bond->params.miimon))
                goto nla_put_failure;

Since both peer_notif_delay and miimon are defined as int, there is a
possibility that the fill in number got overflowed. The same with up/down delay.

Even we limit the peer_notif_delay to 300s, which is 30000, there is still has
possibility got overflowed if we set miimon large enough.

This overflow should only has effect on use space shown since it's a
multiplication result. The kernel part works fine. I'm not sure if we should
also limit the miimon, up/down delay values..

Thanks
Hangbin
