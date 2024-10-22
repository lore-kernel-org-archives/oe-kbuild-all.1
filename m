Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A41CC147
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630365; cv=none; b=iwLx0YU7+pl4c0ON62+7HwAqcPNWxHalFlIfHCHkJwieQuJ881k1pxIP+0QG/1yV351WqYZSnbKjjeKewtikBJsmnjmj/4HJbhZJkPO4qYJZLsy/+7QMvArMoNSTBluvNMYqgFO5szYU3PP6OEXe/y2kVKRaYCTfUweCmPTx3pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630365; c=relaxed/simple;
	bh=U3rKvqLYrU17CnpvwCOY9tC1Wc0auZrdJPAFKphHmds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dox+lN7gQK6Gcrs0e5Od/9gg4kH6cpO9kG7ZDMXWKts/KZBY5Zty0ILfLz9z2NOlTcLUxSFYhvNs/QF3MNYaiIXh60m/egTrZ1Oiyu6cqGesli+Jiy9lGUXSz69lDgrbG8w8YsaAagGka3wQbFuUA19mjjMjtCKc4bTAAwvIujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9u9FNvF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9u9FNvF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43158625112so60098745e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729630361; x=1730235161; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUAcUW24njjn+XrN6mOIm7m9zPxXv5JZOuaBqXkJE/o=;
        b=i9u9FNvFOU00Kezb5VgBZUX/xRcBfNph+XRIlfkmPfea5LrAnh7C0jvy0LfNbOQ+1Z
         AuI4lOgXY4uIR3pn7fdVGoQfu7OFBTUbxhc/twm964YJ1ARU37ctJbK9advMC9dooQCK
         q4BYiPVFqdxptKqaVZe5DVYm/5mOb1/Gnwyv4glXcQAU2UWNc1eIW8dh5LdwFjx6iIiH
         5C8Sy4Ntq4kPX01c2KnN/nBzYM1S1kvZTdXwHiuz9hrWfMNYCu1YA/p+YXmBeddkLikD
         skNcc+uyHKI2VqH5E5ZU2bRhhYEhGiZRQ6W0le2xTQF9oAmnJG332QlvaCnpNEsFVWuQ
         YZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630361; x=1730235161;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUAcUW24njjn+XrN6mOIm7m9zPxXv5JZOuaBqXkJE/o=;
        b=giq6ZAw1GmYQXhjD6eoKpobR1OdtN2lUaOjpFnxuUZMfxr3SIaQQql0JWBrg3D1Rvm
         Rx6Qfy8d4hTt0ar20kbbe7c4uTFH25PZTwiz+iQ8eHolrSJpUep4rXjf200unm/3wrib
         Wq6TAgrUPssIPGodK+2ySKAfouHPQcjv32T45UUKNNlNvNPPKnytRU12VW93whVmSV+w
         1rJPKjeLLkDdlRnPbGPf21LR9twWah8S0piRjE+t3+dGu8eA8jLTtLWIGRdDfXpuQNLU
         T7pg9CUTv6xJqumIUEdV5+V2qAC7Z7A/Ta14KJ4azw870oE7k1bZY8Oen4WnAkMaE9m5
         m6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrfOpgFb4yPX0e8Feo/+8viZ7Ir3fmS04dNBA65IMQEunfdVzCwfdduX8kwixQYZnY0mgazVYlAMiL3w3F@lists.linux.dev
X-Gm-Message-State: AOJu0YyFl1PC2sqBpnkArVWBlZEFaW+3nFAfEYpxKFuUrKZB9W+SQzBV
	sR6BiWMhCRYaWIYlRecKHOYyX3hoPr+PFt7H63Oix+CWl4bxu69LepPpwD0Fir8Xyz/2+zqRB3p
	v2TA=
X-Google-Smtp-Source: AGHT+IECBvkH3BCoyj6ByZPNuhscJZaEF7nR00mX/vf+rCWpImRlEcUIlw//M8n181HmRnNRuQdEPQ==
X-Received: by 2002:a05:600c:1c03:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-4318424eb98mr3692595e9.24.1729630361350;
        Tue, 22 Oct 2024 13:52:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fe00sm98868615e9.20.2024.10.22.13.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:52:40 -0700 (PDT)
Date: Tue, 22 Oct 2024 23:52:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [kdave-btrfs-devel:test-for-next 78/86] fs/btrfs/subpage.c:332
 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 326)
Message-ID: <fee3fa59-82b9-44b4-aec9-f4680aa8c365@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git test-for-next
head:   bf6531230d457f76c7eaef675bf4364634701ce4
commit: 8a1e6576deee2baede43827c092b3b183687a9e7 [78/86] btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
config: i386-randconfig-141-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230432.QbEXhcm1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410230432.QbEXhcm1-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:332 btrfs_folio_end_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 326)

vim +/fs_info +332 fs/btrfs/subpage.c
1e1de38792e0ae Qu Wenruo 2021-05-31  321  
8a1e6576deee2b Qu Wenruo 2024-10-09  322  void btrfs_folio_end_lock_bitmap(const struct btrfs_fs_info *fs_info,
bd610c0937aaf0 Qu Wenruo 2024-09-02  323  				 struct folio *folio, unsigned long bitmap)
bd610c0937aaf0 Qu Wenruo 2024-09-02  324  {
bd610c0937aaf0 Qu Wenruo 2024-09-02  325  	struct btrfs_subpage *subpage = folio_get_private(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02 @326  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

bd610c0937aaf0 Qu Wenruo 2024-09-02  327  	unsigned long flags;
bd610c0937aaf0 Qu Wenruo 2024-09-02  328  	bool last = false;
bd610c0937aaf0 Qu Wenruo 2024-09-02  329  	int cleared = 0;
bd610c0937aaf0 Qu Wenruo 2024-09-02  330  	int bit;
bd610c0937aaf0 Qu Wenruo 2024-09-02  331  
bd610c0937aaf0 Qu Wenruo 2024-09-02 @332  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
                                                             ^^^^^^^^
Checked too late.

bd610c0937aaf0 Qu Wenruo 2024-09-02  333  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  334  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  335  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  336  
8a1e6576deee2b Qu Wenruo 2024-10-09  337  	if (atomic_read(&subpage->nr_locked) == 0) {
8a1e6576deee2b Qu Wenruo 2024-10-09  338  		/* No subpage lock, locked by plain lock_page(). */
bd610c0937aaf0 Qu Wenruo 2024-09-02  339  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  340  		return;
bd610c0937aaf0 Qu Wenruo 2024-09-02  341  	}
bd610c0937aaf0 Qu Wenruo 2024-09-02  342  
bd610c0937aaf0 Qu Wenruo 2024-09-02  343  	spin_lock_irqsave(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  344  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
bd610c0937aaf0 Qu Wenruo 2024-09-02  345  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
bd610c0937aaf0 Qu Wenruo 2024-09-02  346  			cleared++;
bd610c0937aaf0 Qu Wenruo 2024-09-02  347  	}
8a1e6576deee2b Qu Wenruo 2024-10-09  348  	ASSERT(atomic_read(&subpage->nr_locked) >= cleared);
8a1e6576deee2b Qu Wenruo 2024-10-09  349  	last = atomic_sub_and_test(cleared, &subpage->nr_locked);
bd610c0937aaf0 Qu Wenruo 2024-09-02  350  	spin_unlock_irqrestore(&subpage->lock, flags);
bd610c0937aaf0 Qu Wenruo 2024-09-02  351  	if (last)
bd610c0937aaf0 Qu Wenruo 2024-09-02  352  		folio_unlock(folio);
bd610c0937aaf0 Qu Wenruo 2024-09-02  353  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

