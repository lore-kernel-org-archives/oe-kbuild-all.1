Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501DA224D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917235; cv=none; b=iHKhn3IPb9CQ5pST0ceJvl0wLuGZLZZQLzVBTFWkqjzxjI1/gI9phgv0SZG7nWWStwdz2PiT6K2mRSDAFUVSovL+V/T12K7PWpliPAexjrSSmmQoDTEiYUwttjZF8MG2bM5+o+sdibtd9t4o1cQA4TYGka12kY9tXzpg01kOf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917235; c=relaxed/simple;
	bh=9FfEe6OFoZbGDW96ysGr9WueOy8pWeEidYfbxgWJia8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ntDpztowqT/MadcD5CI6hnNBk7evmXarlSLsYsNFEAF2XF8FRoR9y97hHk2hFF7fXVLFzxlMfbC4j9hdZv67a46aeu1/3HQrswDvIA8hKHVmMlFiirjxBbUxN/2dt37IwFmvt474Ds6SVEXns34fh4ZorMn1olVLJm2ySTuMa1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sTYLvBUs; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sTYLvBUs"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-267b7ef154aso76263fac.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721917232; x=1722522032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=prd5gdrgcHUSJFCSq8IZ2hshSmuQhoOfgDLkcbCu/CA=;
        b=sTYLvBUsmZ1edryJwS95AMHlHBu3KPo1LoBU2JIfU+Wbkd5+0M7zDkWln4AMLcX1x8
         T8VsG9n3QyUPfvWfG4SNa+wk4NyHo9gc6yj1Q1lzGyDkBSo9Yap6okjFupTriO704xbQ
         cxiNXmSkEGkIdFO3Pukx3wRI8TW4X3mBtb03oxANJ7eLhIVrhUp9Tdue6FETLtc4Zm9h
         JkdXOQ2TOS1TJ5yxpZu+a7uhwv8YJ+WZmnJguk02j1YRjwzKH53VRX/nQnAN1vrF9jKd
         3HClNcNKmtsZ70JWPz69JtKdCd50bP49aW4Qy5/xixYUi9mtXwr7uwqYOxmyQkYjSS0u
         ix/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721917232; x=1722522032;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prd5gdrgcHUSJFCSq8IZ2hshSmuQhoOfgDLkcbCu/CA=;
        b=P4b3MSG8z9tus7gi4t+zCgi93ZC5mljdLetum3qCGf3WG3yRN59XJvPTfZqC4BvEQ5
         PpROsY8w7HUuM1O+eN4kOMk7VJes0jxEdCiXT8dX0NlQc1Cp4j1HRW+/S1nreAVf8iZP
         jftq2me3KLAEstdNy+cvu7ap3YYU2SWdPCIVKu63uYUYzDz3EFrLiIPei3II628uS2zS
         kvkjSOLcBaG4SNuMK/dPGeedHhv7gjVgjDzUJ/BgrqSlFUEJmO4HwATsa3M0mie0qOY9
         w11SGSbZD2jFT16yMgat1CIuyiJAUtkZJnzvs8Ju/Eo+cW8y0qnu6j4AjfrN24uMHBXn
         kDQw==
X-Forwarded-Encrypted: i=1; AJvYcCUVl2lW7mbkU7DDoB+eeWQzmGTiOimCuNw31zV2VaVUysgpIAZOljU/kTYWg1ErTNEqWNWD9/I5s61KXmiZNIRlUf7A3V954MDyyTVhnw==
X-Gm-Message-State: AOJu0YytrpJrNb0nil7SKodfk3GHXy/aESlrkdUyqOEGlFYjY325hh3C
	NkDLgGU3HoyV6Mfw8WCH3xYmw3w8oF17aENYyOYurKzIoBYnHs41E3OE1TNHIBM=
X-Google-Smtp-Source: AGHT+IHXHyIc8SqwgcHmP1Zzc5EJsSGYsj0nBJHepSqcD12lMbOQCY8PFrLdcGoB0XXjQK0n+q5kww==
X-Received: by 2002:a05:6870:4194:b0:254:c7f6:3294 with SMTP id 586e51a60fabf-264a0f74f45mr3610643fac.47.1721917232057;
        Thu, 25 Jul 2024 07:20:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6751:f2ec:fdb9:323e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2657723ada8sm291077fac.57.2024.07.25.07.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 07:20:31 -0700 (PDT)
Date: Thu, 25 Jul 2024 09:20:29 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Barry Song <21cnbao@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/5] non-mm: discourage the usage of __GFP_NOFAIL and
 encourage GFP_NOFAIL
Message-ID: <d1dda6c8-3091-48a6-b828-9d26ee79ef03@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724085544.299090-6-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/vpda-try-to-fix-the-potential-crash-due-to-misusing-__GFP_NOFAIL/20240724-170305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240724085544.299090-6-21cnbao%40gmail.com
patch subject: [PATCH RFC 5/5] non-mm: discourage the usage of __GFP_NOFAIL and encourage GFP_NOFAIL
config: i386-randconfig-141-20240725 (https://download.01.org/0day-ci/archive/20240725/202407251449.TnONiYn5-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407251449.TnONiYn5-lkp@intel.com/

New smatch warnings:
lib/rhashtable.c:192 bucket_table_alloc() warn: masked condition '(gfp & ~(((((((1))) << (10)) | ((((1))) << (11)))) | (((((1))) << (15))))) != (((((((1))) << (10)) | ((((1))) << (11)))) | (((((1))) << (6))) | (((((1))) << (7))))' is always true.

vim +192 lib/rhashtable.c

97defe1ecf868b Thomas Graf        2015-01-02  177  static struct bucket_table *bucket_table_alloc(struct rhashtable *ht,
b9ecfdaa1090b5 Herbert Xu         2015-03-24  178  					       size_t nbuckets,
b9ecfdaa1090b5 Herbert Xu         2015-03-24  179  					       gfp_t gfp)
7e1e77636e3607 Thomas Graf        2014-08-02  180  {
eb6d1abf1bd8bf Daniel Borkmann    2015-02-20  181  	struct bucket_table *tbl = NULL;
8f0db018006a42 NeilBrown          2019-04-02  182  	size_t size;
f89bd6f87a53ce Thomas Graf        2015-01-02  183  	int i;
149212f07856b2 NeilBrown          2019-04-02  184  	static struct lock_class_key __key;
7e1e77636e3607 Thomas Graf        2014-08-02  185  
9e54dd8b64dccd Kent Overstreet    2024-03-21  186  	tbl = alloc_hooks_tag(ht->alloc_tag,
9e54dd8b64dccd Kent Overstreet    2024-03-21  187  			kvmalloc_node_noprof(struct_size(tbl, buckets, nbuckets),
9e54dd8b64dccd Kent Overstreet    2024-03-21  188  					     gfp|__GFP_ZERO, NUMA_NO_NODE));
da20420f83ea0f Herbert Xu         2017-02-11  189  
da20420f83ea0f Herbert Xu         2017-02-11  190  	size = nbuckets;
da20420f83ea0f Herbert Xu         2017-02-11  191  
c61791509b08d1 Barry Song         2024-07-24 @192  	if (tbl == NULL && (gfp & ~GFP_NOFAIL) != GFP_KERNEL) {
                                                                                   ^^^^^^^^^^
GFP_KERNEL includes some NOFAIL bits so this condition doesn't work.

da20420f83ea0f Herbert Xu         2017-02-11  193  		tbl = nested_bucket_table_alloc(ht, nbuckets, gfp);
da20420f83ea0f Herbert Xu         2017-02-11  194  		nbuckets = 0;
da20420f83ea0f Herbert Xu         2017-02-11  195  	}
2d22ecf6db1c39 Davidlohr Bueso    2018-08-21  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

