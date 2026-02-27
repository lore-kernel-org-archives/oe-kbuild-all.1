Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19E43876BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219416; cv=none; b=Geq71MdQ2BauB3OX/98G0RnD8SPCOQprjr/LzvGru9d0m/gHGCE84kgGGWCv8tEBh1+qslUGeVEBBCka5Idqys8EZ/lFwKXe2GVf+8HvHBgsqB+WbxYGMTfcRAAkSeyGdx8BQ743FXED7CbV4dmeTr9v+HNseffOYdvIYhNkQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219416; c=relaxed/simple;
	bh=4MPwVFLb7FdsC/bC8bdINb9PPn+ZBuVEKeSqtxpxUYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPVMqf5KTp1vf0FyoGiWGiVmuU4Uv6fupOlXUk15z9l/G8hVu7+RkMQnGLuMu3rCi2Z4sZMntIi2comvGSzDuopeUGHdCjIZumT3d5IoQzvAEnIpdmspbnYwuYAbfTjJO3+MCVoRqeXS0K0jG/OuYd2KydEkQoR/oKzsQ6R8WNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFe4Atzu; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFe4Atzu"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45f015a3259so971164b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772219414; x=1772824214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh4Slgmg+UM8ULkOgNjOfZ5JCRqub7cSuOexnoiN0l4=;
        b=ZFe4AtzulbHfEqLNHqzD+QvUxLz54A17o3JIxZM+z/ycP63Z81oRsCIpxl+j7ilOCK
         XDOTfavYo5SEDGOG+SUv2sjb8F9URFrevuGBPmk6p3HsFpgGxS5jeGneU4v4fvX9hBfw
         TfJxPzXLgKYp4YC0VknbUN/z9AJp1L/nPFI1/E0KFL+QjbGMXjHkiHFNR5VRkZoM2fvT
         xs6paVEsg8/CPftFCgg5x/ciZH3l2qZkBVePtHPVTsU+XdpFLZIM+9TbpaoD6AWQhD7+
         uK2LBMh+vFunIoCSCE81S+MKEAojM+1fQgFSIrwWrVIt5OcItgyV7CwYB9wrAMt2hEz7
         kyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219414; x=1772824214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sh4Slgmg+UM8ULkOgNjOfZ5JCRqub7cSuOexnoiN0l4=;
        b=cOBVSS1fqF43G9l8fdGKxlIcaRctvJl57QsvwHBYQFonMNDkk7huqQaiP3l2368T4+
         4Q9b+FIDlvhQf6Z1q/VBG+2GZDEjbvEUHig2JP36rXWGVKA6cFHhJ2IwxnNc4Va2Jxff
         knQNzYpOCxuK26RcNFUyMaH3xubtg78pJdPuyhPnUFht4KKWnRw6KbCW4LOu754SF21s
         qrOtGER7WxbyKg1Ybg+iWZuj/VvJqVzQtVxj19F9S4/LbLgXFEPBdrfN82tTq8wr+wR8
         fymPSmpPmpgYJr+tiuDCp66dRvDbj0MEAB3Kp+vKMJhApESKGOGEVINxmqcfbq5wNJad
         zYoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyB1YQWKJnOIx7ErNdZicGgbMqZxkyPUaTYv0KOQweRrxA90fVgjqmj904rJa5L1GqkHGDcbKF5FUrwH99@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6OtVHlHozFsPpdJ8jWYQDBvaWnhK8Y8IgjxCTIPXyMx4xZHmu
	P3F8e8rWnJ27MLiI3YwQ2HLEUup4WWmq6n5vFrl0K3wdtXlqAgVFIFb8
X-Gm-Gg: ATEYQzwx+EU1jJyBp6cHyO4ZCxTmS7Ilx0mHCqynaGI1GmBoa4gFVNclPZSuhx2F5oc
	DAtnnJaV0ur2riuq0qMrP/7xs0/VNZzFSllXOLNMueiCxcoh1QtlByxAzGw8ZLneBtIN081Zn96
	1JU51k42VffdSB2Tmxu3Bw2++IJaH8L4bv/oA09xSlEkYngOCnEI/XC6XZkRnJLSqucOCIvm7rW
	NBFeOi8mXCCTP4lB15viZlMoFE+6RfkDps1qVJgWE0gBYqJbIvbYmmoG4KYxRFvsOU3aYOeaOS6
	6DmGzCH2qHgbCWKvBN/xTr1R0RsEvA3vCTbv1wGTt5toSb+Y3+EXNWQiPRmZ9p4IlYSGFCsyvIn
	dmQ5+0rl9/+jLaNSt2v/JDLVzNf7TdNmm5Nqs+nRj4/qom+jxbqZ+cCdcfo11Clax3uUPl4VNcS
	w3JIEm416JCccl8TGOoNZh
X-Received: by 2002:a05:6808:2205:b0:45e:a749:81ed with SMTP id 5614622812f47-464beceb3c7mr2131034b6e.25.1772219414489;
        Fri, 27 Feb 2026 11:10:14 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:9::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cff1aacsm5051639fac.9.2026.02.27.11.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:10:14 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	oe-kbuild-all@lists.linux.dev,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Nhat Pham <hoangnhat.pham@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 5/8] mm/zsmalloc,zswap: Redirect zswap_entry->obcg to zpdesc
Date: Fri, 27 Feb 2026 11:10:11 -0800
Message-ID: <20260227191012.144117-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <202602270738.SxqPEs3Q-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 27 Feb 2026 07:13:12 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Joshua,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on axboe/for-next]
> [also build test ERROR on linus/master v7.0-rc1 next-20260226]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-zsmalloc-Rename-zs_object_copy-to-zs_obj_copy/20260227-033239
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
> patch link:    https://lore.kernel.org/r/20260226192936.3190275-6-joshua.hahnjy%40gmail.com
> patch subject: [PATCH 5/8] mm/zsmalloc,zswap: Redirect zswap_entry->obcg to zpdesc
> config: x86_64-buildonly-randconfig-004-20260227 (https://download.01.org/0day-ci/archive/20260227/202602270738.SxqPEs3Q-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270738.SxqPEs3Q-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602270738.SxqPEs3Q-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mm/zswap.c: In function 'zswap_lru_add':
> >> mm/zswap.c:626:25: error: implicit declaration of function 'obj_cgroup_memcg'; did you mean 'obj_cgroup_get'? [-Wimplicit-function-declaration]
>      626 |         memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
>          |                         ^~~~~~~~~~~~~~~~
>          |                         obj_cgroup_get
> >> mm/zswap.c:626:49: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
>      626 |         memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
>          |                                                 ^
>    mm/zswap.c: In function 'zswap_lru_del':
>    mm/zswap.c:639:49: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
>      639 |         memcg = objcg ? obj_cgroup_memcg(objcg) : NULL;
>          |                                                 ^

Hi Kernel test robot,

Thank you! It appears that I've forgotten to define obj_cgroup_memcg
for the #else CONFIG_MEMCG case. I'll update this in v2!
Joshua
