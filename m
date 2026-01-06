Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB87309DDB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767685829; cv=none; b=WpxPiH03//JZcR/GvJpo1DSTy/P2f6Rf1xIqq+E4T2LJclo5EiiwovRqYV6Sm2Ey9N01VqITdFHyyh7JCUkO4b71J5FC9YKHM5fV6KpwU3Oul4/OeeZWpYrPsgthRLjOB/R7m+yFLFHBy8g7iF8c1mtdfyKuuh01svUXwRhZx5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767685829; c=relaxed/simple;
	bh=jsF3NDuO62h6NCbXJop/CZsOfV7IwiG//knqQ7cqXW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PBNZYojm6qFrcdQHeQy7rvFo5VhuZROn1tv7LrzsBtivV/Gr0vsyfA+Q2/NhGE7vrTBAshfVy/88OZpKbeueY7KuyOAA/yUeKn59h4ggZMGlKR2PlrZZRicwJgctm5p3YwkUpYYXLQnGKBuSETkoz7tEjueCsdIjO3j2If95cf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5JEf0Sg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5JEf0Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767685826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
	b=G5JEf0SgRbu8rI2bCfoy2aq3SERxGClJa0PeeGZN6yCFQhZAubc+Wt/vg9GTEzNeAtDOm0
	H9oXXbOlrkQKLIPeJDE3r/hQnZ3ELZiTMAMYcwzZKAcjhKupbdyW9dWVJtdlXB/VRvaZGu
	p1OQOFtJ56MMjsyFJdsRVCgIUkudpt0=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-uHjlVFOkMmKRBDVe-EF5KA-1; Tue, 06 Jan 2026 02:50:23 -0500
X-MC-Unique: uHjlVFOkMmKRBDVe-EF5KA-1
X-Mimecast-MFC-AGG-ID: uHjlVFOkMmKRBDVe-EF5KA_1767685822
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f21951c317so677277b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Jan 2026 23:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685822; x=1768290622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
        b=gnsbiRZ9qCUf21G9V19f9ldd5buVLoK6uIY+xdGOR4nrrulg9vcceM3lTQrbd9uH9w
         ca24XN3BvmD6Gcr2uFUYd6FeIx2IabLWTex8E0i4b9NYTUHpje/+781ZUkHIqmL9yiAl
         HxL2WtP6NCbL84lDA8ynrAU8bZ0rEbmhpepfS12kxlsQu55rpPsdo7t3RTbX2nnehCou
         jPgG3KJWZifIQuP9HYL4+ZEMyYJSEIoAEhJev4NEfysHEnpPVLr/2ozpy0xuQVPiGLJA
         Qi6plG3zGCrtZAdDKKYRKANDGulG35L7oakjFB4kUmSe1RhyfWJILUw1WqfP8d8U7IT+
         3bhA==
X-Forwarded-Encrypted: i=1; AJvYcCWMx2b4LPCqK6uoIy37WC4QEblBaaqsJckGguTP0gB8wy8FNJTorQZoLtQJWn54adf+oFOjmfEQDuirJXf2@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm2YRnG3H20SnDuQeLldh+m9zIFlg/kNzO7Csz1B9Syx2dfZv/
	0EA9v0oiWnCoz2xghxBGOQIfmdjxZl1dr9lmUlR5MsvY8b8Vsl/zoE/RTpHzDaN13rsVXSbxf1W
	3DuReyPOUDTlVRUQKPu7WHy/W9I/N0MbBohEhCgmemcLRiKvnTpeCm/WKmJmp/IPZ9Jw=
X-Gm-Gg: AY/fxX5AdBuYsoAyDuheBg2P5C8BnzX2x42FhvMz2NSCojr+Lb945+bWEeUNNUJfq8M
	GVEoM+ajs2fmXLNBX7Jd9QVxjRzROe4AegXDTCsVorLjFWARsM0P41LeFTHqDfSGRwCCUMVM4pg
	i4+8+lMTcQc7EgMaltPigutKF0HN2WP49XzuFwV1vMkIV/Npv/g17WSzMjxRYnBd6PndDDvE4Ef
	EnMgJ51lNWgMiRUk1dZxw3N1aRcQqRkrWRQfvCsxZ3EHxrJ6e1+Wi9kcbSod0r3voCD1lZGDwEn
	tTVKwrqsfWYUEcdnkz08PrBCY7lS6sIJz+k1M3XPbz7XmgQPGqFl6FipgsHlvEaEI13nmRi+Hbx
	V
X-Received: by 2002:a05:6a00:1d25:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81882ddd7c3mr1845207b3a.63.1767685821899;
        Mon, 05 Jan 2026 23:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDKsDXMRpPACVaN2GdRV6l0Fy6KDBpzSzhtqSYzxT7W76UAFruKAKNIbDHoNo+0oE4mtloEg==
X-Received: by 2002:a05:6a00:1d25:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81882ddd7c3mr1845179b3a.63.1767685821335;
        Mon, 05 Jan 2026 23:50:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0ddf97sm1263404b3a.19.2026.01.05.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:50:20 -0800 (PST)
Date: Tue, 6 Jan 2026 15:46:57 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Thomas Staudt <tstaudt@de.ibm.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aVy9qfeSDZyKybIC@Rk>
References: <20251226140636.1378505-1-coxu@redhat.com>
 <202512272218.ghBaSjzO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202512272218.ghBaSjzO-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nUp6WWbiKDZYB4ueksnSXYT7Mcab6Bl6vdivFTduXRE_1767685822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Sat, Dec 27, 2025 at 10:35:11PM +0800, kernel test robot wrote:
>Hi Coiby,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/powerpc-kdump-pass-dm-crypt-keys-to-kdump-kernel/20251226-220726
>base:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
>patch link:    https://lore.kernel.org/r/20251226140636.1378505-1-coxu%40redhat.com
>patch subject: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
>config: powerpc64-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/config)
>compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>>> arch/powerpc/kexec/elf_64.c:95:9: error: call to undeclared function 'crash_load_dm_crypt_keys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      95 |                 ret = crash_load_dm_crypt_keys(image);
>         |                       ^
>   1 error generated.

This issue has been addressed in v2
https://lore.kernel.org/all/20260106074039.564707-1-coxu@redhat.com/

Thanks!

-- 
Best regards,
Coiby

