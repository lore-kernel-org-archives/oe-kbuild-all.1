Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6723D7E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718203197; cv=none; b=gzEkHpQG+pOaiopiLkZ94pCtC4CfhhdxuLXntGYTZqBUPx/GEf8ReuPgoz4+Wmqs3BDCyk1bm3QYOAyQe0r584KOoo1AaMhL95i1EZjRhL81o2rJUUa3C4199eCls/Zhz4IDqJJ6jzkBQXCNqK6k8IFAWy9kqla20Olcx4uOhPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718203197; c=relaxed/simple;
	bh=C8Pf6TJnvxaJ4Nn4K66aAeGYlXGVGIeUuoWkgeaYxbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YKNT0bD9AN8Jh9zkO6EZm48CNWvzMAoajJz5FXG/xtDolIBspvTgIHY0Yb4Y6aobZcBtKgvwWeja7SLbw5GyPDh+5dnJ1IyWiJxJt3kc5ohnvGvO1rkeC2PihM6RzIylPDAzEMVAc54ipKMoPcRxqAsRyMK0wALsz9hMxxNjHqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yx59APT7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yx59APT7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4217990f997so37867495e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203194; x=1718807994; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ek4Yz+vlANPAH4c/dw08+ma76dKbUBNCWTM+vTMJPkg=;
        b=Yx59APT7PzcFBu091HgnXtK3bXq8fSf486PlTUNz1a1+a6MnZ44dNshzKrhCPNv545
         29u9SB1EUC+nLlQuKL1PWDNjka3ZQXIv/K7Pfvp8Ck7r7BUlO284va1V80SzIEduZ/Oo
         j9C4Cw/lTcKBttjI2wCuFzVRQJxGKi0AYV6jgvBj9wKXQX7OAAmVtLDID1SDCDRdnKAE
         JNzg+70VgGAF8kWF/FJGJ4fIWv4xOVDq3klf6sDDrsfx4WaDHQKTrCA0W3274zRDbDO+
         axeDbBcKdZu5ai7CbEBnMwzYqPtQNMYUkzo8JWx2DvZE/00jVlFkHyAVVVaiLrpoiEvp
         CqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203194; x=1718807994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ek4Yz+vlANPAH4c/dw08+ma76dKbUBNCWTM+vTMJPkg=;
        b=tLfpL+ys7HfxdW2B5bHFceTzSdaeZ8NNZZSTAOHTNKs5RS+82b+JsNtR31g4Ykbtpm
         dFvMFoiO/OiCxleeT/wwn/OSx56rR/iHC7WvpKJYj01loXiTZJoywZhvgP9dP8uCZ+VZ
         4MJihnQ13g+APt4eD0LL1daaQ+0A5lBwIzNrCka1MLjpPe/KqVhkELZHMfXPRKUX9L6N
         oweZHSTWXbwIGxKJlXYNL8lOwtemgTxwSY+rnzQvPdjaI3xDZBs01e2pgheJhgZae3P7
         G3UnisiOwWeyni7OBrS6NiwhohWxqmCpmU2h/UlK5NGXazNHTBO3MdJmuEryDuP0cMVZ
         hfPA==
X-Forwarded-Encrypted: i=1; AJvYcCXP1LTQ4Chw/sRzNUe260X5sYLAR1UHHOc+Kk4mkJwp59BM66escAb8MwwenkFsLt7WGwq/JgZG8n8k0bY/xdIGcpnY0e2fDh9nDwFWlQ==
X-Gm-Message-State: AOJu0YwxV4gKtjbjOJsOuyj5FwwFTQWMgF/1oEZ3wFEq+XyXugteGvQQ
	9f3scia5I2U6Mv/oPXHQhRiCiFF8GSVf+Z/r1dMgD4rAoJo+Cvl4clNE0AvTDl2PrkHJOluR3r2
	2
X-Google-Smtp-Source: AGHT+IHoBqFVkLgUfa4fzrXbQ2MvOOSCUpnqYXpdqs629Xjbqw2VXrzEMNGPqVF9CCj+Druqiqe2WA==
X-Received: by 2002:a05:600c:314e:b0:422:140:f440 with SMTP id 5b1f17b1804b1-422867c0b23mr18811025e9.36.1718203193587;
        Wed, 12 Jun 2024 07:39:53 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm29485865e9.38.2024.06.12.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:39:53 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:39:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-reservations 6/12] mm/slub.c:5551
 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns
 '&s->reserve_lock'.
Message-ID: <0682f0c0-41bd-482e-8ea9-6a676766ef34@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-reservations
head:   f5877f7833fc9f8a236be339ae5bbcccdde7c850
commit: 17f60c99bf92fbf1ed52e1c492f46cec91d14cd5 [6/12] mm, slub: implement per-cache reserves
config: x86_64-randconfig-161-20240612 (https://download.01.org/0day-ci/archive/20240612/202406122208.joPiUJJy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406122208.joPiUJJy-lkp@intel.com/

smatch warnings:
mm/slub.c:5551 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns '&s->reserve_lock'.
mm/slub.c:5551 kmem_cache_reserve_only_alloc_noprof() warn: inconsistent returns 'flags'.

vim +5551 mm/slub.c

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5512  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5513  void *kmem_cache_reserve_only_alloc_noprof(struct kmem_cache_reserve *reserve,
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5514  					   gfp_t gfp)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5515  {
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5516  	struct kmem_cache *s = reserve->cache;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5517  	unsigned long flags;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5518  	void *obj = NULL;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5519  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5520  	spin_lock_irqsave(&s->reserve_lock, flags);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5521  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5522  	if (!reserve->size && !s->reserve_surplus)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5523  		goto empty_reserve;

spin_unlock_irqrestore(&s->reserve_lock, flags);

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5524  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5525  	/*
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5526  	 * Should not happen, the kmem_cache reserve_size should be sum of all
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5527  	 * active struct kmem_cache_reserve's size and the shared surplus
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5528  	 */
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5529  	if (WARN_ON_ONCE(!s->reserve_size))
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5530  		goto empty_reserve;

spin_unlock_irqrestore(&s->reserve_lock, flags)

17f60c99bf92fbf Vlastimil Babka 2024-05-31  5531  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5532  	obj = s->reserve_freelist;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5533  	s->reserve_freelist = get_freepointer(s, obj);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5534  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5535  	s->reserve_size--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5536  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5537  	if (s->size)
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5538  		reserve->size--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5539  	else
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5540  		s->reserve_surplus--;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5541  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5542  	spin_unlock_irqrestore(&s->reserve_lock, flags);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5543  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5544  	slab_post_alloc_hook(s, NULL, gfp, 1, &obj,
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5545  		slab_want_init_on_alloc(gfp, s), s->object_size);
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5546  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5547  	/* paired with smp_rmb() in kmem_cache_reserve_free() */
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5548  	smp_wmb();
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5549  
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5550  empty_reserve:
17f60c99bf92fbf Vlastimil Babka 2024-05-31 @5551  	return obj;
17f60c99bf92fbf Vlastimil Babka 2024-05-31  5552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

