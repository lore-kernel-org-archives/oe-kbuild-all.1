Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036861A239D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267620; cv=none; b=G+lIUfZWZwYAEQdTx/98MycsEDZze/wJKuIt/TZ3AV7MRfo9a/30lGREc/qgXFS5D20sr8jouq58gYX5xT0qKhUceD7iKEsu8ZmXEgS9nUU8Wy7USeCUP0DDpYVLjRUFyU/ta3mY6gT6cuPzdkjWTHVlP1EC05CHffB3FxPhap4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267620; c=relaxed/simple;
	bh=J+BqwMFmKcN19hQQ3aT9eKAwy1PnKrQMbSUnQLnRrRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=saaTADJb442+TKJToANRG5td+LaP0kw61xwGkIInHGCpaqkQsS2yOYN81DecKc56YuV009k4i13rmG1Q3tnkHok6P9HKntW/nMmERY2vMhhHi2R7x8Kaat8ZNEL/bm/oNDdcS5sYx5+gNO7yHGI+xr85rOuVKTIXQE6zUH/0UU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ocl897MR; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ocl897MR"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-736f9e352cbso4363172a34.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 10:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750267618; x=1750872418; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6p/EuXGOB6YYcPGLEVBf9Y7M5MlRj/BCkj3EsNFJrV8=;
        b=Ocl897MRUpzE66RW0f6kBVunC9BZp1b6npRC/srGbXtJTBjdHyPwyFlZn4+qo/2qoe
         HqKQq5Ghuhzl002rAQ6PtiNOaaMX/uoKgPXhZUxSWmoO79TOYghl73OBCyg2KRfQFi2E
         mxbB3FZe2YjvvAfXNCYBYLPXPf6rJPVRRHsPBzSnOnlQYN9XJH34c3AeuxPyDHOx4VjW
         J7iz1GQuFSI3lMsvuqU6T+qiAc+RYZ4m9btU3kD4BRf7E5SlOe1fLWhBTfOoOq/CP4b/
         eHk3GQFVfVbYmOmezVRUjwNyuzgBzXPlxg8lfDUSSoXTbRHQytkoZ9dnL3irO7c+4um2
         5/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267618; x=1750872418;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6p/EuXGOB6YYcPGLEVBf9Y7M5MlRj/BCkj3EsNFJrV8=;
        b=aN+bJSIDSxv5/ok1fKC0DDQXGkQLMTps1BQIQ6s5cxZtB0fCPcEBNzC4XGMmGFHbtz
         F7g7hygGQnlbt7Zo0z8gpm088q0XwVZd7MJ26MCiQnshYbJTOZ4amcuDynbD5b7xJrjL
         97/VeNaEFk16Et58+VFU80O2+zqrqBwJhX5NkYoS+fbp3Xa40928Ozl5SPtw/pF9qWYg
         ofXeMKWKoQKPTz/NoRzoAHlBrG7+Ur63TBjZ8/mMg5H7ECGVBgOwFy0B22nZ+i2aUPXM
         jcht/wxNCN9slngSfLmziVCCvO9CUeP4ISlic+LacFi3dZchQn4vBCV2OfiygwnA0Rj/
         272A==
X-Forwarded-Encrypted: i=1; AJvYcCWBKEUep1dUN3RUjZrp4MY9OV0vE+YKh1oRaJR2f2TB2vM4JKj2D41kXO30gS2pS63MUPmogKGNL1AACf0Z@lists.linux.dev
X-Gm-Message-State: AOJu0YyTrn0Mg5ZFdc5jKmy1wxxIsuLBgjT/HWipfYjzwYHtLQIJmMVJ
	4rWb7NbyowLrGMo/R2WxWOqyhE498yzvzb24FlCZoFFSmA5eNwkLJlHykVgsw8YfJkA=
X-Gm-Gg: ASbGnctcEwM48bae1tUptVjAZ11xCWrwRCu8J8F54EbPGaGjwWlgKjpooDQsp7yo80L
	saH0t5tzjnwFg0FEVAzIG+6qs4QB6G/iZs24jdtpIeDd0CEYkV2CWHk6mDZO+oZYCLC4qfE0Me4
	53Z5IVYVO/2zNiF6UR4MWgq39SGF9XPmlN5d0fgKIRv3uA+zdZ01fKEtWThRv7/lkqBMAKzKOYF
	ODRqD0b6coVp55wKKNW72pjD3NUhzK6PIMmiuwNcAKhaHLYBn/OVmLhxcu/3XTssv2o67OvDFUB
	pMqfBOwvbCWSuNCYWPtrHWssQxh+iYHmXL9+9kiNKIMcKRUDb9RzQdZMyCirYPHZfYkk7g==
X-Google-Smtp-Source: AGHT+IFP0GuBKlRwXw2OJNEzq9cywJo2wUE5iUpl+qcRNZHJ6Edt+/XzOGWu0ECCFUNYcg28rXeKvA==
X-Received: by 2002:a05:6830:6219:b0:735:b4ef:acaf with SMTP id 46e09a7af769-73a36405b46mr12502515a34.27.1750267618055;
        Wed, 18 Jun 2025 10:26:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a284039bdsm2037108a34.22.2025.06.18.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:26:57 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:26:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 12/13] net: mctp: add gateway routing support
Message-ID: <c336c490-e002-48a8-bda7-b095ebde4c33@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-dev-forwarding-v1-12-6b69b1feb37f@codeconstruct.com.au>

Hi Jeremy,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-mctp-don-t-use-source-cb-data-when-forwarding-ensure-pkt_type-is-set/20250611-143319
base:   0097c4195b1d0ca57d15979626c769c74747b5a0
patch link:    https://lore.kernel.org/r/20250611-dev-forwarding-v1-12-6b69b1feb37f%40codeconstruct.com.au
patch subject: [PATCH net-next 12/13] net: mctp: add gateway routing support
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250613/202506131515.a5tCsTj0-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506131515.a5tCsTj0-lkp@intel.com/

New smatch warnings:
net/mctp/route.c:1381 mctp_route_nlparse_common() error: uninitialized symbol 'gateway'.

vim +/gateway +1381 net/mctp/route.c

33d33bef994e518 Jeremy Kerr   2025-06-11  1350  static int mctp_route_nlparse_common(struct net *net, struct nlmsghdr *nlh,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1351  				     struct netlink_ext_ack *extack,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1352  				     struct nlattr **tb, struct rtmsg **rtm,
33d33bef994e518 Jeremy Kerr   2025-06-11  1353  				     struct mctp_dev **mdev,
75626016e50cb9a Jeremy Kerr   2025-06-11  1354  				     struct mctp_fq_addr *gatewayp,
33d33bef994e518 Jeremy Kerr   2025-06-11  1355  				     mctp_eid_t *daddr_start)
06d2f4c583a7d89 Matt Johnston 2021-07-29  1356  {
75626016e50cb9a Jeremy Kerr   2025-06-11  1357  	struct mctp_fq_addr *gateway;
75626016e50cb9a Jeremy Kerr   2025-06-11  1358  	unsigned int ifindex = 0;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1359  	struct net_device *dev;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1360  	int rc;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1361  
06d2f4c583a7d89 Matt Johnston 2021-07-29  1362  	rc = nlmsg_parse(nlh, sizeof(struct rtmsg), tb, RTA_MAX,
06d2f4c583a7d89 Matt Johnston 2021-07-29  1363  			 rta_mctp_policy, extack);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1364  	if (rc < 0) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1365  		NL_SET_ERR_MSG(extack, "incorrect format");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1366  		return rc;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1367  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1368  
06d2f4c583a7d89 Matt Johnston 2021-07-29  1369  	if (!tb[RTA_DST]) {
06d2f4c583a7d89 Matt Johnston 2021-07-29  1370  		NL_SET_ERR_MSG(extack, "dst EID missing");
06d2f4c583a7d89 Matt Johnston 2021-07-29  1371  		return -EINVAL;
06d2f4c583a7d89 Matt Johnston 2021-07-29  1372  	}
06d2f4c583a7d89 Matt Johnston 2021-07-29  1373  	*daddr_start = nla_get_u8(tb[RTA_DST]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1374  
75626016e50cb9a Jeremy Kerr   2025-06-11  1375  	if (tb[RTA_OIF])
06d2f4c583a7d89 Matt Johnston 2021-07-29  1376  		ifindex = nla_get_u32(tb[RTA_OIF]);
06d2f4c583a7d89 Matt Johnston 2021-07-29  1377  
75626016e50cb9a Jeremy Kerr   2025-06-11  1378  	if (tb[RTA_GATEWAY])
75626016e50cb9a Jeremy Kerr   2025-06-11  1379  		gateway = nla_data(tb[RTA_GATEWAY]);

Unitialized on else path

06d2f4c583a7d89 Matt Johnston 2021-07-29  1380  
75626016e50cb9a Jeremy Kerr   2025-06-11 @1381  	if (ifindex && gateway) {
                                                                       ^^^^^^^
warning.

75626016e50cb9a Jeremy Kerr   2025-06-11  1382  		NL_SET_ERR_MSG(extack,
75626016e50cb9a Jeremy Kerr   2025-06-11  1383  			       "cannot specify both ifindex and gateway");
33d33bef994e518 Jeremy Kerr   2025-06-11  1384  		return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

