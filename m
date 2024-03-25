Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A198141981
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 05:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711345454; cv=none; b=ocTJkB8NOZP2E4o6aRzZPlHMKKQURLymt4wWY7z2rR+2iHnzSxgG7eRpY4lpoEGMXDGRWwgn5/1yIOgI9T7WbjLJeSc/2vYtvaTD42iRGbxMMZpsZexJ7jTjuCoWFZ946ErSFRuiBIZ0kQBYsD3jOuhl1RPCeZfqM53FT25Vs3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711345454; c=relaxed/simple;
	bh=8b2NPUXak2rPBHzFSSeaiB2UBGM6VTUB0LxmrYdTc0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uezPXcSNpqni+YqmFGYSW72dLMqTCfgc6Dl4rT80hkmoVat5O7JCywdTrD9mj/NUmyrqHE4p5Ff1NwR86IdO9QLVEUhY1Lj6RKim85fXWMrIYb71Ok13TPd/rc1/IgtHOl9haCpfeB5LgIik72wbkiXyzo0mnQXS3BGT7gxTORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rlp7FWES; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rlp7FWES"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c0613307cso1070663a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 22:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711345450; x=1711950250; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSiD+9+Vo/MN7nexjWvC9Mo/4lJyNqYqVIVWFz6u1GY=;
        b=Rlp7FWESN9cNHrPF4JmNzrRl2LBDizc/GY+knrvuo4stayXjmu2F5iwLR458OCSJnT
         2wYVglq51ZJDHrBENy03ExQ0RvCipweBgPBZMIvqxbeVkVRj9RVJY+DSh0t8gaHqJpqj
         +1qaapsROMxP0mJ1HZPOXh1UgyxXjG/HaX98qT+uN0iCeWh5XhkOE+O4mdToYbcaxcBA
         jjDkpwb8xobpFU9EZ2i/MoRzyT+TAd2IeLLjBskjNqS94K+JPkYtr6oFTkF17Fh4/P5o
         VZyunsFQdAHi7OKvGQN239uWfMo5aG7PPfh623WhJMYiF8+PvZHP0qtiBT9X1QKw4Imd
         aq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711345450; x=1711950250;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSiD+9+Vo/MN7nexjWvC9Mo/4lJyNqYqVIVWFz6u1GY=;
        b=enlDXPtv0eBA4QbVT6JXx7WYmaf62bgP7LEk9QXx8h5GnXU0at2/cXxowHt2ErNw4l
         TUMAGLymWzVUkAaKubt6PRiGqHYTmMzbb/iQMR9NhXTuPKew+/OFEeZ0RvMyMuXu58Ft
         61f3fn/xk/7vOdHIby3S4gXafI/N2l00Wi4v6QPPkE+wYzzWQjwYRJjeJuuf0+APfPDs
         TO2VOb5P/X9ueb8CjBldMF2rswOIs7Kdbf4yJrzwYDk+OWjD4S/+FGuTD1c2/qDeA7Yk
         /h7VO4NKRPIb5GUuHbKavlzZvc+ihNiC2AT63xm9kIsMJvnBvTUG3fhWH429GV9eJl72
         hZOg==
X-Forwarded-Encrypted: i=1; AJvYcCUnowUUADM4LZTy5dNJSd1dQ4cF+1FaX7yDygRtbC0kKWYhZaEtdP7xrfLqO+O7dJcGrBkZex474WR6o7WFUFqSXQ7fsGNPSvjKeAJ6rA==
X-Gm-Message-State: AOJu0Yz7OeMQWUwnym6eqV6JNRxXKaLEN8yApK1ggLC/p+sUpi21+j4P
	0bf/st+AcVHhgy6saEGaIinsh32OSq0n7BxLI4mgA4KkcgXWmmHAgsJpRGJoZqc=
X-Google-Smtp-Source: AGHT+IGwv0s6BaURbKfJtjYu2GpcpPn5goZ2nF4pAupUt62oAYFBPgf35YKkH3776wuuNPBOF6xOrQ==
X-Received: by 2002:a17:906:947:b0:a46:edb6:df44 with SMTP id j7-20020a170906094700b00a46edb6df44mr3208186ejd.67.1711345449597;
        Sun, 24 Mar 2024 22:44:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i27-20020a170906265b00b00a471481ef3csm2630995ejc.124.2024.03.24.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 22:44:09 -0700 (PDT)
Date: Mon, 25 Mar 2024 08:44:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jinjiang Tu <tujinjiang@huawei.com>,
	akpm@linux-foundation.org, david@redhat.com, shr@devkernel.io,
	hannes@cmpxchg.org, riel@surriel.com, wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com, linux-mm@kvack.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, tujinjiang@huawei.com
Subject: Re: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
Message-ID: <4005efd4-06a5-4c91-845a-f0ad2cc792e2@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322060947.3254967-2-tujinjiang@huawei.com>

Hi Jinjiang,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-ksm-fix-ksm-exec-support-for-prctl/20240322-141317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240322060947.3254967-2-tujinjiang%40huawei.com
patch subject: [PATCH v2 1/2] mm/ksm: fix ksm exec support for prctl
config: openrisc-randconfig-r081-20240322 (https://download.01.org/0day-ci/archive/20240324/202403240146.Pv4gVc5N-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403240146.Pv4gVc5N-lkp@intel.com/

smatch warnings:
fs/exec.c:305 __bprm_mm_init() error: uninitialized symbol 'err'.

vim +/err +305 fs/exec.c

b6a2fea39318e43 Ollie Wild                  2007-07-19  255  static int __bprm_mm_init(struct linux_binprm *bprm)
b6a2fea39318e43 Ollie Wild                  2007-07-19  256  {
eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  257  	int err;
b6a2fea39318e43 Ollie Wild                  2007-07-19  258  	struct vm_area_struct *vma = NULL;
b6a2fea39318e43 Ollie Wild                  2007-07-19  259  	struct mm_struct *mm = bprm->mm;
b6a2fea39318e43 Ollie Wild                  2007-07-19  260  
490fc053865c9cc Linus Torvalds              2018-07-21  261  	bprm->vma = vma = vm_area_alloc(mm);
b6a2fea39318e43 Ollie Wild                  2007-07-19  262  	if (!vma)
eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  263  		return -ENOMEM;
bfd40eaff5abb9f Kirill A. Shutemov          2018-07-26  264  	vma_set_anonymous(vma);
b6a2fea39318e43 Ollie Wild                  2007-07-19  265  
d8ed45c5dcd455f Michel Lespinasse           2020-06-08  266  	if (mmap_write_lock_killable(mm)) {
f268dfe905d4682 Michal Hocko                2016-05-23  267  		err = -EINTR;
f268dfe905d4682 Michal Hocko                2016-05-23  268  		goto err_free;
f268dfe905d4682 Michal Hocko                2016-05-23  269  	}
b6a2fea39318e43 Ollie Wild                  2007-07-19  270  
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  271  	/*
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  272  	 * Need to be called with mmap write lock
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  273  	 * held, to avoid race with ksmd.
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  274  	*/
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  275  	if (ksm_execve(mm))
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  276  		goto err_ksm;

"err" not set before the goto.

d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  277  
b6a2fea39318e43 Ollie Wild                  2007-07-19  278  	/*
b6a2fea39318e43 Ollie Wild                  2007-07-19  279  	 * Place the stack at the largest stack address the architecture
b6a2fea39318e43 Ollie Wild                  2007-07-19  280  	 * supports. Later, we'll move this to an appropriate place. We don't
b6a2fea39318e43 Ollie Wild                  2007-07-19  281  	 * use STACK_TOP because that can depend on attributes which aren't
b6a2fea39318e43 Ollie Wild                  2007-07-19  282  	 * configured yet.
b6a2fea39318e43 Ollie Wild                  2007-07-19  283  	 */
aacb3d17a73f644 Michal Hocko                2011-07-26  284  	BUILD_BUG_ON(VM_STACK_FLAGS & VM_STACK_INCOMPLETE_SETUP);
b6a2fea39318e43 Ollie Wild                  2007-07-19  285  	vma->vm_end = STACK_TOP_MAX;
b6a2fea39318e43 Ollie Wild                  2007-07-19  286  	vma->vm_start = vma->vm_end - PAGE_SIZE;
1c71222e5f2393b Suren Baghdasaryan          2023-01-26  287  	vm_flags_init(vma, VM_SOFTDIRTY | VM_STACK_FLAGS | VM_STACK_INCOMPLETE_SETUP);
3ed75eb8f1cd895 Coly Li                     2007-10-18  288  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
462e635e5b73ba9 Tavis Ormandy               2010-12-09  289  
b6a2fea39318e43 Ollie Wild                  2007-07-19  290  	err = insert_vm_struct(mm, vma);
eaccbfa564e48c8 Luiz Fernando N. Capitulino 2009-01-06  291  	if (err)
b6a2fea39318e43 Ollie Wild                  2007-07-19  292  		goto err;
b6a2fea39318e43 Ollie Wild                  2007-07-19  293  
b6a2fea39318e43 Ollie Wild                  2007-07-19  294  	mm->stack_vm = mm->total_vm = 1;
d8ed45c5dcd455f Michel Lespinasse           2020-06-08  295  	mmap_write_unlock(mm);
b6a2fea39318e43 Ollie Wild                  2007-07-19  296  	bprm->p = vma->vm_end - sizeof(void *);
b6a2fea39318e43 Ollie Wild                  2007-07-19  297  	return 0;
b6a2fea39318e43 Ollie Wild                  2007-07-19  298  err:
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  299  	ksm_exit(mm);
d282f6b19afd1a9 Jinjiang Tu                 2024-03-22  300  err_ksm:
d8ed45c5dcd455f Michel Lespinasse           2020-06-08  301  	mmap_write_unlock(mm);
f268dfe905d4682 Michal Hocko                2016-05-23  302  err_free:
b6a2fea39318e43 Ollie Wild                  2007-07-19  303  	bprm->vma = NULL;
3928d4f5ee37cdc Linus Torvalds              2018-07-21  304  	vm_area_free(vma);
b6a2fea39318e43 Ollie Wild                  2007-07-19 @305  	return err;
b6a2fea39318e43 Ollie Wild                  2007-07-19  306  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

