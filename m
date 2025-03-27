Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A1C17E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 06:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056698; cv=none; b=LbHBsEkk6TsX4aE+x/SIK6iLnWV7JpNyZ5+6XsEuWpGO0/+Vbcqd8tXt/efuTkIT67pET++10yZK7LtS+0LLPMWi3eNl6uWSdWo5VYozr0Q+/KZzh7oxmLhG1GVHLHOhUCjQtFpmsLDPTyGs4m25Sn8Ow/UwN8vo5zlV9SCdoYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056698; c=relaxed/simple;
	bh=i6N3v/donggcrWjrvjU234GXECyvkVkvv0690Vo3SFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1z3xHpJ0xwYmu+WBYhphRwsd/WbiG1ovjzcA/oUf4KhHTAH4u7n250z2FaU6PLjD1nYfbyM/3K1+BhTEX7g3n/b4Ep3aDIUwBPJ2v67hYWEiHyFJ1q4rAB5CrdYsTthmG0A3YdX8B7uFg2F3abyk29JX1Vt1DLZd1b4kGt1PPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8oSoP4k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8oSoP4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743056697; x=1774592697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i6N3v/donggcrWjrvjU234GXECyvkVkvv0690Vo3SFM=;
  b=i8oSoP4kKZtE0uSDoD3jHN/S71uj5dA2bRFOumu+PWHovCa7zbAlqInV
   eQCyB6Z986O3igdTNCwYMoRBYfjP5Ceijaoaf6wQcjNcgqTgFarRGTcN5
   ha6IF/sG/VuVFE/bXW+8NiXvYMzD7jPSE/b4iISb/wPX2o5Yd7Ckmuyqz
   5G3OcF/leL2Y45yB0hMIJFRM3PsXs0lxBa8bihYAvLBfXUtQgrsl4u3zQ
   GPuxR/LqfZIIIGpFJEeJfyHJUkgpavAnDdrl8kkTMymcz0NJeMrF3ZzBK
   YQ3W+wDq8xuwALAAFsSX+XiHnPBtL/yaGh+GKt5rzHrhgeCEfxtPXCeaa
   w==;
X-CSE-ConnectionGUID: GuX00YH7RdW9ocE6A8aQSA==
X-CSE-MsgGUID: CbSz7zJiTWWFVnCsSo/DLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48249453"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48249453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 23:24:56 -0700
X-CSE-ConnectionGUID: URXENyl2TEOFScs9UFOeXw==
X-CSE-MsgGUID: znKP0cuWQcerrVohvxZYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129194193"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2025 23:24:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txgfb-0006Qu-0N;
	Thu, 27 Mar 2025 06:24:51 +0000
Date: Thu, 27 Mar 2025 14:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1523/1523]
 net/netfilter/nft_nat.c:165:23: warning: 'alen' may be used uninitialized in
 this function
Message-ID: <202503271418.7nn4LU8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   69d39b683755039471781fee8dc7ed96952f771b
commit: 1a53a31cdd778dfc49a1bf495394238cb9de9bef [1523/1523] netfilter: nft_nat: allow to specify layer 4 protocol NAT only
config: arm64-randconfig-004-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271418.7nn4LU8p-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271418.7nn4LU8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271418.7nn4LU8p-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   net/netfilter/nft_nat.c: In function 'nft_nat_init':
>> net/netfilter/nft_nat.c:165:23: warning: 'alen' may be used uninitialized in this function [-Wmaybe-uninitialized]
     165 |                 err = nft_validate_register_load(priv->sreg_addr_min, alen);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/alen +165 net/netfilter/nft_nat.c

75e8d06d430843 Pablo Neira Ayuso 2015-01-14  116  
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  117  static int nft_nat_init(const struct nft_ctx *ctx, const struct nft_expr *expr,
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  118  			const struct nlattr * const tb[])
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  119  {
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  120  	struct nft_nat *priv = nft_expr_priv(expr);
d07db9884a5fba Patrick McHardy   2015-04-11  121  	unsigned int alen, plen;
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  122  	u32 family;
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  123  	int err;
75e8d06d430843 Pablo Neira Ayuso 2015-01-14  124  
5c819a39753d6a Pablo Neira Ayuso 2014-10-16  125  	if (tb[NFTA_NAT_TYPE] == NULL ||
5c819a39753d6a Pablo Neira Ayuso 2014-10-16  126  	    (tb[NFTA_NAT_REG_ADDR_MIN] == NULL &&
5c819a39753d6a Pablo Neira Ayuso 2014-10-16  127  	     tb[NFTA_NAT_REG_PROTO_MIN] == NULL))
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  128  		return -EINVAL;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  129  
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  130  	switch (ntohl(nla_get_be32(tb[NFTA_NAT_TYPE]))) {
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  131  	case NFT_NAT_SNAT:
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  132  		priv->type = NF_NAT_MANIP_SRC;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  133  		break;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  134  	case NFT_NAT_DNAT:
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  135  		priv->type = NF_NAT_MANIP_DST;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  136  		break;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  137  	default:
cc8272882c3dad Pablo Neira Ayuso 2020-09-22  138  		return -EOPNOTSUPP;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  139  	}
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  140  
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  141  	if (tb[NFTA_NAT_FAMILY] == NULL)
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  142  		return -EINVAL;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  143  
a4c2e8beba8432 Patrick McHardy   2014-03-07  144  	family = ntohl(nla_get_be32(tb[NFTA_NAT_FAMILY]));
36596dadf54a92 Pablo Neira Ayuso 2018-01-09  145  	if (family != ctx->family)
a4c2e8beba8432 Patrick McHardy   2014-03-07  146  		return -EOPNOTSUPP;
d07db9884a5fba Patrick McHardy   2015-04-11  147  
d07db9884a5fba Patrick McHardy   2015-04-11  148  	switch (family) {
d07db9884a5fba Patrick McHardy   2015-04-11  149  	case NFPROTO_IPV4:
d07db9884a5fba Patrick McHardy   2015-04-11  150  		alen = FIELD_SIZEOF(struct nf_nat_range, min_addr.ip);
d07db9884a5fba Patrick McHardy   2015-04-11  151  		break;
d07db9884a5fba Patrick McHardy   2015-04-11  152  	case NFPROTO_IPV6:
d07db9884a5fba Patrick McHardy   2015-04-11  153  		alen = FIELD_SIZEOF(struct nf_nat_range, min_addr.ip6);
d07db9884a5fba Patrick McHardy   2015-04-11  154  		break;
d07db9884a5fba Patrick McHardy   2015-04-11  155  	default:
1a53a31cdd778d Pablo Neira Ayuso 2021-10-25  156  		if (tb[NFTA_NAT_REG_ADDR_MIN])
d07db9884a5fba Patrick McHardy   2015-04-11  157  			return -EAFNOSUPPORT;
1a53a31cdd778d Pablo Neira Ayuso 2021-10-25  158  		break;
d07db9884a5fba Patrick McHardy   2015-04-11  159  	}
a4c2e8beba8432 Patrick McHardy   2014-03-07  160  	priv->family = family;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  161  
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  162  	if (tb[NFTA_NAT_REG_ADDR_MIN]) {
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  163  		priv->sreg_addr_min =
b1c96ed37ceeef Patrick McHardy   2015-04-11  164  			nft_parse_register(tb[NFTA_NAT_REG_ADDR_MIN]);
d07db9884a5fba Patrick McHardy   2015-04-11 @165  		err = nft_validate_register_load(priv->sreg_addr_min, alen);
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  166  		if (err < 0)
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  167  			return err;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  168  
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  169  		if (tb[NFTA_NAT_REG_ADDR_MAX]) {
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  170  			priv->sreg_addr_max =
b1c96ed37ceeef Patrick McHardy   2015-04-11  171  				nft_parse_register(tb[NFTA_NAT_REG_ADDR_MAX]);
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  172  
d07db9884a5fba Patrick McHardy   2015-04-11  173  			err = nft_validate_register_load(priv->sreg_addr_max,
d07db9884a5fba Patrick McHardy   2015-04-11  174  							 alen);
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  175  			if (err < 0)
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  176  				return err;
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  177  		} else {
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  178  			priv->sreg_addr_max = priv->sreg_addr_min;
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  179  		}
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  180  	}
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  181  
d07db9884a5fba Patrick McHardy   2015-04-11  182  	plen = FIELD_SIZEOF(struct nf_nat_range, min_addr.all);
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  183  	if (tb[NFTA_NAT_REG_PROTO_MIN]) {
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  184  		priv->sreg_proto_min =
b1c96ed37ceeef Patrick McHardy   2015-04-11  185  			nft_parse_register(tb[NFTA_NAT_REG_PROTO_MIN]);
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  186  
d07db9884a5fba Patrick McHardy   2015-04-11  187  		err = nft_validate_register_load(priv->sreg_proto_min, plen);
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  188  		if (err < 0)
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  189  			return err;
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  190  
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  191  		if (tb[NFTA_NAT_REG_PROTO_MAX]) {
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  192  			priv->sreg_proto_max =
b1c96ed37ceeef Patrick McHardy   2015-04-11  193  				nft_parse_register(tb[NFTA_NAT_REG_PROTO_MAX]);
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  194  
d07db9884a5fba Patrick McHardy   2015-04-11  195  			err = nft_validate_register_load(priv->sreg_proto_max,
d07db9884a5fba Patrick McHardy   2015-04-11  196  							 plen);
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  197  			if (err < 0)
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  198  				return err;
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  199  		} else {
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  200  			priv->sreg_proto_max = priv->sreg_proto_min;
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  201  		}
61cfac6b42af98 Pablo Neira Ayuso 2014-10-16  202  	}
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  203  
e42eff8a32f8b7 Arturo Borrero    2014-09-04  204  	if (tb[NFTA_NAT_FLAGS]) {
e42eff8a32f8b7 Arturo Borrero    2014-09-04  205  		priv->flags = ntohl(nla_get_be32(tb[NFTA_NAT_FLAGS]));
e42eff8a32f8b7 Arturo Borrero    2014-09-04  206  		if (priv->flags & ~NF_NAT_RANGE_MASK)
cc8272882c3dad Pablo Neira Ayuso 2020-09-22  207  			return -EOPNOTSUPP;
e42eff8a32f8b7 Arturo Borrero    2014-09-04  208  	}
e42eff8a32f8b7 Arturo Borrero    2014-09-04  209  
20afd423976ef3 Florian Westphal  2016-11-15  210  	return nf_ct_netns_get(ctx->net, family);
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  211  }
eb31628e37a0a4 Tomasz Bursztyka  2013-10-10  212  

:::::: The code at line 165 was first introduced by commit
:::::: d07db9884a5fba8c8020166c86183c79a18d066a netfilter: nf_tables: introduce nft_validate_register_load()

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
