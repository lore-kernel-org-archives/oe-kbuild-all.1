Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49713FE0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 13:44:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso64225995e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689774283; x=1690379083;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxEa7ZwmbtgvUZmyPwt7LvypfZDgVVCC3R8/YAt2SXA=;
        b=Ye6BA598dBDYf1XKC40Vlgb6lcjT0j/ASLtOw8IE0Ecnnr7Ri+S4jJwtNlfNxxQMkV
         VEKymcXNZkZAuFn8Pi4zJOFHNiod6v1LpNqzNRpYccNUxrtL/PiNxN3SINw6+YhimgtN
         7SOR0TfGR0x3QQl4E+dkdZr8lu1mxT8ScjsRwfqeZhUnrqvcSSPTLN2KlqMXJOTXnDtD
         3mIkDM0yzj4zCAKar6qoH4tK5CF1W2a4tsDEjP6HvNVXdWe8bFPX1NeA7S9I0soABQBv
         nMuVZ1wHqp8e8Yyc6488I1/CIJR6O2+LsbJsI/B+MYEHxIShuHAoSnbMzAPXQ8zmdf6G
         j3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689774283; x=1690379083;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxEa7ZwmbtgvUZmyPwt7LvypfZDgVVCC3R8/YAt2SXA=;
        b=LXzYBf7Y2WwtuFNauarPOQL4V1+6bjLSKmNRoZUHMg1LOPbWyl8oJLn6wQOFsy7pvC
         yIwGG+ZEUoRUEJlJfBathy6xmMiPv/T23e1ZZfIinJwTdkdt7sw8LntBhMNPrR4uMniC
         HQz1QWCiNrEF7wD4jmcsAVE0IQGkvIGT1oMwh3zMlfdNGAe+Lijiskto3RmcaLIwZexx
         NIlaVgZtE4TmtRfRSSZkkYRnXx0q6UWbC5lR3kHvUc9WJRwcZX+6PMifr2KafocWCADm
         AAAdg9NGSqyFEbHoLY1QtgXuXYJv4TVVrq+W3pcYfehQtfPX65m2+oEBPK6HElBzWZEH
         JL/g==
X-Gm-Message-State: ABy/qLZZ3kLmhWldGw/26W6lWj6yYb0rl/+SlH2OXnwaFq++htJNjYNe
	08nJL3Y3PGzQbHdZxzlCYJ2XCA==
X-Google-Smtp-Source: APBJJlGRAbCaxxekeDgGVO/og5aN4wlb/W1+ZPJxbkKSNWedMnsl46RdKW0o44vi2mkr4L7iQMTUag==
X-Received: by 2002:a1c:e913:0:b0:3fb:9ef2:157 with SMTP id q19-20020a1ce913000000b003fb9ef20157mr1929582wmc.28.1689774282928;
        Wed, 19 Jul 2023 06:44:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b0030c4d8930b1sm5397706wrr.91.2023.07.19.06.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 06:44:40 -0700 (PDT)
Date: Wed, 19 Jul 2023 16:44:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Patrick Rohr <prohr@google.com>,
	"David S . Miller" <davem@davemloft.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Network Development Mailing List <netdev@vger.kernel.org>,
	Patrick Rohr <prohr@google.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Lorenzo Colitti <lorenzo@google.com>
Subject: Re: [net-next] net: add sysctl accept_ra_min_rtr_lft
Message-ID: <8ab106ad-d153-4c3e-8b4a-de4826d29da6@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718213709.688186-1-prohr@google.com>

Hi Patrick,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Patrick-Rohr/net-add-sysctl-accept_ra_min_rtr_lft/20230719-053943
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230718213709.688186-1-prohr%40google.com
patch subject: [net-next] net: add sysctl accept_ra_min_rtr_lft
config: x86_64-randconfig-m001-20230717 (https://download.01.org/0day-ci/archive/20230719/202307192116.N4bDjayg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192116.N4bDjayg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307192116.N4bDjayg-lkp@intel.com/

smatch warnings:
net/ipv6/ndisc.c:1501 ndisc_router_discovery() error: uninitialized symbol 'lifetime'.

vim +/lifetime +1501 net/ipv6/ndisc.c

  1279  
  1280          if (!ndisc_parse_options(skb->dev, opt, optlen, &ndopts))
  1281                  return SKB_DROP_REASON_IPV6_NDISC_BAD_OPTIONS;
  1282  
  1283          if (!ipv6_accept_ra(in6_dev)) {
  1284                  ND_PRINTK(2, info,
  1285                            "RA: %s, did not accept ra for dev: %s\n",
  1286                            __func__, skb->dev->name);
  1287                  goto skip_linkparms;
                        ^^^^^^^^^^^^^^^^^^^^
This goto happens before lifetime is set

  1288          }
  1289  
  1290          lifetime = ntohs(ra_msg->icmph.icmp6_rt_lifetime);

Set here

  1291          if (lifetime != 0 && lifetime < in6_dev->cnf.accept_ra_min_rtr_lft) {
  1292                  ND_PRINTK(2, info,
  1293                            "RA: router lifetime (%ds) is too short: %s\n",
  1294                            lifetime, skb->dev->name);
  1295                  goto skip_linkparms;
  1296          }
  1297  
  1298  #ifdef CONFIG_IPV6_NDISC_NODETYPE

[ SNIP ]

  1464  
  1465  skip_linkparms:
  1466  
  1467          /*
  1468           *      Process options.
  1469           */
  1470  
  1471          if (!neigh)
  1472                  neigh = __neigh_lookup(&nd_tbl, &ipv6_hdr(skb)->saddr,
  1473                                         skb->dev, 1);
  1474          if (neigh) {
  1475                  u8 *lladdr = NULL;
  1476                  if (ndopts.nd_opts_src_lladdr) {
  1477                          lladdr = ndisc_opt_addr_data(ndopts.nd_opts_src_lladdr,
  1478                                                       skb->dev);
  1479                          if (!lladdr) {
  1480                                  ND_PRINTK(2, warn,
  1481                                            "RA: invalid link-layer address length\n");
  1482                                  goto out;
  1483                          }
  1484                  }
  1485                  ndisc_update(skb->dev, neigh, lladdr, NUD_STALE,
  1486                               NEIGH_UPDATE_F_WEAK_OVERRIDE|
  1487                               NEIGH_UPDATE_F_OVERRIDE|
  1488                               NEIGH_UPDATE_F_OVERRIDE_ISROUTER|
  1489                               NEIGH_UPDATE_F_ISROUTER,
  1490                               NDISC_ROUTER_ADVERTISEMENT, &ndopts);
  1491                  reason = SKB_CONSUMED;
  1492          }
  1493  
  1494          if (!ipv6_accept_ra(in6_dev)) {
  1495                  ND_PRINTK(2, info,
  1496                            "RA: %s, accept_ra is false for dev: %s\n",
  1497                            __func__, skb->dev->name);
  1498                  goto out;
  1499          }
  1500  
  1501          if (lifetime != 0 && lifetime < in6_dev->cnf.accept_ra_min_rtr_lft) {
                    ^^^^^^^^
Uninitialized

  1502                  ND_PRINTK(2, info,
  1503                            "RA: router lifetime (%ds) is too short: %s\n",
  1504                            lifetime, skb->dev->name);
  1505                  goto out;
  1506          }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

