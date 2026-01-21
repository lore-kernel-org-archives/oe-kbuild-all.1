Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2859647AF54
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985910; cv=none; b=a33PODj3TPs7y9qDxI/HZy8an8MIoIoFT70ha8t+icE3ct9Ev2Tw/9uipDUEKS8pKp/T/7e4UPBZXhFCiMNRe+W0TkYtEhxKOh/XsZDX8MAw9lVzWarQyZJW+e5wGkDlX6sEc0y8KuKIEvlpVmOIWKtqeGeNhbDmnLzKuCB0aIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985910; c=relaxed/simple;
	bh=nRNveS2MaO6bMX9fxvOOdKwYjrNkmfpz0QY5vX0nE78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mA8tq92F5QhNVvC7iL5oHq1Nq51CdqWFBZ1ivHx5QXNsxgnAvQUnrVeC3+SZ4XRkjxAkUHPHL8wi49YkwbOer7lF6RZ3BecDZcWYg/CMnDmrWbH6tUQzDRVEmEtZDoEAY6F/tGwuMqnfnxvIP9n41qpPuFpUST9TyfI/7+w061U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oAiR/lrB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oAiR/lrB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so41793045e9.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 00:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768985905; x=1769590705; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4X8dMKetrdNmqKhKcHZ5SlhB98c1MkwzIAdKHbK4l8=;
        b=oAiR/lrBQ64WLvkYzg1wOedWY37TYs8MiMXrPzKalfzrOJe/kGFTKKtQ2Yz9arg52T
         2LiJc31Es+TTJoKiswEVxcq1RgQXYyTM5+oDMaBAuSC1rPR6YKrWo0m5NxR8vMR38JH/
         N8M6m3NZWHho3h5Do2PGA/CcHHCKQi2XW7TfBlMh8Tn65p/W1XvOY9DxAb/WstBjIToe
         jfAP7/vlhHLEcMzCGn75Cs8njXHIwyX2/NjxxrXdoTTuwybN8tiiAXYgBvybgxwjX7U7
         kgQahTEE+7ppawRnJnN9CAprLmdcZ3j4UcUzHaHTIAegHM2yoT/4FHoDMD7TUfdATrlU
         i9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768985905; x=1769590705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4X8dMKetrdNmqKhKcHZ5SlhB98c1MkwzIAdKHbK4l8=;
        b=cDpFlCkEfYkXhNx27pVwInJa8Mc1dtAYnrrKjdnu6IWOQwF6lnBsaklYAuNaYn27b5
         sMbv0BJ941wYRSJxr1v3EZ6dDwzGFo2jE9S0KPQm+hKq1kXrZYwY4bkYnQ1BPhF3AUzH
         A4OfXgOeFtOUCkkHHHOoYJHJPbxbxeDgfZpZoic3XeuqFryXXn/trZQV1k8E5YeA3PXY
         a3UjNrM+nN/jbLx3NT96zhPVF08CpxIaQHykoj0/NL2DUaqRTWQtq/iCqd3DCbmwdDoD
         VPQwTTTghsHo54778WCndCLPjRBrO/9Pj6Qu6BCrwk3IrZBs7UzMLJd8Tes4grcfJpYp
         Jt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyBFfzer4LiCWZigO3Usny8Gr0SghjBp+fFtVn7K34RSTeO+T+5PwfddGBKO9lmUwBDV5osVavwmeQ68iR@lists.linux.dev
X-Gm-Message-State: AOJu0YyUVeXsT1B/Vn9XfpblLByIe+QTTLVEQl1bK5FtNgzzAjOG+U7O
	VuU8MpFqksLr4KPRoos6TWBO6SUMIRYYVasPQ7ad4l3LNYmzfNCaAcMa1xQmxJ/U8BI=
X-Gm-Gg: AZuq6aJb8aOJNC4wxul6B48vam7DoNn0x34ld298PqkcX2+lNTJb+ZSemxss9IMdeFG
	AiXhsB5alk3Ac6UdVCAQaW+5sXvBkHyxiI/gtqgVyTzZwIkfNO5mezFH2zQtHxSf/1q+vB0Kwh/
	ldsWMiV3gzT7YKVYsVZLRTWQUDcYFEWS6TzGyAlMLcy5sN89hTbfyAEn37Ij3j4L05YzC6q9KU6
	sice1c/eCrIuJ1nKcD+HiOAYraXCX4+6BhSeH3+r3JkJU7bmoXOKOzcA5erPe/LRnLEWP6FIDB8
	MiVJ7CalvEvVrkGwbzT+2FD3T1s/YXjwCzpl8ftS9nxtNXg6cN3/HvWJNBV4XeiFxOn6NJNfWX8
	sZ8V8Zopx6dDrnYmyO9MiPP5//3hurAutCPDKn/+Z42JfXU9EWAniHQK1NqoxDcR7m+PAMkDNv8
	sJi+T+Rw3pTi7XF9yBFN3e5AmIvfw=
X-Received: by 2002:a05:600c:8011:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-4803e801e7dmr62810625e9.35.1768985905121;
        Wed, 21 Jan 2026 00:58:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804252b02dsm17027785e9.5.2026.01.21.00.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:58:24 -0800 (PST)
Date: Wed, 21 Jan 2026 11:58:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn:
 missing error code 'err'
Message-ID: <202601211636.IRaejjdw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pasha,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c790212c588fddeb0d852f2790840753bb604b1
commit: 48a1b2321d763b5edeaf20bd4576d8c4b5df772b liveupdate: kho: move to kernel/liveupdate
config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.IRaejjdw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/

smatch warnings:
kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +994 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   960) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   961) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   962) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   963) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   964) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   965) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   966) 	int err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   967) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   968) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   969) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   970) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   971) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   972) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   973) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   974) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   975) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   976) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   977) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   978) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   979) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   980) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   981) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   982) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   983) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   984) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   985) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   986) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   987) 		if (err)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   988) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   989) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   990) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   991) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   992) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   993) 			if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  @994) 				goto err_free;

err = -ENOMEM;

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   995) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   996) 		}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   997) 	}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   998) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   999) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1000) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1001) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1002) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1003) 	return 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1004) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1005) err_free:
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1006) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1007) 	return err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1008) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

