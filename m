Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2533C3F39CB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997082; cv=none; b=YliLpy/eEedQ5+E2Hi3d5vzbQhplVL4ebEvgnFZYAURn9hW1fiTKx0Po3n+aEBEJ6sy2xeUGdgMG2MLgdHh4LgSFldeS9wq9R2qYigK2EDQX5khk+HSIfR0fNGfPu0HKKcVPaLl0XLhXiu9ueXltx6i+gKAqDoE1QbRBPr/+/js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997082; c=relaxed/simple;
	bh=/Qa1inmzanAneq/BsqpNt71srsHmc3Q9wzFTfyUU/Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFLi2TZ0waO/FT/S4WE/JqLww+XuXEp7y144FtH/zaMwfwBSV0VUyaU4qKpPgtbDp8SsTz5EiQHXuSzAOQ4v/IpppdFf5NvOhtiJRQ2ZC7KsEnBRnYb8cms2Dia/AkvVqKHCI/528tAEjs37p6BRpxBtz5ks6AsXmnV1C4ZJ7rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDqn5qsN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDqn5qsN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceab75934dso17851025ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 09:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784997080; x=1785601880; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1Xu6gB2hPvfzPeGIegNJ8tUDHaIiJU8rBYzwhmih9I=;
        b=DDqn5qsNhPqV1FmC+PwhOihA7n9AI6C2nRgnzT2d/KyWzNDGHsYBMtCulz+UB+8KFO
         9SiQxbeZ8y6eag49hA8p0I36+HB7ursEjd9ujhdeeWPlpBQ8Lfdvv0fO3x9Q5pF0TzRh
         x/DKIegBqK1ndEjqhumqxHeQm6bBvzcunHu4iDJ0heMFpgWYVM6PArjKMI7XgmH/tO6f
         H4Hy+80H2ekoP/9YbyvyxvyXV8iXlCEGicWebhhdnlFTi7A4ciKvVjzsoI6JZXefsjTY
         Q5axm11RYgunjCs/Ey7tz+y4tTV1mOeDM7cbhRh07swzU5+sWLNciELyPYD3WkQqtFfc
         sr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784997080; x=1785601880;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1Xu6gB2hPvfzPeGIegNJ8tUDHaIiJU8rBYzwhmih9I=;
        b=BwBfDU0aKfwfi/dEzppGm3RGCK0XSjE3qIS4c0lpSHEeM0imSqHjWSK2HAO2SwOKry
         fzUcnT45PKzYmW+OZre1hQnLOMDSgB4z1fCCnBXAF9yBsgsO4uqXfs9h2of6NcRZMuJy
         8DCpCrPnujii6ya/R1wGXT0vzw5+6iBt0Btn+jNUhOquVdtZyvxgeDkCudTfpB+yPFPk
         HMWBIYP9Za2RZwyLaTYxE/VyI1A8c0/DJUwNnLlWMs7aZJ04s2j3IC7+m/vixb60OVer
         qhtlmqXFBkbW/xIa2CwtAyaO2xCWlCQfjhHaz0Z8YBKFt0gK/qMi5SaXm660VCVcumC8
         Wk9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrysyK9ldpLp8tnHRxCtMe/uoUmWJYNGlEYNF3Xx3yV8XxwfV1D1QEPSb34RMQ0NALmM5KOvj0rYl4af+SF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7vtfw3H07jJjeXHaX9CNY3wuaDUrRcH0GRwvqg93Dq4nHAbNv
	AHztA2M9826bHT93pD1okPirDSoRgV5mrENptHOHWb+YGnIKKfS+kC9B
X-Gm-Gg: AR+sD11fby5ej8XEBsINKuJGy4T+h7vb1NLpghWrvnRX5xgj3QCQKKrSbJSJf//DuZR
	2Y32C6daRz3cQBB6Kiljwl0mrqusLAAXcfG8Tv94+dBHExecqKWDODUBY4aKHIWV7jl5pe27Cca
	/7G3H3YxdBm5X+Jo/35Hhh4a+SU4TNbj6pe+k+lUrS9Yle9tKaWiftIJvJqkzsFAorYQzUNO2x0
	FS5QA1pUsaNbmoX1dGbr7P1E0IsL4pVHDW3MBEhjllFdp/g84KzQO87bVh2OXQyhR07Hz/CT6Dw
	x84vhpsSJ39sFF5tRwMK42OU3aVHlSDktr7Mf5AXc10GUNsJFwMjt4gVDJVOSO5lu05QnNRv8Ep
	60xliI2l7SNcBO0eFdTxtXIxLztJrnFdFw2mZMBkp5LSizCU7hzXCBi/KQYyzwrkbx0ArINKB
X-Received: by 2002:a17:903:19ee:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2cfde866afcmr24786625ad.24.1784997080266;
        Sat, 25 Jul 2026 09:31:20 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc57asm10874305ad.45.2026.07.25.09.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 09:31:18 -0700 (PDT)
Date: Sat, 25 Jul 2026 19:31:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.18/linux 1/1] kernel/kexec_handover.c:941
 kho_preserve_vmalloc() warn: missing error code 'err'
Message-ID: <202607260054.fmMWCkfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: a667300bd53f272a3055238bcefe108f88836270 [1/1] kho: add support for preserving vmalloc allocations
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260726/202607260054.fmMWCkfT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a667300bd53f ("kho: add support for preserving vmalloc allocations")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607260054.fmMWCkfT-lkp@intel.com/

smatch warnings:
kernel/kexec_handover.c:941 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +941 kernel/kexec_handover.c

a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  907) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  908) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  909) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  910) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  911) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  912) 	unsigned int idx = 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  913) 	int err;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  914) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  915) 	if (!vm)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  916) 		return -EINVAL;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  917) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  918) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  919) 		return -EOPNOTSUPP;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  920) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  921) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  922) 	order = get_vm_area_page_order(vm);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  923) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  924) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  925) 	if (!chunk)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  926) 		return -ENOMEM;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  927) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  928) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  929) 	nr_contig_pages = (1 << order);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  930) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  931) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  932) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  933) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  934) 		if (err)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  935) 			goto err_free;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  936) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  937) 		chunk->phys[idx++] = phys;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  938) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  939) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  940) 			if (!chunk)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21 @941) 				goto err_free;

err = -ENOMEM;

a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  942) 			idx = 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  943) 		}
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  944) 	}
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  945) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  946) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  947) 	preservation->flags = flags;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  948) 	preservation->order = order;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  949) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  950) 	return 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  951) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  952) err_free:
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  953) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  954) 	return err;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  955) }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

