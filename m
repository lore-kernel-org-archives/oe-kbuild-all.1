Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85092DCF45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768737900; cv=none; b=VftWRYeACrr+tufyXK3hlqDpO1ZnZh9vXThh7NrXdSFdcksMGcRdvqNrbtDd+081e+CTYe3sTvmdFA3f4MNPO7KPE4dIU1Odo3eElkvsQG1/gwXqf/IIBGSWzBEBthWVeXjH5M0iM970FNJuVNSDtFllslKtjuBYByg4kPJzdks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768737900; c=relaxed/simple;
	bh=OMefo3WIdZBDpIOc8YWjpNiPYo2DW6Bya0njsixD8WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NiF8ZSRBTSRQp/yZUJHLhK1R3/c5pA+UTSzVK4iQVVL6bUtbqqbsQjNJPMZN8rXjTZySbetOtLNbVB87vRvSMsI4KoJ5ZDfOpk5mnFdiLgBkKy1CqmWyE5zBz2HiaxphdySNShuHVJC7DJBo4vaNDpoPTX3Ox8qqQCdpJDENx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yrt/grxm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yrt/grxm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso22116265e9.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 04:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768737897; x=1769342697; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oF5W5aUZl0P1F8rfmU73l0YSa0P2lxA+7bTTG4Xe1sw=;
        b=Yrt/grxm/6EndsK25fmAQg+Yb3jPKBbwvXi2mhnLnnc84Rt+cgft7SHft9PJDO7n9e
         NVtBYmUAk/186QiCSmHCPHraHKd84pT0kNTNxEu2x8vzSTaDXftEB/Nw3n7hY64yemBg
         8fViqWkti3Jvkvn/430/S3nUoegwO/cPizNw+HhHrRYNrEiDjN8mCf7De42+htu/hYWs
         IX6LEJLv8u5yqq2KT82qcHgPGUrQwGkxMeeETMiCs6SCSRqjj8LnqwqwOMTf+r/tDeWl
         j3mwBQ76aQ7UdvPD7T1rViChKihQCnOCPYnZv9eqiI5APmERuVsOdUXqTcLnQdMwKmoV
         ow6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768737897; x=1769342697;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF5W5aUZl0P1F8rfmU73l0YSa0P2lxA+7bTTG4Xe1sw=;
        b=IqJZvM+kAh9GiK/ZloG+H05mn5Chm3s0DM77T7/foBP/3ktltsxY+6CI5xf72RLIg2
         DRkTxtQfrUGvItrmgjw7sD32RaHfsixPz8izSNgA9tsR3SDY1jaMn7IxrD8kom4X2EJd
         PtSvTG55oS+SmTOL3UjPnc7uAXTZtn7+tS3z3B5Wi2Q3flSSpBDkZzhWd0BUqTryKDr7
         VbXXKNiQrr4npYANxZpausoeO2oGME6LQqW9JO/bkxmEJIVnUg1RH6OEPMjtp932SJmz
         gcaGygoimYW9J6SwQqZCJN3I/2LPxv1hsgxdP1hLeA+892lGNjD9XPm0zPwpcy9zX+FP
         FmtA==
X-Forwarded-Encrypted: i=1; AJvYcCVPSTgh8NQgwVlsaWl43FwWtHH+1AWab8lEWyo/TU3rLRnNrGPQoDVZEJT2jj0Jc1S/WXpuFKOPH6WNOdT4@lists.linux.dev
X-Gm-Message-State: AOJu0YzVlTMBKwQVQGkeb0T6M+g7fznPGVhFXnsB6c8wMxkqa20eX2AT
	mRDtG8dM3vIlEYTGkPO2ucC2cBf9h+IvS6s3R+iIgOr4CPgprjTjy047HfCXNrr3C3k=
X-Gm-Gg: AY/fxX7w/sChWqYBUKuSOX7+kq7yE4UVrxSiABzkjlYwRA9tpdLLOcmJX8MiTFGGc7S
	yiSr+F0nuWAG9N71xppz+vv0YOmRXuJC3prsENv3G4W/3874WU6wuUV8xDI6P2Ew/3MS0/8hskl
	WOcIxKDkSxD4sW6mMTEYSEwc6E7tBqu2jsOYl2/MelgT/U9QrjPBE5CxrIqnvkdsd8DAAbuPbTH
	WqLyKtyg3CnbKqmqZIYknIiznY02SgcBTr0Ychg59argtAHq2Bw1qv8L+EfaS5etsHazz0JOgJd
	9dMEYrw0YAifgtStQpCvskHJZJKL0h5wOKxC3UZMiMF6Zq7+mCWqYpw2dVP57OeMg2DULJpmTGM
	PSJoaqmXWBvfV8OiqmOVnZ+FcCmrliNNYSOUO3i//jFHTIXEMwQWvx1aqSxOmSNmNHqmGqrhOHL
	jF7Pbl9ePW2AfL2e7k
X-Received: by 2002:a05:600c:8184:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-4801e530d08mr96596425e9.1.1768737897204;
        Sun, 18 Jan 2026 04:04:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428acae8sm194366875e9.4.2026.01.18.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 04:04:56 -0800 (PST)
Date: Sun, 18 Jan 2026 15:04:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alistair Popple <apopple@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: lib/test_hmm.c:932 dmirror_migrate_to_system() error: uninitialized
 symbol 'ret'.
Message-ID: <202601152125.McLpiKxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: d438d273417055241ebaaf1ba3be23459fc27cba mm: remove devmap related functions and page table bits
config: s390-randconfig-r071-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152125.McLpiKxS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601152125.McLpiKxS-lkp@intel.com/

smatch warnings:
lib/test_hmm.c:932 dmirror_migrate_to_system() error: uninitialized symbol 'ret'.

vim +/ret +932 lib/test_hmm.c

4c2e0f764eb4444 Alex Sierra     2022-07-15  875  static int dmirror_migrate_to_system(struct dmirror *dmirror,
4c2e0f764eb4444 Alex Sierra     2022-07-15  876  				     struct hmm_dmirror_cmd *cmd)
4c2e0f764eb4444 Alex Sierra     2022-07-15  877  {
4c2e0f764eb4444 Alex Sierra     2022-07-15  878  	unsigned long start, end, addr;
4c2e0f764eb4444 Alex Sierra     2022-07-15  879  	unsigned long size = cmd->npages << PAGE_SHIFT;
4c2e0f764eb4444 Alex Sierra     2022-07-15  880  	struct mm_struct *mm = dmirror->notifier.mm;
4c2e0f764eb4444 Alex Sierra     2022-07-15  881  	struct vm_area_struct *vma;
6046a3bed1c2b02 Arnd Bergmann   2025-06-10  882  	unsigned long src_pfns[32] = { 0 };
6046a3bed1c2b02 Arnd Bergmann   2025-06-10  883  	unsigned long dst_pfns[32] = { 0 };
16ce101db85db69 Alistair Popple 2022-09-28  884  	struct migrate_vma args = { 0 };
4c2e0f764eb4444 Alex Sierra     2022-07-15  885  	unsigned long next;
4c2e0f764eb4444 Alex Sierra     2022-07-15  886  	int ret;
4c2e0f764eb4444 Alex Sierra     2022-07-15  887  
4c2e0f764eb4444 Alex Sierra     2022-07-15  888  	start = cmd->addr;
4c2e0f764eb4444 Alex Sierra     2022-07-15  889  	end = start + size;
4c2e0f764eb4444 Alex Sierra     2022-07-15  890  	if (end < start)

If end == start then ret is uninitialized.

4c2e0f764eb4444 Alex Sierra     2022-07-15  891  		return -EINVAL;
4c2e0f764eb4444 Alex Sierra     2022-07-15  892  
4c2e0f764eb4444 Alex Sierra     2022-07-15  893  	/* Since the mm is for the mirrored process, get a reference first. */
4c2e0f764eb4444 Alex Sierra     2022-07-15  894  	if (!mmget_not_zero(mm))
4c2e0f764eb4444 Alex Sierra     2022-07-15  895  		return -EINVAL;
4c2e0f764eb4444 Alex Sierra     2022-07-15  896  
4c2e0f764eb4444 Alex Sierra     2022-07-15  897  	cmd->cpages = 0;
4c2e0f764eb4444 Alex Sierra     2022-07-15  898  	mmap_read_lock(mm);
4c2e0f764eb4444 Alex Sierra     2022-07-15  899  	for (addr = start; addr < end; addr = next) {
4c2e0f764eb4444 Alex Sierra     2022-07-15  900  		vma = vma_lookup(mm, addr);
4c2e0f764eb4444 Alex Sierra     2022-07-15  901  		if (!vma || !(vma->vm_flags & VM_READ)) {
4c2e0f764eb4444 Alex Sierra     2022-07-15  902  			ret = -EINVAL;
4c2e0f764eb4444 Alex Sierra     2022-07-15  903  			goto out;
4c2e0f764eb4444 Alex Sierra     2022-07-15  904  		}
4c2e0f764eb4444 Alex Sierra     2022-07-15  905  		next = min(end, addr + (ARRAY_SIZE(src_pfns) << PAGE_SHIFT));
4c2e0f764eb4444 Alex Sierra     2022-07-15  906  		if (next > vma->vm_end)
4c2e0f764eb4444 Alex Sierra     2022-07-15  907  			next = vma->vm_end;
4c2e0f764eb4444 Alex Sierra     2022-07-15  908  
4c2e0f764eb4444 Alex Sierra     2022-07-15  909  		args.vma = vma;
4c2e0f764eb4444 Alex Sierra     2022-07-15  910  		args.src = src_pfns;
4c2e0f764eb4444 Alex Sierra     2022-07-15  911  		args.dst = dst_pfns;
4c2e0f764eb4444 Alex Sierra     2022-07-15  912  		args.start = addr;
4c2e0f764eb4444 Alex Sierra     2022-07-15  913  		args.end = next;
4c2e0f764eb4444 Alex Sierra     2022-07-15  914  		args.pgmap_owner = dmirror->mdevice;
4c2e0f764eb4444 Alex Sierra     2022-07-15  915  		args.flags = dmirror_select_device(dmirror);
4c2e0f764eb4444 Alex Sierra     2022-07-15  916  
4c2e0f764eb4444 Alex Sierra     2022-07-15  917  		ret = migrate_vma_setup(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  918  		if (ret)
4c2e0f764eb4444 Alex Sierra     2022-07-15  919  			goto out;
4c2e0f764eb4444 Alex Sierra     2022-07-15  920  
4c2e0f764eb4444 Alex Sierra     2022-07-15  921  		pr_debug("Migrating from device mem to sys mem\n");
4c2e0f764eb4444 Alex Sierra     2022-07-15  922  		dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
4c2e0f764eb4444 Alex Sierra     2022-07-15  923  
4c2e0f764eb4444 Alex Sierra     2022-07-15  924  		migrate_vma_pages(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  925  		cmd->cpages += dmirror_successful_migrated_pages(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  926  		migrate_vma_finalize(&args);
4c2e0f764eb4444 Alex Sierra     2022-07-15  927  	}
4c2e0f764eb4444 Alex Sierra     2022-07-15  928  out:
4c2e0f764eb4444 Alex Sierra     2022-07-15  929  	mmap_read_unlock(mm);
4c2e0f764eb4444 Alex Sierra     2022-07-15  930  	mmput(mm);
4c2e0f764eb4444 Alex Sierra     2022-07-15  931  
4c2e0f764eb4444 Alex Sierra     2022-07-15 @932  	return ret;
4c2e0f764eb4444 Alex Sierra     2022-07-15  933  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

