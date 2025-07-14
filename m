Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4210912CDBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 19:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521718; cv=none; b=XAioPSP2yTq8oTbPSyD53iPiDsb/Iuk26kbbUVf6CJgbyOEMrvRFOOdV/DKMoOwwLuL5SqyTB3EKlMFmR9pcV9EdKW6N9qnQ2ITolrYQRBLlqU3cUYd3zGDf8v1C8DKav1x2ediMRTOZjGUL23jOZU0lRHx7Lf+5BEEt7HZNQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521718; c=relaxed/simple;
	bh=Brzjxb5hn7B3eLqSzzWD0aDUcze0NCCbfwYdpfdr7KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEyo/zZChwf6WM2KA1J0nnpfapikERv9QvAQFYW+O3L+6JZR1vqNtmqhkK9Nklf0YbKUlsA3l2c/T9dl11bP2fRQukKi93DaD1aRtVQkXdPynu+gS8MvHPwZP85m3Na19IJ3XBuZ+pXbmymmGSA5h7b1vZGepL3v59TYWDFIsP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yefXoWJ5; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yefXoWJ5"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2ea58f008e9so4097866fac.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521715; x=1753126515; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJCe0uafwWJcjAjBLJm8eV2mzcLBkCS614s8l9BK++c=;
        b=yefXoWJ56PdmFJu4/uCb3AMWo15a62mEoU4JMDG4L1gX8hLU8D9xk9oHsBlEpj76or
         pK6YGES6Wm2mOCwi4EZpq3fII7IMU5xLbqorX29zjjVa87ouvWc1pR4dQCualNnyWjkf
         gknRK57E28Dnap9bzBZDAM5MU9e/Xae5FPBVAUonYZkUG+TvX/iBvPFK/ViSVPB5OUrq
         P6mK2bU0e9EjyF3er1lizdRXa8m0ZQxJTXk5dRpodmqSalmTe8xt6eENk6pKvlt0JgH8
         DGq5kLRaQh+kzSJyaITwoZiGGaSKhfiW6+5SA9O+JjWvUw6usC5vwFse6sTV8p+xJ77m
         s7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521715; x=1753126515;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJCe0uafwWJcjAjBLJm8eV2mzcLBkCS614s8l9BK++c=;
        b=rr9gUd29zrZ/+fCS48X50LTlTQEazUQFfH9JYsQanHiYawwQeAJHQWswofs34sDwCh
         bZRJSCpqURxhORpeHaXYauzj+1o89Vy/TC3O/pKDyHdLJsxXhRfZkX/tUHmLuwt1rzx9
         4ImgPk8ticFB34ELKlVSzGMK30uqHJSQk6jnmDVORw8fY+VOVmP9VLSDQpcCtJnTURYx
         0IDhtrKRKOk/6WCnLX6UhulVXorxtPRyMZS58hncRdSUXUu5uH1IsGHU4ICFh3Zg4NQc
         ab6+LUZQWlwU5sVGdJUhDSzjsQFTVYYyo4qNuVgXXfHVwyZbBSbFSjfILzOnhzrF4bGp
         yi8w==
X-Forwarded-Encrypted: i=1; AJvYcCX1L6mgyNHk+9X7SY2Cks89DkwROTOEjA9SuYZiZnCKHgfP7YSuvnKbV4N9kSWwpu7JQ8wXfxRrgvgSCIZt@lists.linux.dev
X-Gm-Message-State: AOJu0YxtP8wnRr5Cpt565K9sx9PaOwnWhPLHIpZYVogLSlk54b1iELiL
	sTHRdhRfjF/rElTg+SC2hSmuKix6ph+NZlgzK8oEw/+6ehhJpx1G/xYfe5S9Zgmxi+U=
X-Gm-Gg: ASbGncsTsBcLM8uil+k+EeSaSCkNi+v1gN9ev6LesbhvQSAwZRyp71Dv1eMDLTW/lrg
	+1OwIq6IdbM3g4kjWG37OU060eAe3D9d1/Jme0fmdv9IegGDjsfFZ2qhfMOmP+NRnfWDBMtQWZZ
	kNeh4VdXDBmddeSYQ0PKNfMqIF93xnslzK++Uap7JvbBoA7+ZQoRyiFvrp7mBhFPleHqH0e+IV9
	X/XsTrAf41GVqENIWH7aD3fuMSRtyTgXPYb6zvbePXgHVGbxnk1nqBcoeXQwjksLPDXiIHotg4W
	f0XbhDQYUK3pSH/ax1mennMCqkglvtIoNaW0URTkbZpmRkRB1nDXIov9WwdAJPPEL577EGC6Izr
	euZuLRHiJJ6LnC+tie5RPCuZDf+js4glbxgQOcfXt
X-Google-Smtp-Source: AGHT+IG+HyZCdbJbsjUqaaRoAPcY8h13dOn2T4hFLwqcOwO/rH5cPhcrBnvzZPiesDDwPnJftqqQ0w==
X-Received: by 2002:a05:6870:4584:b0:2e9:fd62:9061 with SMTP id 586e51a60fabf-2ff2715f4c1mr10463782fac.32.1752521715068;
        Mon, 14 Jul 2025 12:35:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11732c6bsm2037502fac.48.2025.07.14.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:35:13 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:35:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 203/214] mm/mremap.c:1829 remap_move() error:
 uninitialized symbol 'last_end'.
Message-ID: <9c8287d3-59e9-48c7-8504-bf51eb3d5a50@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   9911a6d0676c211ea4df7eb8fe82ee6a0bb64fb4
commit: f1d4bfd28bb6e2e82f5fc58c7a0e17b7e15bba29 [203/214] mm/mremap: permit mremap() move of multiple VMAs
config: x86_64-randconfig-161-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120401.DCzwzjow-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507120401.DCzwzjow-lkp@intel.com/

smatch warnings:
mm/mremap.c:1829 remap_move() error: uninitialized symbol 'last_end'.

vim +/last_end +1829 mm/mremap.c

f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1785  static unsigned long remap_move(struct vma_remap_struct *vrm)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1786  {
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1787  	struct vm_area_struct *vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1788  	unsigned long start = vrm->addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1789  	unsigned long end = vrm->addr + vrm->old_len;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1790  	unsigned long new_addr = vrm->new_addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1791  	unsigned long prev_addr = start;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1792  	VMA_ITERATOR(vmi, current->mm, start);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1793  	unsigned long res = -EFAULT;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1794  	unsigned long last_end;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1795  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1796  	/*
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1797  	 * When moving VMAs we allow for batched moves across multiple VMAs,
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1798  	 * with all VMAs in the input range [addr, addr + old_len) being moved
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1799  	 * (and split as necessary).
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1800  	 */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1801  	for_each_vma_range(vmi, vma, end) {
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1802  		/* Account for start, end not aligned with VMA start, end. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1803  		unsigned long addr = max(vma->vm_start, start);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1804  		unsigned long len = min(end, vma->vm_end) - addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1805  		unsigned long offset, res_vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1806  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1807  		/* Merged with self, move on. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1808  		if (vrm->multi_vma && prev_addr == addr)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1809  			continue;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1810  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1811  		/*
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1812  		 * To sensibly move multiple VMAs, accounting for the fact that
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1813  		 * get_unmapped_area() may align even MAP_FIXED moves, we simply
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1814  		 * attempt to move such that the gaps between source VMAs remain
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1815  		 * consistent in destination VMAs, e.g.:
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1816  		 *
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1817  		 *           X        Y                       X        Y
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1818  		 *         <--->     <->                    <--->     <->
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1819  		 * |-------|   |-----| |-----|      |-------|   |-----| |-----|
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1820  		 * |   A   |   |  B  | |  C  | ---> |   A'  |   |  B' | |  C' |
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1821  		 * |-------|   |-----| |-----|      |-------|   |-----| |-----|
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1822  		 *                               new_addr
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1823  		 *
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1824  		 * Now, new_addr may be altered even with MREMAP_FIXED set, due
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1825  		 * to e.g. alignment changes from get_unmapped_area().
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1826  		 *
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1827  		 * So we map B' at A'->vm_end + X, and C' at B'->vm_end + Y.
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1828  		 */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10 @1829  		offset = vrm->multi_vma ? vma->vm_start - last_end : 0;
                                                                                                          ^^^^^^^^
The "last_end" variable is set on the next line.  I don't know the
starting value of vrm->multi_vma so it's possible that this is a false
positive but it seems like a legit issue at first glance.

f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1830  		last_end = vma->vm_end;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1831  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1832  		vrm->vma = vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1833  		vrm->addr = addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1834  		vrm->new_addr = new_addr + offset;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1835  		vrm->old_len = vrm->new_len = len;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1836  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1837  		res_vma = check_prep_vma(vrm);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1838  		if (!res_vma)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1839  			res_vma = mremap_to(vrm);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1840  		if (IS_ERR_VALUE(res_vma))
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1841  			return res_vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1842  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1843  		/* mmap lock is only dropped on shrink. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1844  		VM_WARN_ON_ONCE(!vrm->mmap_locked);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1845  		/* This is a move, no expand should occur. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1846  		VM_WARN_ON_ONCE(vrm->populate_expand);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1847  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1848  		if (!vrm->multi_vma)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1849  			res = res_vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1850  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1851  		if (vrm->vmi_needs_reset) {
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1852  			vma_iter_reset(&vmi);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1853  			vrm->vmi_needs_reset = false;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1854  		}
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1855  		vrm->multi_vma = true;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1856  		prev_addr = addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1857  		new_addr = res_vma + vrm->new_len;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1858  	}
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1859  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1860  	return res;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1861  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

