Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8349217C2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Nov 2022 02:23:40 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id b29so15401781pfp.13
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Nov 2022 18:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1hlIcLvDM2TvXNx8JutOJSIG2DccN9Gi8iiaJskLDI=;
        b=qFagyHVKD69vbY5Du6qxJkiffT5G3B2uxzNhSrowZvGZA1QkfUYt8ZPeggOUvjXxQY
         aQJsMAe+gCcJPu38WkvcFXHm4h4Z8o9dC/DmAMluC8UPzNw/UMnalVFWEMCjCW0tY030
         yVLyaiUAFSZNNOmmxWNsgP9xwXZIBoxjHrkgK/CcrREjft1ghc5hNXXk3eNgY3qNLcLe
         BU/WblPvRICDvSNI4SDDVU9JyWZnnfbLcVHMH7GdOU84p4ooEr7XCR0yRngofUdtYGAc
         VGLDMhoxj0hAwJ4jdgZnknF3/4eALH7Ux1OvW6pEdP2IETtesqMh0lq3XDIRYx3vCtrt
         QcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1hlIcLvDM2TvXNx8JutOJSIG2DccN9Gi8iiaJskLDI=;
        b=FoKp2odC0in6Spzy6Hc9EdTMmPw6TBTIiu6EyZhmIJv97MXZOjrvwGqb+UKcthN0T2
         Ogj0WxGNhCYIAtPS+ybg/mMB3Tt76g5st/KP0uijpq03wUuQNbnk5E2zsOr1ISHBOEAD
         ygrUxNND8JQ5VjaKpw3S0gDQGGXUfoquA9CQscADNWuNtUiAjWhHe5sNJ/90491MXFtL
         VIH98W8afMHkUPTeSfiVGCF+eZYVb/DNLqXOvKMPkIVrSTfaz/4EJqw9qNbwXp0xrFbQ
         3tgbMmUP7jbioW15ldtPGj/1sIp6qBVXB58h7tWC3KRki/jJt3JvoKuultkujCCpuvGh
         nBrQ==
X-Gm-Message-State: ACrzQf0TvI300aJzISkK4I5aYyvAdXgldX6qx6KDqd/x2RTXR18xddSU
	2dkNSJhjpVb26l3FKMVp60c=
X-Google-Smtp-Source: AMsMyM7BRqJgUMki7OMyN2NJX1WHYdEBO4Ox15/wpS/yJS8WCfgDvPurvqrTr/Z6I7PZHxB05+ToYw==
X-Received: by 2002:a62:ea0d:0:b0:55f:8624:4d8b with SMTP id t13-20020a62ea0d000000b0055f86244d8bmr58745599pfh.74.1667960619894;
        Tue, 08 Nov 2022 18:23:39 -0800 (PST)
Received: from Laptop-X1 ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k12-20020a6555cc000000b0043c22e926f8sm6467084pgs.84.2022.11.08.18.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 18:23:38 -0800 (PST)
Date: Wed, 9 Nov 2022 10:23:31 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Jay Vosburgh <j.vosburgh@gmail.com>
Cc: netdev@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Toppins <jtoppins@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@gmail.com>,
	Liang Li <liali@redhat.com>
Subject: Re: [PATCHv2 net] bonding: fix ICMPv6 header handling when receiving
 IPv6 messages
Message-ID: <Y2sPI+E8RgaM2ND5@Laptop-X1>
References: <20221108070035.177036-1-liuhangbin@gmail.com>
 <202211082322.B7ILgv9S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211082322.B7ILgv9S-lkp@intel.com>

On Wed, Nov 09, 2022 at 12:06:32AM +0800, kernel test robot wrote:
> All warnings (new ones prefixed by >>):
> 
>    drivers/net/bonding/bond_main.c: In function 'bond_na_rcv':
> >> drivers/net/bonding/bond_main.c:3242:77: warning: passing argument 4 of 'skb_header_pointer' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>     3242 |         hdr = skb_header_pointer(skb, sizeof(struct ipv6hdr), sizeof(_hdr), &_hdr);
>          |                                                                             ^~~~~

Oh...When I post patches, I always rebuild the whole kernel. Maybe I missed
this warning as the build info passed to fast. I will only build the module
like the bot did in future...

I have post a new version to fix this.

>                     from drivers/net/bonding/bond_main.c:35:
>    In function 'fortify_memcpy_chk',
>        inlined from 'iph_to_flow_copy_v4addrs' at include/net/ip.h:566:2,
>        inlined from 'bond_flow_ip' at drivers/net/bonding/bond_main.c:3983:3:
>    include/linux/fortify-string.h:413:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
>      413 |                         __read_overflow2_field(q_size_field, size);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    In function 'fortify_memcpy_chk',
>        inlined from 'iph_to_flow_copy_v6addrs' at include/net/ipv6.h:900:2,
>        inlined from 'bond_flow_ip' at drivers/net/bonding/bond_main.c:3993:3:
>    include/linux/fortify-string.h:413:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
>      413 |                         __read_overflow2_field(q_size_field, size);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I will post another patch to fix this warning.

Thanks
Hangbin
