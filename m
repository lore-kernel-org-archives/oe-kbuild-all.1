Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BA361DD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137740; cv=pass; b=B/FT1UhsWgrT8X9+4YzglWWoCnl2UTxDmGtPr6s1ZpuxXbb7VzZy9F1NYuhHfFoyIdBM86Ys9zvsuyNrSrzS3Zu4N8OEmZPSreStDK2Nx2IxZ5wmoS51NRfBmvuPaZASJ1GWdobhRgP5vU2SRmrV02vjFdpRpp4BezC4vocBkE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137740; c=relaxed/simple;
	bh=l9tNbApyNKlKEGwYqWI2PPtB9POx0b+CnQVgR7HkWdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZZfwxlByb3dVPh2Xz3X4jkxwjwuAuAe/inXWMgFsPG0k7HamkfHbnZHYlx062pm98SDHTOeWt4SjFbbZSOK1qWJ+vrNlKo5D/FFv8DuI/3ku4o1zjaShEZM1zHXfKL+8ynMDXoDe82fWJ+nEfBR+MLPi2Ti8BsAfkI56gU+W6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WwbYG5B/; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WwbYG5B/"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12bee82a1ecso2488056c88.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Apr 2026 06:48:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775137737; cv=none;
        d=google.com; s=arc-20240605;
        b=cDa5qoFQk4V//8o4bDQj6tBGgcwoFUF44VhF25KNtUXIB7A7fUJfhmBA++VldLlKiy
         AHPtmDGpryfCQ2nZBvLn218mbXSIFtuDbSS2qpZwLrFUYwbCf8Jkxr7pztzZimXWWl75
         9tiv+eB4ZHNTdQZtW+47iXqUcT/pjUIFLWq3TytxEwWJqQ5ZGhAplGXtImROyW2P/1C3
         UQZx4+oDfrHJWTgSLHH4iu9rV854UDFmzy+D6EZEQE4fa5MrP2ohlJgZ9fQrRiObr0c/
         VwHb9TfwcvonSsywqVIOOZ4AxILtAQxAZRg+kt1WoWNTOin4cnS0oczujbL3s+Tz1wdf
         4zWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        fh=NK6EyyvEOP2eE/Esd6FagJis/psu1NA9uOn9xXL2pW0=;
        b=j+LwKhmgXc+DsUDT15UVwpwT3Lp2Zi2x2FnTC+2GhJw8qG00w5kgoVuHhhjuaRyknW
         FXN8rJgaNyqyNM1zbQ4AtM8TY3sPlt41Gzrvz83qz2L2t2BFfSMfZcD6GngG5ktcIch+
         uLimlj0wU73IdooxG4wJBXFFcy/Id4pKjvNJhHVIhZA0n2hILyVnFnb02Lm6RxbW2dgz
         01Rbq4XfqxdHwIdPVQ8jH2zqFiqlrZWQnbnfr3k1e+CqGOghLuxg323zqX4UE35fT+nB
         MlvyHW26I6GHlh8dTySmYAo9TgZCHOw4HxPjHz8XQeM9lAoRHIC1LNCT4Do/fLgGnPB7
         2eGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775137737; x=1775742537; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        b=WwbYG5B/AmXNTsEgZKB+T6IokNLrLqSRKgQcX+9li3DOLKJrMVUJkRzcRs+9FnQYmI
         e32taf6Xlv2XHzbLwvGQEDLhGrKyiG1IFWVEvAvPnrLqdxQN8Pb6UyyMRTkrV5lPsMaT
         nVAibvy6s8G1auwEMMyKp64Ya1I0orsXHMNOeQZM8Ndy68HB90YorneZiDLKFQWK/KxI
         uyAy9GtbKgRyiAd/8fPcRMed1hSSp/5rFl8VtKSkOP1XYflhD/N1sPVm7gbJrrW769R0
         FDjgOe1b4F9NMlTde8xLhiphLl/drTCRFO2rT8adziwAuJpA5YyxrIIc6CK3h5QSQqMn
         H4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137737; x=1775742537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4odl4u5FIkYFl0AjuN4ex6RSgkq9844Lzudav/PrauU=;
        b=Ak7FnMEKJ6DHt9nbQWP/yy06l5fg38OHFsQ6x+oajXOuS+wldjMZbUMu0S4w75QDa+
         1QLlr2LHjhgAOBMg2+igeumKwfVwbLchuPigSpyZfcFjKjzAjP/9IZcWU/VgX8z5W2nE
         tETbXYn+PD4M4tbOUBKKkWSKxD2GwJezyPBfnGahQmbBazPQnkkzMZy1ySTJJ/3Ezyb9
         wqs8bvB3vfKcHpgLuTrVdp+77HHVw3qiHvP0aeSAV+cAzPL4WK4jhJPQ+AzKLihkRglE
         StrpM/0lJIN+jmyBWDLzzPC83CdylgrQU43ZK1mNtZl+Ld0BjlvaE+jBJZ80O/4tFi3z
         jTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVLUBo6TO//WMESfvN//5mM6pdBErFuGuNl0WVvGVuM6F1EiYJtYBPu9tfDGTTMZO8S3MTZ2TnbKHdXFjs@lists.linux.dev
X-Gm-Message-State: AOJu0YxIwmKKJzhgbQivDPpbgMojA7/9rtlQtt6B8RoOezVHnA3Wd7TN
	hvm+5uat6esgGUgbeaJj9faFeeBzfJS22cvZ7ETlFw1b0Hi4xb9D69xlBNgc9iOfRERqGQb53qR
	5Vmxp7pSH83U1xtwElk3ihkELIi8E4SvekeVF2Y9j
X-Gm-Gg: ATEYQzym0eLSMwH+oh268y8SLOAI0wBAGxu93QnZ6ifZjeg5sh6a5mabt4Kqo6ALHjj
	5LUaNlKP+oKG8fodoMBs5T5S8mGsmT1Duosv57nqge3pa3b3MkLXui9ScrtpUW0qmkK/2z0ojhh
	u4hTdwn+iAEEegBNt8KpYSkc0346L8pAyRsrSTvsrsNxrhOcsluPZntXlQtXS/1kL2Xl5OX4ktu
	YryTKuuH5a1w39Rz2Ft0VDwXj3EyqpBb+NgU83bJT3zw3/M4spVBXjG8NAXQ5hnrHXelJPCXyFH
	YF9rDUfeN38LvlokmrtyJnZBRS3L5tFsylidshQ=
X-Received: by 2002:a05:7022:4582:b0:11d:c86c:652e with SMTP id
 a92af1059eb24-12be64206a6mr4246421c88.5.1775137736932; Thu, 02 Apr 2026
 06:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <202604020400.jEq32K95-lkp@intel.com>
In-Reply-To: <202604020400.jEq32K95-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 2 Apr 2026 15:48:20 +0200
X-Gm-Features: AQROBzBTzNfYUXOsbmlfPQCs1PnLUVzNWPXPqQybMa2GKboY40C31FthWXXrJZ4
Message-ID: <CANpmjNOsM1e8jMvRKtEizMmZgPCCZ9YqpuZKad61Zg7PAGW7RA@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux-foundation.org>, Harry Yoo <harry.yoo@oracle.com>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 15:33, Dan Carpenter <error27@gmail.com> wrote:
>
> Hi Marco,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Elver/slab-support-for-compiler-assisted-type-based-slab-cache-partitioning/20260401-035608
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20260331111240.153913-1-elver%40google.com
> patch subject: [PATCH v1] slab: support for compiler-assisted type-based slab cache partitioning
> config: um-randconfig-r072-20260401
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch: v0.5.0-9004-gb810ac53
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202604020400.jEq32K95-lkp@intel.com/
>
> New smatch warnings:
> drivers/misc/lkdtm/heap.c:118 lkdtm_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)
> drivers/misc/lkdtm/heap.c:169 lkdtm_KFENCE_READ_AFTER_FREE() warn: potential pointer math issue ('base' is a 32 bit pointer)

How is this related to the patch I sent? Did the <linux/slab.h> change
force rechecking of all these files and it found latent issues?

> vim +118 drivers/misc/lkdtm/heap.c
>
> 73f62e60d80c2d drivers/misc/lkdtm/heap.c Kees Cook    2022-03-03   92  static void lkdtm_READ_AFTER_FREE(void)
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   93  {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   94   int *base, *val, saw;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   95   size_t len = 1024;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26   96   /*
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   97    * The slub allocator will use the either the first word or
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   98    * the middle of the allocation to store the free pointer,
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25   99    * depending on configurations. Store in the second word to
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  100    * avoid running into the freelist.
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  101    */
> e12145cf1c3a80 drivers/misc/lkdtm/heap.c Kees Cook    2020-06-25  102   size_t offset = sizeof(*base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  103
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  104   base = kmalloc(len, GFP_KERNEL);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  105   if (!base) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  106           pr_info("Unable to allocate base memory.\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  107           return;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  108   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  109
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  110   val = kmalloc(len, GFP_KERNEL);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  111   if (!val) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  112           pr_info("Unable to allocate val memory.\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  113           kfree(base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  114           return;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  115   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  116
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  117   *val = 0x12345678;
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26 @118   base[offset] = *val;
>
> This doesn't really matter, but the comment says we are writing to the
> second word.  The base[] array holds 256 integers, so:
>
>         base[sizeof(int)] = *val;
>
> would be the third word, right?  A word is unsigned long, right?  All
> of a sudden I am unsure.  :P

???

So this is clearly a minor defect in this existing code (comment wrong
or code might want to match what the comment said), but "slab: support
for compiler-assisted type-based slab cache partitioning" didn't touch
that.

> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  119   pr_info("Value in memory before free: %x\n", base[offset]);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  120
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  121   kfree(base);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  122
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  123   pr_info("Attempting bad read from freed memory\n");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  124   saw = base[offset];
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  125   if (saw != *val) {
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  126           /* Good! Poisoning happened, so declare a win. */
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  127           pr_info("Memory correctly poisoned (%x)\n", saw);
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  128   } else {
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  129           pr_err("FAIL: Memory was not poisoned!\n");
> 5b777131bd8005 drivers/misc/lkdtm/heap.c Kees Cook    2021-06-23  130           pr_expected_config_param(CONFIG_INIT_ON_FREE_DEFAULT_ON, "init_on_free");
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  131   }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  132
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  133   kfree(val);
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  134  }
> ffc514f3fcac4a drivers/misc/lkdtm_heap.c Kees Cook    2016-06-26  135
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  136  static void lkdtm_KFENCE_READ_AFTER_FREE(void)
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  137  {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  138   int *base, val, saw;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  139   unsigned long timeout, resched_after;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  140   size_t len = 1024;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  141   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  142    * The slub allocator will use the either the first word or
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  143    * the middle of the allocation to store the free pointer,
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  144    * depending on configurations. Store in the second word to
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  145    * avoid running into the freelist.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  146    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  147   size_t offset = sizeof(*base);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  148
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  149   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  150    * 100x the sample interval should be more than enough to ensure we get
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  151    * a KFENCE allocation eventually.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  152    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  153   timeout = jiffies + msecs_to_jiffies(100 * kfence_sample_interval);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  154   /*
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  155    * Especially for non-preemption kernels, ensure the allocation-gate
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  156    * timer can catch up: after @resched_after, every failed allocation
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  157    * attempt yields, to ensure the allocation-gate timer is scheduled.
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  158    */
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  159   resched_after = jiffies + msecs_to_jiffies(kfence_sample_interval);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  160   do {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  161           base = kmalloc(len, GFP_KERNEL);
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  162           if (!base) {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  163                   pr_err("FAIL: Unable to allocate kfence memory!\n");
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  164                   return;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  165           }
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  166
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  167           if (is_kfence_address(base)) {
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29  168                   val = 0x12345678;
> aabf7c37dfbce3 drivers/misc/lkdtm/heap.c Stephen Boyd 2023-11-29 @169                   base[offset] = val;
>                                                                                         ^^^^^^^^^^^^^^^^^^
> Same here.

Unrelated to "slab: support for compiler-assisted type-based slab
cache partitioning".
