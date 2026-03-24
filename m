Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4C3DB653
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343463; cv=none; b=WLkffhIERo7gYwg1klniqF/fM2Z2xXAR4W/OTrQkaa/EQAmrh0TXpR0kk/E+VycdlkjgCE4Fxe6qK2y2uyl9HXh9tin7X6j/GkXrViZ2AoTbvXeeU9j6vnCPt9qoFv8NeqilYhsLh+CFF2tRmjp5azrJiF7QqmPN/LG2FGiRM8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343463; c=relaxed/simple;
	bh=kdMOtPk2CJNdzK5TAPoFyAepYVoHlWSZWSQYeczlyIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eyuFD2bfc4rSbZMkWb2uNVZ8V67utrUu791IKk7SQ7RPFyOvhKyEKQSPQWRi1wxwy1WQ4ALrmoqab1L7TWF1Haje757FtEa4kwgf5DFQzO2FMnlg+1fe4SHisrZ0WoHYu7zQH+wXebLVNypELDSiKnC9hFgO21Kt8TF/9NyaXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eo5BJLvn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eo5BJLvn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48538c5956bso46600165e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774343454; x=1774948254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySFCnBOOL5CefvlohZg7FDp7ZB+X1Q7Muut2F1vaWbU=;
        b=eo5BJLvnO5HzkEInaN1YXqsTUSaRuYjQkm3E0qZe8P5LgVfRzSGgP3BqLSbFJc4/3V
         j9rR9dfLCQmT3uZrso0Ax2sIrBnx7gIHy3JqeMt5VlowFNfCa/KTuZW//NCeZdCUOe2+
         VRVwjnNwYhfbUGZK/6/LfpVDXHaYO7cri5Gyo2NGzITr+z1Ked0ycKL2jq/KDlFxeb4j
         yizfeMNIvPdxANcnFU0/edtaJBQ7KHDOT1xWUYPbaDM+E2dbnZHBQoC8Xi6M0GHO42a5
         ev2UeIy7yvXJn0FVqBxnGa0BJZVaUvZfDvkQfcUE5r/kBE/DBChAgxyaS6z5EdPgUhHw
         G3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343454; x=1774948254;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySFCnBOOL5CefvlohZg7FDp7ZB+X1Q7Muut2F1vaWbU=;
        b=UV3ojdxmZwnRIghTALtVWKK1qeEUX3UhroKvkOQTOMgSdu6gSYT4KwdFnGEdUNH1Vg
         SAxdhmL48SyGDTFagM+Z6GSgzP/mTcj+Tnt7dA5xjf1/+sUxIl2hB+xyIvRjpmo5kdd9
         /Cdj/cyIaUkv/2SrD1yQ3a8nQ1GG7FM+YojkcAqdDdWeT0M9tkJvFPylgYmesumAKDEe
         mQZPJtRerWFvuiyoQe+GH0RT9ye2bz3bhRHqrDa7eq7yZYNa4bCm53z7eZXsvCpo8BvZ
         FGQhzkItuyPAKo3yK53WEJGGKQyB39LLLL2xLo/BHgKec7TUzrrgjsYCkJ2WM2xgdcRI
         sJNg==
X-Forwarded-Encrypted: i=1; AJvYcCXyqCeQRS9bwo9urjpZe//NXtOYUC41XarckmC6xkmXR0AdlKFcoKa2posgSpWn3BNbZxTJ27ZtAGnJ/F8R@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Y/9/2kqNEt40FSI1yCRZxT68DUeJ165gel/91PzN0Ml5qw8e
	M2r0KXgMrqRb+aTs/nqFB0X6OHrRkwYxj9SZ9zGSK2wa9JtJUIW+/xqoIhoFmiPvKso=
X-Gm-Gg: ATEYQzy42+obtu51gkPI1om/pc8zIpOlkgsMhkrQv6fZqVZDliSOxDhTszSSDW5NDK4
	V4pOkMYU4lYnukaE5hhVWfY005SLFMG6ZuPOlefZEbIMhSYjb7Yb0Zzt37inV3IyckGMYzrw4IC
	1OoUBZjymodod3l6cm6gZoTSNbgIdtkEXhfQGm+GEWr+F5qBkBZWSFYBKqPuq568NMgCa2hiYm1
	st/jy2MWxwjRs5nzJYPl/T/YzxK9+B3+6Uw4l94h/nJVwwEUri0/vNuwBmOcMAh9QHYw/VHsiTX
	GRprg8FWsWVuw7OOy7I/0Iz0IAeXodm3ljPShDz0pFv8qV95UNAWjyfvphORPSrgGqXNm2haGjr
	QotjWU5l2XUsS4RibwJ2WxaSo9G39gUcOvbjbKTH0ASNvSjr0UW1SsZsHKFvD5Af+cmHWHaBfR9
	4E1pk46xQYkFZa78d074xvD72iY8LbxrJyqic1/II=
X-Received: by 2002:a05:600c:154b:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-4870f212c1emr37488815e9.13.1774343454041;
        Tue, 24 Mar 2026 02:10:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2desm44785325e9.9.2026.03.24.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:10:53 -0700 (PDT)
Date: Tue, 24 Mar 2026 12:10:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Carlier <devnexen@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Carlier <devnexen@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/memcontrol: fix obj_cgroup leak in
 mem_cgroup_css_online() error path
Message-ID: <202603241635.qNXDPwjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322164943.37460-1-devnexen@gmail.com>

Hi David,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/David-Carlier/mm-memcontrol-fix-obj_cgroup-leak-in-mem_cgroup_css_online-error-path/20260324-010357
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260322164943.37460-1-devnexen%40gmail.com
patch subject: [PATCH] mm/memcontrol: fix obj_cgroup leak in mem_cgroup_css_online() error path
config: arm64-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241635.qNXDPwjs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603241635.qNXDPwjs-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:4180 mem_cgroup_css_online() warn: variable dereferenced before check 'pn' (see line 4176)

vim +/pn +4180 mm/memcontrol.c

6f0df8e16eb543 Johannes Weiner  2023-08-23  4168  	 * regular ID destruction during offlining.
6f0df8e16eb543 Johannes Weiner  2023-08-23  4169  	 */
e77786b4682e69 Shakeel Butt     2025-12-25  4170  	xa_store(&mem_cgroup_private_ids, memcg->id.id, memcg, GFP_KERNEL);
6f0df8e16eb543 Johannes Weiner  2023-08-23  4171  
2f7dd7a4100ad4 Johannes Weiner  2014-10-02  4172  	return 0;
098fad3e1621cb Qi Zheng         2026-03-05  4173  free_objcg:
098fad3e1621cb Qi Zheng         2026-03-05  4174  	for_each_node(nid) {
098fad3e1621cb Qi Zheng         2026-03-05  4175  		struct mem_cgroup_per_node *pn = memcg->nodeinfo[nid];
59f75a1877fbf7 David Carlier    2026-03-22 @4176  		objcg = rcu_replace_pointer(pn->objcg, NULL, true);
                                                                                            ^^^^^^^^^
Dereference

59f75a1877fbf7 David Carlier    2026-03-22  4177  		if (objcg)
59f75a1877fbf7 David Carlier    2026-03-22  4178  			percpu_ref_kill(&objcg->refcnt);
098fad3e1621cb Qi Zheng         2026-03-05  4179  
4a2f95f5c79e02 Qi Zheng         2026-03-09 @4180  		if (pn && pn->orig_objcg) {
                                                                    ^^
Checked too late.

098fad3e1621cb Qi Zheng         2026-03-05  4181  			obj_cgroup_put(pn->orig_objcg);
4a2f95f5c79e02 Qi Zheng         2026-03-09  4182  			/*
02b5fc7885d9f8 Andrew Morton    2026-03-09  4183  			 * Reset pn->orig_objcg to NULL to prevent
02b5fc7885d9f8 Andrew Morton    2026-03-09  4184  			 * obj_cgroup_put() from being called again in
02b5fc7885d9f8 Andrew Morton    2026-03-09  4185  			 * __mem_cgroup_free().
4a2f95f5c79e02 Qi Zheng         2026-03-09  4186  			 */
4a2f95f5c79e02 Qi Zheng         2026-03-09  4187  			pn->orig_objcg = NULL;
4a2f95f5c79e02 Qi Zheng         2026-03-09  4188  		}
098fad3e1621cb Qi Zheng         2026-03-05  4189  	}
a0dd8b1942f5bf Muchun Song      2026-03-05  4190  	free_shrinker_info(memcg);
da0efe30944476 Muchun Song      2022-03-22  4191  offline_kmem:
da0efe30944476 Muchun Song      2022-03-22  4192  	memcg_offline_kmem(memcg);
e77786b4682e69 Shakeel Butt     2025-12-25  4193  	mem_cgroup_private_id_remove(memcg);
da0efe30944476 Muchun Song      2022-03-22  4194  	return -ENOMEM;
8cdea7c0545426 Balbir Singh     2008-02-07  4195  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

