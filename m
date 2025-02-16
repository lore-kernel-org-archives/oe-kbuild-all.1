Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C92904
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739718485; cv=none; b=h2EPCKSZe16pDk4nYNuZGa5/DQohJsWtlaqgDIh5iTVYlqHgOnq6VSX7wfgUlfWTwqqcOUqH8sjl9lZXboj+Pnv8LG8ObyH67Dv+gJ3WiEKHfrv0T2EcLIFWeHnXqzKtc93vfvzo+sKcElcUhZXfM5UXhjNRoT6lElHCShJQOYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739718485; c=relaxed/simple;
	bh=5lD/xE0/i3x58jgI6adRMe04H0+H+4nJKLZDwim0Uhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U0LH/slbBRHm6As4KRSZ1X4MV8rI9TnvB8zKOuSJlEIUV4hCYoA0t5ObsAUkJP+Sk7NAdh1/aHe0WR0M45cevsJ+j2Xa61TdEoOljhJAmvds8INNPUACpSHam76/SJ4g4zRJikTUrF3SXK23otn12HlPg9WTvBp8h8B0CJFa1Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RvRaEfGC; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RvRaEfGC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abb97e15bcbso41991166b.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 07:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739718481; x=1740323281; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y53y9K9S/4j536/Ca/UZoX5PNgmZq1/qgPaBQX+zRzg=;
        b=RvRaEfGCuQUwylNnPzADK3Cr2hyG27vtDopxIRB2Or+9ak08mNH1ixJ8LF7//1RWsg
         kRxmP/RcIgjlaSY5pD3EXhP3eEoXa4KEMZGoVgsX0Z9HBcsfjB3U2V2rXPNu4FJ8DkMM
         KrnGpXjfXCNUfRjNSGtIVuCnzp0cnkReSOks/1D1YKWpgAOIc5EM27koxb1RltK2/rva
         Vmfj61PmuKs1F0+Ovv3qWdnk5bOGL+YDABs18xsbyvDmAYRrzz0TLNo+ZGlcWnE5+bVQ
         5AeYB+Vvx3oZL31Bw8H3kHobykNfu9tz7y8JUTUsX9xZ7sPwdfOO/HomW93g/EPZ/4Ry
         PFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739718481; x=1740323281;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y53y9K9S/4j536/Ca/UZoX5PNgmZq1/qgPaBQX+zRzg=;
        b=oxdPJ709IQR6AkQh7sMFVbQ7DmU4+hOqNOJRphvAt5USHRnhPIOhE4n+wsl7nvrUWF
         5fYrNL+fh8hIMy+aA4+f1qoqgZazJfP6+tBZUTQyn/WBxFZa41qNt/BzXgCiwHD8kZpx
         VJ8RlyQv7LxVFfm2zdVbSZVlkVswTsH1BcaSVHKNeGgVaM/+FFwUj3RYz4ywTOhY13GM
         z5kHLRDGvYWS02viE0vMBQBeTObZEUs0DFKcry7VXq04l5CDiW4ykLKJnSuIhbZimYVM
         TWiT4ojsKwyzWe9XlfCK+kyB6IQC7Vfcd35BjE7pto6AMOzQkiTRHAYOZUnkJ6uT11Ms
         zpHw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BdiCVkG6kJ66F+7WkISebdsaxyTBhxEEPs958+hXP7oBDcgyJiO83E7NNWJp7VnIZ5pnzJUBOX07H53m@lists.linux.dev
X-Gm-Message-State: AOJu0YytgT+I2WexArl88udqOaZG6oIaIF8lBF4tqhALV9jPM9HOB7R2
	9PyrIVtv83neWY69TRBDRRIQixLQihwCNhDILoop0gU7TiV7Y2gOfkZfcB5EbdE=
X-Gm-Gg: ASbGncvNwR1gShLvuZG3PeCiDuji3R5+sMUd85pph8plcB2GPLoyzmB1BwaKpdhxtPD
	kJk003Y2OBEwvGn5ZgDtZLgb8w//iAOpGS8Z4hAaljjDn108sG5BCUy3IhRrDRS9ImETT2+Gxgc
	qA+0ZFeJNQSwRKNEfMfKkHPVfqv0YTLf2ruMMwQhxA9Uy7h5VSzrAYA8nnn08If3HnRwNpohs/u
	u2ItaHbA7Vz2rFH8J7KCdUqvFUjWbWpbIy9FAKEeh1URNlwN8Qi69/NX+7AemYn67xTS9ERoUuD
	N/KItaXbu3E0p5UEWkAO
X-Google-Smtp-Source: AGHT+IFjqUfpc0AbIyBLbdzwSn1gj1bugxcWDcZZFUi5kTwF7qQDrysyLhiSZe3uQpqrrNb6Ts0FeQ==
X-Received: by 2002:a17:907:60c9:b0:ab7:ec8b:c648 with SMTP id a640c23a62f3a-abb70bfc7fdmr655709566b.1.1739718481396;
        Sun, 16 Feb 2025 07:08:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb7c76b0cfsm274300366b.28.2025.02.16.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 07:08:00 -0800 (PST)
Date: Sun, 16 Feb 2025 18:07:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhang Yi <yi.zhang@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
Subject: [tytso-ext4:test 13/15] fs/ext4/extents.c:4780 ext4_fallocate()
 warn: inconsistent returns '&inode->i_rwsem'.
Message-ID: <914fe9e7-8597-4789-b995-850449885e0d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git test
head:   e5a9a1fce162be14c6f1ac325faac48b1a7dea9e
commit: 2890e5e0f49e10f3dadc5f7b7ea434e3e77e12a6 [13/15] ext4: move out common parts into ext4_fallocate()
config: i386-randconfig-141-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142300.QWZQEt11-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502142300.QWZQEt11-lkp@intel.com/

smatch warnings:
fs/ext4/extents.c:4780 ext4_fallocate() warn: inconsistent returns '&inode->i_rwsem'.

vim +4780 fs/ext4/extents.c

2fe17c1075836b Christoph Hellwig  2011-01-14  4715  long ext4_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
a2df2a63407803 Amit Arora         2007-07-17  4716  {
496ad9aa8ef448 Al Viro            2013-01-23  4717  	struct inode *inode = file_inode(file);
2890e5e0f49e10 Zhang Yi           2024-12-20  4718  	struct address_space *mapping = file->f_mapping;
fd2f764826df54 Zhang Yi           2024-12-20  4719  	int ret;
a2df2a63407803 Amit Arora         2007-07-17  4720  
2058f83a728adf Michael Halcrow    2015-04-12  4721  	/*
2058f83a728adf Michael Halcrow    2015-04-12  4722  	 * Encrypted inodes can't handle collapse range or insert
2058f83a728adf Michael Halcrow    2015-04-12  4723  	 * range since we would need to re-encrypt blocks with a
2058f83a728adf Michael Halcrow    2015-04-12  4724  	 * different IV or XTS tweak (which are based on the logical
2058f83a728adf Michael Halcrow    2015-04-12  4725  	 * block number).
2058f83a728adf Michael Halcrow    2015-04-12  4726  	 */
592ddec7578a33 Chandan Rajendra   2018-12-12  4727  	if (IS_ENCRYPTED(inode) &&
457b1e353c739a Eric Biggers       2019-12-26  4728  	    (mode & (FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_INSERT_RANGE)))
2058f83a728adf Michael Halcrow    2015-04-12  4729  		return -EOPNOTSUPP;
2058f83a728adf Michael Halcrow    2015-04-12  4730  
a4bb6b64e39abc Allison Henderson  2011-05-25  4731  	/* Return error if mode is not supported */
9eb79482a97152 Namjae Jeon        2014-02-23  4732  	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |
331573febb6a22 Namjae Jeon        2015-06-09  4733  		     FALLOC_FL_COLLAPSE_RANGE | FALLOC_FL_ZERO_RANGE |
331573febb6a22 Namjae Jeon        2015-06-09  4734  		     FALLOC_FL_INSERT_RANGE))
a4bb6b64e39abc Allison Henderson  2011-05-25  4735  		return -EOPNOTSUPP;
a4bb6b64e39abc Allison Henderson  2011-05-25  4736  
f87c7a4b084afc Baokun Li          2022-04-28  4737  	inode_lock(inode);
f87c7a4b084afc Baokun Li          2022-04-28  4738  	ret = ext4_convert_inline_data(inode);
f87c7a4b084afc Baokun Li          2022-04-28  4739  	if (ret)
ea3f17efd36b56 Zhang Yi           2024-12-20  4740  		goto out_inode_lock;
f87c7a4b084afc Baokun Li          2022-04-28  4741  
2890e5e0f49e10 Zhang Yi           2024-12-20  4742  	/* Wait all existing dio workers, newcomers will block on i_rwsem */
2890e5e0f49e10 Zhang Yi           2024-12-20  4743  	inode_dio_wait(inode);
2890e5e0f49e10 Zhang Yi           2024-12-20  4744  
2890e5e0f49e10 Zhang Yi           2024-12-20  4745  	ret = file_modified(file);
2890e5e0f49e10 Zhang Yi           2024-12-20  4746  	if (ret)
2890e5e0f49e10 Zhang Yi           2024-12-20  4747  		return ret;

goto out_inode_lock;

2890e5e0f49e10 Zhang Yi           2024-12-20  4748  
2890e5e0f49e10 Zhang Yi           2024-12-20  4749  	if ((mode & FALLOC_FL_MODE_MASK) == FALLOC_FL_ALLOCATE_RANGE) {
2890e5e0f49e10 Zhang Yi           2024-12-20  4750  		ret = ext4_do_fallocate(file, offset, len, mode);
2890e5e0f49e10 Zhang Yi           2024-12-20  4751  		goto out_inode_lock;
2890e5e0f49e10 Zhang Yi           2024-12-20  4752  	}
2890e5e0f49e10 Zhang Yi           2024-12-20  4753  
2890e5e0f49e10 Zhang Yi           2024-12-20  4754  	/*
2890e5e0f49e10 Zhang Yi           2024-12-20  4755  	 * Follow-up operations will drop page cache, hold invalidate lock
2890e5e0f49e10 Zhang Yi           2024-12-20  4756  	 * to prevent page faults from reinstantiating pages we have
2890e5e0f49e10 Zhang Yi           2024-12-20  4757  	 * released from page cache.
2890e5e0f49e10 Zhang Yi           2024-12-20  4758  	 */
2890e5e0f49e10 Zhang Yi           2024-12-20  4759  	filemap_invalidate_lock(mapping);
2890e5e0f49e10 Zhang Yi           2024-12-20  4760  
2890e5e0f49e10 Zhang Yi           2024-12-20  4761  	ret = ext4_break_layouts(inode);
2890e5e0f49e10 Zhang Yi           2024-12-20  4762  	if (ret)
2890e5e0f49e10 Zhang Yi           2024-12-20  4763  		goto out_invalidate_lock;
2890e5e0f49e10 Zhang Yi           2024-12-20  4764  
fd2f764826df54 Zhang Yi           2024-12-20  4765  	if (mode & FALLOC_FL_PUNCH_HOLE)
ad5cd4f4ee4d5f Darrick J. Wong    2022-03-08  4766  		ret = ext4_punch_hole(file, offset, len);
fd2f764826df54 Zhang Yi           2024-12-20  4767  	else if (mode & FALLOC_FL_COLLAPSE_RANGE)
ad5cd4f4ee4d5f Darrick J. Wong    2022-03-08  4768  		ret = ext4_collapse_range(file, offset, len);
fd2f764826df54 Zhang Yi           2024-12-20  4769  	else if (mode & FALLOC_FL_INSERT_RANGE)
ad5cd4f4ee4d5f Darrick J. Wong    2022-03-08  4770  		ret = ext4_insert_range(file, offset, len);
fd2f764826df54 Zhang Yi           2024-12-20  4771  	else if (mode & FALLOC_FL_ZERO_RANGE)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  4772  		ret = ext4_zero_range(file, offset, len, mode);
fd2f764826df54 Zhang Yi           2024-12-20  4773  	else
2890e5e0f49e10 Zhang Yi           2024-12-20  4774  		ret = -EOPNOTSUPP;
2890e5e0f49e10 Zhang Yi           2024-12-20  4775  
2890e5e0f49e10 Zhang Yi           2024-12-20  4776  out_invalidate_lock:
2890e5e0f49e10 Zhang Yi           2024-12-20  4777  	filemap_invalidate_unlock(mapping);
ea3f17efd36b56 Zhang Yi           2024-12-20  4778  out_inode_lock:
ea3f17efd36b56 Zhang Yi           2024-12-20  4779  	inode_unlock(inode);
0e8b6879f3c234 Lukas Czerner      2014-03-18 @4780  	return ret;
a2df2a63407803 Amit Arora         2007-07-17  4781  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

