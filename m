Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB0125D5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721831102; cv=none; b=uGgn+6uLeYOribY8Y3YBXB9PpyJC/ThcOrsLPhs9DVdgWuzCL6o8xPeyPKHMCkDpGGaiFXVsRHW1h92uBPHLhMsdG/+CeT0+fdzugNQLTC441NACon9Pc2anRVkjQ2EzhPlCJGTQZg2Aj6Vl7Yz4kVrwXUc2LofRrLG4crxLguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721831102; c=relaxed/simple;
	bh=sDU91G80dZXsGb0ZiflDTQoONrOqeE8samgK2FkwiLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNEmUCLJNCXfte8yKBFKSAuKnEb15YLX5mjQEQ9Se3HOxXbV+Plr9J/3tDASfJsXMi2GWtaoZt4VH48VDmd0Vcbr/mtpo3D8YDDj0UTswKA9ur0julEVJu6QsAgoIy5LthbteKh1iXyH30mcz7ZfqDmt+AOtqOp4oGmdliEuGl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PFNDTiWv; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PFNDTiWv"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-703775e4d5dso3211772a34.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721831100; x=1722435900; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r8MOplKzAIFnTgQM/CxCQr9nzneUD1wo8tBszVKfkSQ=;
        b=PFNDTiWvk6WHQW+7E0I5fL+TfrRni5JuBppdak6aNSJizJYFME/wOElBQgvFQ4lhi2
         Y63ezOZoMGnxi4MCp0Nhl4oHPPaBXjSB8T4e8uUVRenfCx1TfCxQldDoArQqLHvxx2yk
         tHF4JEjtydMNbmUfELU4Qc1okQ9QVCzJjeK0LPaXewOyYeMF8XPAy6HKeZ4CD1NK7pKJ
         L7H7BK+Ft9+onj4Yl9gOJJQnw98xbMAhANys5O6lpm6z9rF4lc3t9D+Cti68OxxndbAF
         xXWqEtznublvuI8OSIzbv+wIH4rAVzJ8lcvbvcdhNScM7mXGNDnwF+wwoQMOWHJ26HUX
         q8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721831100; x=1722435900;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r8MOplKzAIFnTgQM/CxCQr9nzneUD1wo8tBszVKfkSQ=;
        b=S0UcU+Msss9ynoCJE5pAq0LTTLlJr1sb9EfZuvVbywzXKHpDiPAe18u7VR8+RrYRON
         5CY3I9T/M4cxnZRJFsMFXJVzaIb5vl9QhJPJunaJ9cUx55cfc6K1REMrRuV9syJUsKW9
         40BgakFHdmFDK04SkONKj0wvrdpaeazCcjdrC0hn+aw+TtOE22GCcGHFL4zSy7Yi5CFR
         cwVK4TYTLCGL64vheTyILt9doDSUPp2O2P+N8RQlAGULxVoHCc+xcU1xMHwmDpQ0Crnp
         N/guzVGUHUXL/jNsxcdvvTjSlcYw3g5xjUYo3n+hKv9YR2pyNwM0MVEIyJqjeDz9jzZs
         Tjdg==
X-Forwarded-Encrypted: i=1; AJvYcCVBXV65pFn0MMvfrczm9Vdt/IRQUl5rVM6kBP/xCVNGcN8fSC5jRK64HUP+XKSHz6QKHjrlPIpD8M/nlOkMCVVqiou4xXz+THM8pjEUhg==
X-Gm-Message-State: AOJu0YxShpx8vSROtxo0whUaBQVuWhM5kaglNC2JV+yMKI6zbX/t6QQM
	sb0sr3j7JoHrknJtWq9XFRAzzHQHIb7oqJaANAbonr4qVhWiiJ091dqOjTBGd38=
X-Google-Smtp-Source: AGHT+IFI2BDoIa/+iKOLzE/pJc4iNbZ3M4MazS5pmfchACCg3odywZB3tTs+xE9jHF/nsfupzmBIkw==
X-Received: by 2002:a05:6870:b493:b0:25e:12b9:be40 with SMTP id 586e51a60fabf-263ab55a7ccmr13766021fac.25.1721831099963;
        Wed, 24 Jul 2024 07:24:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:eca3:bb93:d28d:1005])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c715436sm2662130fac.1.2024.07.24.07.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 07:24:59 -0700 (PDT)
Date: Wed, 24 Jul 2024 09:24:57 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ido Schimmel <idosch@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 16/26] net/ipv4/nexthop.c:895
 nla_put_nh_group() warn: right shifting more than type allows 16 vs 16
Message-ID: <cd9f0a7c-6ed5-43eb-a9e8-f9407d17c795@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   965a9e1af54d436b4c96de99d7b070d8c5975fdf
commit: 2ea1151c7eb7f0c76d0cea4bf605f6ff2229c074 [16/26] net: nexthop: Increase weight to u16
config: i386-randconfig-141-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241208.PucVQezH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407241208.PucVQezH-lkp@intel.com/

smatch warnings:
net/ipv4/nexthop.c:895 nla_put_nh_group() warn: right shifting more than type allows 16 vs 16

vim +895 net/ipv4/nexthop.c

95fedd7685912f9 Ido Schimmel 2024-03-06  867  static int nla_put_nh_group(struct sk_buff *skb, struct nexthop *nh,
360a094e12892e2 Petr Machata 2024-07-23  868  			    u32 op_flags, u32 *resp_op_flags)
430a049190de3c9 David Ahern  2019-05-24  869  {
95fedd7685912f9 Ido Schimmel 2024-03-06  870  	struct nh_group *nhg = rtnl_dereference(nh->nh_grp);
430a049190de3c9 David Ahern  2019-05-24  871  	struct nexthop_grp *p;
430a049190de3c9 David Ahern  2019-05-24  872  	size_t len = nhg->num_nh * sizeof(*p);
430a049190de3c9 David Ahern  2019-05-24  873  	struct nlattr *nla;
430a049190de3c9 David Ahern  2019-05-24  874  	u16 group_type = 0;
2ea1151c7eb7f0c Petr Machata 2024-07-23  875  	u16 weight;
                                                ^^^^^^^^^^

430a049190de3c9 David Ahern  2019-05-24  876  	int i;
430a049190de3c9 David Ahern  2019-05-24  877  
360a094e12892e2 Petr Machata 2024-07-23  878  	*resp_op_flags |= NHA_OP_FLAG_RESP_GRP_RESVD_0;
360a094e12892e2 Petr Machata 2024-07-23  879  
de1d1ee3e3e9f02 Petr Machata 2021-03-26  880  	if (nhg->hash_threshold)
430a049190de3c9 David Ahern  2019-05-24  881  		group_type = NEXTHOP_GRP_TYPE_MPATH;
a2601e2b1e7ecd3 Petr Machata 2021-03-11  882  	else if (nhg->resilient)
a2601e2b1e7ecd3 Petr Machata 2021-03-11  883  		group_type = NEXTHOP_GRP_TYPE_RES;
430a049190de3c9 David Ahern  2019-05-24  884  
430a049190de3c9 David Ahern  2019-05-24  885  	if (nla_put_u16(skb, NHA_GROUP_TYPE, group_type))
430a049190de3c9 David Ahern  2019-05-24  886  		goto nla_put_failure;
430a049190de3c9 David Ahern  2019-05-24  887  
430a049190de3c9 David Ahern  2019-05-24  888  	nla = nla_reserve(skb, NHA_GROUP, len);
430a049190de3c9 David Ahern  2019-05-24  889  	if (!nla)
430a049190de3c9 David Ahern  2019-05-24  890  		goto nla_put_failure;
430a049190de3c9 David Ahern  2019-05-24  891  
430a049190de3c9 David Ahern  2019-05-24  892  	p = nla_data(nla);
430a049190de3c9 David Ahern  2019-05-24  893  	for (i = 0; i < nhg->num_nh; ++i) {
2ea1151c7eb7f0c Petr Machata 2024-07-23  894  		weight = nhg->nh_entries[i].weight - 1;
2ea1151c7eb7f0c Petr Machata 2024-07-23 @895  		WARN_ON_ONCE(!!(weight >> 16));
                                                                        ^^^^^^^^^^^^
Check is unnecessary.

2ea1151c7eb7f0c Petr Machata 2024-07-23  896  
8b06dd4ec057d91 Petr Machata 2024-07-18  897  		*p++ = (struct nexthop_grp) {
8b06dd4ec057d91 Petr Machata 2024-07-18  898  			.id = nhg->nh_entries[i].nh->id,
2ea1151c7eb7f0c Petr Machata 2024-07-23  899  			.weight = weight,
2ea1151c7eb7f0c Petr Machata 2024-07-23  900  			.weight_high = weight >> 8,
8b06dd4ec057d91 Petr Machata 2024-07-18  901  		};
430a049190de3c9 David Ahern  2019-05-24  902  	}
430a049190de3c9 David Ahern  2019-05-24  903  
a2601e2b1e7ecd3 Petr Machata 2021-03-11  904  	if (nhg->resilient && nla_put_nh_group_res(skb, nhg))
a2601e2b1e7ecd3 Petr Machata 2021-03-11  905  		goto nla_put_failure;
a2601e2b1e7ecd3 Petr Machata 2021-03-11  906  
95fedd7685912f9 Ido Schimmel 2024-03-06  907  	if (op_flags & NHA_OP_FLAG_DUMP_STATS &&
746c19a52ec50b8 Ido Schimmel 2024-03-06  908  	    (nla_put_u32(skb, NHA_HW_STATS_ENABLE, nhg->hw_stats) ||
5072ae00aea434d Ido Schimmel 2024-03-06  909  	     nla_put_nh_group_stats(skb, nh, op_flags)))
95fedd7685912f9 Ido Schimmel 2024-03-06  910  		goto nla_put_failure;
95fedd7685912f9 Ido Schimmel 2024-03-06  911  
430a049190de3c9 David Ahern  2019-05-24  912  	return 0;
430a049190de3c9 David Ahern  2019-05-24  913  
430a049190de3c9 David Ahern  2019-05-24  914  nla_put_failure:
430a049190de3c9 David Ahern  2019-05-24  915  	return -EMSGSIZE;
430a049190de3c9 David Ahern  2019-05-24  916  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

