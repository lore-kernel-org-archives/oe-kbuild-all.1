Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA721D3E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429767; cv=none; b=IDlhZoRYjUa5pwSvZy8xH/1ZZJPsuW+kw39o9qnlQjS5sWPH7Wu3j2O9MLcqcb2qhQIfYjI7NI8213BrdN3+ZYpp+PBWGNVioRnnEQ318sxKKFGU1vKVvsnax11ATAthsT/TSVKVJ77X838d2RAfTI16VpJue5LfJvidP9oY4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429767; c=relaxed/simple;
	bh=IS9JNZKpTFhkcU7bsV2BgbeEVETE/nyzALetZrxp9pI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dF6LtrDxlXKFUwpF4yOyq2YrXl6QKnQG15TET6LAx2w4fpoc2g2kWVS3lTcwXAfBFaN4umaf6szFMRQY4nNmsIdphpw3+icPROwx3S70AFrGOfzwepsvFL3wB5mCpENQ83eg1ZH1ldQLXifqFqfFCG6KCvGv4ug+qdSPP43dNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IuUs+ud5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuUs+ud5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e504975dbso29482005e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760429761; x=1761034561; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyVJ9F0sPkvb6d9V8yvLooHwZ3md82CKflBoPN1xb5Y=;
        b=IuUs+ud51T0qqjr4h3iq6Gvl+qIWky5wZ/WUItzWgKldm14AL74MN+vlMNTsYLee8o
         yYCDHf3hPn0odJPdDsvIrD4WHY1xnYstXGvV7HzTShjrY9NyCquRgkPgKueOPDV+XlEy
         25vQswYwU6cMa3eGleYOFpKsTQSxo1gl+VOlZi2q7YpA2CwdqM+sfAGCnPX8j8Sixgah
         akKaPPCAcb6CJSbYTaHXTm+5TxBEbctlXS4u2uXA1q0WlpR5cauvHU2ddZi0RwDua2YA
         cn4dPgKLX5DezPSvATMcBV/1WeKqAX+p7bWcD0Ddnfom5dmvLv4pomjAyizRYbPsF7qD
         O3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429761; x=1761034561;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyVJ9F0sPkvb6d9V8yvLooHwZ3md82CKflBoPN1xb5Y=;
        b=uArNheWLiQ8rY+I6SE++YEQaQv0jIU8OdO4zNz258RCGOgQRkcyTc811YfIEBD/VzM
         5L8ljmBQ7KFZDphrHRih2R9YajzSBFcau6QUSNkaj/6H6CjJ+M31L4IyVW0rVLn4mtHU
         J3kApWJ9yVfd9RKSF+jDuVTrNG+RP3OZ8qLw1MK5aZO5sH3IEF7nGIQlvi4Nq6dq6CMZ
         0duWMqIdfpwluaAYvFbS9OhZQRoXB/gj8frdD8658n20A8I9O21h1C+xVmr5/Sx1ffYT
         hRtNbZYk/1+hdHM0eDWjQZDJ74ns4cUOsT8f8UwTWpBPXtdTI0xlhGGtxMqAm7DrI43n
         jRig==
X-Forwarded-Encrypted: i=1; AJvYcCWHTGikdwu8vbbDArpqPibypBghftQEyJVjIXC07EVP+PdjEjIin8ll/NCEknYtjHrqmkQhpi4yxA3MXpZP@lists.linux.dev
X-Gm-Message-State: AOJu0YyNLRXWyUyddjMb95bxuAi4R45ZFJpodGjjCxbkNyM8vhVoRNWd
	OF0A1LyruuFTBVl+GPjKxww2Q98Rlh1+ikQ4ajcLgOB1vsl6YGYEkcy8GyzazItaQS0=
X-Gm-Gg: ASbGncsF1zxlru8ncVvo5ht8LTuU+o3Y4VHfjhaPgjtqYsuJo9q1cBgYgWK4WcDckxI
	C2jpOiaAdVc6qFKOvnW6er0iSrNfQLfmSrYVmlZiw9Hh31IFKD2I/IFs4ckt63aFlcmW9SouamW
	mSehpxjml+ZMMJG3ZL/E4U42GVrOK0+6gfPhTPP1gsLkLl3ntDReGD6GqSHgrAWa7cvo8SQqJ0R
	SUJtu3fuxMuYZ4ErikfxuDasFWKq7efEMu9sB1rCdKqp5xMs4ca2Fn7+V6zrQuEMMYG5hfLMAFm
	LI6epQnOD231jcmRL+FT+fgrXV3VS0V9IA3Ow9b185vXyJYLbCdihakGsjupOhOrpKHqoG15OdY
	YcPa18+Euzz103kwjs7y9x9NEt9y9LK3gEsjgjqp4eWUDXQ3lYBA=
X-Google-Smtp-Source: AGHT+IEmRqbCSKEmZNfKWDxZ8G3ZB8/M2f4+Xn4uL3VJmZBukjyvTnhQ7J09DzuK9UCi1D9bEFsC1g==
X-Received: by 2002:a05:600c:1d11:b0:46e:5aca:3d26 with SMTP id 5b1f17b1804b1-46fa9aef840mr173171105e9.22.1760429761023;
        Tue, 14 Oct 2025 01:16:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb4982b30sm224831925e9.6.2025.10.14.01.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:16:00 -0700 (PDT)
Date: Tue, 14 Oct 2025 11:15:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 13427/13588]
 kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing
 error code 'err'
Message-ID: <202510100941.GZGMq64U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
commit: f13bb574707674d1113a40e0b6dc4d9a143d2ec1 [13427/13588] liveupdate: kho: move to kernel/liveupdate
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100941.GZGMq64U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510100941.GZGMq64U-lkp@intel.com/

smatch warnings:
kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +978 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  944) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  945) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  946) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  947) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  948) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  949) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  950) 	int err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  951) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  952) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  953) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  954) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  955) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  956) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  957) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  958) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  959) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  960) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  961) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  962) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  963) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  964) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  965) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  966) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  967) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  968) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  969) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  970) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  971) 		if (err)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  972) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  973) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  974) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  975) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  976) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  977) 			if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21 @978) 				goto err_free;

err = -ENOMEM;

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  979) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  980) 		}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  981) 	}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  982) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  983) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  984) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  985) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  986) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  987) 	return 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  988) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  989) err_free:
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  990) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  991) 	return err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  992) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

