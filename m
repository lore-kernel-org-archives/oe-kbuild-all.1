Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FB1DFE8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972780; cv=none; b=VVawABLLYzcGZhE4iV/uyhCJA0sMXN1GtQ/BtcTtONvs76a90U3zn7sIAgs46pNCMXFROAjfoqyYZ5eQJ7bKeVHMKeNKuyu1Gr7iemr13Sd+Kv8z+WRsWNchOR2xWzFCWvNQwBhQE0qk7H9Sh9UWvgw2Qj5ehM3kKmzZkVCv0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972780; c=relaxed/simple;
	bh=gCJBrtpD1zb+rKcgrSSzloY6l3QLliLLRJ9Z+1iODZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nO+g8qqijF2hmdSoXx6i5ukAbMP2v0KA5THgL20lNhuTRCvsTPF7Gn3xReZ+vLWSJXJXqPMqO6edHlPSSwS7/OGUuccb3eYKH/qtbQIb42s1NP2RU6GQEsikGS/xWnwbTuY5dg6DUADatWmkgXTKWfKnyelupgLswGNkYMTy3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AiD72uEm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AiD72uEm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374bb08d011so3173680f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725972776; x=1726577576; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LytqXkjAg4kJafNiKcHBPrkZjdNnaMiyYSwVbXFWN6s=;
        b=AiD72uEmBO9bqSSImQTPgjyX1MhIK9khiEO+KafG+AYFl7Zfx/X6ZVjVXlD5nQSbra
         xCZ2vjDnPTAyJQmqdnU3Cq2pC9kFb5eeX+9aXI+9fKlWLnOHAkDMzkAAZ9QZu6L9sPC9
         ZyoR7dNLWwkB70EOK3YgCm7oGqRA02UcTllv6257kQNyjh4ZPDmwGM7o6GGGd3hG9d9v
         teZW1bUhllvRJfvhezWOSLn6eBDymjRxZ9xXy3rSacufDnS8dYxRljFU9SgD/VXGAyBn
         LEHTus3MnC9mOw8dlXTl/rWyIcr3mHhItvRbFYlCtcXBfQsqwrPwmirDn4nUqqtR7jcv
         6Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972776; x=1726577576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LytqXkjAg4kJafNiKcHBPrkZjdNnaMiyYSwVbXFWN6s=;
        b=BwFcrv4htVKiTdcidZwF6OHmVyzVCfdxA3OajreI5LGF9HcV/W+qkkJiP/46v/tNsz
         gkbVT0ad0h7W0XbtlxyuV/ekCAkvlPMzYKEgBgpUfg2aXTaOfVY5Ffwn2b/rywb/twvW
         Ud/aTKsXzZUnCsf3MAMrU4/Rimh/jtYbv2VJd7djLr73TGBZT7ExDK8bD0ReHoqbqFwj
         VqgsQ/TaXhENOX6H0NDGP0jV51txywsRtpji3JDnH5ufvxiqrhZI75rqMoRsYZon7NZy
         aNCXXx9M4fBEGwYK+Vtgpf3nJtfKt4ErAt+1n/v5hpW7bKEJvywcJRWh/9CzcfcSFslX
         xWKw==
X-Forwarded-Encrypted: i=1; AJvYcCWK1avPZcGNGTxaoEU/rvP52bBVRS5UBwGbRBCtJwdOVhpORaOI9ouxFs5UC4J3+27Dl9dE76TqK8aVUFO0@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd1AFaIVPeFbE2hEKo9fk9zo103QgISX6S0iQbuWI1q4GhcIXQ
	Z5i5HciDzPPcXljGuhEG/w644uRKM6e/of1spEfXEoB9sddxPss/6BRH4Hbr9y4=
X-Google-Smtp-Source: AGHT+IEB2acOgb1hQNL6xw1IZqZNa0+g3rm4HvpsctDrKvmlOn36D67jAxDB2raxeo4vxE8iMWHdag==
X-Received: by 2002:adf:f807:0:b0:374:c17a:55b5 with SMTP id ffacd0b85a97d-378895c9f94mr8480599f8f.14.1725972776245;
        Tue, 10 Sep 2024 05:52:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d374fsm8897233f8f.86.2024.09.10.05.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:52:55 -0700 (PDT)
Date: Tue, 10 Sep 2024 15:52:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Qu Wenruo <wqu@suse.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [linux-next:master 9813/10862] fs/btrfs/subpage.c:437
 btrfs_folio_end_writer_lock_bitmap() warn: variable dereferenced before
 check 'fs_info' (see line 431)
Message-ID: <3023236c-6e88-407b-9640-5b956d4c969c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6708132e80a2ced620bde9b9c36e426183544a23
commit: 966416b380926c94751476747ea68571004eac24 [9813/10862] btrfs: only unlock the to-be-submitted ranges inside a folio
config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101924.XTvd0yQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409101924.XTvd0yQv-lkp@intel.com/

smatch warnings:
fs/btrfs/subpage.c:437 btrfs_folio_end_writer_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 431)

vim +/fs_info +437 fs/btrfs/subpage.c

966416b380926c Qu Wenruo 2024-09-02  427  void btrfs_folio_end_writer_lock_bitmap(const struct btrfs_fs_info *fs_info,
966416b380926c Qu Wenruo 2024-09-02  428  					struct folio *folio, unsigned long bitmap)
966416b380926c Qu Wenruo 2024-09-02  429  {
966416b380926c Qu Wenruo 2024-09-02  430  	struct btrfs_subpage *subpage = folio_get_private(folio);
966416b380926c Qu Wenruo 2024-09-02 @431  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
                                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

966416b380926c Qu Wenruo 2024-09-02  432  	unsigned long flags;
966416b380926c Qu Wenruo 2024-09-02  433  	bool last = false;
966416b380926c Qu Wenruo 2024-09-02  434  	int cleared = 0;
966416b380926c Qu Wenruo 2024-09-02  435  	int bit;
966416b380926c Qu Wenruo 2024-09-02  436  
966416b380926c Qu Wenruo 2024-09-02 @437  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
                                                             ^^^^^^^^^
Too late

966416b380926c Qu Wenruo 2024-09-02  438  		folio_unlock(folio);
966416b380926c Qu Wenruo 2024-09-02  439  		return;
966416b380926c Qu Wenruo 2024-09-02  440  	}
966416b380926c Qu Wenruo 2024-09-02  441  
966416b380926c Qu Wenruo 2024-09-02  442  	if (atomic_read(&subpage->writers) == 0) {
966416b380926c Qu Wenruo 2024-09-02  443  		/* No writers, locked by plain lock_page(). */
966416b380926c Qu Wenruo 2024-09-02  444  		folio_unlock(folio);
966416b380926c Qu Wenruo 2024-09-02  445  		return;
966416b380926c Qu Wenruo 2024-09-02  446  	}
966416b380926c Qu Wenruo 2024-09-02  447  
966416b380926c Qu Wenruo 2024-09-02  448  	spin_lock_irqsave(&subpage->lock, flags);
966416b380926c Qu Wenruo 2024-09-02  449  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
966416b380926c Qu Wenruo 2024-09-02  450  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
966416b380926c Qu Wenruo 2024-09-02  451  			cleared++;
966416b380926c Qu Wenruo 2024-09-02  452  	}
966416b380926c Qu Wenruo 2024-09-02  453  	ASSERT(atomic_read(&subpage->writers) >= cleared);
966416b380926c Qu Wenruo 2024-09-02  454  	last = atomic_sub_and_test(cleared, &subpage->writers);
966416b380926c Qu Wenruo 2024-09-02  455  	spin_unlock_irqrestore(&subpage->lock, flags);
966416b380926c Qu Wenruo 2024-09-02  456  	if (last)
966416b380926c Qu Wenruo 2024-09-02  457  		folio_unlock(folio);
966416b380926c Qu Wenruo 2024-09-02  458  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

