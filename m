Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E41A145FE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242704; cv=none; b=gXN8tTNfB7lpV9q7n+O7XuR/mSPxeUNaZT+YKG2PS8io0ic9RbLeXYUsjddJrJ9+LY1K3j9zzVNroZHDVkwMvrsgl2SH5qiSMHszr/kFbgDuM2s0BT18AMjU6f3viK+ywDFzvmcYepIkKx4zKMRWawV5ZvBKygGDfZzS6QMN2Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242704; c=relaxed/simple;
	bh=KIbE1b0fqIHR6t4DbcpHz0fGfYw9U88y89LFbkpYtVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFH7iG23KUxgZbCd4hNVQikqGQhRR8epGW76s/+EJY5juhjXEkLAheQA1y2GN8xfYkd0VIaBuXi6eXghV6VJ/pdFbKOEG3SlCfbFKYuTl26ewD5T98f78ueRtH/DT6wfm1tutARl0PoyM/0j3nAuR90hojj/Z5Gu0LSup2qYehE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ACaUYdzu; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ACaUYdzu"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679b5c66d0so1628771cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 11:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735242701; x=1735847501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwzvVo3A9tqwYP/Mb4qBWoe8LalbJFa9pYp37BvyRxY=;
        b=ACaUYdzu0rIcTL4P2OOs5C5iRYZf3/TTLoPcamB//Tk9Enu4ApXUIkucCMaI3h6tnm
         FkC/6IPsyzoEv0uFVPhBfEHr2F9fMQ9tnku/afqMejPpTWt7T6UmVGLUOkm3ulknHePy
         qfow4oPOEXQGhrpZqHH6eTDQqvPY9tmlxV3EeMKbkhwUv6piz6jw1R5i/fdMlo+yQcmH
         Y19HAihdDsr/ZqDEWeiTKqUumyornPBg6ypEjqhWYD40DM/uFaMySfDoRRdMVqDWwURC
         N1VSyHlGD4W94TxX0jxeLl10aTAtZJC3e9YPrwGCcNemmSZ5g5Hiq8Z7VvSvuJmC/Rq/
         lUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242701; x=1735847501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwzvVo3A9tqwYP/Mb4qBWoe8LalbJFa9pYp37BvyRxY=;
        b=aupM+HyAnRiME63dIXGZ5vT1pTKsVd59sMZgLLO8oOt8EaIvsWMADHU36e8SZ37Gl5
         hvrs523PXp9Cmj5HLVPs7CiIbBlY9nWQiVo7kOcMOrUuglRuXixPw6C66327l2tDgzYx
         BeHSX8tlgS0oOyS5MQDfY4n1aZl9TKFq/7h3V0E5sFyGOcAPmRAjUMHyeSu5gobBHsd5
         zQpHqbOYrhda/Zyax+GKAzppXyCPWT0TOUS5jP2w9IeT/f+YbXEjon+SWbQ0IxENj5Um
         XWIBO7xV4S+Pxr6TSHiNFe72VE6taxbXNuGET37ZxSoO/WkUBQX0h8JW0ZKDJ86T2ceK
         ocTg==
X-Forwarded-Encrypted: i=1; AJvYcCXD2jYV90o8I6zRD2y+d0l8l7N8C6X1eH6G2WZiEbJdbnLsZHJq316Rc84yUjCD4UsJpnG/qPi3spo796vI@lists.linux.dev
X-Gm-Message-State: AOJu0YwPjUUQ9PCUOK1hVnBT6Pimx6eWdka9Hw5yGD5gmqVtv8xFfbLc
	GMzfBfzNNGiNZpwgi9wtvoplRdeXH+JwQ/y5W7oDdQXZW95kBy8w5aMnZMKSUGVbA7Zyyq1Dm2w
	y/K2ajZmJMFvQJ+x99KS+GcHuk42Aog/UWL9A
X-Gm-Gg: ASbGncuplcPVy8Zq5e2QDeINYy9uChjghk/E9PbFsCh0cPbfE2QrZeYRbpWaFvdtVXN
	616W6N6QGZDUxoGBejzL20paScjIUX+JgSAxcyw==
X-Google-Smtp-Source: AGHT+IHBdFc9hhlRPZCBWUc3Iy779E66gX61RcLkTGDPxcjXvqPzHzBcKuM/XFvHtqdVCG4f0JtV0UMo/Gw0tXwDT0g=
X-Received: by 2002:a05:622a:1823:b0:466:a11c:cad2 with SMTP id
 d75a77b69052e-46a4c00cc98mr19789051cf.7.1735242701233; Thu, 26 Dec 2024
 11:51:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241226170710.1159679-14-surenb@google.com> <202412270328.HiJX1mRt-lkp@intel.com>
In-Reply-To: <202412270328.HiJX1mRt-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Dec 2024 11:51:28 -0800
Message-ID: <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com>
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 11:41=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
> base:   431614f1580a03c1a653340c55ea76bd12a9403f
> patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-surenb=
%40google.com
> patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dump=
ing the vma
> config: hexagon-randconfig-002-20241227 (https://download.01.org/0day-ci/=
archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241227/202412270328.HiJX1mRt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/debug.c:189:54: error: no member named 'vm_refcnt' in 'struct vm_ar=
ea_struct'

Ugh, ok. On architectures with ARCH_SUPPORTS_PER_VMA_LOCK=3Dn this will
happen. Preparing a fix.

>      189 |                 vma->vm_flags, &vma->vm_flags, refcount_read(&=
vma->vm_refcnt));
>          |                                                               =
~~~  ^
>    include/linux/printk.h:514:35: note: expanded from macro 'pr_emerg'
>      514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
>          |                                          ^~~~~~~~~~~
>    include/linux/printk.h:501:60: note: expanded from macro 'printk'
>      501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__V=
A_ARGS__)
>          |                                                            ^~~=
~~~~~~~~
>    include/linux/printk.h:473:19: note: expanded from macro 'printk_index=
_wrap'
>      473 |                 _p_func(_fmt, ##__VA_ARGS__);                 =
          \
>          |                                 ^~~~~~~~~~~
>    1 error generated.
>
>
> vim +189 mm/debug.c
>
>    178
>    179  void dump_vma(const struct vm_area_struct *vma)
>    180  {
>    181          pr_emerg("vma %px start %px end %px mm %px\n"
>    182                  "prot %lx anon_vma %px vm_ops %px\n"
>    183                  "pgoff %lx file %px private_data %px\n"
>    184                  "flags: %#lx(%pGv) refcnt %x\n",
>    185                  vma, (void *)vma->vm_start, (void *)vma->vm_end, =
vma->vm_mm,
>    186                  (unsigned long)pgprot_val(vma->vm_page_prot),
>    187                  vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
>    188                  vma->vm_file, vma->vm_private_data,
>  > 189                  vma->vm_flags, &vma->vm_flags, refcount_read(&vma=
->vm_refcnt));
>    190  }
>    191  EXPORT_SYMBOL(dump_vma);
>    192
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
