Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7462EBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go+Qzu4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700285739; x=1731821739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iTXbwAhxq11zSPkUT2/3fDk8CpSa+Gpqp5F65TQaTAQ=;
  b=Go+Qzu4ss2ccggcnAxsTrOv0fmvbU4EBzESs+9QSId6PHWGEFYnIkjrg
   0BDA+8Is8+E/Dx5MOb03Oeglru0T5a0DB7w905ukUv8DoU1XZ25c8gHRe
   /mCldHEGJKCcqsw1PhH5uPqBA5BVdqHBihrTozSjqiibx/Jwfb+auXPdu
   QGk2oRBn53rF14emAcMkKA5brehyc7nmHecfudBFhIWkTLfUznRZalw3p
   GX6P0r2JH+yTR+dq4QZfvIBvuvFQMhK8GucsYa9C3WLA2wmXASo6KyBE/
   HrNIvcjQ3rQEKlfF6/qYUAQYIKEwPPnZltnoUaXHFdKaC/mOcYOFL5qGe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="370756888"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="370756888"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 21:35:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715732359"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="715732359"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Nov 2023 21:35:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DzQ-0003Yv-0W;
	Sat, 18 Nov 2023 05:35:32 +0000
Date: Sat, 18 Nov 2023 13:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v2 06/10] net: ethtool: Introduce a command
 to list PHYs on an interface
Message-ID: <202311181328.C3AKGhlh-lkp@intel.com>
References: <20231117162323.626979-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117162323.626979-7-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231117-234210
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231117162323.626979-7-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next v2 06/10] net: ethtool: Introduce a command to list PHYs on an interface
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231118/202311181328.C3AKGhlh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181328.C3AKGhlh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181328.C3AKGhlh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/phy.c:216:5: warning: no previous prototype for 'ethnl_phy_dump_one_dev' [-Wmissing-prototypes]
     216 | int ethnl_phy_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/net/genetlink.h:6,
                    from net/ethtool/netlink.h:8,
                    from net/ethtool/phy.c:7:
   In function 'nla_put_string',
       inlined from 'ethnl_phy_fill_reply' at net/ethtool/phy.c:113:6:
>> include/net/netlink.h:1566:39: warning: argument 1 null where non-null expected [-Wnonnull]
    1566 |         return nla_put(skb, attrtype, strlen(str) + 1, str);
         |                                       ^~~~~~~~~~~
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from net/ethtool/common.h:6,
                    from net/ethtool/phy.c:6:
   net/ethtool/phy.c: In function 'ethnl_phy_fill_reply':
   include/linux/string.h:129:24: note: in a call to function 'strlen' declared 'nonnull'
     129 | extern __kernel_size_t strlen(const char *);
         |                        ^~~~~~
   In function 'ethnl_phy_reply_size',
       inlined from 'ethnl_phy_doit' at net/ethtool/phy.c:162:8:
>> net/ethtool/phy.c:69:48: warning: argument 1 null where non-null expected [-Wnonnull]
      69 |                         size += nla_total_size(strlen(sfp_get_name(phydev->sfp_bus)));
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/netdevice.h:24,
                    from net/ethtool/common.h:6,
                    from net/ethtool/phy.c:6:
   net/ethtool/phy.c: In function 'ethnl_phy_doit':
   include/linux/string.h:129:24: note: in a call to function 'strlen' declared 'nonnull'
     129 | extern __kernel_size_t strlen(const char *);
         |                        ^~~~~~


vim +/ethnl_phy_dump_one_dev +216 net/ethtool/phy.c

    24	
    25	/* Caller holds rtnl */
    26	static ssize_t
    27	ethnl_phy_reply_size(const struct ethnl_req_info *req_base,
    28			     struct netlink_ext_ack *extack)
    29	{
    30		struct phy_device_node *pdn;
    31		struct phy_device *phydev;
    32		struct link_topology *lt;
    33		unsigned long index;
    34		size_t size;
    35	
    36		lt = &req_base->dev->link_topo;
    37	
    38		size = nla_total_size(0);
    39	
    40		xa_for_each(&lt->phys, index, pdn) {
    41			phydev = pdn->phy;
    42	
    43			/* ETHTOOL_A_PHY_INDEX */
    44			size += nla_total_size(sizeof(u32));
    45	
    46			/* ETHTOOL_A_DRVNAME */
    47			size += nla_total_size(strlen(phydev->drv->name));
    48	
    49			/* ETHTOOL_A_NAME */
    50			size += nla_total_size(strlen(dev_name(&phydev->mdio.dev)));
    51	
    52			/* ETHTOOL_A_PHY_UPSTREAM_TYPE */
    53			size += nla_total_size(sizeof(u8));
    54	
    55			/* ETHTOOL_A_PHY_ID */
    56			size += nla_total_size(sizeof(u32));
    57	
    58			if (phy_on_sfp(phydev)) {
    59				/* ETHTOOL_A_PHY_UPSTREAM_SFP_NAME */
    60				if (sfp_get_name(pdn->parent_sfp_bus))
    61					size += nla_total_size(strlen(sfp_get_name(pdn->parent_sfp_bus)));
    62	
    63				/* ETHTOOL_A_PHY_UPSTREAM_INDEX */
    64				size += nla_total_size(sizeof(u32));
    65			}
    66	
    67			/* ETHTOOL_A_PHY_DOWNSTREAM_SFP_NAME */
    68			if (phydev->sfp_bus)
  > 69				size += nla_total_size(strlen(sfp_get_name(phydev->sfp_bus)));
    70		}
    71	
    72		return size;
    73	}
    74	
    75	static int
    76	ethnl_phy_fill_reply(const struct ethnl_req_info *req_base, struct sk_buff *skb)
    77	{
    78		struct phy_req_info *req_info = PHY_REQINFO(req_base);
    79		struct phy_device_node *pdn = &req_info->pdn;
    80		struct phy_device *phydev = pdn->phy;
    81		enum phy_upstream ptype;
    82		struct nlattr *nest;
    83	
    84		ptype = pdn->upstream_type;
    85	
    86		if (nla_put_u32(skb, ETHTOOL_A_PHY_INDEX, phydev->phyindex) ||
    87		    nla_put_string(skb, ETHTOOL_A_PHY_DRVNAME, phydev->drv->name) ||
    88		    nla_put_string(skb, ETHTOOL_A_PHY_NAME, dev_name(&phydev->mdio.dev)) ||
    89		    nla_put_u8(skb, ETHTOOL_A_PHY_UPSTREAM_TYPE, ptype) ||
    90		    nla_put_u32(skb, ETHTOOL_A_PHY_ID, phydev->phy_id))
    91			return -EMSGSIZE;
    92	
    93		if (ptype == PHY_UPSTREAM_PHY) {
    94			struct phy_device *upstream = pdn->upstream.phydev;
    95	
    96			nest = nla_nest_start(skb, ETHTOOL_A_PHY_UPSTREAM);
    97			if (!nest)
    98				return -EMSGSIZE;
    99	
   100			/* Parent index */
   101			if (nla_put_u32(skb, ETHTOOL_A_PHY_UPSTREAM_INDEX, upstream->phyindex))
   102				return -EMSGSIZE;
   103	
   104			if (pdn->parent_sfp_bus && sfp_get_name(pdn->parent_sfp_bus) &&
   105			    nla_put_string(skb, ETHTOOL_A_PHY_UPSTREAM_SFP_NAME,
   106					   sfp_get_name(pdn->parent_sfp_bus)))
   107				return -EMSGSIZE;
   108	
   109			nla_nest_end(skb, nest);
   110		}
   111	
   112		if (phydev->sfp_bus &&
   113		    nla_put_string(skb, ETHTOOL_A_PHY_DOWNSTREAM_SFP_NAME,
   114				   sfp_get_name(phydev->sfp_bus)))
   115			return -EMSGSIZE;
   116	
   117		return 0;
   118	}
   119	
   120	static int ethnl_phy_parse_request(struct ethnl_req_info *req_base,
   121					   struct nlattr **tb)
   122	{
   123		struct phy_req_info *req_info = PHY_REQINFO(req_base);
   124		struct link_topology *lt = &req_base->dev->link_topo;
   125		struct phy_device_node *pdn;
   126	
   127		if (!req_base->phydev)
   128			return 0;
   129	
   130		pdn = xa_load(&lt->phys, req_base->phydev->phyindex);
   131		memcpy(&req_info->pdn, pdn, sizeof(*pdn));
   132	
   133		return 0;
   134	}
   135	
   136	int ethnl_phy_doit(struct sk_buff *skb, struct genl_info *info)
   137	{
   138		struct phy_req_info req_info = {};
   139		struct nlattr **tb = info->attrs;
   140		struct sk_buff *rskb;
   141		void *reply_payload;
   142		int reply_len;
   143		int ret;
   144	
   145		ret = ethnl_parse_header_dev_get(&req_info.base,
   146						 tb[ETHTOOL_A_PHY_HEADER],
   147						 genl_info_net(info), info->extack,
   148						 true);
   149		if (ret < 0)
   150			return ret;
   151	
   152		rtnl_lock();
   153	
   154		ret = ethnl_phy_parse_request(&req_info.base, tb);
   155		if (ret < 0)
   156			goto err_unlock_rtnl;
   157	
   158		/* No PHY, return early */
   159		if (!req_info.pdn.phy)
   160			goto err_unlock_rtnl;
   161	
   162		ret = ethnl_phy_reply_size(&req_info.base, info->extack);
   163		if (ret < 0)
   164			goto err_unlock_rtnl;
   165		reply_len = ret + ethnl_reply_header_size();
   166	
   167		rskb = ethnl_reply_init(reply_len, req_info.base.dev,
   168					ETHTOOL_MSG_PHY_GET_REPLY,
   169					ETHTOOL_A_PHY_HEADER,
   170					info, &reply_payload);
   171		if (!rskb) {
   172			ret = -ENOMEM;
   173			goto err_unlock_rtnl;
   174		}
   175	
   176		ret = ethnl_phy_fill_reply(&req_info.base, rskb);
   177		if (ret)
   178			goto err_free_msg;
   179	
   180		rtnl_unlock();
   181		ethnl_parse_header_dev_put(&req_info.base);
   182		genlmsg_end(rskb, reply_payload);
   183	
   184		return genlmsg_reply(rskb, info);
   185	
   186	err_free_msg:
   187		nlmsg_free(rskb);
   188	err_unlock_rtnl:
   189		rtnl_unlock();
   190		ethnl_parse_header_dev_put(&req_info.base);
   191		return ret;
   192	}
   193	
   194	struct ethnl_phy_dump_ctx {
   195		struct ethnl_req_info	req_info;
   196	};
   197	
   198	int ethnl_phy_start(struct netlink_callback *cb)
   199	{
   200		const struct genl_dumpit_info *info = genl_dumpit_info(cb);
   201		struct ethnl_phy_dump_ctx *ctx = (void *)cb->ctx;
   202		struct nlattr **tb = info->info.attrs;
   203		int ret;
   204	
   205		BUILD_BUG_ON(sizeof(*ctx) > sizeof(cb->ctx));
   206	
   207		memset(ctx, 0, sizeof(*ctx));
   208	
   209		ret = ethnl_parse_header_dev_get(&ctx->req_info,
   210						 tb[ETHTOOL_A_PHY_HEADER],
   211						 sock_net(cb->skb->sk), cb->extack,
   212						 false);
   213		return ret;
   214	}
   215	
 > 216	int ethnl_phy_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
   217				   struct netlink_callback *cb)
   218	{
   219		struct ethnl_phy_dump_ctx *ctx = (void *)cb->ctx;
   220		struct phy_req_info *pri = PHY_REQINFO(&ctx->req_info);
   221		struct phy_device_node *pdn;
   222		unsigned long index = 1;
   223		void *ehdr;
   224		int ret;
   225	
   226		ctx->req_info.dev = dev;
   227	
   228		xa_for_each(&dev->link_topo.phys, index, pdn) {
   229			ehdr = ethnl_dump_put(skb, cb,
   230					      ETHTOOL_MSG_PHY_GET_REPLY);
   231			if (!ehdr) {
   232				ret = -EMSGSIZE;
   233				break;
   234			}
   235	
   236			ret = ethnl_fill_reply_header(skb, dev,
   237						      ETHTOOL_A_PHY_HEADER);
   238			if (ret < 0) {
   239				genlmsg_cancel(skb, ehdr);
   240				break;
   241			}
   242	
   243			memcpy(&pri->pdn, pdn, sizeof(*pdn));
   244			ret = ethnl_phy_fill_reply(&ctx->req_info, skb);
   245	
   246			genlmsg_end(skb, ehdr);
   247		}
   248	
   249		ctx->req_info.dev = NULL;
   250	
   251		return ret;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
